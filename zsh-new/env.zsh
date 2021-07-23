
typeset -x ZDOTDIR="$HOME/.config/zsh"

#export TIMEFMT=""

typeset -x EDITOR=nvim
typeset -x BROWSER=firefox

# Command called when redirection operators are given w/o a command name
# Default: `cat'
typeset -x NULLCMD=bat
# Like NULLCMD, only when the redirection is an input
typeset -x READNULLCMD=bat

# Ignored pattern during spell complete
typeset -x CORRECT_IGNORE=_*

# Max Dirstack size
typeset -x DIRSTACKSIZE=16

# ENV: Sourced when invoked as sh
# FCEDIT: The editor used for the fc command
typeset -x FCEDIT="nvim -c 'set ft=zsh' --"

# File suffixes ignored during completion
#fignore=( o ~ )

# Function definition search path
#fpath=()

# File to save history to
typeset -x HISTFILE="$HOME/.zshhistory"

# Pattern(s) not saved to hist file
typeset -x HISTORY_IGNORE='fc*'

# Internal history list size
typeset -x HISTSIZE=15000

# Man Pages
typeset -x MANPAGER="nvim -R -c 'set ft=man' --"

path+=(~/bin ~/.cargo/bin) 

#export FZF_DEFAULT_OPTS="--reverse --ansi --color=fg:15,hl:3,hl+:3,bg+:-1,fg+:-1,pointer:06,spinner:05,info:7,prompt:6"
# PROMPT_EOL_MARK=%B%S%#%s%b

PS1="%m%# "
PS2="%_> "
PS3="?# "
PS4="+%N:%i> "
RPS1=""
RPS2=""

#LISTPROMPT="%l -- %m -- %p"
#MENUPROMPT=$LISTPROMPT

# Number of lines to save to hist file (after removing duplicates)
typeset -x SAVEHIST=13000

# Show during spell completion
#typeset -x SPROMPT="

# `time' command output format
typeset -x TIMEFMT="%J %U user %S system %P cpu %*E total"
