#!/bin/bash

# setting up zsh
[ ! -f /bin/zsh ] && sudo pacman -S zsh
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh >zsh-setup-tmp.sh
chmod +x ./zsh-setup-tmp
./install-zsh.sh
