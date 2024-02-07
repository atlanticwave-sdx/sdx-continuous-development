FROM flask-base

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./container-sdx-controller /usr/src/app

ENTRYPOINT ["python3"]
CMD ["-m", "swagger_server"]
