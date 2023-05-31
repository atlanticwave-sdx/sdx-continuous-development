#!/bin/sh
# multipass launch 22.04 --name sdx -d 20G -m 8192M -c 2
# multipass set client.primary-name=sdx
# multipass list
# multipass info sdx

echo "### mongo client ###"
multipass exec sdx -- bash -c "sudo wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb"
multipass exec sdx -- bash -c "sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb"
multipass exec sdx -- bash -c "sudo wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -"
multipass exec sdx -- bash -c "sudo echo 'deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse' | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list"
echo "### Ubuntu update ###"
multipass exec sdx -- bash -c 'echo "$nrconf{restart} = "l"" | sudo tee -a /etc/needrestart/needrestart.conf'
multipass exec sdx -- bash -c "sudo apt-get update --assume-yes"
multipass exec sdx -- bash -c "sudo apt-get -y upgrade"
echo "### dependencies install ###"
multipass exec sdx -- bash -c "sudo apt-get install --assume-yes --no-install-recommends \
                apt-transport-https build-essential ca-certificates curl dirmngr dpkg-dev docker gcc \
	        git gnupg2 gunicorn iputils-ping libbz2-dev libc6-dev libexpat1-dev libffi-dev \
		liblzma-dev libncurses5-dev libgdbm-dev libnss3-dev libreadline-dev \
		libsqlite3-dev libssl-dev lsb-release lsof make mininet mongodb-org-shell net-tools \
	       	netbase netcat openvswitch-switch-dpdk software-properties-common uuid-dev wget \
		xz-utils zlib1g-dev jq"
echo "### install python 3.9 ###"
multipass exec sdx -- bash -c "sudo add-apt-repository -y ppa:deadsnakes/ppa"
multipass exec sdx -- bash -c "sudo apt-get install --assume-yes python3.9"
multipass exec sdx -- bash -c "sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1"
multipass exec sdx -- bash -c "sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 2"
multipass exec sdx -- bash -c "sudo apt-get install --assume-yes --reinstall python3.9-distutils"
echo "### docker install ###"
multipass exec sdx -- bash -c "sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg"
multipass exec sdx -- bash -c 'echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null'
multipass exec sdx -- bash -c "sudo apt remove -y python3-apt"
multipass exec sdx -- bash -c "sudo apt install -y python3-apt"
multipass exec sdx sudo apt-get update
multipass exec sdx -- bash -c "sudo apt install docker-ce docker-ce-cli containerd.io -y"
multipass exec sdx -- bash -c "sudo usermod -aG docker ubuntu"
multipass exec sdx -- bash -c "mkdir -p ~/.docker/cli-plugins/"
multipass exec sdx -- bash -c "curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose"
multipass exec sdx -- bash -c "chmod +x ~/.docker/cli-plugins/docker-compose"
#multipass exec sdx -- bash -c "sudo newgrp docker"
multipass exec sdx -- bash -c "sudo pip install docker-compose"
multipass exec sdx -- bash -c "sudo apt-get update"
multipass exec sdx -- bash -c "sudo apt-get install -y docker-compose"
multipass exec sdx -- bash -c "sudo apt-get install python3-pip --assume-yes"
