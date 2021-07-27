
# Keys {{{1

# Named Directories (Begin with '~Dir/...')

# Load Necessary Functions & Modules {{{2
zmodload zsh/complist
autoload -U compinit; compinit
autoload -U colors; colors
typeset -x CLICOLOR=1

autoload -Uz functions/man

autoload -Uz edit-command-line
zle -N edit-command-line

# KeyBindings {{{2

bindkey "^A" beginning-of-line
#bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey "^Q" push-line-or-edit
#bindkey "^s" spell-word

#bindkey -s "jf" "\e"
bindkey "^h" _complete_help

# Edit command line in $EDITOR
bindkey '^e' edit-command-line
bindkey -M vicmd v edit-command-line

# Vim-like menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'n' complete-word
bindkey -M menuselect ' ' accept-search
#bindkey -M menuselect '^i' vi-insert
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
