

# :completion:<function>:<completer>:<command>:<argument>:<tag>

zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _complete _approximate
# Cache Completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

zstyle ':completion:*:*:cp:*' file-sort access follow

# Menu
#zstyle ':completion:*' menu select=9

# Colors
zstyle ':completion:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:corrections' format '%F{yellow}--! %d (errors: %e) !--%f'
zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'

zstyle ':completion:*' group-name ''
if [[ -n "$LS_COLORS" ]]; then
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi

compdef _gnu_generic bat fd

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'n' complete-word
bindkey -M menuselect ' ' accept-search
bindkey -M menuselect '^i' vi-insert

