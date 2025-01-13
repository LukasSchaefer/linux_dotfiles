#!/bin/sh
if [ $# != 3 ]; then
    echo "Usage: ./dual_screen_left.sh <eDP_name> <DP_name> <DP_resolution>"
    exit 1
fi

height=$(echo $3 | sed 's/[0-9]*x//g')
pos="${height}x0"
xrandr --output $1 --mode 1920x1200 --pos $pos --rotate normal --output $2 --mode $3 --pos 0x0 --rotate right
