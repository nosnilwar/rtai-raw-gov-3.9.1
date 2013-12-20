# Makefile for hello module
#
#
ifneq ($(KERNELRELEASE),)
  obj-m := signal_edf_internet.o
  EXTRA_CFLAGS += -I/usr/realtime/include
else
  MAKE := /usr/bin/make
  KDIR := /home/rsgoncalves/public_html/linux-2.6.24.6
  PWD := $(PWD)
default:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
endif

