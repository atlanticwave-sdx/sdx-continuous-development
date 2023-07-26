FROM python-base

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./container-sdx-lc/sdx-lc/requirements.txt /usr/src/app/

# RUN pip3 install --no-cache-dir -r requirements.txt

COPY ./container-sdx-lc/sdx-lc /usr/src/app

# EXPOSE 8080

# ENTRYPOINT ["python3"]

# CMD ["-m", "swagger_server"]
