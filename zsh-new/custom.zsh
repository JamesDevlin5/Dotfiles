
autoload -Uz pwdx
alias pw='pwdx'

autoload -Uz prepend-sudo
zle -N prepend-sudo
bindkey -M vicmd "s" prepend-sudo

autoload -Uz toggle-sudo
zle -N toggle-sudo
bindkey -M vicmd "S" toggle-sudo

autoload -Uz zmv
autoload -Uz zcp
autoload -Uz zln

autoload -Uz insert-last-command-output
zle -N insert-last-command-output
bindkey '^[p' insert-last-command-output

