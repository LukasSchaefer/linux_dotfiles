#!/usr/bin/env sh

# Terminate already running bar instances
# killall -q polybar

# Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar base &

sleep .5

# single monitor setup
# if ! pgrep -x polybar; then
#     echo "---" | tee -a /tmp/polybar_mybar.log
#     polybar mybar >> /tmp/polybar_mybar.log 2>&1 &
# else
# 	pkill -USR1 polybar
# fi

# multiple monitors
if ! pgrep -x polybar; then
    if type "xrandr"; then
        for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
            MONITOR=$m polybar --reload mybar &
        done
    else
        polybar --reload mybar &
    fi
else
    pkill -USR1 polybar
fi

echo "Bars launched..."
