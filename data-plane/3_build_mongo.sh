#!/bin/sh
docker build -f os_base/rabbit_base/Dockerfile -t sdx_rabbit .
docker build -f os_base/python_base/Dockerfile -t sdx_python .
docker build -f os_base/mongo_base/Dockerfile -t sdx_mongo .
docker build -f container-mongo-replicas/mongo1t/Dockerfile -t mongo1t .
docker build -f container-mongo-replicas/mongo2t/Dockerfile -t mongo2t .
docker build -f container-mongo-replicas/mongo3t/Dockerfile -t mongo3t .
