#!/bin/bash

HOSTS_ENTRY="127.0.0.1 mongo1 mongo2 mongo3"
COUNT=$(cat /etc/hosts | grep -c "$HOSTS_ENTRY")
if [ $COUNT -eq 0 ]; then
  echo "$HOSTS_ENTRY" >> /etc/hosts
fi

MONGO_NODES=(mongo1:27017 mongo2:27018 mongo3:27019)

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
mongosh --host ${MONGO_NODES[0]} <<EOF
var config = {
    "_id": "rs0",
    "protocolVersion": 1,
    "version": 1,
    "members": [
        {
            "_id": 1,
            "host": "${MONGO_NODES[0]}",
            "priority": 30
        },
        {
            "_id": 2,
            "host": "${MONGO_NODES[1]}",
            "priority": 20
        },
        {
            "_id": 3,
            "host": "${MONGO_NODES[2]}",
            "priority": 10
        }
    ]
};
rs.initiate(config, { force: true });
rs.status();

var curStatus = rs.status();
while (curStatus.members[0].stateStr !== 'PRIMARY') {
  print("Waiting for 1s while stateStr !== PRIMARY, current:", curStatus.members[0].stateStr);
  sleep(1000);
  curStatus = rs.status();
}
if (!curStatus) {
  print("rs.status() failed, exiting, check the logs");
  exit();
}
print("Done. Primary node stateStr is PRIMARY.")

admin = db.getSiblingDB("admin");
admin.createUser(
  {
    user: process.env["MONGO_INITDB_ROOT_USERNAME"],
    pwd: process.env["MONGO_INITDB_ROOT_PASSWORD"],
    roles: [ { role: "root", db: "admin" } ]
  }
);

