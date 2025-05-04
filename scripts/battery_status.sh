#!/bin/bash

capacity=$(cat /sys/class/power_supply/BMBT/capacity)
status=$(cat /sys/class/power_supply/BMBT/status)

if [[ "$status" == "Charging" ]]; then
    icon=""
elif (( capacity >= 90 )); then
    icon=""
elif (( capacity >= 60 )); then
    icon=""
elif (( capacity >= 30 )); then
    icon=""
elif (( capacity >= 10 )); then
    icon=""
else
    icon=""
fi

# Output JSON
echo "{\"capacity\": $capacity, \"icon\": \"$icon\"}"
