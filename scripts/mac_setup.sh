#!/bin/bash
#

set -ex

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# things to install with homebrew
HB_FORMULAE=""
HB_CASKS="1password box-drive google-chrome inkscape kitty microsoft-edge onedrive skim slack spotify visual-studio-code whatsapp zoom"

`brew install --cask 1password docker slack microsoft-edge visual-studio-code dropbox onedrive box-drive spotify google-drive`
