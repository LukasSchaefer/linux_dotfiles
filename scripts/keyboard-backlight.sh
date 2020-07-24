#!/bin/bash
# source: https://www.frandieguez.dev/posts/macbook-pro-keyboard-backlight-keys-on-ubuntu-gnulinux/
BACKLIGHT=$(cat /sys/class/leds/smc::kbd_backlight/brightness)
INCREMENT=20

SET_VALUE=0
case $1 in

    up)
        TOTAL=`expr $BACKLIGHT + $INCREMENT`
        if [ $TOTAL -gt "255" ]; then
            exit 1
        fi
        SET_VALUE=1
        ;;
    down)
        TOTAL=`expr $BACKLIGHT - $INCREMENT`
        if [ $TOTAL -lt "0" ]; then
            exit 1
        fi
        SET_VALUE=1
        ;;
    total)
    TEMP_VALUE=$BACKLIGHT
    while [ $TEMP_VALUE -lt "255" ]; do
        TEMP_VALUE=`expr $TEMP_VALUE + 1`
        if [ $TEMP_VALUE -gt "255" ]; then TEMP_VALUE=255; fi
        echo $TEMP_VALUE > /sys/class/leds/smc::kbd_backlight/brightness
    done
        ;;
    off)
    TEMP_VALUE=$BACKLIGHT
    while [ $TEMP_VALUE -gt "0" ]; do
        TEMP_VALUE=`expr $TEMP_VALUE - 1`
        if [ $TEMP_VALUE -lt "0" ]; then TEMP_VALUE=0; fi
        echo $TEMP_VALUE > /sys/class/leds/smc::kbd_backlight/brightness
    done
        ;;
    *)
        echo "Use: keyboard-light up|down|total|off"
        ;;
esac

if [ $SET_VALUE -eq "1" ]; then
    sudo chmod 666 /sys/class/leds/smc::kbd_backlight/brightness
    echo $TOTAL > /sys/class/leds/smc::kbd_backlight/brightness
fi
