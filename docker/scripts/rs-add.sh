#!/bin/bash

mongosh --host "mongo1t" -u "admin_user" -p "admin_pwd" --authenticationDatabase "admin" <<EOF
rs.status()
rs.addNode("mongo2t:27017")
rs.addNode("mongo3t:27017")

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

mongosh --host "mongo1t" -u "amlight_user" -p "amlight_pwd" --authenticationDatabase "amlight" <<EOF
rs.status()
print("done connecting to replicaset with user/db amlight.");
exit
EOF

mongosh --host "mongo2t" -u "sax_user" -p "sax_pwd" --authenticationDatabase "sax" <<EOF
rs.status()
print("done connecting to replicaset with user/db sax.");
exit
EOF

