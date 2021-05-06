#!/bin/bash

sudo ip r del 192.168.0.0/16 dev tunsnx
sudo ip r del 172.17.0.0/16 dev tunsnx
sudo ip r del 172.17.0.0/17 dev tunsnx
sudo ip r del 172.17.128.0/17 dev tunsnx
