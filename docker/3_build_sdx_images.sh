#!/bin/sh
docker build -f ./sdx_containers/Dockerfile -t amlight .
docker build -f ./sdx_containers/Dockerfile -t sax .
docker build -f ./sdx_containers/Dockerfile -t tenet .
