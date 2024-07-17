#!/bin/sh
docker build -f os_base/kytos_base/Dockerfile -t kytos-base .
docker build --no-cache -f container-mininet/Dockerfile -t mininet .
docker build --no-cache -f os_base/mongo_base/Dockerfile -t sdx-mongo .
docker build --no-cache -f os_base/python_base/Dockerfile -t python-base .
docker build --no-cache -f os_base/flask_base/Dockerfile -t flask-base .
docker build --no-cache -f os_base/rabbit_base/Dockerfile -t sdx-rabbit .
#docker build --no-cache -f os_base/controller_base/Dockerfile -t controller-base .
docker build --no-cache -f container-validator/Dockerfile -t validator .
