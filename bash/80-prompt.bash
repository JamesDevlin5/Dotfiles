#!/usr/bin/env bash

user_status() {
    if [ $UID == 0 ]; then
        # Root
        echo "r"
    else
        # Non-super user
        echo "not"
    fi
}

# Prev status
# if [[ $? == 0 ]]; then echo -n "\e[91m"; fi
prev_status() {
    if [ $? == 0 ]; then
        echo "ok"
    else
        echo "no k"
    fi
}

PS1=' -[ \@ ]- $(user_status) -- \w : \$ '
export PS1

