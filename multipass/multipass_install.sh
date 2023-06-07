#!/bin/sh
sleep 5
brew install multipass
echo "Sleeping..."
sleep 30
multipass get local.driver
multipass list
multipass set local.driver=qemu
echo "Sleeping..."
sleep 5
multipass list
multipass get local.driver
