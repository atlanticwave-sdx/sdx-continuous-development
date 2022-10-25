#!/bin/sh
podman build -f ./container-redis/Dockerfile -t sdx_redis .
podman build -f ./container-app/Dockerfile -t sdx_api .
