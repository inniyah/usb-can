[![Build Status](https://travis-ci.org/alexmohr/usb-can.svg?branch=master)](https://travis-ci.com/alexmohr/usb-can)
# USB-CAN Analyzer Linux Support
This repository implements a kernel module which adds support for QinHeng Electronics HL-340 USB-Serial adapter
It is based on the works https://github.com/kobolt/usb-can and the linux slcan driver.

It supports adapters like the one below.

![alt text](USB-CAN.jpg)

This fork adds support for:
* SocketCAN Api: This enabled usage of this adapter like a native adapter.
* Extended Frames: Extended Frames now can be used.
* Installation via make

The adapters can be found everywhere on Ebay nowadays, but there is no official Linux support. Only a Windows binary file [stored directly on GitHub](https://github.com/SeeedDocument/USB-CAN_Analyzer).

When plugged in, it will show something like this:
```
Bus 002 Device 006: ID 1a86:7523 QinHeng Electronics HL-340 USB-Serial adapter
```
And the whole thing is actually a USB to serial converter, for which Linux will provide the 'ch341-uart' driver and create a new /dev/ttyUSB device. So this program simply implements part of that serial protocol.

## Requirements
* can-utils

## Install
````
make
# optional
sudo make install

# load module
sudo insmod hl340_can.ko
````

## Usage
Create adapter 
````
sudo ip link add  dev hlcan0 type hlcan
````

Configure usb device 
````
sudo ip link set hlcan0 alias /dev/ttyUSB0
````

Configure can baudrate 
````
sudo ip link set hlcan0 type can bitrate 500000
`````
