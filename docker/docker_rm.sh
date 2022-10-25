#!/bin/sh
podman-compose down -v
podman machine stop
podman machine start

sudo podman system prune --all --volumes

# Remove all containers that aren't running.
sudo podman rm -vf $(podman ps -a -q --filter "status=exited")

# Remove untagged images.
sudo podman rmi -f $(podman images -q -f "dangling=true")

# Remove unused volumes using "rm" or "prune".
sudo podman volume rm -f $(podman volume ls -f "dangling=true")
sudo podman volume prune -f

# Remove unused networks.
sudo podman network prune -f

# Display running containers.
podman ps

# Display all containers using "-a" or "--all".
podman ps -a
podman ps --all

# Filter output using "-f" or "--filter".
podman ps -f "status=exited"
podman ps --filter "status=exited"

# Show only the container ID using "-q" or "--quiet".
podman ps -q -f "status=exited"
podman ps --quiet --filter "status=exited"

# Remove an individual container by ID or name.
# Use "-v" or "--volumes" to remove associated volumes.
# Use "-f" or "--force" to remove running containers.
#podman rm -vf b0479f9d1ea4
#podman rm --volumes --force ol7_ords_con

# Remove all the containers matching the "ps" output.
sudo podman rm -vf $(podman ps -a -q --filter "status=exited")

# Show top-level images only.
podman images

# Show all images using "-a" or "--all".
podman images -a
podman images --all

# Filter the output using "-f" or "--filter".
podman images -f "dangling=true"
podman images --filter "dangling=true"

# Display only the image ID using "-q" or "--quiet".
podman images -q -f "dangling=true"
podman images --quiet --filter "dangling=true"

# Remove image by image ID or repository:tag
#podman rmi ffcd22192b23
#podman rmi ol7_122:latest

# Force the remove using "-f" or "--force".
#podman rmi -f ffcd22192b23
#podman rmi --force ol7_122:latest

# Remove images matching list.
sudo podman rmi -f $(podman images -q -f "dangling=true")

# List all volumes.
podman volume ls

# Filter output using "-f" or "--filter".
podman volume ls -f "dangling=true"
podman volume ls --filter "driver=local"

# Display only volume name using "-q" or "--quiet".
podman volume ls -q -f "driver=local"
podman volume ls --quiet --filter "driver=local"

# Remove specified volume.
#podman volume rm test_vol

# Force removal using "-f" or "--force".
#podman volume rm -f test_vol
#podman volume rm --force test_vol

# Remove unused volumes.
sudo podman volume rm -f $(podman volume ls -f "dangling=true")

# Remove unused volumes.
sudo podman volume prune -f

# List all networks.
podman network ls

# Filter output using "-f" or "--filter".
podman network ls -f "driver=bridge"
podman network ls --filter "driver=bridge"

# Display only network ID using "-q" or "--quiet".
podman network ls -q -f "driver=bridge"
podman network ls --quiet --filter "driver=bridge"

# Remove network by name or ID.
#podman network rm my_network2
#podman network rm 6466079abd47

# Remove unused networks.
sudo podman network prune

# Force prune  using "-f" or "--force".
sudo podman network prune -f
sudo podman network prune --force

