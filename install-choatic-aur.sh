#!/bin/bash

echo "If this fails , a backup file of your pacman.conf has been created in /tmp/pacman.conf-backup"
cp /etc/pacman.conf /tmp/pacman.conf-backup

sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

if [ $? != 0 ]; then
	echo "Something failed, File not edited yet, exiting..."
	exit 1
fi
sudo sed -i "s|\#\[multilib-testing\]|\[chaotic-aur\]\nInclude = /etc/pacman.d/chaotic-mirrorlist\n\n\#\[multilib-te
sting\]|g" /etc/pacman.conf
