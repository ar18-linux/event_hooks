#!/bin/bash
#echo $4
#user_name="$(logname)"
#user_id="$(id -u "${user_name}")"
user_id="$(ls "/run/user/" | head -1)"
user_name="$(id -nu "${user_id}")"

if [ "$3" = "plug" ]; then
  sudo -u "${user_name}" XDG_RUNTIME_DIR="/run/user/${user_id}" pactl set-sink-port 0 analog-output-headphones
else
  sudo -u "${user_name}" XDG_RUNTIME_DIR="/run/user/${user_id}" pactl set-sink-port 0 analog-output-speaker
fi
#sudo -u "${user_name}" XDG_RUNTIME_DIR="/run/user/${user_id}" pactl set-sink-port 0 analog-output-speaker
#  sleep 2 && su - nulysses -c "pactl set-sink-port 0 analog-output-speaker"

#echo $(date) >> /tmp/test
#echo "$@" >> /tmp/test
#echo "${user_name}" >> /tmp/test
#echo "${user_id}" >> /tmp/test