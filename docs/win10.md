# windows 10

## overview

- enable
  - WSL2
    - [WSL Install Guide](https://docs.microsoft.com/en-us/windows/wsl/install)
      - microsoft [best practices](https://docs.microsoft.com/en-us/windows/wsl/setup/environment) for setting up wsl
    - install & enable Ubuntu
  - Hyper-V
  - Docker
    - [using docker with wsl2](https://code.visualstudio.com/blogs/2020/03/02/docker-in-wsl2?ref=codebldr)
    - [docker desktop wsl 2 backend](https://docs.docker.com/docker-for-windows/wsl-tech-preview/#download)
- install chocolatey
  - [install](https://chocolatey.org/install)
  - an [example](https://www.digitalocean.com/community/tutorials/how-to-install-python-3-and-set-up-a-local-programming-environment-on-windows-10)

### WSL2

- win+x -> powershell (admin)

```sh
PS C:\Users\jejs> wsl --install
Installing: Virtual Machine Platform
Virtual Machine Platform has been installed.
Installing: Windows Subsystem for Linux
Windows Subsystem for Linux has been installed.
Downloading: WSL Kernel
Installing: WSL Kernel
WSL Kernel has been installed.
Downloading: GUI App Support
Installing: GUI App Support
GUI App Support has been installed.
Downloading: Ubuntu
The requested operation is successful. Changes will not be effective until the system is rebooted.
```

- reboot
- [update wsl2 kernel](https://docs.microsoft.com/en-us/windows/wsl/wsl2-kernel)
- [config wsl2](https://docs.microsoft.com/en-us/windows/wsl/wsl-config)

```sh
wsl --set-default-version 2
```

- install Linux distro of choice
  - Debian and/or Ubuntu are recommended
  - [Debian](https://www.microsoft.com/store/apps/9MSVKQC78PK6)
  - [Ubuntu 20.04 LTS](https://www.microsoft.com/store/apps/9n6svws3rx71)
- ensure it is using wsl2

```sh
wsl --list --verbose
```

- start selected distro's app, and create username and password

```sh
) debian/ubuntu
... installing ...

```

- [fix file permissions](https://docs.microsoft.com/en-us/windows/wsl/wsl-config#configure-per-distro-launch-settings-with-wslconf)

```ini
[automount]
enabled = true
options = "metadata,umask=22,fmask=11"
```

- update system
- install packages for Python, Go, and C/C++ development in VS Code

```sh
sudo apt-get update && sudo apt-get dist-upgrade -y

sudo apt-get install build-essential gdb g++ gcc libc5-dev make python3-pip python3-setuptools

```

- disable windows features

```sh
dism.exe /online /disable-feature /featurename:smb1protocol /norestart
dism.exe /online disable-feature /featurename:windowsmediaplayer /norestart
dism.exe /online disable-feature /featurename:internet-explorer-optional-amd64 /norestart

```

- reboot

#### issues

- time drift between wsl2 and windows
  - example: `Release file for http://security.ubuntu.com/ubuntu/dists/focal-security/InRelease is not valid yet`
  - <https://askubuntu.com/questions/1096930/sudo-apt-update-error-release-file-is-not-yet-valid>
  - fix with `sudo hwclock --hctosys`

### chocolatey

- [install chocolatey](https://chocolatey.org/install)
- install packages
  - 7zip
  - vscode
  - spotify
  - microsoft windows terminal

```powershell
choco install 7zip vscode microsoft-windows-terminal -y

```

### terminal

- set wsl default
- edit colors, keybindings, etc.
- ssh key/dotfiles

```sh
ssh-keygen -t ed25519

```

### vs code

- themes
  - [Fantastic (Ayu...)]

- extensions
  - ~[Djaneiro]~
  - [Ansible]
  - [All Autocomplete]
  - [Spell Right](https://marketplace.visualstudio.com/items?itemName=ban.spellright)
  - [Bracket Pair Colorizer]
  - [GitLens]
  - [Markdown All in One]
  - [Project Manager]
  - [Settings Sync]
  - [Paste JSON as Code](https://marketplace.visualstudio.com/items?itemName=quicktype.quicktype)
  - [Explorer Exclude]

- future
  - [Puppet]
  - [ApiDoc Snippets]

- settings references
  - (<https://djangocentral.com/visual-studio-code-setup-for-django-developers/>)
  - (<https://medium.com/productivity-freak/the-ultimate-vscode-setup-for-js-react-6a4f7bd51a2>)
  - (<https://rominirani.com/setup-go-development-environment-with-visual-studio-code-7ea5d643a51a>)
  - (<https://medium.com/@betakuang/setup-go-development-environment-with-vs-code-and-wsl-on-windows-62bd4625c6a7>)
  - (<https://code.visualstudio.com/docs/remote/ssh>)
  - (<https://blog.elmah.io/best-visual-studio-code-extensions/>)
  - (<https://stackify.com/top-visual-studio-code-extensions/>)
  - (<https://www.ubuntupit.com/best-visual-studio-code-extensions-for-programmers/>)
  - (<https://5minutebi.com/2019/03/14/how-to-setup-vscode-for-python-and-github-integration/>)
  - [devloping in wsl](https://code.visualstudio.com/docs/remote/wsl)

- Go setup
  - ctrl-shift-p
    - go: install/update tools
    - shell default
      - Git/Bash

### Ubuntu (WSL2)

- packages to install
  - ALREADY INSTALLED python3 (wsl)
  - ALREADY INSTALLED git (wsl)
  - golang (wsl)
  - neovim (wsl)

### Python

Ubuntu 20.04 ships with Python3.8.

- verify version

```sh
$ python -V
Python 3.8.2
```

### Go

Go is installed `/usr/local/go` automagically with [setup_go.sh](../scripts/setup_go.sh)

- verify install

```sh
$ go version
go version go1.16.2 linux/amd64

$ go env GOPATH
/home/jejs/repo/go

$ go env GOROOT
/usr/local/go
```

### C/C++

- [vs code setup - wsl](https://code.visualstudio.com/docs/cpp/config-wsl)
- [vs code setup - msvc](https://code.visualstudio.com/docs/cpp/config-msvc)

### Docker

TODO get docker 2.3

```sh
choco install docker

```

- get docker base-images

```sh
docker pull debian:testing-slim
docker pull centos:centos7
```

- rebuild images with necessary packages (will be automated in a future release)
  - custom Dockerfile for Debian and Centos7
    - (<https://stackoverflow.com/questions/25845538/how-to-use-sudo-inside-a-docker-container>)

```sh
docker build -t joshuaejs:centos7 centos7
docker build -t joshuaejs:debian debian
```
