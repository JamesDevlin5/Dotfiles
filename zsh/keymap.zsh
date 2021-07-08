#!/usr/bin/env zsh

zle-keymap-select () {
if [ "$KEYMAP" = vicmd ]; then
  echo -ne "\033]12;Red\007"
else
  echo -ne "\033]12;Grey\007"
fi
}

zle -N zle-keymap-select

zle-line-init () {
zle -K viins
echo -ne "\033]12;Green\007"
}
zle -N zle-line-init
bindkey -v

