#!/bin/bash


echo -n "Please input a username: "
read username

scripts/install_dependencies.sh

scripts/user_setup.sh

scripts/install_drivers.sh

scripts/install_programs.sh

scripts/install_rice.sh

scripts/install_dotfiles.sh

scripts/install_graphics.sh
