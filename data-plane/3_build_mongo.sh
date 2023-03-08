#!/bin/sh
docker build -f ./os_base/redis_base/Dockerfile -t sdx_redis .
docker build -f ./os_base/mongo_base/Dockerfile -t sdx_mongo .
docker build -f ./mongo_replicas/mongo1t/Dockerfile -t mongo1t .
docker build -f ./mongo_replicas/mongo2t/Dockerfile -t mongo2t .
docker build -f ./mongo_replicas/mongo3t/Dockerfile -t mongo3t .
docker build -f ./mongo_replicas/mongolc1/Dockerfile -t mongo_lc .
