#!/bin/bash


if [ $# -ne 2 ] then
	echo "Usage: $0 <username>"
	exit false
fi


useradd -m "$1" >/dev/null 2>&1 || echo "[ Could not add user ]"; exit false;
usermod -a -G sudo,wheel "$1" 2>&1
passwd "$1"

# make customised folders
