# pull os base image
FROM flask_base

# set work directory
RUN mkdir -p /app
WORKDIR /app

# add app
COPY ./container-sdx-lc/swagger_server /app/

ENTRYPOINT ["./gunicorn.sh"]
