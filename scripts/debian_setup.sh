#!/bin/bash
#
# https://support.1password.com/betas/#install-a-beta-release-of-1password-for-linux
# https://support.1password.com/install-linux/

KEYDIR=/usr/share/keyrings
APTDIR=/etc/apt/sources.list.d

function add_1password() {
  # add 1password keys & repo
  if [ -f "$KEYDIR"/1password.gpg ]; then
    sudo rm -f "$KEYDIR"/1password.gpg
  fi

  curl https://downloads.1password.com/linux/keys/1password.asc | \
    sudo gpg --dearmor --output "$KEYDIR"/1password.gpg

  if [ -f "$APTDIR"/1password.list ]; then
    sudo rm -f "$APTDIR"/1password.list
  fi

  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/1password.gpg] https://downloads.1password.com/linux/debian/amd64 beta main" | \
    sudo tee "$APTDIR"/1password.list

  # add the debsig-verify policies
  sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
  curl https://downloads.1password.com/linux/debian/debsig/1password.pol | \
    sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol

  sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
  curl https://downloads.1password.com/linux/keys/1password.asc | \
    sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg

  sudo apt-get update && sudo apt-get install -y 1password
}

function add_msedge() {
  if [ -f "$KEYDIR"/microsoft.gpg ]; then
    sudo rm -f "$KEYDIR"/microsoft.gpg
  fi

  curl https://packages.microsoft.com/keys/microsoft.asc | \
    sudo gpg --dearmor --output "$KEYDIR"/microsoft.gpg

  echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/edge stable main" | \
    sudo tee "$APTDIR"/microsoft-edge-beta.list

  ## install
  sudo apt-get update && sudo apt-get install -y microsoft-edge-beta
}

function add_min_system() {
  sudo apt-get update
  sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    debian-keyring \
    git \
    gnupg2 \
    less \
    software-properties-common \
    tree \
    zstd
}

function add_dev_tools() {
  sudo apt-get update
  sudo apt-get install -y \
    build-essential \
    clang \
    make

  sudo apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    python3-setuptools \
    python3-wheel

  sudo apt-get install -y \
    golang

  }


function add_sway() {
  sudo apt-get update
  sudo apt-get install -y \
   lm-sensors \
   xdg-desktop-portal-wlr \
   mako-notifier \
   kitty \
   tofi \
   sway \
   swayidle \
   swaylock \
   qt6-wayland
}

function add_drivers() {
  sudo apt-get update
  sudo apt-get install -y \
   firmware-iwlwifi \
   intel-microcode \
   firmware-misc-nonfree \
   nvidia-driver \
   linux-headers-amd64 \
   firmware-realtek
}
