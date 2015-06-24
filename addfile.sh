#!/bin/bash
DOTFILE_DIR="$(dirname "${BASH_SOURCE}")";

cp -r $1 $DOTFILE_DIR
echo "!$1"  >> $DOTFILE_DIR/.gitignore