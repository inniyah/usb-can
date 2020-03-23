[![Build Status](https://travis-ci.org/alexmohr/usb-can.svg?branch=master)](https://travis-ci.com/alexmohr/usb-can)
# USB-CAN Analyzer Linux Support
This repository implements a kernel module which adds support for QinHeng Electronics HL-340 USB-Serial adapter
It is based on the works https://github.com/kobolt/usb-can and the linux slcan driver.

Adapters like the one below are supported

![alt text](USB-CAN.jpg)
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
````

# load module
````
sudo insmod hl340_can.ko
````

## Usage
Load the kernel module 
````
insmod hlcan.ko
````

Create a new device 
````
slcand -o -c -f -s6 ttyUSB0\n
````