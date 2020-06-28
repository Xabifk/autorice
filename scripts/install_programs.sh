#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Usage: $0 <username>"
	exit 1
fi

echo "[ Installing programs ]"

while IFS=, read -r place name
do
	place=$(echo $place | xargs echo -n)
	name=$(echo $name | xargs echo -n)

    	echo "I got:$place|$name"
	if [ $place = "repo" ]
	then
		echo "[ Installing $name from Repository ]"
		pacman --noconfirm --needed -S $name >/dev/null 2>&1 || echo "[ Could not install $name form Repository ]"; exit 1
	fi

	if [ $place = "aur" ]
	then
		echo "[ Installing $name from AUR ]"
		sudo -u "$1" yay -S --noconfirm "$name" >/dev/null 2>&1 || echo "[ Could not install $name from AUR ]"; exit 1
	fi

	if [ $place = "script" ]
	then
		echo "[ Running script custom_scripts/$name ]"
		./custom_scripts/$name >/dev/null 2>&1 || echo "[ Could not run script custom_scripts/$name ]"
	fi
done < configs/programs.csv

echo "[ Finished installing programs ]"
