#!/bin/bash

mongosh "mongodb://192.168.0.9:27030/?directConnection=true&authSource=admin" <<EOF
db.auth('admin_user', 'admin_pwd')

db = db.getSiblingDB('sdx_lc')

db.createUser(
  {
    user: "sdx_user",
    pwd: "sdx_pwd",
    roles: [
        {
          role: "readWrite",
          db: "sdx_lc"
        }
    ]
  }
);
print("done sdx_lc database have been created.");
exit

EOF
