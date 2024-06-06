#!/bin/bash

consumer_API="http://0.0.0.0:7000/"

# SDX-related variables
echo '########## post consumer ########## '
curl -H 'Content-Type: application/json' -X POST -d'{"hello": "world"}' $consumer_API
