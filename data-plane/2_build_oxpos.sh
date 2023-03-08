#!/bin/sh
docker build -f ./sdx_containers/Dockerfile -t amlight .
docker build -f ./sdx_containers/Dockerfile -t sax .
docker build -f ./sdx_containers/Dockerfile -t tenet .
docker build -f ./os_base/mininet_base/Dockerfile -t mininet_base .
docker build -f ./container-mininet/Dockerfile -t mininet .
