# -*- coding: utf-8 -*-
#
# This software may be modified and distributed under the terms
# of the MIT license.  See the LICENSE file for details.

# Base Image
FROM debian:bullseye-slim

# LABEL about the custom image
LABEL maintainer="lmarinve@fiu.edu"
LABEL version="0.1"
LABEL description="Base Image"

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# http://bugs.python.org/issue19846
ENV LANG=C.UTF-8

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install build dependencies
RUN set -e
RUN apt-get update 

RUN apt-get install --assume-yes ca-certificates dirmngr dpkg-dev gcc git \
gnupg gunicorn iputils-ping libbz2-dev libc6-dev libexpat1-dev libffi-dev \
liblzma-dev libncurses5-dev libgdbm-dev libnss3-dev libreadline-dev \
libsqlite3-dev libssl-dev lsof make mininet netbase netcat \
software-properties-common uuid-dev wget xz-utils zlib1g-dev

WORKDIR /usr/src/
RUN apt install python3-pip --assume-yes
RUN apt-get purge --assume-yes --auto-remove -o APT::AutoRemove::RecommendsImportant=false && \
rm -rf /var/lib/apt/lists/*

# Pre install
RUN pip3 install --upgrade pip
RUN pip3 install six==1.16.0
RUN pip3 install wheel==0.37.0
RUN pip3 install grpcio==1.41.0
RUN pip3 install networkx==2.5.1
RUN pip3 install eventlet==0.33.0
RUN pip3 install black==20.8b0

# install our dependencies
COPY requirements/requirements.txt .
RUN chmod 755 requirements.txt
RUN pip3 install -r requirements.txt
