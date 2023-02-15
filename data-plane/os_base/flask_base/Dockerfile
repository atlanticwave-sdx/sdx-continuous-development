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
RUN apt install python3-pip --assume-yes

RUN pip3 install flask==2.0.2
RUN pip3 install flask-restx==0.5.1
RUN pip3 install gunicorn==20.1.0
RUN pip3 install pymongo==4.3.3