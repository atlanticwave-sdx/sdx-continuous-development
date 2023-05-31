#!/bin/sh
multipass exec sdx -- bash -c "mongo --host '192.168.0.6' --port '27027' -u 'admin_user' -p 'admin_pwd' --authenticationDatabase admin"
# mongodb://192.168.0.6:27027/?directConnection=true&authSource=admin&appName=mongosh+1.9.0

