#!/usr/bin/env bash

# Setup Variables for Later {{{1
declare NVIM_PATH
NVIM_PATH="$(which nvim)"
declare BAT_PATH
BAT_PATH="$(which bat)"
declare SHELL_NAME
SHELL_NAME="$(basename "${SHELL}")"

# XDG Directories {{{1
declare -x XDG_DESKTOP_DIR="${HOME}/Desktop"
declare -x XDG_DOWNLOAD_DIR="${HOME}/Downloads"
declare -x XDG_TEMPLATES_DIR="${HOME}/Templates"
declare -x XDG_PUBLICSHARE_DIR="${HOME}/Public"
declare -x XDG_DOCUMENTS_DIR="${HOME}/Documents"
declare -x XDG_MUSIC_DIR="${HOME}/Music"
declare -x XDG_PICTURES_DIR="${HOME}/Pictures"
declare -x XDG_VIDEOS_DIR="${HOME}/Videos"

# Core {{{2
declare -x XDG_CONFIG_HOME="${HOME}/.config"
declare -x XDG_DATA_HOME="${HOME}/.local/share"
declare -x XDG_CACHE_HOME="${HOME}/.cache"

# General Shell Settings {{{1
declare -x TERM="xterm-256color"
declare -x EDITOR="${NVIM_PATH}"
declare -x PAGER="${BAT_PATH}"
declare -x MANPAGER="sh -c 'col -bx | bat -l man -p'"
#declare -x BROWSER="$(which )"
declare -x INPUTRC="${XDG_CONFIG_HOME}/inputrc"

# SSH Settings {{{2
declare -x SSH_KEY_PATH="${HOME}/.ssh/id_rsa"
declare -x HOSTFILE="${HOME}/.ssh/known_hosts"

# History {{{2
declare -x HISTFILE="${XDG_CACHE_HOME}/${SHELL_NAME}/history.log"
declare -x HISTSIZE=15000

# Custom {{{1
declare -x TRASH_HOME="${XDG_DATA_HOME}/.Trash"
declare -x WORKSPACE_HOME="${HOME}/workspace"
declare -x DOTFILES_HOME="${HOME}/dotfiles"

# Programs {{{1
#declare -x JAVA_HOME=""
#declare -x LUA_ROCKS_DIR=""
#declare -x CARGO_HOME="${XDG_CACHE_HOME}/cargo"
#declare -x CARGO_INSTALL_ROOT="${XDG_DATA_HOME}/cargo"
#declare -x STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/config.toml"
#declare -x STARSHIP_CACHE="${XDG_CACHE_HOME}/starship"
#declare -x PURE_POWER_MODE="modern"

# Path {{{1
#declare -x PATH="${HOME}/bin:${CARGO_INSTALL_ROOT}/bin:${PATH}"

# Colorize {{{1
declare DCOLORS_FILE="${XDG_CONFIG_HOME}/dircolors"
if [ -r "${DCOLORS_FILE}" ]; then
eval "$(dircolors "${DCOLORS_FILE}")"
fi

# Shell Specific Settings
case "${SHELL_NAME}" in
	"zsh")
	  declare -x CORRECT_IGNORE=_*
	  if [ -n "${LS_COLORS}" ]; then
	    declare -x ZLS_COLORS="${LS_COLORS}"
	  fi
		;;
	"bash")
		;;
	"*")
		echo "unkown shell..."
		;;
esac

# vim:foldmethod=marker

