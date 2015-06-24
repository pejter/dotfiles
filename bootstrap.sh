#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function moveDotfiles() {
	rsync --exclude ".git/" --exclude "bootstrap.sh" -avh --no-owner --no-group . ~;
	source ~/.profile;
	source ~/.bashrc;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	moveDotfiles;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		moveDotfiles;
	fi;
fi;
unset moveDotfiles;