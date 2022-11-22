#!/bin/sh
docker build -f ./os_base/redis_base/Dockerfile -t sdx_redis .
docker build -f ./os_base/mongo_base/Dockerfile -t sdx_mongo .
