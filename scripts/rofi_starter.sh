#!/bin/bash
setxkbmap -layout us && rofi -show run  && setxkbmap -option grp:toggle "us,ru"
