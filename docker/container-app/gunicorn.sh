#!/usr/bin/env bash

echo "Start flask dev server"
exec gunicorn main:app -w 2 --threads 2 --bind 0.0.0.0:8800
