#!/bin/sh
docker build --no-cache -f container-kytos-sdx-topology/Dockerfile -t amlight .
docker build --no-cache -f container-kytos-sdx-topology/Dockerfile -t sax .
docker build --no-cache -f container-kytos-sdx-topology/Dockerfile -t tenet .
docker build --no-cache -f container-kytos-sdx-topology/Dockerfile -t sdx-test .
docker build --no-cache -f container-sdx-lc/Dockerfile -t amlight-sdx-lc .
docker build --no-cache -f container-sdx-lc/Dockerfile -t sax-sdx-lc .
docker build --no-cache -f container-sdx-lc/Dockerfile -t tenet-sdx-lc .
docker build --no-cache -f container-validator/Dockerfile -t validator .
