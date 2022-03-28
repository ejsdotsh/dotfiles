#!/bin/bash
#
# setup debian/ubuntu wsl envorinment faster

export DEBIAN_FRONTEND=noninteractive

echo "removing any previous versions..."
# ensure previous versions are uninstalled
sudo apt-get --purge remove -y \
    docker* \
    container* \
    runc >/dev/null 2>&1

echo "installing required software..."
# update and install required software
sudo apt-get update -qq \
  && sudo apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    gnupg \
    lsb-release >/dev/null 2>&1

# load os info
source /etc/os-release

echo "fetching docker's gpg key and adding sources..."
# get docker's gpg key and add to the apt keyring
curl -fsSL https://download.docker.com/linux/${ID}/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/${ID} \
  ${VERSION_CODENAME} test" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "installing docker..."
sudo apt-get update -qq \
  && sudo apt-get install -y --no-install-recommends \
    docker-ce \
    docker-ce-cli \
    docker-ce-rootless-extras \
    docker-compose \
    docker-scan-plugin \
    containerd.io >/dev/null 2>&1

# clean up
echo "cleaning up..."
sudo apt-get --purge autoremove -y \
  && sudo apt-get clean >/dev/null 2>&1
