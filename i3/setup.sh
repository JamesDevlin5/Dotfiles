#!/usr/bin/env sh

if [ $# -eq 1 ] && [ "$1" = "clean" ]; then
    rm ~/.config/i3/config ~/.config/i3status/config
    return
fi

mkdir -p ~/.config/i3
ln -s ~/.dotfiles/i3/i3-config ~/.config/i3/config

mkdir -p ~/.config/i3status
ln -s ~/.dotfiles/i3/i3status-config ~/.config/i3status/config

