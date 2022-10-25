FROM mongo:5.0

# custom label for the docker image
LABEL version="0.1" maintainer="lmarinve@fiu.edu"
ENV MONGO_INITDB_ROOT_USERNAME admin-user
ENV MONGO_INITDB_ROOT_PASSWORD admin-password
ENV MONGO_INITDB_DATABASE admin
RUN mkdir -p /data/db
COPY ./container-mongo/mongo-init.js /docker-entrypoint-initdb.d/mongo-init.js
