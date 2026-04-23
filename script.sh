#!/usr/bin/env bash

set -Eeuo pipefail

trap 'echo "Error occurred at line $LINENO"; exit 1' ERR

# Add Docker's official GPG key:
apt update
apt install ca-certificates curl
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

apt update

apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

systemctl start docker

groupadd docker

usermod -aG docker $USER

newgrp docker

systemctl enable docker.service
systemctl enable containerd.service


docker: {
    enable: true 
    update_infra: true 
    install_tools: [curl, ca-certificates, docker-ce, docker-cli]
}