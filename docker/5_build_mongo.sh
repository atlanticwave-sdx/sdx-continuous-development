#!/bin/sh
docker build -f ./container-redis/Dockerfile -t sdx_redis .
docker build -f ./container-mongo/Dockerfile -t sdx_mongo .
