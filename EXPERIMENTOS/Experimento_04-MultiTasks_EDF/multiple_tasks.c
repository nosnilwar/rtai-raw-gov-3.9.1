/**************************************************************
* UNIVERSIDADE FEDERAL DO AMAZONAS                            *
* ENGENHARIA DA COMPUTACAO                                    *
* MESTRADO - ICOMP                                            *
*                                                             *
* Autor: Rawlinson da Silva Goncalves                         *
**************************************************************/

/** Tabela de conversao... hehehe :P
Nanosegundos 1 -> Segundos 10^9
Nanosegundos 1 -> Milissegundo 10^6
Nanosegundos 1 -> Microsegundos 10^3
*/

/* Inclusao das bibliotecas. */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include <sys/mman.h>
#include <fcntl.h>
#include <sched.h>

#include <rtai_lxrt.h>

/** TABELA DE CORES... **/
char texto_preto[8] = "\033[30m"; //Cor do primeiro plano preta
char texto_vermelho[8] = "\033[31m"; //Cor do primeiro plano vermelha
char texto_verde[8] = "\033[32m"; //Cor do primeiro plano verde
char texto_laranja[8] = "\033[33m"; //Cor do primeiro plano laranja
char texto_azul[8] = "\033[34m"; //Cor do primeiro plano azul
char texto_magenta[8] = "\033[35m"; //Cor do primeiro plano magenta
char texto_ciano[8] = "\033[36m"; //Cor do primeiro plano ciano
char texto_branco[8] = "\033[37m"; //Cor do primeiro plano branca
char fundo_preto[8] = "\033[40m"; //Cor do fundo preta
char fundo_vermelho[8] = "\033[41m"; //Cor do fundo vermelha
char fundo_verde[8] = "\033[42m"; //Cor do fundo verde
char fundo_laranja[8] = "\033[43m"; //Cor do  fundo laranja
char fundo_azul[8] = "\033[44m"; //Cor do fundo azul
char fundo_magenta[8] = "\033[45m"; //Cor do fundo magenta
char fundo_ciano[8] = "\033[46m"; //Cor do fundo ciano
char fundo_branco[8] = "\033[47m"; //Cor do fundo branca

/* Definindo MACROS */
#define CPU_ALLOWED 1

/* Definindo variaveis goblais*/

#define ONE_SHOT

#define TICK_PERIOD 500000000

#define STACK_SIZE 2000

#define LOOPS 1000000000

#define NTASKS 4

RT_TASK *arrayTasks[NTASKS];
pthread_t *arrayThreads[NTASKS];

RTIME tick_period;

struct thread_param {
    int idTask;
};

void *init_task(void *arg)
{
	int idTask = ((struct thread_param*) arg)->idTask;
    unsigned int loops = LOOPS;
    RTIME now;

	//TODO:RAWLINSON
	if(!(arrayTasks[idTask] = rt_task_init_schmod(idTask,(NTASKS - idTask - 1),STACK_SIZE,0,SCHED_FIFO, CPU_ALLOWED))) {
		printf("[ERRO] Não foi possível criar a tarefa 1.\n");
		exit(1);
	}

	rt_allow_nonroot_hrt();

	rt_make_hard_real_time();

	now = rt_get_time() + NTASKS*tick_period;
    rt_task_make_periodic(arrayTasks[idTask], now, (NTASKS+idTask)*tick_period);

    while(loops--)
    {
    	printf("%sTASK %d\n", texto_verde, idTask);
        printf("%s", texto_preto);
        if (idTask == (NTASKS - 1))
        {
            rt_printk("\n\n");
            rt_task_wait_period();
        }
        else
        {
            rt_task_set_resume_end_times(-(NTASKS+idTask)*tick_period, -(idTask + 1)*tick_period);
        }
    }
}

int create_tasks(void)
{
	RTIME now;
	int i;
	struct thread_param *arrayThreadParams[NTASKS];

	#ifdef ONE_SHOT
		rt_set_oneshot_mode();
	#endif

	rt_set_periodic_mode();

	rt_hard_timer_tick_cpuid(CPU_ALLOWED);

	printf("************** Iniciando escalonamento **************\n");

	for (i = 0; i < NTASKS; i++)
	{
		arrayThreads[i] = (pthread_t *) malloc(sizeof(pthread_t));
		if (!arrayThreads[i])
		{
			printf("[ERRO] Não foi possivel criar a Thread da tarefa %d.\n\n", i);
			return(0);
		}
	}

	tick_period = start_rt_timer(nano2count(TICK_PERIOD));
	now = rt_get_time() + NTASKS*tick_period;

	for (i = 0; i < NTASKS; i++) {
		if((arrayThreadParams[i] = malloc(sizeof(*arrayThreadParams[i]))) == NULL)
		{
			printf("[ERRO] Não foi possivel criar os parametros da tarefa %d.\n\n", i);
			return (-1);
		}
		arrayThreadParams[i]->idTask = i;

		// Inicializando as tarefas...
		if(pthread_create(arrayThreads[i], 0, init_task, (void *)arrayThreadParams[i]))
		{
			printf("[ERRO] Não foi possível inicializar a Thread da tarefa %d.\n", i);
			return(0);
		}
	}

	while(!getchar()); // Aguardo o usuario apertar alguma tecla para finalizar o escalonamento...

	for (i = 0; i < NTASKS; i++) {
		pthread_cancel((pthread_t) *arrayThreads[i]);
		free(arrayThreadParams[i]);
	}

	return 0;
}

void delete_tasks(void)
{
	int i;

	rt_make_soft_real_time();

	for (i = 0; i < NTASKS; i++) {
		rt_task_delete(arrayTasks[i]);
	}

	printf("\nFim do Escalonamento %s\n", texto_preto);
}

int main(void) {
	printf("\n\nIniciando o escalonamento das tarefas...\n\n");

	create_tasks();

	delete_tasks();

	return 0 ;
}
