/**************************************************************
* UNIVERSIDADE FEDERAL DO AMAZONAS                            *
* ENGENHARIA DA COMPUTACAO                                    *
* MESTRADO - ICOMP                                            *
*                                                             *
* Autor: Rawlinson da Silva Goncalves                         *
**************************************************************/

/* Inclusao das bibliotecas. */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include <sys/mman.h>
#include <fcntl.h>
#include <sched.h>

#include <rtai_lxrt.h>

/* Definindo MACROS */
#define CPU_ALLOWED 1
#define TICK 500000000 //0.5 seconds

/* Definindo variaveis goblais*/

// Tarefas utilizadas no escalonamento
RT_TASK *Task_1;
RT_TASK *Task_2;
RT_TASK *Task_3;
RT_TASK *Task_4;

RTIME sampling;

// Variaveis para realizar os calculos de tempo...
struct tm *newtime;
time_t aclock;

void *init_task_1(void *arg)
{
	unsigned long Task_1_name = nam2num("TASK_1");

	//TODO:RAWLINSON
	if(!(Task_1 = rt_task_init_schmod(Task_1_name,1,0,0,SCHED_FIFO, CPU_ALLOWED))) {
		printf("[ERRO] Não foi possível criar a tarefa 1.\n");
		exit(1);
	}

	rt_allow_nonroot_hrt();

	rt_make_hard_real_time();

	rt_task_make_periodic(Task_1, rt_get_time() + sampling * 5, sampling * 10);

	while (1) {
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);

		printf("[TASK 1] =======> %s", asctime(newtime));
		rt_task_wait_period();
	}

}

void *init_task_2(void *arg)
{
	unsigned long Task_2_name = nam2num("TASK_2");

	if(!(Task_2 = rt_task_init_schmod(Task_2_name,1,0,0,SCHED_FIFO, CPU_ALLOWED))) {
		printf("[ERRO] Não foi possível criar a tarefa 2.\n");
		exit(1);
	}

	rt_allow_nonroot_hrt();

	rt_make_hard_real_time();

	rt_task_make_periodic(Task_2, rt_get_time() + sampling, sampling * 10);

	while (1) {
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);

		printf("[TASK 2] =======> %s", asctime(newtime));
		rt_task_wait_period();
	}
}

void *init_task_3(void *arg)
{
	unsigned long Task_3_name = nam2num("TASK_3");

	if(!(Task_3 = rt_task_init_schmod(Task_3_name,1,0,0,SCHED_FIFO, CPU_ALLOWED))) {
		printf("[ERRO] Não foi possível criar a tarefa 3.\n");
		exit(1);
	}

	rt_allow_nonroot_hrt();

	rt_make_hard_real_time();

	rt_task_make_periodic(Task_3, rt_get_time() + sampling * 11, sampling * 10);

	while (1) {
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);

		printf("[TASK 3] =======> %s", asctime(newtime));
		rt_task_wait_period();
	}

}

void *init_task_4(void *arg)
{
	unsigned long Task_4_name = nam2num("TASK_4");

	if(!(Task_4 = rt_task_init_schmod(Task_4_name,1,0,0,SCHED_FIFO, CPU_ALLOWED))) {
		printf("[ERRO] Não foi possível criar a tarefa 1.\n");
		exit(1);
	}

	rt_allow_nonroot_hrt();

	rt_make_hard_real_time();

	rt_task_make_periodic(Task_4, rt_get_time() + sampling * 16, sampling * 10);

	while (1) {
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);

		printf("[TASK 4] =======> %s", asctime(newtime));
		rt_task_wait_period();
	}
}

int create_tasks(void)
{
	/* Dados de controle da Thread */
	pthread_t *threadControle_Task_1;
	pthread_t *threadControle_Task_3;
	pthread_t *threadControle_Task_2;
	pthread_t *threadControle_Task_4;

	rt_set_periodic_mode();

	rt_hard_timer_tick_cpuid(CPU_ALLOWED);

	sampling = start_rt_timer(nano2count(TICK));

	printf("\nInit module function\n");

	threadControle_Task_1 = (pthread_t *) malloc(sizeof(pthread_t));
	threadControle_Task_3 = (pthread_t *) malloc(sizeof(pthread_t));
	threadControle_Task_2 = (pthread_t *) malloc(sizeof(pthread_t));
	threadControle_Task_4 = (pthread_t *) malloc(sizeof(pthread_t));

	if (threadControle_Task_1 == 0)
	{
		printf("[ERRO] Não foi possivel criar a Thread da tarefa 1.\n\n");
		return(0);
	}
	if (threadControle_Task_2 == 0)
	{
		printf("[ERRO] Não foi possivel criar a Thread da tarefa 2.\n");
		return(0);
	}
	if (threadControle_Task_3 == 0)
	{
		printf("[ERRO] Não foi possivel criar a Thread da tarefa 3.\n");
		return(0);
	}
	if (threadControle_Task_4 == 0)
	{
		printf("[ERRO] Não foi possivel criar a Thread da tarefa 4.\n");
		return(0);
	}

	// Inicializando as tarefas...
	if(pthread_create(threadControle_Task_1, 0, init_task_1, 0))
	{
		printf("[ERRO] Não foi possível inicializar a Thread da tarefa 1.\n");
		return(0);
	}
	if(pthread_create(threadControle_Task_3, 0, init_task_2, 0))
	{
		printf("[ERRO] Não foi possível inicializar a Thread da tarefa 2.\n\n");
		return(0);
	}
	if(pthread_create(threadControle_Task_2, 0, init_task_3, 0))
	{
		printf("[ERRO] Não foi possível inicializar a Thread da tarefa 3.\n\n");
		return(0);
	}
	if(pthread_create(threadControle_Task_4, 0, init_task_4, 0))
	{
		printf("[ERRO] Não foi possível inicializar a Thread da tarefa 4.\n\n");
		return(0);
	}

	while(!getchar()); // Aguardo o usuario apertar alguma tecla para finalizar o escalonamento...

	pthread_cancel((pthread_t) *threadControle_Task_1);
	pthread_cancel((pthread_t) *threadControle_Task_3);
	pthread_cancel((pthread_t) *threadControle_Task_2);
	pthread_cancel((pthread_t) *threadControle_Task_4);

	return 0;
}

void delete_tasks(void)
{
	rt_make_soft_real_time();

	rt_task_delete(Task_1);
	rt_task_delete(Task_2);
	rt_task_delete(Task_3);
	rt_task_delete(Task_4);

	printf("\nFim do Escalonamento\n");
}

int main(void) {
	printf("\n\nIniciando o escalonamento das tarefas...\n\n");

	create_tasks();

	delete_tasks();

	return 0 ;
}
