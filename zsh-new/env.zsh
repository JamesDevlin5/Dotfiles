
# Basic {{{
typeset -x EDITOR=nvim
typeset -x BROWSER=firefox
typeset -x PAGER=bat

# Function definition search path
#fpath=()

path+=(~/bin ~/.cargo/bin) 

# }}}

# Plugins {{{
typeset -x STARSHIP_CONFIG=~/.config/starship/config.toml
typeset -x AUTOPAIR_INHIBIT_INIT=1
# }}}

# Pager {{{
# Command called when redirection operators are given w/o a command name
# Default: `cat'
typeset -x NULLCMD=bat
# Like NULLCMD, only when the redirection is an input
typeset -x READNULLCMD=bat

# Man Pages
typeset -x MANPAGER="nvim -R -c 'set ft=man' --"

#typeset -x LESS='--ignore-case --status-column --line-numbers --raw-control-chars --shift=0.15 --mouse --'
# }}}

# Filesystem {{{
# Ignored pattern during spell complete
typeset -x CORRECT_IGNORE=_*

# Max Dirstack size
typeset -x DIRSTACKSIZE=16
# }}}

# History {{{
# ENV: Sourced when invoked as sh
# FCEDIT: The editor used for the fc command
typeset -x FCEDIT="nvim -c 'set ft=zsh' --"

# File suffixes ignored during completion
#fignore=( o ~ )

# File to save history to
typeset -x HISTFILE="$HOME/.zshhistory"

# Pattern(s) not saved to hist file
typeset -x HISTORY_IGNORE='fc*'

# Internal history list size
typeset -x HISTSIZE=15000

# Number of lines to save to hist file (after removing duplicates)
typeset -x SAVEHIST=13000

# }}}

#export FZF_DEFAULT_OPTS="--reverse --ansi --color=fg:15,hl:3,hl+:3,bg+:-1,fg+:-1,pointer:06,spinner:05,info:7,prompt:6"
# PROMPT_EOL_MARK=%B%S%#%s%b

#LISTPROMPT="%l -- %m -- %p"
#MENUPROMPT=$LISTPROMPT

# Show during spell completion
#typeset -x SPROMPT="zsh: correct '%R' to %r' [nyae]? "
typeset -x SPROMPT="%Bzsh%b:
  Correct:  '%U%R%u'  -->  '%U%r%u' ?
  | %F{red}(N)o%f
  | %F{green}(Y)es%f
  | %F{yellow}(A)bort%f
  | %F{blue}(E)dit%f
%B>>%b "

# `time' command output format
typeset -x TIMEFMT="%J %U user %S system %P cpu %*E total"

# vim:foldmethod=marker
