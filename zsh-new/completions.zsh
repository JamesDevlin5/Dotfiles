
# Completions

# Shell Program Function Completions
#fpath=( ~/.zsh_functions $fpath )

# :completion:<function>:<completer>:<command>:<argument>:<tag>


autoload -Uz local-directories
autoload -Uz directory-stack

# >> The completer, `_complete_help`, will display information describing the completion system's current context.
# >> May be call with `<C-x>h` by default

zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _complete _approximate _correct _extensions
zstyle ':completion:*:correct:::' max-errors 3 not-numeric
zstyle ':completion:*:approximate:::' max-errors 5 numeric
zstyle ':completion:*' squeeze-slashes true
# Ambiguous case matching and -/_ interchangability
# Don't *need* to hit shift when inputting a symbol? And vice-versa.
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z-_}={A-Za-z_-}'

# Sudo Completions
zstyle ':completion::complete:*' gain-privileges 1

# Cache Completion
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# zstyle ':completion:*:cd:*' tag-order

zstyle ':completion:*:cp:*' file-sort access follow
zstyle ':completion:*:nvim:*' file-list
zstyle ':completion:*:ls:*' completer _local_directories
zstyle ':completion:*:cd:*' completer _local_directories _directory_stack

#zstyle ':completion:*:cd:*' tag-order _local_directories _directory_stack

#zstyle ':completion:*:cd:*' avoid-completer '_files'
zstyle ':completion:*:mkdir:*' avoid-completer '_correct'
zstyle ':completion:*:touch:*' avoid-completer '_correct'
zstyle ':completion:*:nvim:*' avoid-completer '_correct'
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

# zstyle ':completion:*:*:cd:*:' completer _local_directories _directory_stack
zstyle ':completion:*:*:cd:directory-stack:' insert-ids=menu

# zstyle ':completion:*:cd:*' _alternative \
  # "local-directories:directories:_cd" \
  # "directory-stack:dir stack:_directory_stack"
#zstyle ':completion:*:cd:*' matcher-list 'm:[0-9]=\+*'
#zstyle ':completion:*:cd:*' tag-order directory-stack local-directories
#zstyle ':completion:*:cd:*' group-order local
#zstyle ':completion:*:cd:*' preserve-prefix '+' '-'

#zstyle ':completion:*:cd:directory_stack' hidden=true
#zstyle ':completion:*:cd:*' completer _directory_stack
#zstyle ':completion::complete:cd::' completer _directory_stack
# }}}

zstyle ':completion:*:*:-command-:*' group-order alias builtins functions commands # external
zstyle ':completion:*' group-name ''

# Menu {{{
zstyle ':completion:*' menu select=2
zstyle ':completion:*' show-ambiguity true
# }}}

# Colors {{{
zstyle ':completion:*:descriptions' format '%F{green}( %d )%f'
zstyle ':completion:*:corrections' format '%F{yellow}-~ %U(%e errors) %B%d%b%u ~-%f'
zstyle ':completion:*:messages' format '%F{blue}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}<< %UNo Matches Found%u >>%f'

if [[ -n "$LS_COLORS" ]]; then
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
fi
# }}}

# Generic Completions (for `--help')
compdef _gnu_generic bat fd rg mdcat stylua fx delta
#compdef '_files -g "*.py"' python

# vim:foldmethod=marker
