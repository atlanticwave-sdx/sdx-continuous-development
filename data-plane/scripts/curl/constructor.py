#!/bin/sh

SDX_API="http://0.0.0.0:8081/sdx/v2/constructor"

curl -H 'Content-type: application/json' -X POST $SDX_API -d '{ "reference": "urn:sdx:topology:amlight.net","name": "Amlight-OXP","version": 1,"model_version": "1.0.0"}'
