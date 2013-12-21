TARGET=led
SRCS=$(TARGET).c

RUNINFO=.runinfo
RTAIDIR=/usr/realtime
FLAGS=-O2 -Wall -MMD
INCLUDE=-I. -I$(HOME)/include -I$(RTAIDIR)/include
LIBDIR=-L$(HOME)/lib
LIBS=-lpthread

CC=gcc
POSIXWRAP=$(shell $(RTAIDIR)/bin/rtai-config --posix-wrap)
CFLAGS=$(FLAGS) $(INCLUDE)
LDFLAGS=$(LIBDIR) $(LIBS) $(POSIXWRAP)

all: $(TARGET) $(RUNINFO)

$(TARGET): $(SRCS:.c=.o)
	$(CC) -o $@ $^ $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

-include $(SRCS:.c=.d)

$(RUNINFO): Makefile
	echo "$(TARGET):lxrt:./$(TARGET);popall:" > $(RUNINFO)

clean:
	rm -f *~ *.bak *.o *.d
	rm -f $(TARGET) $(RUNINFO)