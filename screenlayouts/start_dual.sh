#!/bin/sh
DP_connected="none"
eDP_connected="none"
for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [[ $m != "eDP"* ]] ; then
        echo $m
        DP_connected=$m
    else
        eDP_connected=$m
    fi
done
if [ "$DP_connected" != "none" ]; then
    echo "Found connected screen at $DP_connected"
    bash ~/.screenlayout/dual_screen_left.sh $eDP_connected $DP_connected
else
    echo "No external screens found"
    xrandr --output $eDP_connected --primary --mode 1920x1200 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off
fi
