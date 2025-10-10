#!/bin/bash

DIRECTION=$1
TYPE=$2
LIMIT=100
STEP=5

DEVICE="@DEFAULT_${TYPE^^}@"
CURRENT_VOLUME=$(pactl get-${TYPE}-volume "$DEVICE" | grep -o '[0-9]*%' | head -n 1 | sed 's/%//')

if [[ "$DIRECTION" == "up" ]]; then
  if [ "$CURRENT_VOLUME" -lt "$LIMIT" ]; then
    pactl set-${TYPE}-volume "$DEVICE" "+${STEP}%"
  else
    pactl set-${TYPE}-volume "$DEVICE" "${LIMIT}%"
  fi
elif [[ "$DIRECTION" == "down" ]]; then
  pactl set-${TYPE}-volume "$DEVICE" "-${STEP}%"
fi
