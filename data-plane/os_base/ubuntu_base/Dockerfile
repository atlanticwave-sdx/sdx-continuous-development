FROM ubuntu:18.04

USER root
WORKDIR /root

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    dnsutils \
    gnupg \
    iproute2 \
    iputils-ping \
    lsof \
    mininet \
    netcat \
    openvswitch-switch \
    wget \
    tmux \
 && rm -rf /var/lib/apt/lists/*
