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
	atool libarchive zip unzip trash-cli sshfs rclone fuse2 \
	iwd wireless_tools wpa_supplicant \
	neovim neovim-plugins python-pynvim \
	kitty kitty-terminfo tree apparmor \
	mtr bluez-utils acpi paru network-manager-applet \
	btop

# hyprland and wayland apps
sudo pacman -S --needed --noconfirm \
	mako wofi polkit-gnome \
	xdg-utils xdg-desktop-portal-gtk \
	polkit-kde-agent polkit-qt6 gnome-keyring \
	swayidle \
	wl-clipboard wayland-utils \
	qt5-wayland qt6-wayland qt5ct qt6ct \
	pipewire wireplumber
	# grim slurp

# TODO rewrite with paru
# yay -Syua --needed --noconfirm --sudoloop \
# 	waybar-hyprland swaylock-effects nwg-look \
# 	catppuccin-gtk-theme-mocha
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

# TODO rewrite with paru
# yay -S --needed --noconfirm --sudoloop \
# 	opentofu
#podman-desktop \

# if [ ! -e "/usr/bin/terraform" ]; then
# 	sudo ln -s /usr/bin/tofu /usr/bin/terraform
# fi

# TODO rewrite with paru
# security stuff
# yay -S --needed --noconfirm --sudoloop \
# 	1password 1password-cli

# systemd for mako, waybar, and swayidle
function user_systemd() {
	systemctl --user add-wants niri.service mako.service
	systemctl --user add-wants niri.service waybar.service

	cat > $DTFS/dotconfig/systemd/user/swayidle.service << EOF
[Unit]
PartOf=graphical-session.target
After=graphical-session.target
Requisite=graphical-session.target

[Service]
ExecStart=/usr/bin/swayidle -w timeout 601 'niri msg action power-off-monitors' timeout 600 'swaylock -f' before-sleep 'swaylock -f'
Restart=on-failure
EOF

	systemctl --user add-wants niri.service swayidle.service
	# reload systemd
	systemctl --user daemon-reload
}

exit 0
