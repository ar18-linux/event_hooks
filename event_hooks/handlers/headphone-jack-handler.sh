#!/bin/bash
#echo $4
if [ "$3" = "unplug" ]; then
  pactl set-sink-port 0 analog-output-headphones
else
  pactl set-sink-port 0 analog-output-speaker
fi

#echo "$@" > /tmp/test