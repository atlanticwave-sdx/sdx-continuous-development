#!/bin/sh
docker build -f ./sdx_containers/amlight/Dockerfile -t amlight .
docker build -f ./sdx_containers/sax/Dockerfile -t sax .
docker build -f ./sdx_containers/tenet/Dockerfile -t tenet .
