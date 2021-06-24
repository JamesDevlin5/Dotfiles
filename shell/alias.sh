
# Colors
alias grep='grep --color=auto'
# alias tree='tree -F -C --dirsfirst -I ".git|.idea|venv|*.iml"'
alias tree='exa --tree --group-directories-first -F -I ".git|.idea|.venv|*.iml|*.vscode|target"'

alias python='python3'
alias pip='pip3'

TIME_FMT_OLD="[ %a %_H:%M  >>>> %_9B %2d (%C) ]"
TIME_FMT_NEW="[ %a %_I:%M %P || %_9b %_2d      ]"
printf -v TIME_FMT "+\"%s\n%s\"" ${TIME_FMT_OLD} ${TIME_FMT_NEW}

# `ls`
alias ls="ls --ignore-backups --classify --group-directories-first -v --human-readable \
	--dereference-command-line --time-style=${TIME_FMT} --color=auto"
alias lc='ls --context'
# --- ??? ^^
alias l='ls'
alias ll='ls -l'
alias la='ls -A'
alias l.='ls -d .*'

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
alias view='$PAGER'
alias e='$EDITOR'
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
function cheat(){
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

# Maintenance
alias update_go='go get -u ...'
alias update='nvim +update +q ; rustup update ; brew update ; brew upgrade ; brew upgrade --cask ; update_pip ; ~/.mypyls/bin/pip install -U "https://github.com/matangover/mypyls/archive/master.zip#egg=mypyls[default-mypy]" ; update_go '
alias clean='brew cleanup ; brew doctor'

