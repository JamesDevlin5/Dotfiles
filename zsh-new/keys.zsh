
#bindkey -s "jf" "\e"
bindkey "^h" _complete_help

# Edit command line in $EDITOR
bindkey '^e' edit-command-line

# Check if fzf is installed
# If so, bind history search
if [[ -d ~/.fzf ]]; then
  source ~/.fzf/shell/key-bindings.zsh
else
  bindkey '^r' history-incremental-search-backward
fi

