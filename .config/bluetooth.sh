#!/bin/sh
if [ ! $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
then
  echo "%{F#42A5F5}"
else
  echo "%{F#9E9E9E}"
fi
