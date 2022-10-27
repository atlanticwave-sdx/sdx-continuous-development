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
ARG branch_python_openflow=master
ARG branch_kytos_utils=master
ARG branch_kytos=master
ARG branch_of_core=master
ARG branch_flow_manager=master
ARG branch_topology=master
ARG branch_of_lldp=master
ARG branch_pathfinder=master
ARG branch_mef_eline=master
ARG branch_maintenance=master
ARG branch_coloring=master
ARG branch_sdntrace=master
ARG branch_flow_stats=master
ARG branch_sdntrace_cp=master


# http://bugs.python.org/issue19846
ENV LANG=C.UTF-8

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install build dependencies
RUN set -e
RUN apt-get update 

RUN apt-get install --assume-yes build-essential ca-certificates curl dirmngr dpkg-dev gcc git \
gnupg gunicorn iputils-ping libbz2-dev libc6-dev libexpat1-dev libffi-dev \
liblzma-dev libncurses5-dev libgdbm-dev libnss3-dev libreadline-dev \
libsqlite3-dev libssl-dev lsof make mininet netbase netcat python3-venv \
software-properties-common uuid-dev wget xz-utils zlib1g-dev

RUN apt-get update && apt-get install -y --no-install-recommends \
	python3-setuptools python3-pip rsyslog iproute2 procps curl jq git-core patch \
        openvswitch-switch mininet iputils-ping vim tmux less \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN sed -i '/imklog/ s/^/#/' /etc/rsyslog.conf

RUN git config --global url."https://github.com".insteadOf git://github.com


WORKDIR /

RUN wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add -
RUN apt update
RUN apt-get install gnupg2
RUN wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add -
RUN echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/5.0 main" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list
RUN apt update
RUN apt-get install -y mongodb-org-shell

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
RUN python3 -m pip install setuptools==60.2.0
RUN python3 -m pip install pip==21.3.1
RUN python3 -m pip install wheel==0.37.1

RUN python3 -m pip install https://github.com/kytos-ng/python-openflow/archive/${branch_python_openflow}.zip \
 && python3 -m pip install https://github.com/kytos-ng/kytos-utils/archive/${branch_kytos_utils}.zip \
 && python3 -m pip install https://github.com/kytos-ng/kytos/archive/${branch_kytos}.zip

RUN python3 -m pip install -e git+https://github.com/kytos-ng/of_core@${branch_of_core}#egg=kytos-of_core \
 && python3 -m pip install -e git+https://github.com/kytos-ng/flow_manager@${branch_flow_manager}#egg=kytos-flow_manager \
 && python3 -m pip install -e git+https://github.com/kytos-ng/topology@${branch_topology}#egg=kytos-topology \
 && python3 -m pip install -e git+https://github.com/kytos-ng/of_lldp@${branch_of_lldp}#egg=kytos-of_lldp \
 && python3 -m pip install -e git+https://github.com/kytos-ng/pathfinder@${branch_pathfinder}#egg=kytos-pathfinder \
 && python3 -m pip install -e git+https://github.com/kytos-ng/maintenance@${branch_maintenance}#egg=kytos-maintenance \
 && python3 -m pip install -e git+https://github.com/kytos-ng/coloring@${branch_coloring}#egg=amlight-coloring \
 && python3 -m pip install -e git+https://github.com/kytos-ng/sdntrace@${branch_sdntrace}#egg=amlight-sdntrace \
 && python3 -m pip install -e git+https://github.com/kytos-ng/flow_stats@${branch_flow_stats}#egg=amlight-flow_stats \
 && python3 -m pip install -e git+https://github.com/kytos-ng/sdntrace_cp@${branch_sdntrace_cp}#egg=amlight-sdntrace_cp \
 && python3 -m pip install -e git+https://github.com/kytos-ng/mef_eline@${branch_mef_eline}#egg=kytos-mef_eline

# end-to-end python related dependencies
# pymongo and requests resolve to the same version on kytos and NApps
RUN python3 -m pip install pytest-timeout==2.0.2 \
 && python3 -m pip install pytest==6.2.5 \
 && python3 -m pip install mock==4.0.3 \
 && python3 -m pip install pymongo \
 && python3 -m pip install requests

COPY ./apply-patches.sh  /tmp/
COPY ./patches /tmp/patches

RUN cd /tmp && ./apply-patches.sh && rm -rf /tmp/*


