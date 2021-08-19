#!/bin/bash

# Set up symlinks
bash ~/dotfiles/generate-symlinks.sh

# Foundation
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install neovim curl zsh tmux tree unzip make
sudo apt-get dist-upgrade
sudo passwd