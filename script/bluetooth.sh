#! /bin/bash

power=$(bluetoothctl show | grep "Powered" | awk '{print $2}')

if [ "$power" = "no" ]; then
    bluetoothctl power on
else
    bluetoothctl power off
fi
