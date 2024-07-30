#!/bin/bash

sudo pacman -S base-devel
git clone https://aur.archlinux.org/yay.git
[ -d yay ] || {
	echo "Error occured"
	exit 1
}
cd yay && makepkg -si
