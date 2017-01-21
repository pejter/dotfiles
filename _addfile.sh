#!/bin/bash
DOTFILES_DIR="$(dirname "${BASH_SOURCE}")"

cp --parents -r $1 $DOTFILES_DIR