TARGET=sample.ko
SRCS=$(TARGET:.ko=.c)

RUNINFO=.runinfo

CINCLUDE=-I/usr/realtime/include

KERNEL_SOURCE=/lib/modules/$(shell uname -r)/build
PWD=$(shell pwd)

KBUILD_EXTRA_SYMBOLS := $(shell rtai-config --prefix)/modules/Module.symvers
EXTRA_CFLAGS+=$(shell rtai-config --module-cflags) $(CINCLUDE)

obj-m+=$(TARGET:.ko=.o)

default: $(TARGET) $(RUNINFO)

$(TARGET): $(TARGET:.ko=.c)
	$(MAKE) -C $(KERNEL_SOURCE) O=. SUBDIRS=$(PWD) modules

$(RUNINFO): Makefile
	echo "sample:sched+sem:push sample;sleep 60;popall:" > $(RUNINFO)
	
clean:
	rm -f *~ *.bak *.o *.ko *.d *.mod.* *.order *.symvers .sample.*
	rm -rf .tmp_versions
	rm -f $(TARGET) $(RUNINFO)