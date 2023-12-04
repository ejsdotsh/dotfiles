# endeavouros on my xps

hardware:

- `XPS 15 9500/0RDX6T, BIOS 1.24.1 08/15/2023`

## configuration

install package list

```txt
thunderbird

swayidle
swaylock
swaybg
waybar

archlinux-xdg-menu
arc-gtk-theme-eos
gtk-engine-murrine
sddm
acpi
bluez-utils
network-manager-applet
sysstat
wayland-protocols
xorg-xwayland
egl-wayland
gtk-layer-shell
ttf-nerd-fonts-symbols
brightnessctl
wl-clipboard
dex
jq
ttf-jetbrains-mono
ttf-ubuntu-font-family

openssh curl wget ripgrep fd lazygit \
nnn atool libarchive zip unzip trash-cli sshfs rclone fuse2 \
iwd wireless_tools wpa_supplicant \
neovim neovim-plugins python-pynvim \
kitty kitty-terminfo tree yay apparmor \
mtr bluez-utils acpi network-manager-applet \
btop
zathura
zathura-pdf-poppler

  mako wofi polkit-gnome \
  hyprland xdg-desktop-portal-hyprland \
  xdg-utils xdg-desktop-portal-gtk \
  polkit-qt6 gnome-keyring \
  wayland-utils \
  qt5-wayland qt6-wayland qt5ct qt6ct \
  pipewire wireplumber \
  grim slurp

# font and LaTeX installation
  tectonic \
  ttf-dejavu-nerd ttf-inconsolata-nerd ttf-firacode-nerd \
  ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono \
  ttf-font-awesome \
  awesome-terminal-fonts ttf-ubuntu-nerd ttf-ubuntu-mono-nerd

# development stuff
  go go-tools \
  hugo npm nodejs-lts-hydrogen \
  podman \
  python-pip python-black python-poetry


yay -Syua --needed --noconfirm --sudoloop \
  waybar-hyprland swaylock-effects nwg-look \
  catppuccin-gtk-theme-mocha
catppuccin-gtk-theme-macchiato catppuccin-gtk-theme-frappe catppuccin-gtk-theme-latte
yay -S --needed --noconfirm --sudoloop \
  opentofu
#podman-desktop \

if [ ! -e "/usr/bin/terraform" ]; then
  sudo ln -s /usr/bin/tofu /usr/bin/terraform
fi

# security stuff
yay -S --needed --noconfirm --sudoloop \
  1password 1password-cli


```

## customization

- thunderbird
  - sorting options: <https://superuser.com/a/13551>

### catppuccin

- btop

  ```sh
  git clone https://github.com/catppuccin/btop.git /tmp/btop
  mv /tmp/btop/themes/* ~/.config/btop/themes/
  rm -rf /tmp/btop

  ```

- firefox
  - <https://github.com/catppuccin/firefox>
- hyprland

  ```sh
  git clone https://github.com/catppuccin/hyprland.git /tmp/hyprland
  mv /tmp/hyprland/themes/mocha.conf ~/.config/hyprland/
  rm -rf /tmp/hyprland

  # hypr/hyprland.conf
  source=mocha.conf

  ```

- gtk

```sh
yay -S catppuccin-gtk-theme-mocha catppuccin-gtk-theme-macchiato \
  catppuccin-gtk-theme-frappe catppuccin-gtk-theme-latte

export THEME_DIR=/usr/share/themes/Catppuccin-Mocha-Standard-Lavender-Dark

ln -sf "${THEME_DIR}/gtk-4.0/assets" "${HOME}/.config/gtk-4.0/assets"
ln -sf "${THEME_DIR}/gtk-4.0/gtk.css" "${HOME}/.config/gtk-4.0/gtk.css"
ln -sf "${THEME_DIR}/gtk-4.0/gtk-dark.css" "${HOME}/.config/gtk-4.0/gtk-dark.css"

# hypr/hyprland.conf
env = GTK_THEME,Catppuccin-Mocha-Standard-Lavender-Dark
```

- lazygit
  - <https://github.com/catppuccin/lazygit>
- kitty
  - <https://github.com/catppuccin/kitty>
- thunderbird

  ```sh
  git clone https://github.com/catppuccin/thunderbird.git ~/repo/gh/catppuccin/thunderbird

  ...do stuff in application...
  ```

- tmux
  - <https://github.com/catppuccin/tmux>
- zathura

  ```sh
  git clone https://github.com/catppuccin/zathura.git ~/repo/gh/catppuccin/zathura
  mkdir -p ~/.config/zathura
  cp zathura/src/catppuccin-mocha ~/.config/zathura/
  echo "include catppuccin-mocha > ~/.config/zathura/zathurarc"
  ```

## automation

see [scripts/endeavouros_setup.sh](../scripts/endeavouros_setup.sh)

## references

- <https://www.lorenzobettini.it/2023/07/hyprland-getting-started-part-1/>
- <https://www.lorenzobettini.it/2023/07/hyprland-getting-started-part-2/>
