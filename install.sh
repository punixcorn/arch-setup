#!/bin/bash
# a installer to install all the programs i need

[ -f /bin/pacman ] && echo "Pacman Found"

echo "proceeding..."
sleep 1

ans=""

function checkup() {
	echo "$@"
	read ans
}

function pause() {
	sleep 1
	ans=""
}

checkup "Install Xorg? [Y,n]" && [ "$ans" != "n" ] && { echo "installing" && sudo pacman -Sy xorg-server \
	xorg-apps xf86-video-intel libxcb xcb-util xcb-util-keysyms \
	xcb-util-wm xorg xorg-xinit; } || echo "not installing Xorg"

pause

checkup "Install Oh my ZSH? [Y,n]" && [ "$ans" != "n" ] && { echo "installing" && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; } || echo "not installing Oh My Zsh"

pause

function installyay() {
	sudo pacman -S base-devel
	git clone https://aur.archlinux.org/yay.git
	[ -d yay ] && cd yay && makepkg -si
}

checkup "Install yay? [Y,n]" && [ "$ans" != "n" ] && { echo "installing" && installyay; } || echo "Not installing yay"
