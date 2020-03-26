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

## Building & Installation
To build the module and the userspace tools run ``make`` in ``src`` and ``src/modules`` or run
````
./build.sh
````

To install run ``make install`` in the folders listed above or 

````
./build.sh install
````

## Usage
Load the kernel module 
````
insmod hlcan.ko
````

Start hlcand
Listen only 
````
hlcand -m 2 -s 500000 /dev/ttyUSB0
````

Foreground
````
hlcand -F -s 500000 /dev/ttyUSB0
````

Extended Frames
````
hlcand -e -s 500000 /dev/ttyUSB0
````

Help 
````
Usage: ./hlcand [options] <tty> [canif-name]

Options: -l         (set transciever to listen mode)
         -s <speed> (set CAN speed in bits per second)
         -S <speed> (set UART speed in baud)
         -e         (set interface to extended id mode)
         -F         (stay in foreground; no daemonize)
         -m <mode>  (0: normal (default), 1: loopback, 2:silent, 3: loopback silent)
         -h         (show this help page)

Examples:
slcand -m 2 -s 500000 /dev/ttyUSB0
````