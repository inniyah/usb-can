[![Build Status](https://travis-ci.org/alexmohr/usb-can.svg?branch=master)](https://travis-ci.com/alexmohr/usb-can)
# This project currently is rewritten to a kernel driver for better support and cleaner code

# USB-CAN Analyzer Linux Support
This is a hard fork of https://github.com/kobolt/usb-can.

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
* ip tools
* cmake

## Install
````
mkdir build
cd build
cmake ../
make

# optional
make install
````

## Usage
Run as daemon
````usbcan -s 500000 -d /dev/ttyUSB0````

Start with verbose logging and in foreground
````usbcan -p -s 500000 -d /dev/ttyUSB0 -t -F ````
