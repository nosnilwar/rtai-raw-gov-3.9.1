/**************************************************************
* UNIVERSIDADE FEDERAL DO AMAZONAS                            *
* ENGENHARIA DA COMPUTACAO                                    *
*                                                             *
* Disciplina: Programacao em Tempo Real                       *
* Programa  : pwmsignal_userspace.c                           *
* Objetivo  : Utilizar tarefas de tempo real em um programa   *
*             no espaco do usuario                            *
*                                                             *
* Autores:                                                    *
*   Adriano Mendes Gil                                        *
*   Jhony Braga da Silva                                      *
*   Rawlinson da Silva Goncalves                              *
*   Rogério Ramos                                             *
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
#define TICK 500000000 //0.5 seconds

/* Definindo variaveis goblais*/

// Tarefas utilizadas no escalonamento
RT_TASK *Task_1A;
RT_TASK *Task_2A;
RT_TASK *Task_1B;
RT_TASK *Task_2B;

RTIME sampling;

// Variaveis de dalculo do tempo
struct tm *newtime;
time_t aclock;

/**
* @name upSignalA_Thread
*
* Representa a passagem do sinal PWM A do nivel baixo para alto.
*
*/
void *upSignalA_Thread(void *arg)
{
	unsigned long Task_1A_name = nam2num("SRV_1");

	Task_1A = rt_task_init(Task_1A_name, 0, 0, 0);
	rt_task_make_periodic(Task_1A, rt_get_time() + sampling * 5, sampling * 10);

	while (1) {
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);

		printf("  Up - Signal A =======> %s", asctime(newtime));
		rt_task_wait_period();
	}

}

/**
* @name downSignalA_Thread
*
* Representa a passagem do sinal PWM A do nivel alto para o nivel baixo.
*
*/
void *downSignalA_Thread(void *arg)
{
	unsigned long Task_2A_name = nam2num("SRV_2");

	Task_2A = rt_task_init(Task_2A_name, 0, 0, 0);
	rt_task_make_periodic(Task_2A, rt_get_time() + sampling, sampling * 10);

	while (1) {
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);

		printf("Down - Signal A =======> %s", asctime(newtime));
		rt_task_wait_period();
	}
}

/**
* @name upSignalB_Thread
*
* Representa a passagem do sinal PWM B do nivel baixo para o nivel alto.
*
*/
void *upSignalB_Thread(void *arg)
{
	unsigned long Task_1B_name = nam2num("SRV_3");

	Task_1B = rt_task_init(Task_1B_name, 0, 0, 0);
	rt_task_make_periodic(Task_1B, rt_get_time() + sampling * 11, sampling * 10);

	while (1) {
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);

		printf("  Up - Signal B =======> %s", asctime(newtime));
		rt_task_wait_period();
	}

}

/**
* @name downSignalB_Thread
*
* Representa a passagem do sinal PWM B do nivel alto para o nivel baixo.
*
*/
void *downSignalB_Thread(void *arg)
{
	unsigned long Task_2B_name = nam2num("SRV_4");

	Task_2B = rt_task_init(Task_2B_name, 0, 0, 0);
	rt_task_make_periodic(Task_2B, rt_get_time() + sampling * 16, sampling * 10);

	while (1) {
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);

		printf("Down - Signal B =======> %s", asctime(newtime));
		rt_task_wait_period();
	}
}

int hello_init(void)
{
	/* Dados de controle da Thread */
	pthread_t *threadControle_1A;
	pthread_t *threadControle_2A;
	pthread_t *threadControle_1B;
	pthread_t *threadControle_2B;

	rt_set_periodic_mode();

	sampling = start_rt_timer(nano2count(TICK));

	printf("\nInit module function\n");

	threadControle_1A = (pthread_t *) malloc(sizeof(pthread_t));
	if (threadControle_1A == 0)
	{
		printf("Não foi possivel criar a Thread deste PWM.\n\n");
		return(0);
	}

	if(pthread_create(threadControle_1A, 0, upSignalA_Thread, 0))
	{
		printf("Não escalonar a Thread deste PWM.\n");
		return(0);
	}

	threadControle_2A = (pthread_t *) malloc(sizeof(pthread_t));
	if (threadControle_2A == 0)
	{
		printf("Não foi possivel criar a Thread deste PWM.\n");
		return(0);
	}

	if(pthread_create(threadControle_2A, 0, downSignalA_Thread, 0))
	{
		printf("Não escalonar a Thread deste PWM.\n\n");
		return(0);
	}

	threadControle_1B = (pthread_t *) malloc(sizeof(pthread_t));
	if (threadControle_1B == 0)
	{
		printf("Não foi possivel criar a Thread deste PWM.\n");
		return(0);
	}

	if(pthread_create(threadControle_1B, 0, upSignalB_Thread, 0))
	{
		printf("Não escalonar a Thread deste PWM.\n\n");
		return(0);
	}

	threadControle_2B = (pthread_t *) malloc(sizeof(pthread_t));
	if (threadControle_2B == 0)
	{
		printf("Não foi possivel criar a Thread deste PWM.\n");
		return(0);
	}

	if(pthread_create(threadControle_2B, 0, downSignalB_Thread, 0))
	{
		printf("Não escalonar a Thread deste PWM.\n\n");
		return(0);
	}

	while(!getchar());

	pthread_cancel((pthread_t) *threadControle_1A);
	pthread_cancel((pthread_t) *threadControle_2A);
	pthread_cancel((pthread_t) *threadControle_1B);
	pthread_cancel((pthread_t) *threadControle_2B);

	return 0;
}

void hello_clean(void)
{
  rt_task_delete(Task_1A);
  rt_task_delete(Task_2A);
  rt_task_delete(Task_1B);
  rt_task_delete(Task_2B);

  printf("\nFim do Escalonamento\n");
}

int main(void) {
	printf("\n\nIniciando o escalonamento de dois sinais PWM\n\n");


	hello_init();
	hello_clean();

	return 0 ;
}
