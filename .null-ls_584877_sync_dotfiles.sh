#!/bin/bash

DOTFILES=('.config/nvim')

for dotfile in "${DOTFILES[@]}"; do
    echo "~/$dotfile"
    cp -r ~/$dotfile .
done
