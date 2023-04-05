#/bin/bash
multipass exec sdx -- bash -c "sudo wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb"
multipass exec sdx -- bash -c "sudo dpkg -i libssl1.1_1.1.1f-1ubuntu2_amd64.deb"
multipass exec sdx -- bash -c "sudo apt-get update"
multipass exec sdx -- bash -c "sudo apt-get install mongodb-org-shell"
