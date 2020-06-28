#!/bin/bash

# this is highly specific to my system
# you may need to change some stuff here


if [ $# -ne 1 ]; then
	echo "Usage: $0 <username>"
	exit 1
fi

echo "[ Installing drivers ]"

# may be part of kernal 5.8
if ! sudo -u "$1" yay -S --noconfirm "rtl8821ce-dkms-git" >/dev/null 2>&1; then
	echo "[ Could not install wireless driver ]"
fi

# driver for fan and keyboard
if ! sudo -u "$1" yay -S --noconfirm "faustus-dkms-git" >/dev/null 2>&1; then
	echo "[ Could not install faustus ]"
fi


echo "[ Finished installing drivers ]"


