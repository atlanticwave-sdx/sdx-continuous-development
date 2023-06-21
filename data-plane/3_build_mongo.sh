#!/bin/sh
docker build -f container-mongo-replicas/mongo1t/Dockerfile -t mongo1t .
docker build -f container-mongo-replicas/mongo2t/Dockerfile -t mongo2t .
docker build -f container-mongo-replicas/mongo3t/Dockerfile -t mongo3t .
