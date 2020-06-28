#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Usage: $0 <username>"
	exit 1
fi

echo "[ Installing some dependencies ]"
# some base tools
pacman --noconfirm --needed -S base-devel git vim neovim >/dev/null 2>&1 || ( echo "[ Could not install dependencies! ]"; exit 1 )

# yay - the aur helper of choice
mkdir /tmp/autorice
cd /tmp/autorice
git clone https://aur.archlinux.org/yay.git
cd yay
sudo -u "$1" makepkg -si --noconfirm --needed >/dev/null 2>&1 || ( echo "[ Could not install yay! ]"; exit 1 )

echo "[ Finished installing dependencies ]"
