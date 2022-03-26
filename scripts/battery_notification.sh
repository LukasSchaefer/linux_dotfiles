#!/bin/bash

# Run this script as a cronjob every 5 minutes or so, to get notifications when
# battery percentage goes below 30% or above 80%.
# Cronjob line example:
# */5 * * * * /bin/bash /path/to/battery_health_notifications.sh

# This line is to make notify-send always work, also when run in a crontab.
# https://askubuntu.com/questions/298608/notify-send-doesnt-work-from-crontab/346580#346580
# export $(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pgrep -u $LOGNAME gnome-session | head -n 1)/environ | tr '\0' '\n')

BATTERY_PATH=$(upower -e | grep battery)
LINE_POWER_PATH=$(upower -e | grep line_power_AC)
BATTERY_PERCENTAGE=$(upower -i $BATTERY_PATH | grep 'percentage:' | awk '{ print $2 }' | sed 's/%//')
CABLE_PLUGGED=$(upower -i $LINE_POWER_PATH | grep -A2 'line-power' | grep online | awk '{ print $2 }')

if [[ $CABLE_PLUGGED == 'yes' ]]; then

    if [[ $BATTERY_PERCENTAGE -gt 95 ]]; then
        notify-send --urgency=low -i "battery-good" "Battery notification" "Battery reached 95%, unplug the power cable to optimize battery life."
    fi

else

    if [[ $BATTERY_PERCENTAGE -lt 5 ]]; then
        notify-send --urgency=critical -i "battery-empty" "Battery notification" "Battery is below 5%!!!"
    elif [[ $BATTERY_PERCENTAGE -lt 10 ]]; then
        notify-send --urgency=critical -i "battery-low" "Battery notification" "Battery is below 10%!"
    elif [[ $BATTERY_PERCENTAGE -lt 20 ]]; then
        notify-send --urgency=normal -i "battery-low" "Battery notification" "Battery is below 20%."
    elif [[ $BATTERY_PERCENTAGE -lt 50 ]]; then
        notify-send --urgency=normal -i "battery-good" "Battery notification" "Battery is below 50%."
    fi
fi
