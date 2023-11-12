#!/bin/bash

set -x


sudo pacman -S --noconfirm \
  neovim neovim-plugins python-pynvim \
  kitty kitty-terminfo

# purge
sudo pacman -Rsn --noconfirm \
  nano nano-syntax-highlighting

# hyprland and wayland apps
sudo pacman -S --noconfirm \
  mako wofi \
  hyprland xdg-desktop-portal-hyprland hyprpaper \
  waybar \
  swaylock swayidle \
  qt5-wayland qt6-wayland \
  pipewire wireplumber

# font and LaTeX installation
sudo pacman -S --noconfirm \
  tectonic \
  ttf-dejavu-nerd \
  ttf-firacode-nerd \
  ttf-font-awesome \
  ttf-inconsolata-nerd \
  ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono \
  ttf-ubuntu-nerd ttf-ubuntu-mono-nerd
