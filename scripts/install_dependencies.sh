#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: $0 <username>"
	exit 1
fi

echo "[ Installing some dependencies ]"
# some base tools
if ! pacman --noconfirm --needed -S base-devel git vim neovim >/dev/null 2>&1; then
	echo "[ Could not install dependencies! ]"
	exit 1
fi

# yay - the aur helper of choice
if [ -d /tmp/autorice ]; then
	echo "[ autorice found, redownloading - just to be sure ]"
	rm -rf /tmp/autorice >/dev/null 2>&1
fi

sudo -u "$1" mkdir /tmp/autorice
cd /tmp/autorice
sudo -u "$1" git clone https://aur.archlinux.org/yay.git >/dev/null 2>&1
cd yay

if ! sudo -u "$1" makepkg -si --noconfirm --needed >/dev/null 2>&1; then
	echo "[ Could not install yay! ]"
	exit 1
fi

echo "[ Finished installing dependencies ]"
