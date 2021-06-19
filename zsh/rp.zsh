#!/usr/bin/env zsh

dir_pr="%(4~|%F{8}.../|)%F{6}%3~%f"

user_pr="%n"
is_root="%(!.#.%%)"

#git rev-parse --is-inside-work-tree 2>/dev/null

time_pr="%F{8}[  %F{2}%D{%r}  %F{8}]%f"

export PS1="${dir_pr} ${user_pr} ${is_root} "
export RPS1=" ${time_pr} "

export PS2="%_>  "

