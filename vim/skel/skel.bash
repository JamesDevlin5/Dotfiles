#!/usr/bin/env bash


# Colors {{{

# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37

declare -A color=( \
    [BLACK]="\033[0;40m" \
    [RED]="\033[0;41m" \
    [GREEN]="\033[0;42m" \
    [ORANGE]="\033[0;43m" \
    [BLUE]="\033[0;44m" \
    [PURPLE]="\033[0;45m" \
    [CYAN]="\033[0;46m" \
    [L_GREY]="\033[0;47m" \
    [D_GREY]="\033[1;40m" \
    [L_RED]="\033[1;41m" \
    [L_GREEN]="\033[1;42m" \
    [YELLOW]="\033[1;43m" \
    [L_BLUE]="\033[1;44m" \
    [L_PURPLE]="\033[1;45m" \
    [L_CYAN]="\033[1;46m" \
    [WHITE]="\033[1;47m" \
)

RESET="\033[0m"

# }}}

# vim:foldmethod=marker
