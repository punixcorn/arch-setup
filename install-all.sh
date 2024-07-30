#!/bin/bash

[ -f /bin/pacman ] && echo "Pacman Found"

echo "proceeding..."
sleep 1

echo 'Installing Xorg...'
./install-xorg.sh

echo 'Installing Oh my ZSH...'
./install-zsh.sh

echo 'Installing yay...'
./install-yay.sh

echo 'Installing choatic-aur'
./install-choatic-aur.zsh
