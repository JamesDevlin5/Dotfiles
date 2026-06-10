#!/usr/bin/env sh

if [ $# -eq 1 ] && [ "$1" = "clean" ]; then
    rm ~/.config/nvim/init.lua ~/.config/nvim/ftplugin ~/.config/nvim/after ~/.config/nvim/lua ~/.config/nvim/stylua.toml
    return
fi

if ! [ -d ~/.config/nvim ]; then
    mkdir ~/.config/nvim
fi

ln -s ~/.dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -s ~/.dotfiles/nvim/ftplugin ~/.config/nvim/ftplugin
ln -s ~/.dotfiles/nvim/after ~/.config/nvim/after
ln -s ~/.dotfiles/nvim/lua ~/.config/nvim/lua
ln -s ~/.dotfiles/nvim/dictionary ~/.config/nvim/dictionary

ln -s ~/.dotfiles/nvim/stylua.toml ~/.config/nvim/stylua.toml

chmod u+x ~/.config/nvim/dictionary/install-dict
~/.config/nvim/dictionary/install-dict
