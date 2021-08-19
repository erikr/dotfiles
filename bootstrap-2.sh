#!/bin/bash

# Oh-My-ZSH
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo chsh -s $(which zsh) $USER
