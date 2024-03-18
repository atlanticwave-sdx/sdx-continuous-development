#!/bin/sh
docker build --no-cache -f ./Docker-files/sdx-lc/Dockerfile -t amlight-sdx-lc .
docker build --no-cache -f ./Docker-files/sdx-lc/Dockerfile -t sax-sdx-lc .
docker build --no-cache -f ./Docker-files/sdx-lc/Dockerfile -t tenet-sdx-lc .
docker build --no-cache -f ./Docker-files/sdx-controller/Dockerfile -t sdx-controller .
