#!/bin/bash
DOTFILES_DIR="$(dirname "${BASH_SOURCE}")"

cp -r $1 $DOTFILES_DIR
echo "!$1"  >> $DOTFILES_DIR/.gitignore