
# Keys {{{1

# Named Directories (Begin with '~Dir/...')

# Load Necessary Functions & Modules {{{2
zmodload -i zsh/complist
zmodload -i zsh/stat
disable stat
autoload -U compinit; compinit
autoload -U colors; colors
typeset -x CLICOLOR=1

autoload -Uz man

autoload -Uz edit-command-line
zle -N edit-command-line
autoload -Uz insert-files
zle -N insert-files
autoload -Uz smart-insert-last-word
zle -N insert-last-word smart-insert-last-word
autoload -Uz spell-word
zle -N spell-word

# KeyBindings {{{2

bindkey "^A" beginning-of-line
bindkey "^[[4" end-of-line
bindkey "^R" history-incremental-search-backward
#bindkey "^P" history-search-backward
#bindkey "^Y" accept-and-hold
#bindkey "^N" insert-last-word
#bindkey "^Q" push-line-or-edit
bindkey "^s" spell-word

#bindkey -s "jf" "\e"
bindkey -s '^`' '\e'
bindkey -M vicmd -s '^`' 'A'

bindkey "^h" _complete_help
bindkey "^f" insert-files

bindkey "^u" kill-whole-line

# Edit command line in $EDITOR
bindkey '^e' edit-command-line
bindkey -M vicmd '^e' edit-command-line

bindkey -M vicmd '^b' vi-backward-word

# Vim-like menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'n' complete-word
bindkey -M menuselect ' ' accept-search
bindkey -M menuselect '^ ' accept-exact-dirs
#bindkey -M menuselect 'i' vi-insert
#bindkey -M menuselect '^I' upline

# Check if fzf is installed {{{2
# If so, bind history search
if [[ -d ~/.fzf ]]; then
  source ~/.fzf/shell/key-bindings.zsh
else
  bindkey '^r' history-incremental-search-backward
fi
# }}}

# vim:foldmethod=marker
