#!/usr/bin/env bash


TIME_FMT="%r"    # 12-Hours, am/pm label
# TIME_FMT="%T"    # 24-Hours, no label

TIME=$(date "+${TIME_FMT}")

WIDGET=" [#!  ${TIME}  !#]     "
W_WIDTH=${#WIDGET}
W_PADDING=4

START_POS=$(( $(tput cols) - ( W_WIDTH + W_PADDING ) ))

tput sc
tput cuf ${START_POS}
echo -n "${WIDGET}"
tput rc


