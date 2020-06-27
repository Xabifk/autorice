#!/bin/bash

# this is highly specific to my system
# you may need to change some stuff here


if [ $# -ne 2 ] then
	echo "Usage: $0 <username>"
	exit false
fi

echo "[ Installing drivers ]"

# may be part of kernal 5.8
sudo -u "$1" yay -S --noconfirm "rtl8821ce-dkms-git" >/dev/null 2>&1 || echo "[ Could not install wireless driver! ]"; exit false;
# driver for fan and keyboard
sudo -u "$1" yay -S --noconfirm "faustus-dkms-git" >/dev/null 2>&1 || echo "[ Could not install faustus! ]"; exit false;


echo "[ Finished installing drivers ]"


