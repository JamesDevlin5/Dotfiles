#!/usr/bin/env zsh

# View the value of some variable

echo "View Shell Parameter Attributes and Values"

typeset + | awk '{print $NF}' | nl -s ') --  ' | column

