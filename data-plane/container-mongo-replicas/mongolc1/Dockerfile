FROM mongo:5.0

# custom label for the docker image
LABEL version="0.1" maintainer="lmarinve@fiu.edu"
ENV MONGO_INITDB_ROOT_USERNAME admin_user
ENV MONGO_INITDB_ROOT_PASSWORD admin_pwd
ENV MONGO_INITDB_DATABASE admin
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    dnsutils \
    iproute2 \
    iputils-ping \
    lsof \
    netcat

# set work directory
WORKDIR /
RUN mkdir -p /data/db
COPY ./container-mongo-replicas/mongolc1/mongo-init.js /docker-entrypoint-initdb.d/mongo-init.js
ENTRYPOINT [ "/usr/bin/mongod", "--bind_ip_all", "--port", "27030" ]
