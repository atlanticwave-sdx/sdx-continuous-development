FROM mongo:5.0

# custom label for the docker image
LABEL version="0.1" maintainer="lmarinve@fiu.edu"
ENV MONGO_INITDB_ROOT_USERNAME admin_user
ENV MONGO_INITDB_ROOT_PASSWORD admin_pwd
ENV MONGO_INITDB_DATABASE admin
RUN mkdir -p /data/db/node1
RUN mkdir -p /data/db/node2
RUN mkdir -p /data/db/node3
RUN mkdir -p /data/pki/
RUN mkdir -p /data/logs/
COPY ./os_base/mongo_base/m103-keyfile /data/pki/.
RUN chmod 400 /data/pki/m103-keyfile
