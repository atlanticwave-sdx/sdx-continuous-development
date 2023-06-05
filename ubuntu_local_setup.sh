#!/bin/sh

echo "### mongo client ###"
sudo wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb
sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb
sudo wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
sudo echo 'deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse' | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
echo "### Ubuntu update ###"
sudo apt-get update --assume-yes
sudo apt-get -y upgrade
echo "### dependencies install ###"
sudo apt-get install --assume-yes --no-install-recommends \
                apt-transport-https build-essential ca-certificates curl dirmngr dpkg-dev docker gcc \
	        git gnupg2 gunicorn iputils-ping libbz2-dev libc6-dev libexpat1-dev libffi-dev \
		liblzma-dev libncurses5-dev libgdbm-dev libnss3-dev libreadline-dev \
		libsqlite3-dev libssl-dev lsb-release lsof make mininet mongodb-org-shell net-tools \
	       	netbase netcat openvswitch-switch-dpdk software-properties-common uuid-dev wget \
		xz-utils zlib1g-dev jq
echo "### install python 3.9 ###"
sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get install --assume-yes python3.9
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 2
sudo apt-get install --assume-yes --reinstall python3.9-distutils
echo "### docker install ###"
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt remove -y python3-apt
sudo apt install -y python3-apt
sudo apt-get update
sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker ubuntu
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose
#sudo newgrp docker
sudo pip install docker-compose
sudo apt-get update
sudo apt-get install -y docker-compose
sudo apt-get install python3-pip --assume-yes
