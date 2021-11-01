
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

# Basic {{{
typeset -x EDITOR=vim
typeset -x BROWSER=firefox
typeset -x PAGER=bat

if command -v luarocks &>/dev/null; then
  eval "$(luarocks path)"
fi

# `time' command output format
#typeset -x TIMEFMT="%J %U user %S system %P cpu %*E total"

# Pager {{{
# Command called when redirection operators are given w/o a command rname
# Default: `cat'
typeset -x NULLCMD=bat
# Like NULLCMD, only when the redirection is an input
#typeset -x READNULLCMD=bat

typeset -x BAT_THEME="Dracula"

# Man Pages
# typeset -x MANPAGER="$EDITOR -R -c 'set ft=man'"
typeset -x MANPAGER="sh -c 'col -bx | bat -l man -p'"

#typeset -x LESS='--ignore-case --status-column --line-numbers --raw-control-chars --shift=0.15 --mouse'

# }}}

# }}}

# (F)Path {{{

# Custom Functions {{{

# Function definition search path
fpath=( $ZDOTDIR/{functions,completion} $fpath )

path=( ~/bin ~/.cargo/bin $path ) 
# }}}

# Load Them {{{
autoload -Uz cux
autoload -Uz g
# }}}

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
typeset -x FCEDIT="$EDITOR -c 'set ft=zsh'"

# File suffixes ignored during completion
fignore=( o pyc ~ )

# File to save history to
typeset -x HISTFILE="$XDG_DATA_HOME/zsh/history.zsh"

# Pattern(s) not saved to hist file
typeset -x HISTORY_IGNORE='fc*'

# Internal history list size
typeset -x HISTSIZE=15000

# Number of lines to save to hist file (after removing duplicates)
typeset -x SAVEHIST=13000

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

# Program Configuration {{{

#typeset -x JAVA_HOME=""

# ZelliJ Terminal Multiplexer
typeset -x ZELLIJ_CONFIG_DIR=$HOME/.config/zellij
typeset -x ZELLIJ_CONFIG_FILE=$ZELLIJ_CONFIG_DIR/config.yaml

# Starship Prompt
typeset -x STARSHIP_CONFIG=$HOME/.config/starship/config.toml
typeset -x STARSHIP_CACHE=$XDG_CACHE_HOME/starship

# Allow us to autoload pls
typeset -x AUTOPAIR_INHIBIT_INIT=1

typeset -x SCCACHE_DIR="$XDG_CACHE_HOME/sccache"
#typeset -x SCCACHE_CACHE_SIZE="10G"

# Sheldon (package manager) {{{
typeset -x SHELDON_CONFIG_DIR=$XDG_CONFIG_HOME/sheldon
typeset -x SHELDON_DATA_DIR=$XDG_DATA_HOME/sheldon
# }}}

# Zoxide (cd) {{{
typeset -x _ZO_DATA_DIR=$XDG_DATA_HOME/zoxide
# Print Fixed Path
typeset -x _ZO_ECHO=1
#typeset -x _ZO_EXCLUDE_DIRS="$HOME/.cache,"
typeset -x _ZO_RESOLVE_SYMLINKS=1
# }}}

# Cargo {{{
# Registry Index Cache
typeset -x CARGO_HOME="$XDG_DATA_HOME/cargo"
# Generated Artifacts (Compiler Output)
#typeset -x CARGO_TARGET_DIR="$CARGO_HOME/out"
# Cache Compiler Info
typeset -x CARGO_CACHE_RUSTC_INFO=1
# `Cargo install' Directory
typeset -x CARGO_INSTALL_ROOT="$HOME/.cargo"
#typeset -x CARGO_INSTALL_ROOT="$XDG_DATA_HOME/cargo"
path=( $CARGO_INSTALL_ROOT/bin $path )
# Compensate for Internet Quality
typeset -x CARGO_NET_RETRY=6

# Use sccache
typeset -x RUSTC_WRAPPER=$(whence sccache)
# }}}

# FZF {{{

#export FZF_DEFAULT_OPTS="--reverse --ansi --color=fg:15,hl:3,hl+:3,bg+:-1,fg+:-1,pointer:06,spinner:05,info:7,prompt:6"
export FZF_DEFAULT_COMMAND='fd --follow --type file --color=always'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi --height=40% --layout=reverse --info=inline --border --margin=2 --padding=2"
export FZF_COMPLETION_TRIGGER='--'

# }}}

# }}}

# Named Directories {{{

typeset -A NAMED_DIRS
NAMED_DIRS=(
  Z-Dots $ZDOTDIR
  Conf $XDG_CONFIG_HOME
  Data $XDG_DATA_HOME
  Cache $XDG_CACHE_HOME
  Trash $TRASH_HOME
  Dots $DOTFILES_HOME
)

for NICKNAME DIRNAME in ${(kv)NAMED_DIRS}; do
  hash -d $NICKNAME=$DIRNAME
done

# }}}

# Remove duplicates {{{
typeset -U path
typeset -U fpath
typeset -U manpath
typeset -U cdpath
# }}}

# vim:foldmethod=marker
. "/Users/james/.local/share/cargo/env"
