#!/bin/bash


if [ $# -ne 1 ]; then
	echo "Usage: $0 <username>"
	exit 1
fi


exists=$(grep -c "^$1:" /etc/passwd)
if [ $exists -eq 0 ]; then
	if ! useradd -m "$1" >/dev/null 2>&1; then
		echo "[ Could not add user ]"
		exit 1
	fi
else
	echo "[ User already exists ]"
fi

groupadd sudo >/dev/null 2>$1
usermod -a -G sudo,wheel "$1" >/dev/null 2>&1
passwd "$1"

# the user needs to be able to use sudo without inputing the passwords so it doesn't ask constantly
sed -i "s/# %sudo\tALL=(ALL) ALL/%sudo\tALL=(ALL) NOPASSWD: ALL/g" /etc/sudoers

# make customised folders

sudo -u "$1" mkdir /home/$1/Projects /home/$1/Tools /home/$1/CTF || echo "[ Directories were not created ]"


