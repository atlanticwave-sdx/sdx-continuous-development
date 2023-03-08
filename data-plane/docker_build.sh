#!/bin/sh
docker build -f ./os_base/debian_base/Dockerfile -t debian_base .
docker build -f ./sdx_containers/Dockerfile -t amlight .
docker build -f ./sdx_containers/Dockerfile -t sax .
docker build -f ./sdx_containers/Dockerfile -t tenet .
docker build -f ./os_base/mininet_base/Dockerfile -t mininet_base .
docker build -f ./container-mininet/Dockerfile -t mininet .
docker build -f ./os_base/redis_base/Dockerfile -t sdx_redis .
docker build -f ./os_base/mongo_base/Dockerfile -t sdx_mongo .
docker build -f ./mongo_replicas/mongo1t/Dockerfile -t mongo1t .
docker build -f ./mongo_replicas/mongo2t/Dockerfile -t mongo2t .
docker build -f ./mongo_replicas/mongo3t/Dockerfile -t mongo3t .
docker build -f ./mongo_replicas/mongolc1/Dockerfile -t mongo_lc .
docker build -f ./os_base/flask_base/Dockerfile -t flask_base .
docker build -f ./container-sdx-lc/Dockerfile -t sdx-lc .
