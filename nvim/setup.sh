#!/usr/bin/env sh

if [ $# -eq 1 ] && [ "$1" = "clean" ]; then
    rm ~/.config/nvim/init.lua ~/.config/nvim/ftplugin ~/.config/nvim/after ~/.config/nvim/lua ~/.config/nvim/stylua.toml
    return
fi

ln -s ~/.dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/.dotfiles/nvim/ftplugin ~/.config/nvim/ftplugin
ln -s ~/.dotfiles/nvim/after ~/.config/nvim/after
ln -s ~/.dotfiles/nvim/lua ~/.config/nvim/lua

ln -s ~/.dotfiles/nvim/stylua.toml ~/.config/nvim/stylua.toml
