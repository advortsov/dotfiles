#!/bin/bash

# Check if gedit is running
# -x flag only match processes whose name (or command line if -f is
# specified) exactly match the pattern. 

if pgrep -x "openvpn" > /dev/null
then
    killall -q openvpn
    dunstify "Stopped"
else
    dunstify "Running convexity vpn"
    sudo openvpn --config ~/ad.client-config.ovpn
fi

