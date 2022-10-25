#!/bin/sh
multipass exec sdx -- bash -c "sudo bash -c /podman/1_build_network.sh"
multipass exec sdx -- bash -c "sudo bash -c /podman/2_build_debian_base.sh"
multipass exec sdx -- bash -c "sudo bash -c /podman/3_build_images.sh"
