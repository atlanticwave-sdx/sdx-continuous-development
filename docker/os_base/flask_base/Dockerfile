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

RUN pip3 install redis==3.5.3
RUN pip3 install flower==1.0.0
RUN pip3 install flask-cors==3.0.8
RUN pip3 install flask-socketio==4.2.1
RUN pip3 install flask-restx==0.5.1
RUN pip3 install flask-restful==0.3.9
RUN pip3 install Flask-Migrate==3.1.0
RUN pip3 install flask-mongoengine==1.0.0
RUN pip3 install Flask-SQLAlchemy==2.5.1
RUN pip3 install Flask-WTF==1.0.1 
RUN pip3 install gunicorn==20.1.0 
RUN pip3 install idna==3.4
RUN pip3 install itsdangerous==2.1.2
RUN pip3 install Jinja2==3.1.2
RUN pip3 install markupsafe==2.1.1
RUN pip3 install mongoengine==0.24.2
RUN pip3 install pymongo==4.3.2
RUN pip3 install werkzeug==2.2.2
RUN pip3 install WTForms==3.0.1
RUN pip3 install flask==2.0.1
RUN pip3 install celery==5.0.5
RUN pip3 install click==7.1.2

