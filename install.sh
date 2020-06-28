#!/bin/bash


echo -n "Please input a username: "
read username

scripts/install_dependencies.sh

scripts/user_setup.sh

scripts/install_drivers.sh $username

scripts/install_programs.sh $username

scripts/install_rice.sh $username

scripts/install_dotfiles.sh $username

scripts/install_graphics.sh $username
