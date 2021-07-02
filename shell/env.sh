#!/usr/bin/env sh

export XDG_DATA_DIR

export BAT_PAGER='less'
export PAGER='bat'

#export MANPAGER='bat -l man --style grid,number'
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

export PATH="${PATH}:${HOME}/.luarocks/bin"

