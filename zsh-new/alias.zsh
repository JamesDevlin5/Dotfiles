
# ZSH Aliases

# Global aliases {{{
alias -g G='| rg'
alias -g P="| ${PAGER}"
alias -g E="| ${EDITOR}"
alias -g TF='| tail -f'
alias -g DN='/dev/null'
alias -g _='/dev/null'
# }}}

# Dirs {{{ 
alias d='dirs -v'
#for idx ({1..9}) alias "$idx"="cd +${idx}"; unset idx;
# }}}

# Regular Aliases {{{ 

alias tree='exa --tree --classify --icons --list-dirs --group-directories-first -I ".git|.idea|.venv|*.iml|*.vscode|target" --git-ignore --sort extension --color-scale'
alias trea='tree --all'
alias trel='tree --long --header --git --no-user --no-time'
# Just Dirs
alias treed='tree --only-dirs'
alias tread='trea --only-dirs'
alias treld='trel --only-dirs'


alias python='python3'
alias pip='pip3'
# Enter interactive mode after executing a python script
alias ppy='python3 -i'

#alias li='lua -i -e "_PROMPT"=" lua:-> "'
alias lua-fmt='lua-format --in-place'

alias shlint='shellcheck --enable=all --severity=style'

alias ls='ls --ignore-backups --classify --group-directories-first -v --human-readable --dereference-command-line --color=auto'
alias lc='ls --context'

alias l='ls'
alias ll='ls -l'
alias la='ls -A'
alias l.='ls -d .*'

alias lgi='ls | rg'
alias lagi='la | rg'
alias lg='fd'
#alias lag='fd --hidden --exec-batch rg {} $1;'
alias envg='env | rg'

alias PWD='pwd -P'

# }}}

# Navigating the FS {{{
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'
#alias cd='j'

# cd to git root directory
alias cdg='cd $(git root)'

# }}}

# extra info {{{
alias mkdir='mkdir --parents --verbose --'
alias rmdir='rmdir --verbose'
alias mv='mv --verbose --interactive --'
alias cp='cp --verbose --interactive'
alias ln='ln --verbose --interactive'
alias rm='rm --verbose --interactive=once'
alias rsync='rsync --verbose --mkpath --copy-unsafe-links --stats --progress'
alias chmod='chmod --changes'
alias chown='chown --changes'

alias wh='whence -mv'
# }}}

# shortcuts {{{
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
#alias c='clear'
alias view="$PAGER"
alias e="$EDITOR"
alias g='git'
alias c='zoxide'
alias p='pueue'
alias sedit='sheldon edit'
# }}}

# Misc. {{{
alias ':q'='echo LOLOLOL!!!!!'

# Creates a new Maven (Java) project
alias makemvn='mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false'

# Mirror stdout to stderr, useful for seeing data going through a pipe
alias peek='tee >(cat 1>&2)'

# Print large text
alias fig='figlet -f banner3 -c -w100'

# Maintenance
alias update='nvim +PlugUpdate +q; rustup update;'

# }}}

# Functions {{{

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

# }}}

# vim:foldmethod=marker
