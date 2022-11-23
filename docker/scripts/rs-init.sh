#!/bin/bash

MONGO_NODES=(mongo1t:27017 mongo2t:27017 mongo3t:27017)

echo "Waiting for mongo nodes serverStatus..."
for mongo_node in "${MONGO_NODES[@]}"
do
  until curl http://${mongo_node}/serverStatus\?text\=1 2>&1 | grep uptime | head -1; do
    printf '.'
    sleep 5
  done
done
echo "All mongo nodes are up"

echo "Applying replicaSet rs0 config on ${MONGO_NODES[0]} at `date +"%T" `..."
mongosh --host 192.168.0.6 -u "admin_user" -p "admin_pwd" --authenticationDatabase "admin" <<EOF 
rs.initiate()

admin = db.getSiblingDB("admin")
admin.createUser(
  {
    user: process.env["MONGO_INITDB_ROOT_USERNAME"],
    pwd: process.env["MONGO_INITDB_ROOT_PASSWORD"],
    roles: [ { role: "root", db: "admin" } ]
  }
)

use napps
db.createUser(
  {
    user: process.env["MONGO_USERNAME"],
    pwd: process.env["MONGO_PASSWORD"],
    roles: [ { role: "dbAdmin", db: "napps" } ]
  }
)

print("done admin users have been created.");
exit
EOF

