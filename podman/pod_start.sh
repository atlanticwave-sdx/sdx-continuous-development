#!/bin/sh
podman-compose down -v
podman machine stop
podman machine start

