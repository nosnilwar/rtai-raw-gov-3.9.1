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
#include <unistd.h>
#include <time.h>

#include <sys/mman.h>
#include <fcntl.h>
#include <sched.h>

#include <rtai_lxrt.h>
#include <rtai_sem.h>

/* Definindo MACROS */
#define TICK 500000000 //0.5 seconds

/* Definindo variaveis goblais*/


RTIME sampling;

int begin, i;

static SEM* rMutex;

// Variaveis de de calculo do tempo



void *signalIchi(void *arg)
{
	RT_TASK *Task_1;

	unsigned long Task_1_name = nam2num("TSK_1") + i++;
	time_t aclock;
	time_t clockNow;
	int timeEx;
	int begin_1;
	int count = 0;

	struct tm *newtime, *timeNow;

	//Task_1 = rt_task_init(Task_1_name, 0, 0, 0);
	
        if(!(Task_1 = rt_task_init_schmod(Task_1_name,2,0,0,SCHED_FIFO,0))) {
		printf("CANNOT INIT HANDLER TASK > Task 1 <\n");
		exit(1);
	}
	rt_allow_nonroot_hrt();

        rt_make_hard_real_time();

	rt_task_make_periodic(Task_1, rt_get_time(), sampling * 16);
	rt_change_prio(Task_1, 2);

	begin_1 = begin;
	while (count < 20) {
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);

		rt_sem_wait(rMutex);

		printf(" Signal 1 =======> %s", asctime(newtime));

		sleep(1);

		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);

		printf(" Signal 1 after Sleep =======> %s", asctime(newtime));

		timeEx = 3600 * newtime->tm_hour + 60 * newtime->tm_min + newtime->tm_sec;
		if( (timeEx - begin_1) > 8 )
			printf(" Time Failure of the Signal 1\n");
		else printf(" Time Correct of the Signal 1\n");
		begin_1 = timeEx + (8 - (timeEx-begin)%8);
		rt_sem_signal(rMutex);

		rt_task_wait_period();
		count++;
	}

	rt_make_soft_real_time();
	rt_task_delete(Task_1);

	return 0;
                                                                           
}

void *signalNi(void *arg)
{
	RT_TASK *Task_2;

	unsigned long Task_2_name = nam2num("TSK_2") + i++;
	time_t aclock;
	time_t clockNow;
	int timeEx, begin_2;
	struct tm *newtime;
	int count = 0;

	//Task_2 = rt_task_init(Task_2_name, 0, 0, 0);
	
        if(!(Task_2 = rt_task_init_schmod(Task_2_name,1,0,0,SCHED_FIFO,0))) {
		printf("CANNOT INIT HANDLER TASK > Task 2 <\n");
		exit(1);
	}
	rt_allow_nonroot_hrt();

        rt_make_hard_real_time();

	rt_task_make_periodic(Task_2, rt_get_time(), sampling * 18);
	rt_change_prio(Task_2, 1);


	begin_2 = begin;
	while (count < 20) {
		rt_sem_wait(rMutex);
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);
		

		printf(" Signal 2 =======> %s", asctime(newtime));

		sleep(1);

		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);
		
		printf(" Signal 2 after Sleep =======> %s", asctime(newtime));

		timeEx = 3600 * newtime->tm_hour + 60 * newtime->tm_min + newtime->tm_sec;
		if( (timeEx - begin_2) > 9 )
			printf(" Time Failure of the Signal 2\n");
		else printf(" Time Correct of the Signal 2\n");
		begin_2 = timeEx + (9 - (timeEx-begin)%9);

		rt_sem_signal(rMutex);

		rt_task_wait_period();
		count++;
	}

	rt_make_soft_real_time();
	rt_task_delete(Task_2);

	return 0;        
                                                                   
}

void *signalSan(void *arg)
{
	RT_TASK *Task_3;

	unsigned long Task_3_name = nam2num("TSK_3") + i++;
	time_t aclock;
	time_t clockNow;
	int timeEx, begin_3;
	int count = 0;
	struct tm *newtime;

	//Task_3 = rt_task_init(Task_3_name, 0, 0, 0);

        if(!(Task_3 = rt_task_init_schmod(Task_3_name,3,0,0,SCHED_FIFO,0))) {
		printf("CANNOT INIT HANDLER TASK > Task 3 <\n");
		exit(1);
	}
	rt_allow_nonroot_hrt();

        rt_make_hard_real_time();

	rt_task_make_periodic(Task_3, rt_get_time(), sampling * 30);
	rt_change_prio(Task_3, 3);

	begin_3 = begin;
	while (count < 20) {
		rt_sem_wait(rMutex);
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);
		

		printf(" Signal 3 =======> %s", asctime(newtime));

		sleep(1);

		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);

		printf(" Signal 3 after Sleep =======> %s", asctime(newtime));


		timeEx = 3600 * newtime->tm_hour + 60 * newtime->tm_min + newtime->tm_sec;
		if( (timeEx - begin_3) > 15 )
			printf(" Time Failure of the Signal 3\n");
		else printf(" Time Correct of the Signal 3\n");
		begin_3 = timeEx + (15 - (timeEx-begin)%15);

		rt_sem_signal(rMutex);

		rt_task_wait_period();
		count++;
	}

	rt_make_soft_real_time();
	rt_task_delete(Task_3);

	return 0;        

                                                                           
}


int main(void)                                                              
{
	time_t aclock;
	struct tm *newtime;

	i = 0;

	printf("\n\nBeginning the Deadline Monotonic Scheduler\n\n");	

	/* Dados de controle da Thread */
	pthread_t *threadControle_11;
	pthread_t *threadControle_12;
	pthread_t *threadControle_13;
	pthread_t *threadControle_21;
	pthread_t *threadControle_22;
	pthread_t *threadControle_31;
	pthread_t *threadControle_32;
	pthread_t *threadControle_33;
	
	rMutex = rt_sem_init(nam2num("MySEM"), 1);  

	rt_set_periodic_mode();
	
	sampling = start_rt_timer(nano2count(TICK));

	printf("\nInit module function\n");
	
	threadControle_11 = (pthread_t *) malloc(sizeof(pthread_t));
	if (threadControle_11 == NULL) 
	{
		printf("Não foi possivel criar a Thread deste PWM.\n\n");
		return(NULL);
	}
	
	if(pthread_create(threadControle_11, NULL, signalIchi, NULL))
	{
		printf("Não escalonar a Thread deste PWM.\n");
		return(NULL);
	}
	threadControle_12 = (pthread_t *) malloc(sizeof(pthread_t));
	if (threadControle_12 == NULL) 
	{
		printf("Não foi possivel criar a Thread deste PWM.\n\n");
		return(NULL);
	}
	
	if(pthread_create(threadControle_12, NULL, signalIchi, NULL))
	{
		printf("Não escalonar a Thread deste PWM.\n");
		return(NULL);
	}
	threadControle_13 = (pthread_t *) malloc(sizeof(pthread_t));
	if (threadControle_13 == NULL) 
	{
		printf("Não foi possivel criar a Thread deste PWM.\n\n");
		return(NULL);
	}
	
	if(pthread_create(threadControle_13, NULL, signalIchi, NULL))
	{
		printf("Não escalonar a Thread deste PWM.\n");
		return(NULL);
	}

	threadControle_21 = (pthread_t *) malloc(sizeof(pthread_t));
	if (threadControle_21 == NULL) 
	{
		printf("Não foi possivel criar a Thread deste PWM.\n");
		return(NULL);
	}

	if(pthread_create(threadControle_21, NULL, signalNi, NULL))
	{
		printf("Não escalonar a Thread deste PWM.\n\n");
		return(NULL);
	}
	threadControle_22 = (pthread_t *) malloc(sizeof(pthread_t));
	if (threadControle_22 == NULL) 
	{
		printf("Não foi possivel criar a Thread deste PWM.\n");
		return(NULL);
	}

	if(pthread_create(threadControle_22, NULL, signalNi, NULL))
	{
		printf("Não escalonar a Thread deste PWM.\n\n");
		return(NULL);
	}


	threadControle_31 = (pthread_t *) malloc(sizeof(pthread_t));
	if (threadControle_31 == NULL) 
	{
		printf("Não foi possivel criar a Thread deste PWM.\n");
		return(NULL);
	}

	if(pthread_create(threadControle_31, NULL, signalSan, NULL))
	{
		printf("Não escalonar a Thread deste PWM.\n\n");
		return(NULL);
	}
	threadControle_32 = (pthread_t *) malloc(sizeof(pthread_t));
	if (threadControle_32 == NULL) 
	{
		printf("Não foi possivel criar a Thread deste PWM.\n");
		return(NULL);
	}

	if(pthread_create(threadControle_32, NULL, signalSan, NULL))
	{
		printf("Não escalonar a Thread deste PWM.\n\n");
		return(NULL);
	}
	threadControle_33 = (pthread_t *) malloc(sizeof(pthread_t));
	if (threadControle_33 == NULL) 
	{
		printf("Não foi possivel criar a Thread deste PWM.\n");
		return(NULL);
	}

	if(pthread_create(threadControle_33, NULL, signalSan, NULL))
	{
		printf("Não escalonar a Thread deste PWM.\n\n");
		return(NULL);
	}

	time(&aclock); // Pega tempo em segundos.
	newtime = localtime(&aclock);
	printf(" Inicio  =======> %s", asctime(newtime));

	begin = 3600 * newtime->tm_hour + 60 * newtime->tm_min + newtime->tm_sec;
	
	while(!getchar());


	rt_sem_wait(rMutex);
	rt_sem_delete(rMutex);
	
	pthread_cancel((pthread_t) *threadControle_11);
	pthread_cancel((pthread_t) *threadControle_12);
	pthread_cancel((pthread_t) *threadControle_13);
	pthread_cancel((pthread_t) *threadControle_21);
	pthread_cancel((pthread_t) *threadControle_22);
	pthread_cancel((pthread_t) *threadControle_31);
	pthread_cancel((pthread_t) *threadControle_32);
	pthread_cancel((pthread_t) *threadControle_33);

	printf("\nFim do Escalonamento\n");

	
	return 0;
}	
