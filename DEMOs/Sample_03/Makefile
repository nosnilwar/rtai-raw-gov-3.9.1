TARGET=led.ko
SRCS=$(TARGET:.ko=.c)

RUNINFO=.runinfo

CINCLUDE=-I/usr/realtime/include -I/usr/include/

KERNEL_SOURCE=/lib/modules/$(shell uname -r)/build
PWD=$(shell pwd)
EXTRA_CFLAGS := $(CINCLUDE)

obj-m+=$(TARGET:.ko=.o)

default: $(TARGET) $(RUNINFO)

$(TARGET): $(TARGET:.ko=.c)
	$(MAKE) -C $(KERNEL_SOURCE) O=. SUBDIRS=$(PWD) modules

$(RUNINFO): Makefile
	echo "led:sched:push led;sleep 60;popall:" > $(RUNINFO)
	
clean:
	rm -f *~ *.bak *.o *.ko *.d *.mod.* *.order *.symvers .led.*
	rm -rf .tmp_versions
	rm -f $(TARGET) $(RUNINFO)