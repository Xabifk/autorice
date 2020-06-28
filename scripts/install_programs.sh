#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Usage: $0 <username>"
	exit 1
fi

echo "[ Installing programs ]"

while IFS=, read -r place name
do
	place=$(echo $place | xargs echo -n)
	name=$(echo $name | xargs echo -n)

    	echo "I got:$place|$name"
	if [ $place = "repo" ]; then
		echo "[ Installing $name from Repository ]"
		if ! pacman --noconfirm --needed -S $name >/dev/null 2>&1; then
			echo "[ Could not install $name form Repository ]"
		fi
	fi

	if [ $place = "aur" ]; then
		echo "[ Installing $name from AUR ]"
		if ! sudo -u "$1" yay -S --noconfirm "$name" >/dev/null 2>&1; then
			echo "[ Could not install $name from AUR ]"
		fi
	fi

	if [ $place = "script" ]; then
		echo "[ Running script custom_scripts/$name ]"
		if ! custom_scripts/$name >/dev/null 2>&1; then
			echo "[ Could not run script custom_scripts/$name ]"
		fi
	fi
done < configs/programs.csv

echo "[ Finished installing programs ]"
