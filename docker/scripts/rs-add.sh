#!/bin/bash

mongosh --host "rs0/192.168.0.6:27027" -u "admin_user" -p "admin_pwd" --authenticationDatabase "admin" <<EOF
rs.isMaster()
print("done connecting to replicaset.");
rs.add("mongo2t:27028")
rs.add("mongo3t:27029")
print("done all nodes added.");
EOF

