FROM python-base

WORKDIR /usr/src/app

COPY ./container-sdx-lc/. /usr/src/app

EXPOSE 8080

ENTRYPOINT ["python3"]

CMD ["-m", "swagger_server"]
