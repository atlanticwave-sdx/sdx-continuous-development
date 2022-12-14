#!/usr/bin/env bash

echo "Start flask dev server"
set ENV_FILE_LOCATION=./.env
exec gunicorn app:app -w 2 --threads 2 --bind 0.0.0.0:8800

