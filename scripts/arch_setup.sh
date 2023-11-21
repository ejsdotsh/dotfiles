#!/bin/bash

# something like debugging
set -x

# purge
sudo pacman -Rsn --noconfirm \
	nano nano-syntax-highlighting

# ensure that some systems..ish stuff is installed
sudo pacman -S \
	openssh curl wget ripgrep fd lazygit \
	iwd wireless_tools wpa_supplicant \
	neovim neovim-plugins python-pynvim \
	kitty kitty-terminfo

# hyprland and wayland apps
sudo pacman -S \
	mako wofi \
	hyprland xdg-desktop-portal-hyprland swaybg \
	wl-clipboard waybar \
	swaylock swayidle \
	qt5-wayland qt6-wayland \
	pipewire wireplumber

# font and LaTeX installation
sudo pacman -S \
	tectonic \
	ttf-dejavu-nerd \
	ttf-firacode-nerd \
	ttf-font-awesome \
	ttf-inconsolata-nerd \
	ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono \
	ttf-ubuntu-nerd ttf-ubuntu-mono-nerd
