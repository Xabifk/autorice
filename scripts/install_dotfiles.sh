#!/bin/bash

if [ $# -ne 1 ]
then
	echo "Usage: $0 <username>"
	exit 1
fi

clone_repo ()
{
	sudo -u $1 git clone $2 /tmp/autorice >/dev/null 2>&1 || echo "[ Could not clone ropo $2 in /tmp/autorice ]"; return 1
}


move_file ()
{
	sudo -u $1 mov /tmp/autorice/$2 ~/$3 || echo "[ Could not move file /tmp/autorice/$2 to ~/$3 ]"; return 1
}


