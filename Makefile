# SPDX-License-Identifier: GPL-2.0
#
#  Makefile for the Linux Controller Area Network drivers.
#
CFLAGS := -O2 -Wall -Wextra -Wstrict-prototypes -pedantic -Wno-parentheses

CPPFLAGS +=	-D_GNU_SOURCE

LDFLAGS= -Wl,--as-needed -Wl,--no-undefined -Wl,--no-allow-shlib-undefined

KERNEL_RELEASE ?= $(shell uname -r)

obj-m+=hlcan.o

all:
	make -C /lib/modules/$(KERNEL_RELEASE)/build/ M=$(PWD) modules
clean:
	make -C /lib/modules/$(KERNEL_RELEASE)/build/ M=$(PWD) clean
install:
	mkdir -p /usr/lib/modules/$(KERNEL_RELEASE)/kernel/drivers/net/can
	cp hlcan.ko /usr/lib/modules/$(KERNEL_RELEASE)/kernel/drivers/net/can
remove:
	find /usr/lib/modules/ -name hlcan.ko -exec rm {} \;
