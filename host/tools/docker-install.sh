#!/bin/bash
#
# SOP copied from: https://docs.docker.com/engine/install/ubuntu/

function abort()
{
	echo "$0: * ABORT: $*"
	exit 255
}

docker=$(which docker)
test ! "$docker" = "" && abort "docker command is standby. Check: $docker"

# Add Docker's official GPG key:
sudo apt-get update || abort "Line ${LINENO}"
sudo apt-get install ca-certificates curl || abort "Line ${LINENO}"
sudo install -m 0755 -d /etc/apt/keyrings || abort "Line ${LINENO}"
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc || abort "Line ${LINENO}"
sudo chmod a+r /etc/apt/keyrings/docker.asc || abort "Line ${LINENO}"

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null || abort "Line ${LINENO}"
sudo apt-get update || abort "Line ${LINENO}"

sync;
echo "...Plz run:"
echo "    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"
echo "...Plz add your account into group: docker"
echo "...Then, login again to renew the group configuration"

exit 0;
#;
