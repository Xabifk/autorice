#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Usage: $0 <username>"
	exit 1
fi


clone_repo ()
{
	sudo -u $1 git clone $2 ~/Projects >/dev/null 2>&1
}

run_install ()
{
	sudo -u $1 ~/Projects/$2 >/dev/null 2>&1 || echo "[ Could not run $2 ]"
}



