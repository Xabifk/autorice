#!/bin/bash


echo -n "Please input a username: "
read username
scripts/user_setup.sh $username

scripts/install_dependencies.sh $username

# the user needs to be able to use sudo without inputing the passwords so it doesn't ask constantly
sed -i "s/# %sudo\tALL=(ALL) ALL/%sudo\tALL=(ALL) NOPASSWD: ALL/g" /etc/sudoers

scripts/install_drivers.sh $username

scripts/install_programs.sh $username

scripts/install_rice.sh $username

scripts/install_dotfiles.sh $username

scripts/install_graphics.sh $username
