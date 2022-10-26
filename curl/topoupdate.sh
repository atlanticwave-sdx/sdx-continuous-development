#!/bin/sh
curl -H 'Content-type: application/json' -X PUT http://127.0.0.1:5000/api/topology/2 -d '{ "id": "urn:sdx:topology:tenet.ac.za","name": "Tenet-OXP","version": 2,"model_version": "1.0.0","timestamp": "2000-01-23T04:56:07Z"}'
