
# Completions

# :completion:<function>:<completer>:<command>:<argument>:<tag>

zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*' squeeze-slashes true
# Cache Completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

zstyle ':completion:*:*:cp:*' file-sort access follow
#zstyle ':completion:*:nvim:*' file-list all
zstyle ':completion:*:cd:*' tag-order dirstack local-directories
#function _dirstack() {
#  declare -A dirs
#  dirs=$(dirs -v)
#  if [[ 
#zstyle ':completion:*:cd:*' dirstack _dirstack

zstyle ':completion:*:*:-command-:*' group-order alias builtins functions commands
zstyle ':completion:*' group-name ''

# Menu
zstyle ':completion:*' menu select

# Colors
zstyle ':completion:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:corrections' format '%F{yellow}--! %d (errors: %e) !--%f'
zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'

if [[ -n "$LS_COLORS" ]]; then
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi

# Generic Completions (for `--help')
compdef _gnu_generic bat fd
#compdef '_files -g "*.py"' python

# vim:foldmethod=marker
