#!/bin/sh
docker build -f ./os_base/flask_base/Dockerfile -t flask .
docker build -f ./mongo_replicas/mongolc1/Dockerfile -t mongo_lc .
