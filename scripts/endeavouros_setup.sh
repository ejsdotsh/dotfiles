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
	neovim neovim-plugins python-pynvim \
	kitty kitty-terminfo tree yay apparmor \
	mtr bluez-utils acpi network-manager-applet \
	btop

# hyprland and wayland apps
sudo pacman -S --needed --noconfirm \
	mako wofi polkit-gnome \
	hyprland xdg-desktop-portal-hyprland \
	xdg-utils xdg-desktop-portal-gtk \
	polkit-kde-agent polkit-qt6 gnome-keyring \
	swaybg swayidle \
	wl-clipboard wayland-utils \
	qt5-wayland qt6-wayland qt5ct qt6ct \
	pipewire wireplumber \
	grim slurp

yay -Syua --needed --noconfirm --sudoloop \
	waybar-hyprland swaylock-effects nwg-look \
	catppuccin-gtk-theme-mocha
#catppuccin-gtk-theme-macchiato catppuccin-gtk-theme-frappe catppuccin-gtk-theme-latte

# font and LaTeX installation
sudo pacman -S --needed --noconfirm \
	tectonic \
	ttf-dejavu-nerd ttf-inconsolata-nerd ttf-firacode-nerd \
	ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono \
	ttf-font-awesome \
	awesome-terminal-fonts ttf-ubuntu-nerd ttf-ubuntu-mono-nerd

# development stuff
sudo pacman -S --needed --noconfirm \
	go go-tools \
	hugo npm nodejs-lts-hydrogen \
	podman \
	python-pip python-black python-poetry

yay -S --needed --noconfirm --sudoloop \
	opentofu
#podman-desktop \

if [ ! -e "/usr/bin/terraform" ]; then
	sudo ln -s /usr/bin/tofu /usr/bin/terraform
fi

# security stuff
yay -S --needed --noconfirm --sudoloop \
	1password 1password-cli

exit 0
