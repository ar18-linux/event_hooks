#!/bin/bash
#echo $4
if [ "$3" = "unplug" ]; then
  sleep 5 && pactl set-sink-port 0 analog-output-headphones
else
  sleep 5 && pactl set-sink-port 0 analog-output-speaker
fi

#echo "$@" > /tmp/test