#!/bin/sh

SDX_API="http://192.168.0.2:8181/api/kytos/sdx_topology/v1/get_sdx_topology"

curl -i -H "Content-Type: application/json" -X GET $SDX_API
