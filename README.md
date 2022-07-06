# CI/CD for AtlanticWave-SDX project

This repository is meant to continuously test the integration of
various pieces of the [AtlanticWave-SDX][aw-sdx] project, and for code
to be deployed in the test environment quicker.

Atlanticwave-SDX is composed of several pieces:

 * [kytos-sdx-topology][sdx-topology]
 * [sdx-controller][sdx-controller]
 * [sdx-controller-client][sdx-controller-client]
 * [sdx-lc][sdx-lc]
 * [sdx-lc-client][sdx-lc-client]
 * [pce][sdx-pce]
 * [datamodel][sdx-datamodel]

We will also use [Kytos-NG][kytos-ng] SDN Platform (and thereby
MongoDB), and RabittMQ, and [mininet][mininet].


## Approach

Things are in an exploratory stage right now.  This is the approach we
taking, at the moment anyway:

* Along with Python and FastAPI, we will use Podman to quickly set up
  our local development environment, and to simplify deployment.

* We will use pytest instead of unittest for writing unit and
  integration tests.

* Since our code is on GitHub, to the extent possible, we will use
  GitHub Actions to run tests before deploying.


## Development setup

We will need the following:

 * Python 3.9
 * [Podman][podman]
 * [Podman Compose][podman-compose]

We will try to have our setup running on macOS and current Debian
stable, and maybe Fedora.

Install Python 3.9 from your distribution's repositories, or using
something like Homebrew.  See below for hints about installing podman
and podman-compose.

### Installing Podman and Podman Compose

On Debian and Ubuntu, install Podman from the respective
distributions' repositories:

``` shellsession
$ sudo apt install podman
```

Podman Compose is not on official Debian and Ubuntu repositories yet;
installing it using [pipx][pipx] seems to be a good idea:

``` shellsession
$ sudo apt install python3-pip
$ python3 -m pip install --user --upgrade pip
$ python3 -m pip install --user --upgrade pipx
$ pipx install podman-compose
```

(See [Podman Compose][podman-compose] project's documentation for
other methods of installing it.)

On Fedora, install podman and podman-compose with:

``` shellsession
$ sudo dnf install podman podman-compose
```

On macOS, do this:

``` shellsession
$ brew install podman podman-compose
```

On macOS, you will also need to initialize a virtual machine to run
Podman containers, with the following commands:


``` shellsession
$ podman machine init
$ podman machine start
```

### A note about container registries

`$HOME/.config/containers/registries.conf` is a TOML config file that
can be used to customize whitelisted registries that are allowed to be
searched and used as image sources.


### Get code From GitHub

``` shellsession
$ git clone https://github.com/atlanticwave-sdx/sdx-continuous-development.git
$ cd sdx-continuous-development
```

## Usage notes

### Building a static network

The script `1_build_network.sh` creates the static network for
mininet, using this command:

``` shellsession
$ podman network create --gateway "192.168.0.1" --subnet "192.168.0.0/24" kytos_network
```

### Building container images

 * The script `2_build_debian_base.sh` script creates a Debian base image.
 * The script `3_build_ubuntu_base.sh` script creates an Ubuntu base image.
 * The script `4_build_containers.sh` script creates Kytos and mininet
   container images.

### Using Podman

To create a local Debian base image to be used for Kytos containers:

``` shellsession
$ podman build -f ./os_base/debian_base/Dockerfile -t debian_base .
```

To access the image with bash:

``` shellsession
$ podman run -it debian_base /bin/bash
```

To list available images:

``` shellsession
$ podman images
```

To remove an image:

``` shellsession
$ podman image rm <image_id>
```

To create local Kytos images using the Debian base image:

``` shellsession
$ podman build -f ./container-amlight/Dockerfile -t amlight .
$ podman build -f ./container-sax/Dockerfile -t sax .
$ podman build -f ./container-tenet/Dockerfile -t tenet .
```

To create a local mongodb image:

``` shellsession
$ podman build -f ./container-mongo/Dockerfile -t mongo_db .
```

To create a local Ubuntu base image, to be used for mininet container:

``` shellsession
$ podman build -f ./os_base/ubuntu_base/Dockerfile -t ubuntu_base .
```

To create a local mininet image:

``` shellsession
$ podman build -f ./container-mininet/Dockerfile -t mininet .
```

To start containers with podman-compose:

``` shellsession
$ podman-compose down
$ podman-compose --podman-run-args='--network kytos_network' up -d
```

<!-- References -->

[aw-sdx]: https://www.atlanticwave-sdx.net/

[sdx-topology]: https://github.com/atlanticwave-sdx/kytos-sdx-topology
[sdx-controller]: https://github.com/atlanticwave-sdx/sdx-controller
[sdx-controller-client]: https://github.com/atlanticwave-sdx/sdx-controller-client
[sdx-lc]: https://github.com/atlanticwave-sdx/sdx-lc
[sdx-lc-client]: https://github.com/atlanticwave-sdx/sdx-lc-client
[sdx-pce]: https://github.com/atlanticwave-sdx/pce
[sdx-datamodel]: https://github.com/atlanticwave-sdx/datamodel

[kytos-ng]: https://github.com/kytos-ng/
[mininet]: http://mininet.org/

[podman]: https://podman.io/
[podman-compose]: https://github.com/containers/podman-compose

[pipx]: https://pypi.org/project/pipx/
