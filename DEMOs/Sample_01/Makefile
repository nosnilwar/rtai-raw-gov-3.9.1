# Makefile Default para a compilacao de arquivos.c usando o RTAI

NOME_ARQUIVO = hello_world

CCFLAGS = -I /usr/realtime/include
LDFLAGS = -L /usr/realtime/lib -llxrt -lpthread -static -O2

default:
	export PATH=$(PATH):/usr/realtime/include:/usr/realtime/bin:.
	gcc $(LDFLAGS) $(CCFLAGS) -o $(NOME_ARQUIVO) $(NOME_ARQUIVO).c

clean:
	rm -rf *.o $(NOME_ARQUIVO)