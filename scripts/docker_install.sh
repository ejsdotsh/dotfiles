#!/bin/bash
#
# setup debian/ubuntu wsl envorinment faster

# update and install prequisites
sudo apt-get update \
  && DEBIAN_FRONTEND=noninteractive sudo apt-get --purge remove -y \
    docker* \
    container* \
    runc

DEBIAN_FRONTEND=noninteractive sudo apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    gnupg \
    lsb-release
#
# get docker's gpg key and add to the apt keyring
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) test" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update \
  && DEBIAN_FRONTEND=noninteractive sudo apt-get install -y --no-install-recommends \
    docker-ce \
    docker-ce-cli \
    docker-ce-rootless-extras \
    docker-scan-plugin \
    containerd.io

# clean up
sudo apt-get --purge autoremove -y \
  && sudo apt-get clean
