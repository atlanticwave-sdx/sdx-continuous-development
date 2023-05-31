#!/bin/sh
sleep 30
multipass get local.driver
multipass list
multipass set local.driver=qemu
echo "Sleeping..."
sleep 5
multipass list
multipass get local.driver
echo "Installing..."
multipass launch 22.04 --name sdx -d 20G -m 8192M -c 2
multipass set client.primary-name=sdx
multipass mount ~/sdx-continuous-development/data-plane sdx:/sdx
multipass list
multipass info sdx
