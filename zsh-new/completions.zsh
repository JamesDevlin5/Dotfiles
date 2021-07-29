
# Completions

# :completion:<function>:<completer>:<command>:<argument>:<tag>

zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _complete _correct _approximate
zstyle ':completion:*:correct:::' max-errors 3 not-numeric
zstyle ':completion:*:approximate:::' max-errors 4 numeric
zstyle ':completion:*' squeeze-slashes true
# Ambiguous case matching and -/_ interchangability
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z-_}={A-Za-z_-}' 'm:.*=\..*'
#zstyle ':completion:*:cd:*' matcher-list 'm:{
# Cache Completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

zstyle ':completion:*:*:cp:*' file-sort access follow
#zstyle ':completion:*:nvim:*' file-list all=8
zstyle ':completion:*:ls::' completer _local_directories
#zstyle ':completion:*:cd::' completer _local_directories _directory_stack

zstyle ':completion:*:*:rm:*:globbed-files' file-patterns \
  '.*.o$:object-files' '.*.pyc$:cached-python-files' '%p:all-files'

#zstyle ':completion:*:cd:*' tag-order _local_directories _directory_stack

#zstyle ':completion:*:cd:*' avoid-completer '_files'
zstyle ':completion:*:mkdir:*' avoid-completer '_correct'
zstyle ':completion:*:touch:*' avoid-completer '_correct'
zstyle ':completion:*:mv::argument-2' avoid-completer '_correct'


# Man {{{
#zstyle ':completion:*:man:*' separate-sections=true
#zstyle ':completion:*:man:*' ignored-patterns="*\\:*"
# }}}


# Cd {{{
#function _dirstack() {
#  declare -A dirs
#  dirs=$(dirs -v)
#  if [[ 

#zstyle ':completion:*:cd:*' dirstack _dirstack

#zstyle ':completion:*:cd:*' tag-order \
#  '

#zstyle+ ':completion:*:cd' style1 value1 \
  #+':directory-stack' style2 value2 \
  #+':local-directories' style3 value3

#zstyle ':completion:*:cd::' completer _

autoload -Uz local-directories
autoload -Uz directory-stack

zstyle ':completion:*:*:cd:*:' completer _local_directories _directory_stack
zstyle ':completion:*:*:cd:directory-stack:' insert-ids=menu

zstyle ':completion:*:cd:*' _alternative \
  "local-directories:directories:_cd" \
  "directory-stack:dir stack:_directory_stack"
#zstyle ':completion:*:cd:*' matcher-list 'm:[0-9]=\+*'
#zstyle ':completion:*:cd:*' tag-order directory-stack local-directories
#zstyle ':completion:*:cd:*' group-order local
#zstyle ':completion:*:cd:*' preserve-prefix '+' '-'

#zstyle ':completion:*:cd:directory_stack' hidden=true
#zstyle ':completion:*:cd:*' completer _directory_stack
#zstyle ':completion::complete:cd::' completer _directory_stack
# }}}

zstyle ':completion:*:*:-command-:*' group-order alias builtins functions commands
zstyle ':completion:*' group-name ''

# Menu {{{
#zstyle ':completion:*' file-list all=6 select=long
zstyle ':completion:*' menu select=2
zstyle ':completion:*' show-ambiguity true
#zstyle ':completion:incremental' list=true
# }}}

# Colors {{{
zstyle ':completion:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:corrections' format '%F{yellow}--! %U%e %B%d%b%u %F{yellow}!--%f'
zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}--{ no matches found }--%f'

if [[ -n "$LS_COLORS" ]]; then
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi
# }}}

# Generic Completions (for `--help')
compdef _gnu_generic bat fd
#compdef '_files -g "*.py"' python

# vim:foldmethod=marker
