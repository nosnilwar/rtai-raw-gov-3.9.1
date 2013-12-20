# Makefile Default para a compilacao de arquivos.c usando o RTAI

NOME_ARQUIVO = periodic_task

CCFLAGS = -I /usr/realtime/include
LDFLAGS = -L /usr/realtime/lib -llxrt -lpthread -static

default:
	gcc $(CCFLAGS) $(LDFLAGS) -o $(NOME_ARQUIVO) $(NOME_ARQUIVO).c

clean:
	rm -rf *.o $(NOME_ARQUIVO)