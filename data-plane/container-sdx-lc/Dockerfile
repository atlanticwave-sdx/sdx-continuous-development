FROM flask_base

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./container-sdx-lc/ /usr/src/app/

EXPOSE 8080

CMD ["python3", "/usr/src/app/swagger_server/__main__.py"]
