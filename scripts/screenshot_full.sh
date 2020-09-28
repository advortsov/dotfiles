#!/bin/bash

fileDate=`date +%Y-%m-%d-%H-%M-%S`
to=~/Pictures/Screenshots/$fileDate.png
import -window root $to
