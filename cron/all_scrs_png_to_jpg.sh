#!/usr/bin/env bash

cd ~/hdd/Screenshots/ && for file in *.png; do convert "$file" $(basename -s .png "$file").jpg ; rm "$file" ; done; 

