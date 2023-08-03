#!/bin/bash
# a installer to install all the programs i need

[ -f /bin/pacman ] && echo "Pacman Found"

echo "proceeding..."
sleep 1

ans=""

function run(){
	echo "$1"
	read ans
	if [ "$ans" != "n" ];then
		echo "installing" 
		eval "$2"
	else 
		echo "not installing..."
	fi 
	sleep 1
	ans=""
}


run 'Install Xorg? [Y,n]' 'sudo pacman -Sy xorg-server xorg-apps xf86-video-intel libxcb xcb-util xcb-util-keysyms xcb-util-wm xorg xorg-xinit'


run 'Install Oh my ZSH? [Y,n]' 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'

run 'Install yay? [Y,n]' 'sudo pacman -S base-devel && git clone https://aur.archlinux.org/yay.git && [ -d yay ] && cd yay && makepkg -si'


echo "setting up chaotic aur.."
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo "Append to /etc/pacman.conf:"
printf "%s\n%s\n" "[chaotic-aur]" "Include = /etc/pacman.d/chaotic-mirrorlist"
