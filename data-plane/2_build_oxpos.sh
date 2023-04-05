#!/bin/sh
docker build --no-cache -f ./container-amlight/Dockerfile -t amlight .
docker build --no-cache -f ./container-amlight/Dockerfile -t sax .
docker build --no-cache -f ./container-amlight/Dockerfile -t tenet .
docker build --no-cache -f ./container-mininet/Dockerfile -t mininet .
