# Makefile for hello module
#
#
ifneq ($(KERNELRELEASE),)
  obj-m := pwmsignal_edf.o
  EXTRA_CFLAGS += -I/usr/realtime/include
else
  MAKE := /usr/bin/make
  KDIR := /usr/src/linux-2.6.24.6-rtai
  PWD := $(PWD)
default:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
endif

