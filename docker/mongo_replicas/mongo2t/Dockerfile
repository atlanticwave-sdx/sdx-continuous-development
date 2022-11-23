FROM sdx_mongo

# custom label for the docker image
LABEL version="0.1" maintainer="lmarinve@fiu.edu"
ENV MONGO_INITDB_ROOT_USERNAME admin_user
ENV MONGO_INITDB_ROOT_PASSWORD admin_pwd
ENV MONGO_INITDB_DATABASE admin
# set work directory
WORKDIR /
ENTRYPOINT [ "/usr/bin/mongod", "--config", "/mongo_base/node2.conf"]
