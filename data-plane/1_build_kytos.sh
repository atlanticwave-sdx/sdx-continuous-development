#!/bin/sh
docker build -f os_base/kytos_base/Dockerfile -t kytos_base .
docker build --no-cache -f container-mininet/Dockerfile -t mininet .
docker build --no-cache -f os_base/mongo_base/Dockerfile -t sdx-mongo .
docker build --no-cache -f os_base/python_base/Dockerfile -t sdx-python .
docker build --no-cache -f os_base/rabbit_base/Dockerfile -t sdx-rabbit .
