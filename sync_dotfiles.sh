#!/bin/bash

DOTFILES=('nvim' 'i3' 'alacritty')

for dotfile in "${DOTFILES[@]}"; do
    echo "$dotfile"
    cp -r ~/.config/$dotfile .
done
