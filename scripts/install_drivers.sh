#!/bin/bash

# this is highly specific to my system
# you may need to change some stuff here


if [ $# -ne 1 ]
then
	echo "Usage: $0 <username>"
	exit 1
fi

echo "[ Installing drivers ]"

# may be part of kernal 5.8
sudo -u "$1" yay -S --noconfirm "rtl8821ce-dkms-git" >/dev/null 2>&1 || ( echo "[ Could not install wireless driver ]" )
# driver for fan and keyboard
sudo -u "$1" yay -S --noconfirm "faustus-dkms-git" >/dev/null 2>&1 || ( echo "[ Could not install faustus ]" )


echo "[ Finished installing drivers ]"


