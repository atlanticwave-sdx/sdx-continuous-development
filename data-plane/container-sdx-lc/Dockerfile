# pull os base image
FROM debian_base

# set work directory
RUN mkdir -p /app
WORKDIR /app

# add app
COPY ./app /app/

ENTRYPOINT ["./gunicorn.sh"]
