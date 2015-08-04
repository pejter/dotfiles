#!/bin/bash
DOTFILES_DIR="$(dirname "${BASH_SOURCE}")"

find $DOTFILES_DIR -type f \
	-not -name addfile.sh \
	-not -name update.sh \
	-not -name bootstrap.sh \
	-not -path "./.git/*"\
	-exec cp ~/{} $DOTFILES_DIR/{} \;
