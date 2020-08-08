#!/bin/sh

#FREE=$(df -h /home | grep dev | awk -F ' ' '{ print $4 }')
FREE=$(bc -l <<< 'scale = 1; '$(df -m /home | grep dev | awk -F ' ' '{ print $4 }')/1024)
 
if [[ "${FREE}" ]]; then
  echo "${FREE}G"
fi
