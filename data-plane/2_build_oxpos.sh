#!/bin/sh
docker build -f ./container-amlight/Dockerfile -t amlight .
docker build -f ./container-amlight/Dockerfile -t sax .
docker build -f ./container-amlight/Dockerfile -t tenet .
docker build -f ./container-mininet/Dockerfile -t mininet .
