#!/bin/sh
set -eu

touch /var/log/access_validator.log
touch /var/log/error_validator.log

gunicorn 'validator.app:app' -b 0.0.0.0:8000 \
	--daemon \
	--access-logfile var/log/access_validator.log \
	--error-logfile var/log/error_validator.log \
	--capture-output \
	--log-level='debug'

exec "$@"
