#!/bin/sh
case "$1" in
    --popup)
        dunstify -i "" -t 3000 -r 9574 -u normal " Memory (%)" "$(ps axch -o cmd:10,pmem k -pmem | head | awk '$0=$0"%"' )"
        ;;
    *)
        echo " $(free -h --si | awk '/^Mem:/ {print $3 "/" $2}')"
        ;;
esac