#!/bin/sh
curl -H 'Content-type: application/json' -X POST http://192.168.0.6:8800/api/topology -d '{ "reference": "urn:sdx:topology:tenet.ac.za","name": "Tenet-OXP","version": 1,"model_version": "1.0.0"}'
