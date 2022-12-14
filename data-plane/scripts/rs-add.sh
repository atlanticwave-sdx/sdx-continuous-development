#!/bin/bash

sleep 30

while ! nc -z 192.168.0.6 27027; do
  sleep 1 # wait 1 second before check for mongo1t again
done

while ! nc -z 192.168.0.7 27028; do
  sleep 1 # wait 1 second before check for mongo2t again
done

while ! nc -z 192.168.0.8 27029; do
  sleep 1 # wait 1 second before check for mongo3t again
done

mongosh "mongodb://192.168.0.6:27027/?replicaSet=rs0&authSource=admin" <<EOF
rs.status()
print("done connecting to replicaset with user/db admin.");

amlight = db.getSiblingDB('amlight')
use amlight
amlight.createUser(
  {
    user: "amlight_user",
    pwd: "amlight_pwd",
    roles: [
        {
          role: "readWrite",
          db: "amlight"
        }
    ]
  }
)

sax = db.getSiblingDB('sax')
use sax
sax.createUser(
  {
    user: "sax_user",
    pwd: "sax_pwd",
    roles: [
        {
          role: "readWrite",
          db: "sax"
        }
    ]
  }
)

tenet = db.getSiblingDB('tenet')
use tenet
tenet.createUser(
  {
    user: "tenet_user",
    pwd: "tenet_pwd",
    roles: [
        {
          role: "readWrite",
          db: "tenet"
        }
    ]
  }
)

exit
EOF

