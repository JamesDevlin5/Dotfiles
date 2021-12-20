#!/usr/bin/env bash

# Terminate any and all running bar instances
killall -q polybar

# Launch Polybar
polybar mainbar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."

