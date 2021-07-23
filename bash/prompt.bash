#!/usr/bin/env bash

# https://misc.flogisoft.com/bash/tip_colors_and_formatting


declare -x PS1

# Shell name
SH_NAME="\s"

# Number of jobs
N_JOBS="\j"

# Current Time: 12- or 24-hour, w/ or w/o seconds, etc.
# \D{fmt} -- man 3 strftime
# ( %r, %T )
TIME="%R"

# Username
USER="\u"

# Whether or not root
if [ $EUID -eq 0 ]; then
	echo "root"
fi

# Directory
CWD="\w"

# Non-printing character sequence: \[ ... \]

# Insert an escape sequence after a command has been typed, but before the output is displayed
trap 'tput sgr0' DEBUG

