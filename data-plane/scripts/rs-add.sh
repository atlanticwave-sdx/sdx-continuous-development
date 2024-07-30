#!/bin/bash

sleep 30

while ! echo 'db.runCommand("ping").ok' | mongosh --quiet "mongodb://192.168.0.6:27027/"; do
  sleep 1 # wait 1 second before check for mongo1t again
done

while ! echo 'db.runCommand("ping").ok' | mongosh --quiet "mongodb://192.168.0.7:27028/"; do
  sleep 1 # wait 1 second before check for mongo2t again
done

while ! echo 'db.runCommand("ping").ok' | mongosh --quiet "mongodb://192.168.0.8:27029/"; do
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

sdx_test = db.getSiblingDB('sdx_test')
use sdx_test
sdx_test.createUser(
  {
    user: "sdx_test_user",
    pwd: "sdx_test_pwd",
    roles: [
        {
          role: "readWrite",
          db: "sdx_test"
        }
    ]
  }
)

sdx_lc = db.getSiblingDB('sdx_lc')
use sdx_lc
sdx_lc.createUser(
  {
    user: "sdx_lc_user",
    pwd: "sdx_lc_pwd",
    roles: [
        {
          role: "readWrite",
          db: "sdx_lc"
        }
    ]
  }
)

sdx_controller = db.getSiblingDB('sdx_controller')
use sdx_controller
sdx_controller.createUser(
  {
    user: "sdx_controller_user",
    pwd: "sdx_controller_pwd",
    roles: [
        {
          role: "readWrite",
          db: "sdx_controller"
        }
    ]
  }
)

exit
EOF
# XXX: give enough time to healthcheck
sleep 60
