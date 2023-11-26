#!/bin/bash

# something like debugging
set -ex

# purge
if [ -e "/usr/bin/nano" ]; then
	sudo pacman -Rsnc --noconfirm \
		nano nano-syntax-highlighting
fi

# update
sudo pacman -Syu --noconfirm

# ensure that some systems..ish stuff is installed
sudo pacman -S --needed --noconfirm \
	openssh curl wget ripgrep fd lazygit \
	nnn atool libarchive zip unzip trash-cli sshfs rclone fuse2 \
	iwd wireless_tools wpa_supplicant \
	neovim neovim-plugins python-pynvim

kitty kitty-terminfo tree yay apparmor \
	mtr

# hyprland and wayland apps
sudo pacman -S --needed --noconfirm \
	mako wofi \
	hyprland xdg-desktop-portal-hyprland \
	xdg-utils xdg-desktop-portal-gtk \
	polkit-kde-agent polkit-qt6 gnome-keyring \
	swaybg swaylock swayidle \
	wl-clipboard wayland-utils \
	qt5-wayland qt6-wayland \
	pipewire wireplumber \
	grim slurp

yay -Syua --noconfirm --sudoloop
yay -S --needed --noconfirm --sudoloop \
	waybar-hyprland

# font and LaTeX installation
sudo pacman -S --needed --noconfirm \
	tectonic \
	ttf-dejavu-nerd \
	ttf-firacode-nerd \
	ttf-font-awesome \
	ttf-inconsolata-nerd \
	ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono \
	ttf-ubuntu-nerd ttf-ubuntu-mono-nerd

# development stuff
sudo pacman -S --needed --noconfirm \
	go go-tools \
	hugo npm nodejs-lts-hydrogen \
	podman \
	python-pip python-black python-poetry

yay -S --needed --noconfirm --sudoloop \
	podman-desktop \
	opentofu

# security stuff
yay -S --needed --noconfirm --sudoloop \
	1password 1password-cli

exit 0
