
# ZSH Aliases

# Global aliases {{{
alias -g G='| rg'
alias -g P="| ${PAGER}"
alias -g E="| ${EDITOR}"
alias -g TF='| tail -f'
alias -g DN='/dev/null'
alias -g _='/dev/null'

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

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
alias fmtfnl='fnlfmt --fix'

alias shlint='shellcheck --enable=all --severity=style'

#alias ls='ls --ignore-backups --classify --group-directories-first -v --human-readable --dereference-command-line --color=auto'
alias ls='ls -F'
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
alias CD='cd $(PWD)'

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

alias ef='$EDITOR $(fzf)'
alias cdf='cd "$(fd -HgLtd --base-directory=${PWD} | fzf --preview="exa -TFadL1 --color=always --icons {}")"'

# }}}

# extra info {{{
# First, work properly with zsh completion... {{{
alias mkdir="nocorrect mkdir"
alias touch="nocorrect touch"
alias vim="nocorrect vim"
#typeset -a NOCORRECT_CMDS=( mkdir touch )
#
#for CMD in ${(k)NOCORRECT_CMDS}; do
#  alias $CMD="nocorrect $CMD"
#done

# }}}
alias mkdir='mkdir -p -v'
# alias rmdir='rmdir -v'
alias mv='mv -v -i'
alias cp='cp -v -i'
alias ln='ln -v -i'
alias rm='rm -v -i'
alias rsync='rsync --verbose --mkpath --copy-unsafe-links --stats --progress'

alias wh='whence -mv'
# }}}

# shortcuts {{{
alias v="$EDITOR"
alias vi="$EDITOR"
alias vim="$EDITOR"
alias nvim="$EDITOR"
#alias c='clear'
if [[ -f ~/bin/edit ]]; then
  alias e="edit"
else
  alias e="$EDITOR"
fi
if [[ -f ~/bin/view ]]; then
  alias v="view"
else
  alias view="$PAGER"
fi
#alias g='git'
alias gs='git status'
alias c='zoxide'
alias p='pueue'
alias sedit='sheldon edit'

alias mdcat='mdcat --paginate --columns $(( COLUMNS-15 ))'

alias cax='chmod u+x'
alias cmx='chmod u-x'

alias jq='jq -C -S'

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
alias update='vim +PlugUpdate +q; rustup update;'

alias gcc='sccache gcc'
alias clang='sccache clang'

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
