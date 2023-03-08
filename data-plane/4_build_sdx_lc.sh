#!/bin/sh

docker build -f ./os_base/flask_base/Dockerfile -t flask_base .
docker build -f ./container-sdx-lc/Dockerfile -t sdx-lc .
