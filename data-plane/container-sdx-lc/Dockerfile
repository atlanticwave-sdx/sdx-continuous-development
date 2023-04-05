#FROM python:3.6-alpine
FROM python:3.9.6-buster

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./container-sdx-lc/ /usr/src/app/

RUN pip3 install --no-cache-dir -r requirements.txt
RUN pip3 install "connexion[swagger-ui]"

ENTRYPOINT ["python3"]

CMD ["-m", "swagger_server"]
