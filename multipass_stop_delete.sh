#!/bin/sh
multipass list
multipass stop sdx
multipass delete sdx -p
multipass delete --all
multipass purge
multipass list
echo "Sleeping..."
sleep 5
sudo sh "/Library/Application Support/com.canonical.multipass/uninstall.sh"
echo "Sleeping..."
sleep 5
brew uninstall --zap multipass
