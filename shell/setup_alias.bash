#!/usr/bin/env bash

alias tree='exa --tree --group-directories-first -F -I ".git|.idea|.venv|*.iml|*.vscode|target"'

alias python='python3'
alias pip='pip3'
# Enter interactive mode after executing a python script
alias ppy='python3 -i'

alias shlint='shellcheck --enable=all --severity=style'

alias ls='ls --ignore-backups --classify --group-directories-first -v --human-readable --dereference-command-line --color=auto'
alias lc='ls --context'

alias l='ls'
alias ll='ls -l'
alias la='ls -A'
alias l.='ls -d .*'

alias lg='ls | rg'
alias lag='la | rg'
alias envg='env | rg'

# Navigating the FS
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'

# cd to git root directory
alias cdg='cd $(git root)'

# extra info
alias mkdir='mkdir -p -v --'
alias mv='mv -v --'
alias cp='cp -v --'
alias ln='ln -v --'

# shortcuts
alias vi='vim'
alias c='clear'
alias view="$PAGER"
alias e="$EDITOR"
alias g='git'


# My Ip Address Info
myip() {
	hostname -I | cut -f1 -d' '
}

# Create a directory and cd into it
mcd() {
    mkdir "${1}" && cd "${1}"
}

# Online cheatsheet
cheat(){
    curl "cheat.sh/$1"
}

# Jump to directory containing file
jump() {
    cd "$(dirname ${1})"
}

# Go up [n] directories
up()
{
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for ((i=0; i<${1}; i++)); do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

# Execute a command in a specific directory
xin() {
    (
        cd "${1}" && shift && "${@}"
    )
}

# Copy the provided file argument to clipboard
copyfile() {
  [[ "$#" != 1 ]] && return 1
  local file_to_copy=$1
  cat $file_to_copy | pbcopy
}

# Mirror stdout to stderr, useful for seeing data going through a pipe
alias peek='tee >(cat 1>&2)'

alias d='dirs -v'

# Print large text
alias fig='figlet -f banner3 -c -w100'

alias wh='whence -mv'

# Maintenance
alias update='nvim +PlugUpdate +q; rustup update;'

