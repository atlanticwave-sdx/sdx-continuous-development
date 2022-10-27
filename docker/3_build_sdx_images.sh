#!/bin/sh
docker build -f ./container-amlight/Dockerfile -t amlight .
docker build -f ./container-sax/Dockerfile -t sax .
docker build -f ./container-tenet/Dockerfile -t tenet .
