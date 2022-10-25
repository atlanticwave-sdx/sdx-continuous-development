#!/bin/sh
docker build -f ./container-amlight/Dockerfile -t amlight .
docker build -f ./container-sax/Dockerfile -t sax .
docker build -f ./container-tenet/Dockerfile -t tenet .
docker build -f ./container-mongo/Dockerfile -t mongo_db .
