#!/bin/sh
docker build -f ./container-redis/Dockerfile -t sdx_redis .
docker build -f ./container-app/Dockerfile -t sdx_api .
