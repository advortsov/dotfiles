#!/bin/bash

fileDate=`date +%Y-%m-%d-%H-%M-%S`
fileName=".png"
to=~/hdd/Screenshots/$fileDate$fileName
import $to
chmod +rwx $to
xclip -selection clipboard -t image/png -i $to
