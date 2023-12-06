#!/bin/sh
docker build --no-cache -f Dockerfile -t amlight-sdx-lc .
docker build --no-cache -f Dockerfile -t sax-sdx-lc .
docker build --no-cache -f Dockerfile -t tenet-sdx-lc .
docker build --no-cache -f ./container-sdx-controller/Dockerfile -t sdx-controller .
