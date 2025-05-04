#!/bin/bash

INTERFACE=$(iw dev | awk '$1=="Interface"{print $2}' | head -n1)
if [ -z "$INTERFACE" ]; then
  echo '{"ssid":"N/A","signal":0}'
  exit
fi

INFO=$(iw dev "$INTERFACE" link)
SSID=$(echo "$INFO" | awk -F ': ' '/SSID/ {print $2}')
SIGNAL=$(echo "$INFO" | awk '/signal/ {print $2}' | cut -d. -f1)

# Convert dBm to percentage (approssimativo)
if [ "$SIGNAL" -lt -80 ]; then
  PERCENT=25
elif [ "$SIGNAL" -lt -60 ]; then
  PERCENT=50
elif [ "$SIGNAL" -lt -40 ]; then
  PERCENT=75
else
  PERCENT=100
fi

echo "{\"ssid\":\"$SSID\", \"signal\":$PERCENT}"
