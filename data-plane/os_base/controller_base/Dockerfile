FROM python:3.9-slim-bullseye

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y --no-install-recommends gcc python3-dev git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /usr/src/app

COPY os_base/controller_base/requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
