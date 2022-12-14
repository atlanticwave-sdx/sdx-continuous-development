#!/bin/bash

mongosh --host "rs0/mongo1t" -u "admin_user" -p "admin_pwd" --authenticationDatabase "admin" <<EOF
rs.status()
print("done connecting to replicaset with user/db admin.");
exit
EOF

mongosh --host "rs0/mongo1t" -u "amlight_user" -p "amlight_pwd" --authenticationDatabase "amlight" <<EOF
rs.status()
print("done connecting to replicaset with user/db amlight.");
exit
EOF

mongosh --host "rs0/mongo1t" -u "sax_user" -p "sax_pwd" --authenticationDatabase "sax" <<EOF
rs.status()
print("done connecting to replicaset with user/db sax.");
exit
EOF

