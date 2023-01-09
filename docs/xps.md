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

### initial packages

```txt
sudo apt-get --purge remove nano && \
sudo apt-get update && \
sudo apt-get install \
  apt-transport-https \
  build-essential \
  ca-certificates \
  curl \
  debian-keyring \
  fonts-dejavu \
  git \
  gnupg2 \
  golang \
  kitty \
  less \
  libc6-dev \
  make \
  neovim
  software-properties-common \
  zstd \
  --no-install-recommends

sudo visudo


```

```txt
sudo apt-get install \
  firmware-iwlwifi \
  intel-microcode \
  firmware-misc-nonfree \
  nvidia-driver \
  linux-headers-amd64 \
  firmware-realtek \
  sway \
  swayidle \
  swaylock \
  lm-sensors \
  xdg-desktop-portal-wlr


sudo reboot
```

### sway config

- <https://forums.developer.nvidia.com/t/nvidia-495-on-sway-tutorial-questions-arch-based-distros/192212/3>


```txt

```

## i3 install

~~## installing ubuntu on my dell xps 15~~

~~i chose the ubuntu-server image, and then installed minimal + third-party~~

~~`sudo apt-get update && sudo apt-get install --no-install-recommends neovim git less -y`~~

install stuff...

```
sudo apt-get install \
  nvidia-driver-525-open xwayland sway sway-backgrounds swaybg swayidle swayimg swaylock tofi waybar wdisplays fonts-dejavu

```

## starting over with desktop
