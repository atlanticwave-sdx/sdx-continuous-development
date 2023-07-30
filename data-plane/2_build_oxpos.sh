#!/bin/sh
docker build --no-cache -f container-kytos-sdx-topology/Dockerfile -t amlight .
docker build --no-cache -f container-kytos-sdx-topology/Dockerfile -t sax .
docker build --no-cache -f container-kytos-sdx-topology/Dockerfile -t tenet .
docker build --no-cache -f container-kytos-sdx-topology/Dockerfile -t sdx-test .
docker build --no-cache -f container-worker/Dockerfile -t worker .
