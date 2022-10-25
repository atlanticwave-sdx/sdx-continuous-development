#!/bin/sh
podman build -f ./container-amlight/Dockerfile -t amlight .
podman build -f ./container-sax/Dockerfile -t sax .
podman build -f ./container-tenet/Dockerfile -t tenet .
podman build -f ./container-mongo/Dockerfile -t mongo_db .
