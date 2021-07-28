
# Basic {{{
typeset -x EDITOR=nvim
typeset -x BROWSER=firefox
typeset -x PAGER=bat

eval "$(luarocks path)"

# Function definition search path
#fpath=()

path+=(~/bin ~/.cargo/bin) 

# `time' command output format
#typeset -x TIMEFMT="%J %U user %S system %P cpu %*E total"

# Remove duplicates {{{
typeset -U path
typeset -U fpath
typeset -U manpath
typeset -U cdpath
# }}}

# }}}

# Plugins {{{
typeset -x ZELLIJ_CONFIG_DIR=$HOME/.config/zellij
typeset -x STARSHIP_CONFIG=$HOME/.config/starship/config.toml
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

# FZF {{{

#export FZF_DEFAULT_OPTS="--reverse --ansi --color=fg:15,hl:3,hl+:3,bg+:-1,fg+:-1,pointer:06,spinner:05,info:7,prompt:6"
export FZF_DEFAULT_COMMAND='fd --follow --type file --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi --height=40% --layout=reverse --info=inline --border --margin=2 --padding=2"
export FZF_COMPLETION_TRIGGER='--'

# }}}

# Prompting {{{

# PROMPT_EOL_MARK=%B%S%#%s%b

#LISTPROMPT="%l -- %m -- %p"
#MENUPROMPT=$LISTPROMPT

# Show during spell completion
#typeset -x SPROMPT="zsh: correct '%R' to %r' [nyae]? "
typeset -x SPROMPT="%Bzsh%b:
  Correct:  '%U%R%u'  -->  '%U%r%u' ?
  | %F{red}(%BN%b)%Uo%u%f
  | %F{green}(%BY%b)%Ues%u%f
  | %F{yellow}(%BA%b)%Ubort%u%f
  | %F{blue}(%BE%b)%Udit%u%f
%B>>%b "

# }}}

# XDG Dirs {{{
typeset -x XDG_DESKTOP_DIR="$HOME/Desktop"
typeset -x XDG_DOCUMENTS_DIR="$HOME/Documents"
typeset -x XDG_DOWNLOAD_DIR="$HOME/Downloads"
typeset -x XDG_MUSIC_DIR="$HOME/Music"
typeset -x XDG_PICTURES_DIR="$HOME/Pictures"
typeset -x XDG_PUBLICSHARE_DIR="$HOME/Public"
typeset -x XDG_TEMPLATES_DIR="$HOME/Templates"
typeset -x XDG_VIDEOS_DIR="$HOME/Videos"

typeset -x XDG_CONFIG_HOME="$HOME/.config"
typeset -x XDG_DATA_HOME="$HOME/.local/share"
typeset -x XDG_CACHE_HOME="$HOME/.cache"

typeset -x TRASH_HOME="${XDG_DATA_HOME}/.Trash"
typeset -x WORKSPACE_HOME="${HOME}/workspace"
typeset -x DOTFILES_HOME="${HOME}/dotfiles"

#for name target in ${(kv)XDG_DIRS}; do
#done
# }}}

# vim:foldmethod=marker
