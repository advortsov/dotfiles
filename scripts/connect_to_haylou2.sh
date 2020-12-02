#!/bin/bash
connected=$(bluetoothctl info 9C:19:C2:A7:66:4C | grep Connected)
echo $connected
if [[ $connected == *"yes"* ]]; then
    echo "disconnect 9C:19:C2:A7:66:4C" | bluetoothctl
#    echo "power off" | bluetoothctl
else
#    echo "power on" | bluetoothctl
    echo "connect 9C:19:C2:A7:66:4C" | bluetoothctl
fi
