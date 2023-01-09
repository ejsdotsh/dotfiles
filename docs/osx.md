# macOS

## OSX

- [macOS Setup](https://sourabhbajaj.com/mac-setup/Homebrew/)
- generate ssh key: `ssh-keygen -t ed25519`
- clone dotfiles

### supported languages

- [mit-scheme]
- [go]
- [python3]
- [lua]
- [LaTeX]
- [json]
- [markdown]

## setup/install process

### neovim

i'm moving back to nvim after time with vscode. i've become too reliant on the mouse, and it has reduced my typing speed
and accuracy, as well as slowing my overall flow of getting anything done. i like vscode quite a lot, but i was never
able to get the key-bindings quite right, and when i started experiencing keyboard lag and rendering issues on my older
macbookpro, i decided to focus on nvim. what i want from my editor:

- ~~a spell check~~(builtin)
- a way to automagically create a table of contents for markdown (perhaps others)
- syntax highlighting
- auto-indentation
- a toolbar with helpful information
- auto-completion
- LSP support

i also want plugins written in `lua`... **no vimscript**

plugins:

- [packer.nvim]
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [treesitter]
- [fzy] (rather than [fzf])?
- [prettierd] or prettier-d-slim
- [mind.nvim]

### Homebrew

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

add the repo for zathura:

`brew tap zegervdv/zathura`

use homebrew to install:

- curl
- git
- go
- gnupg
- neovim
- python3
- wget
- zathura


casks:

- 1password
- docker
- slack
- --vscode--
- ~~iterm2~~
- edge
- --quicksilver--
- kitty

`brew install --cask 1password docker slack iterm2 microsoft-edge visual-studio-code dropbox onedrive box-drive spotify google-drive quicksilver`

- create development filesystem

```txt
mkdir -p ~/{go,repo}
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

***switching to [kitty]()+[tmux]()***

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
