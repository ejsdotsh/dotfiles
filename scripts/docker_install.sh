#!/bin/bash
#
# setup debian/ubuntu wsl envorinment faster

export DEBIAN_FRONTEND=noninteractive
source /etc/os-release

# update and uninstall
sudo apt-get update -qq \
  && sudo apt-get --purge remove -y \
    docker* \
    container* \
    runc

# remove old keyring
sudo rm -f /usr/share/keyrings/docker-archive-keyring.gpg

# need to use iptables-legacy
sudo update-alternatives --set iptables /usr/sbin/iptables-legacy

# install prereqs
sudo apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    gnupg \
    lsb-release

# get docker's gpg key and add to the apt keyring
curl -fsSL https://download.docker.com/linux/${ID}/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/${ID} \
  ${VERSION_CODENAME} test" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update \
  && sudo apt-get install -y --no-install-recommends \
    docker-ce \
    docker-ce-cli \
    docker-ce-rootless-extras \
    docker-scan-plugin \
    containerd.io

# add nvidia cuda support
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-docker.gpg
cat <<EOF | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
deb https://nvidia.github.io/libnvidia-container/experimental/ubuntu20.04/\$(ARCH) /
deb https://nvidia.github.io/nvidia-container-runtime/experimental/ubuntu20.04/\$(ARCH) /
deb https://nvidia.github.io/nvidia-docker/ubuntu20.04/\$(ARCH) /
EOF

# clean up
sudo apt-get --purge autoremove -y \
  && sudo apt-get clean
