#!/bin/sh
if [ $# != 3 ]; then
    echo "Usage: ./dual_screen_left.sh <eDP_name> <DP_name> <DP_resolution>"
    exit 1
fi
if [[ $3 == 1920* ]]; then
    pos="1920x0"
else
    pos="2560x240"
fi
xrandr --output $1 --mode 1920x1200 --pos $pos --rotate normal --output $2 --mode $3 --pos 0x0 --rotate normal
