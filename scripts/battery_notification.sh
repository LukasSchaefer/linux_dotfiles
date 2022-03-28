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

# get last battery status
if [ ! -f "/tmp/last_battery_status.dat" ] ; then
    LAST_BATTERY_STATUS=-1
else
    LAST_BATTERY_STATUS=`cat /tmp/last_battery_status.dat`
fi

if [[ $CABLE_PLUGGED == 'yes' ]]; then

    if [[ $BATTERY_PERCENTAGE -gt 95 ]]; then
        if [[ $LAST_BATTERY_STATUS -ne 0 ]]; then
            notify-send --urgency=low -i "battery-good" "Battery notification" "Battery reached 95%, unplug the power cable to optimize battery life."
            LAST_BATTERY_STATUS=0
        fi
    fi

else

    if [[ $BATTERY_PERCENTAGE -lt 5 ]]; then
        if [[ $LAST_BATTERY_STATUS -ne 1 ]]; then
            notify-send --urgency=critical -i "battery-empty" "Battery notification" "Battery is below 5%!!!"
            LAST_BATTERY_STATUS=1
        fi
    elif [[ $BATTERY_PERCENTAGE -lt 10 ]]; then
        if [[ $LAST_BATTERY_STATUS -ne 2 ]]; then
            notify-send --urgency=critical -i "battery-low" "Battery notification" "Battery is below 10%!"
            LAST_BATTERY_STATUS=2
        fi
    elif [[ $BATTERY_PERCENTAGE -lt 20 ]]; then
        if [[ $LAST_BATTERY_STATUS -ne 3 ]]; then
            notify-send --urgency=normal -i "battery-low" "Battery notification" "Battery is below 20%."
            LAST_BATTERY_STATUS=3
        fi
    elif [[ $BATTERY_PERCENTAGE -lt 50 ]]; then
        if [[ $LAST_BATTERY_STATUS -ne 4 ]]; then
            notify-send --urgency=normal -i "battery-good" "Battery notification" "Battery is below 50%."
            LAST_BATTERY_STATUS=4
        fi
    fi
fi

# save last battery status
echo "${LAST_BATTERY_STATUS}" > /tmp/last_battery_status.dat
