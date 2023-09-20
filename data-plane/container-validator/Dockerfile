# pull os base image
FROM flask-base

# set work directory

WORKDIR /
RUN mkdir -p /validator
COPY ./container-validator/ /validator
COPY ./container-validator/curl/gunicorn.sh .
