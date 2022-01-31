#!/bin/sh
if [ $(iwctl device wlan0 show | grep "Powered             on" | wc -c) -eq 0 ]
then
  iwctl device wlan0 set-property Powered on
else
  iwctl device wlan0 set-property Powered off
fi
