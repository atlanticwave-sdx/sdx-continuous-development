#!/bin/sh
ps -ef | grep -i multipass | awk '{print "sudo kill -9 "$2}' | sh
echo "Sleeping..."
sleep 5
multipass list
sudo pkill multipassd
echo "Sleeping..."
sleep 5
multipass list
