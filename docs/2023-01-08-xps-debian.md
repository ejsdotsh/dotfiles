## sway configuration

- ~~set terminal~~
- ~~set font~~
- ~~setup input devices~~
- setup output devices
- update keybindings
- login manager

### login manager

```txt
[terminal]
# The VT to run the greeter on. Can be "next", "current" or a number
# designating the VT.
vt = 1

# The default session, also known as the greeter.
[default_session]

# `agreety` is the bundled agetty/login-lookalike. You can replace `$SHELL`
# with whatever you want started, such as `sway`.
command = "/usr/sbin/agreety --cmd sway --unsupported-gpu"
# if using wlgreet
#command = "sway --config /etc/greetd/sway-config"

# The user to run the command as. The privileges this user must have depends
# on the greeter. A graphical greeter may for example require the user to be
# in the `video` group.
user = "_greetd"

[initial_session]
command = "/usr/local/bin/sway-run"
user = "ejs"
```

## references

- [sway wiki](https://github.com/swaywm/sway/wiki)
- [greetd](https://man.sr.ht/~kennylevinsen/greetd/)
- [swayr](https://sr.ht/~tsdh/swayr/)
- [swawm on debian11](https://blog.aktsbot.in/swaywm-on-debian-11.html)

# installing debian on my dell xps 15

## setup

```txt
diskutil list
diskutil unmountDisk <disk>

sudo dd if=somthing.iso of=<disk> bs=1m

disktuil eject <disk>
```

- ~~bookworm alpha 1 installer~~
- [testing weekly w/
firmware](https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/weekly-builds/)
- no additional packages

### wireless

```txt
export PATH=$PATH:/sbin:/usr/sbin
echo $PATH
iw dev
sudo ip link set wlp0s20f3 up
export WLAN=wlp0s20f3
sudo iw $WLAN scan
export SSID=unicorn_party
sudo su -l -c "wpa_passphrase unicorn_party  > /etc/wpa_supplicant/wpa_supplicant.conf"

sudo vi /etc/wpa_supplicant/wpa_supplicant.conf
sudo systemctl reenable wpa_supplicant.service
sudo service wpa_supplicant restart

iw dev
sudo wpa_supplicant -B -D wext -i $WLAN -c /etc/wpa_supplicant/wpa_supplicant.conf
sudo dhclient $WLAN
ip addr
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install openssh-server --no-install-recommends
ip addr
```

### base packages

```txt
sudo apt-get --purge remove nano && sudo apt-get update

sudo visudo
```

- apt-transport-https
- bzip2
- ca-certificates
- curl
- debian-keyring
- git
- gnupg2
- gzip
- software-properties-common
- unzip
- zstd

#### development

- build-essential
- libc6-dev
- golang
- kitty
- fonts-dejavu
- less
- make
- neovim
- python3
- python3-pip
- python3-setuptools
- python3-wheel
- python3-venv
- python3-pynvim
- npm
- ripgrep




#### firmware & drivers

- firmware-iwlwifi
- intel-microcode
- firmware-misc-nonfree
- nvidia-driver
- linux-headers-amd64
- firmware-realtek

#### sway

- sway
- swayidle
- swaylock
- lm-sensors
- qt6-wayland
- xdg-desktop-portal-wlr


sudo reboot
```

### sway config

- <https://forums.developer.nvidia.com/t/nvidia-495-on-sway-tutorial-questions-arch-based-distros/192212/3>

## packages

- 1password
- rclone
- ms-edge
- chrome

## waybar

```txt
mkdir -p ~/.config/waybar
cp /etc/xdg/waybar/* ~/.config/waybar
```

