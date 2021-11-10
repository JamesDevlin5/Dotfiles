#!/usr/bin/env zsh


switchfzf() {
    find * | fzf --prompt 'All> ' \
        --header 'CTRL-D: Directories / CTRL-F: Files / CTRL-A: All' \
        --bind 'ctrl-d:change-prompt(Directories> )+reload(find * -type d)' \
        --bind 'ctrl-f:change-prompt(Files> )+reload(find * -type f)' \
        --bind 'ctrl-a:change-prompt(All> )+reload(find *)'
}

# grepfzf() {
#     # 1. Search for text in files using Ripgrep
#     # 2. Interactively narrow down the list using fzf
#     # 3. Open the file in Vim
#     IFS=: read -r -a selected < <(
#     rg --color=always --line-number --no-heading --smart-case "${*:-}" |
#     fzf --ansi \
#         --color "hl:-1:underline,hl+:-1:underline:reverse" \
#         --delimiter : \
#         --preview 'bat --color=always {1} --highlight-line {2}' \
#         --preview-window 'up,60%,border-bottom,+{2}+3/3,~3'
#     )
#     [ -n "${selected[0]}" ] && vim "${selected[0]}" "+${selected[1]}"
# }

