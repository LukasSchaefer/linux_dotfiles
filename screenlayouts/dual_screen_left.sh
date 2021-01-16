#!/bin/sh
if [ $# != 2 ]; then
    echo "Usage: ./dual_screen_left.sh <eDP_name> <DP_name>"
    exit 1
fi
xrandr --output $1 --mode 1920x1200 --pos 2560x240 --rotate normal --output $2 --mode 2560x1440 --pos 0x0 --rotate normal
