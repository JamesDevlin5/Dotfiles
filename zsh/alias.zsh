#!/usr/bin/env zsh

# Global aliases {{{
alias -g G='| rg'
alias -g P="| ${PAGER}"
alias -g E="| ${EDITOR}"
alias -g TF='| tail -f'
alias -g DN='/dev/null'
alias -g _='/dev/null'
# }}}

# Dirs
for idx ({1..9}) alias "$idx"="cd +${idx}"; unset idx

# vim:foldmethod=marker
