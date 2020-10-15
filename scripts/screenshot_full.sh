#!/bin/bash

fileDate=`date +%Y-%m-%d-%H-%M-%S`
to=~/hdd/Screenshots/$fileDate.png
import -window root $to
xclip -selection clipboard -t image/png -i $to
