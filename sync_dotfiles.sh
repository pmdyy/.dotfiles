#!/bin/bash

DOTFILES=('.config/nvim' '.config/i3' '.config/alacritty' '.zshrc')

for dotfile in "${DOTFILES[@]}"; do
    echo "~/$dotfile"
    cp -r ~/$dotfile .
done
