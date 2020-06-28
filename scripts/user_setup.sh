#!/bin/bash


if [ $# -ne 1 ]
then
	echo "Usage: $0 <username>"
	exit 1
fi


useradd -m "$1" >/dev/null 2>&1 || echo "[ Could not add user ]"; exit 1;
usermod -a -G sudo,wheel "$1" 2>&1
passwd "$1"

# make customised folders


