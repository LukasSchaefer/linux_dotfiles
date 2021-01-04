#!/usr/bin/zsh
# get GPU load in percentage
gpu_util=$(nvidia-smi --query-gpu=utilization.gpu --format=csv | sed -n -e 2p | awk '{print $1}')
# get cpu temperature
gpu_temp=$(nvidia-smi --query-gpu=temperature.gpu --format=csv | sed -n -e 2p | awk '{print $1}')
echo " $gpu_util%    $gpu_temp"
