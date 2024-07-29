#!/bin/bash

for repo in sdx-lc sdx-controller kytos-sdx; do folder=container-$repo; git -C $folder pull || git clone https://github.com/atlanticwave-sdx/$repo $folder; cd $folder/; docker build -t $repo .; cd ..; done

docker build --no-cache -f container-mininet/Dockerfile -t mininet .
