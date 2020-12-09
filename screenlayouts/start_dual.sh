#!/bin/sh
DP_connected="none"
for m in $(/usr/bin/xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "$m" != "eDP-1-1" ]; then
        DP_connected=$m
    fi
done
if [ "$DP_connected" != "none" ]; then
    echo "Found connected screen at $DP_connected"
    bash ~/.screenlayout/dual_screen_left.sh $DP_connected
fi
