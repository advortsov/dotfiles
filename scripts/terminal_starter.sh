#!/bin/bash
setxkbmap -layout us && kitty && setxkbmap -option grp:toggle "us,ru"
