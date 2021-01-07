#!/usr/bin/zsh
case "$1" in
    --popup)
        dunstify -i "" -t 3000 -r 9574 -u normal " CPU time (%)" "$(ps axch -o cmd:10,pcpu k -pcpu | head | awk '$0=$0"%"' )"
        ;;
    *)
        # get CPU load in percentage
        cpu_util=$(mpstat 1 1| grep "all" | head -1 | awk '{print $3}')
        # get cpu temperature
        cpu_temp=$(sensors | grep "Package id 0:" | head -1 | awk '{print $4}')
        # remove + and floating point digit
        cpu_temp="${cpu_temp//+}"
        cpu_temp="${cpu_temp//.0}"
        echo " $cpu_util%    $cpu_temp"
        ;;
esac
