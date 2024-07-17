#!/bin/sh

SDX_API="http://0.0.0.0:8181/api/kytos/sdx_topology/v1/get_sdx_topology"

multipass exec sdx -- bash -c "curl -i -H 'Content-Type: application/json' -X GET $SDX_API"
