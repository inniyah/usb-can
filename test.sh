#!/bin/bash
cd src 
sudo ip link delete hlcan0
sudo rmmod hl340_can 
make 
sudo insmod hl340_can.ko
sudo ip link add  dev hlcan0 type hlcan
sudo ip link set hlcan0 alias /dev/ttyUSB0
sudo ip link set hlcan0 type can bitrate 500000