# Variable Definition

CC = gcc
CFLAGS = `xml2-config --cflags --libs` -lfl -g
BISON = bison
FLEX = flex

GRAPH_FILES = src/graph/graph_structs \
				src/graph/stmt_structs \
				src/graph/graph

BISON_FILES = src/grammar/syntax
FLEX_FILES = src/grammar/lexical

LIB_OBJS = $(GRAPH_FILES:=.o)
LIB_C = src/grammar/syntax.tab.c src/grammar/lexical.c

PARSER = src/parser

# Pretty Print

Q = @ # suppress rules commands
QUIET_CC = 		$(Q:@=@echo		"\tCC\t" $@.o)
QUIET_BISON = 	$(Q:@=@echo		"\tBISON\t" $@.y)
QUIET_FLEX = 	$(Q:@=@echo		"\tFLEX\t" $@.l)
QUIET_GEN = 	$(Q:@=@echo		"\tGEN\t" $@)

# Rules

all: $(GRAPH_FILES) $(BISON_FILES) $(FLEX_FILES) $(PARSER)

$(GRAPH_FILES): % : %.c
	$(QUIET_CC)
	$(Q)$(CC) -c $^ -o $@.o

$(BISON_FILES): % : %.y
	$(QUIET_BISON)
	$(Q)$(BISON) -o $@.tab.c -d $^

$(FLEX_FILES): % : %.l
	$(QUIET_FLEX)
	$(Q)$(FLEX) -o $@.c $^

$(PARSER): $(LIB_OBJS) $(LIB_C)
	$(QUIET_GEN)
	$(Q)$(CC) $^ -o $@ $(CFLAGS)

clean:
	rm -f src/graph/*.o src/grammar/*.o
	rm -f src/grammar/*.c src/grammar/syntax.tab.h
	rm -f src/parser output/* src/c2asm/*.pyc
