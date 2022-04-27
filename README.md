# USB-CAN Analyzer
This is a small C program that dumps the CAN traffic for one these adapters:

![alt text](USB-CAN.jpg)

I belive the adapter was originally designed by [SeeedStudio](https://www.seeedstudio.com/USB-CAN-Analyzer-p-2888.html), atleast i have found the most "complete" version of documentation on what i assume is their github:[SeeedDocument](https://github.com/SeeedDocument/USB-CAN_Analyzer/tree/master/res/USB-CAN%20software%20and%20drive(v7.10)). The adapters can be found everywhere on Ebay nowadays, but there is no official Linux support. Only a Windows binary file [stored directly on GitHub](https://github.com/SeeedDocument/USB-CAN_Analyzer).

## Linux Support
This fork of the original project made by kobolt **is able to dumb data frames with an extended CAN FrameID**. Note support for sending messages with an extended ID has yet to be added.

**Note:**

When plugged into a linux machine, the adapter will show something like this:
```
$ lsusb

Bus 002 Device 006: ID 1a86:7523 QinHeng Electronics HL-340 USB-Serial adapter
```
And the whole thing is actually a USB to serial converter, for which Linux will provide the 'ch341-uart' driver and create a new /dev/ttyUSB device. So this program simply implements part of that serial protocol
