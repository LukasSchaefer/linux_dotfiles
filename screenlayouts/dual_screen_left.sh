#!/bin/sh
if [ $# != 1 ]; then
    echo "Usage: ./dual_screen_left.sh <screen_name>"
    exit 1
fi
xrandr --output eDP-1-1 --mode 1920x1200 --pos 2560x0 --rotate normal --output $1 --mode 2560x1440 --pos 0x0 --rotate normal
