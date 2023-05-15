#!/bin/sh

docker build -f ./container-mongo-replicas/mongolc1/Dockerfile -t mongo_lc .
docker build -f ./os_base/flask_base/Dockerfile -t flask_base .
docker build -f ./container-sdx-lc/Dockerfile -t sdx-lc .
