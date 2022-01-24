# macOS

## OSX

- [macOS Setup](https://sourabhbajaj.com/mac-setup/Homebrew/)
- generate ssh key: `ssh-keygen -t ed25519`
- clone dotfiles

### Homebrew

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

use homebrew to install:

- curl
- git
- go
- gnupg
- neovim
- python3
- wget

`brew install bash-completion curl git go gnupg neovim python3 tree wget`

casks:

- 1password
- docker
- slack
- vscode
- iterm2
- edge
- quicksilver

`brew install --cask 1password docker slack iterm2 microsoft-edge visual-studio-code dropbox onedrive box-drive spotify google-drive quicksilver`

- create development filesystem

```txt
$ mkdir -p go/src/github.com/joshuaejs go/{pkg,bin}
```

- pip install
  - setuptools
  - wheel
  - black

  - jinja2
  - jupyter
  - mypy
  - pydocstyle
  - pylint
  - bandit

```sh
$ sudo -H pip install flake8 jinja2 jupyter mypy ...

TODO output goes here
```

#### terminal and iterm colors

- [color schemes](https://github.com/nathanbuchar/atom-one-dark-terminal) for terminal and iterm

### Docker

- docs
  - (<https://docs.docker.com/docker-for-mac/>)

### vs code

- install extensions
  - Settings Sync
    - login to GitHub
    - initiate download
  - Python
  - Go

### Using Ansible

- <https://github.com/geerlingguy/mac-dev-playbook>
- <https://github.com/geerlingguy/pi-dev-playbook>
