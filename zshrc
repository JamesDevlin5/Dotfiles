# ----------# ZSH Config #----------
# ----------+============+----------

# Completion {{{
# Ambiguous case matching and -/_ interchangability
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z-_}={A-Za-z_-}'

# Menu driven
zstyle ':completion:*' menu select

# Colorize missteps
#zstyle ':completion:*:warnings' format "%F{214}%d%f"

# activate approximate completion, but only after regular completion (_complete)
zstyle ':completion:::::' completer _complete _approximate _expand _correct

# limit to 3 errors
#zstyle ':completion:*:approximate:*' max-errors 3
# or to have a better heuristic, by allowing one error per 3 character typed
zstyle ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX+$#SUFFIX)/3 )) numeric )'

# Hosts
hosts=($([ -r .ssh/known_hosts ] && cat .ssh/known_hosts | cut -d ' ' -f 1 | tr ',' '\n' | sort -u))
zstyle ':completion:*' hosts $hosts

# Load git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zfunc $fpath)

autoload -Uz compinit
compinit

# }}}

eval "$(gdircolors $HOME/.dircolors)"

# ZPLUG PLUGINS {{{
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/b4b4r07/zplug ~/.zplug
fi
source ~/.zplug/init.zsh

# Better keybindings
zplug "jeffreytse/zsh-vi-mode"
# Load completion library for those sweet [tab] squares
zplug "lib/completion", from:oh-my-zsh
# System clipboard
zplug "lib/clipboard", from:oh-my-zsh
# Navigation
zplug "lib/directories", from:oh-my-zsh
# VCS
zplug "plugins/git", from:oh-my-zsh
# Fuzzy Git
zplug "bigH/git-fuzzy", as:command, use:"bin/git-fuzzy"
# https://git.jpatrick.io/james/dotfiles/src/commit/ab918ab3b5a640f4a0b686cf6cb297c0dbe35524/zsh/zplug
zplug "agkozak/zsh-z"

# Syntax highlighting for commands, load last
zplug "zsh-users/zsh-syntax-highlighting", from:github, defer:3

zplug load

# }}}

# Variables {{{
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export CORRECT_IGNORE=_*

export HISTFILE="~/.zsh_history"
export HISTSIZE=800

export PATH="$HOME/bin:/usr/local/sbin:$PATH"

source "$HOME/.lessrc"
source "$HOME/.config/shell/alias.sh"
source "$HOME/.zsh/prompt.zsh"
source "$HOME/.zsh/alias.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Git Fuzzy
export PATH="/Users/james/.zsh/plugins/git-fuzzy/bin:$PATH:/Users/james/Library/Python/3.9/bin"

# }}}

# vim:foldmethod=marker
