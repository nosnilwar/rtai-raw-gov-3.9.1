TARGET=sample
SRCS=$(TARGET).c

RUNINFO=.runinfo

FLAGS=-O2 -Wall -MMD
INCLUDE=-I. -I$(HOME)/include -I/usr/realtime/include
LIBDIR=-L$(HOME)/lib
LIBS=

CC=gcc
CFLAGS=$(FLAGS) $(INCLUDE)
LDFLAGS=$(LIBDIR) $(LIBS)

all: $(TARGET) $(RUNINFO)

$(TARGET): $(SRCS:.c=.o)
	$(CC) -o $@ $^ -lpthread $(LDFLAGS) 

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

-include $(SRCS:.c=.d)

$(RUNINFO): Makefile
	echo "$(TARGET):sched+sem:./$(TARGET);popall:Control+C para cancelar a execucao! ;)" > $(RUNINFO)

clean:
	rm -f *~ *.bak *.o *.d
	rm -f $(TARGET) $(RUNINFO)