#!/bin/bash
DOTFILES_DIR="$(dirname "${BASH_SOURCE}")"

find $DOTFILES_DIR -type f \
	-not -name "_*.sh" \
	-not -path "./.git/*"\
	-exec cp ~/{} $DOTFILES_DIR/{} \;
