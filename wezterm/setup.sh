#!/usr/bin/env sh

if [ $# -eq 1 ] && [ "$1" = "clean" ]; then
    rm ~/.config/wezterm/wezterm.lua ~/.config/wezterm/stylua.toml
    return
fi

mkdir -p ~/.config/wezterm

ln -s ~/.dotfiles/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
ln -s ~/.dotfiles/wezterm/stylua.toml ~/.config/wezterm/stylua.toml

./install-terminfo
./update-alternatives
