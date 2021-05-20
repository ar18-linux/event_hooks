#!/bin/bash
echo $4
pactl set-sink-port 0 analog-output-headphones

echo $4 > /tmp/test