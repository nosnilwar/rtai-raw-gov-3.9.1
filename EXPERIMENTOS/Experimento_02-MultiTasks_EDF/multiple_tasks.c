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
#define TICK 500000000 //0.5 seconds

/* Definindo variaveis goblais*/

// Tarefas utilizadas no escalonamento
RT_TASK *Task_1;
RT_TASK *Task_2;
RT_TASK *Task_3;
RT_TASK *Task_4;

RTIME timeline_sched, start_time_sched, delay_start_time_sched;

unsigned long start_time_sched_segundos;

void *init_task_1(void *arg)
{
	// Variaveis para realizar os calculos de tempo...
	struct tm *newtime;
	time_t aclock;

	RTIME inicioExecucao = 0;
	RTIME terminoExecucao = 0;
	RTIME terminoPeriodo = 0;
	double tempo_processamento_tarefa = 0.0;
	double periodo_tarefa = 0.0;

	unsigned long Task_1_name = nam2num("TASK_1");

	//TODO:RAWLINSON
	if(!(Task_1 = rt_task_init_schmod(Task_1_name,1,0,0,SCHED_FIFO, CPU_ALLOWED))) {
		printf("[ERRO] Não foi possível criar a tarefa 1.\n");
		exit(1);
	}

	rt_allow_nonroot_hrt();

	rt_make_hard_real_time();

	rt_task_make_periodic(Task_1, rt_get_time() + start_time_sched * 5, start_time_sched * 10);
	rt_change_prio(Task_1, 1);

	while (1) {
		inicioExecucao = rt_get_cpu_time_ns();
		printf("%s[TASK 1 - Iniciando]      =======> %llu\n", texto_verde, inicioExecucao);

		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);
		printf("%s[TASK 1 - Processando...] =======> %s", texto_verde, asctime(newtime));
		rt_sleep(100*TICK);

		terminoExecucao = rt_get_cpu_time_ns();

		tempo_processamento_tarefa = (terminoExecucao - inicioExecucao) / 1000000000; // Transformando de nanosegundo para segundo (10^9).
		printf("%s[TASK 1 - Finalizada]     =======> %llu -> Tempo processamento: %.10f\n", texto_verde, terminoExecucao, tempo_processamento_tarefa);

		rt_task_wait_period();

		terminoPeriodo = rt_get_cpu_time_ns();
		periodo_tarefa = (terminoPeriodo - inicioExecucao) / 1000000000; // Transformando de nanosegundo para segundo (10^9).
		printf("%s[TASK 1 - Fim Periodo]    =======> %llu -> Duracao: %.10f\n", texto_verde, terminoPeriodo, periodo_tarefa);
		printf("%s", texto_preto);
	}

}

void *init_task_2(void *arg)
{
	// Variaveis para realizar os calculos de tempo...
	struct tm *newtime;
	time_t aclock;

	unsigned long Task_2_name = nam2num("TASK_2");

	if(!(Task_2 = rt_task_init_schmod(Task_2_name,1,0,0,SCHED_FIFO, CPU_ALLOWED))) {
		printf("[ERRO] Não foi possível criar a tarefa 2.\n");
		exit(1);
	}

	rt_allow_nonroot_hrt();

	rt_make_hard_real_time();

	rt_task_make_periodic(Task_2, rt_get_time() + start_time_sched, start_time_sched * 15);
	rt_change_prio(Task_2, 2);

	while (1) {
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);

		printf("%s[TASK 2] =======> %s", texto_azul, asctime(newtime));
		rt_task_wait_period();
	}
}

void *init_task_3(void *arg)
{
	// Variaveis para realizar os calculos de tempo...
	struct tm *newtime;
	time_t aclock;

	unsigned long Task_3_name = nam2num("TASK_3");

	if(!(Task_3 = rt_task_init_schmod(Task_3_name,1,0,0,SCHED_FIFO, CPU_ALLOWED))) {
		printf("[ERRO] Não foi possível criar a tarefa 3.\n");
		exit(1);
	}

	rt_allow_nonroot_hrt();

	rt_make_hard_real_time();

	rt_task_make_periodic(Task_3, rt_get_time() + start_time_sched * 11, start_time_sched * 20);
	rt_change_prio(Task_3, 3);

	while (1) {
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);

		printf("%s[TASK 3] =======> %s", texto_ciano, asctime(newtime));
		rt_task_wait_period();
	}

}

void *init_task_4(void *arg)
{
	// Variaveis para realizar os calculos de tempo...
	struct tm *newtime;
	time_t aclock;

	unsigned long Task_4_name = nam2num("TASK_4");

	if(!(Task_4 = rt_task_init_schmod(Task_4_name,1,0,0,SCHED_FIFO, CPU_ALLOWED))) {
		printf("[ERRO] Não foi possível criar a tarefa 1.\n");
		exit(1);
	}

	rt_allow_nonroot_hrt();

	rt_make_hard_real_time();

	rt_task_make_periodic(Task_4, rt_get_time() + start_time_sched * 16, start_time_sched * 25);
	rt_change_prio(Task_4, 4);

	while (1) {
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);

		printf("%s[TASK 4] =======> %s", texto_preto, asctime(newtime));
		rt_task_wait_period();
	}
}

int create_tasks(void)
{
	// Variaveis para realizar os calculos de tempo...
	struct tm *newtime;
	time_t aclock;

	RTIME rt_time_now;

	/* Dados de controle da Thread */
	pthread_t *threadControle_Task_1;
	pthread_t *threadControle_Task_3;
	pthread_t *threadControle_Task_2;
	pthread_t *threadControle_Task_4;

	rt_set_periodic_mode();

	rt_hard_timer_tick_cpuid(CPU_ALLOWED);

	rt_time_now = start_rt_timer(nano2count(TICK));
	delay_start_time_sched = rt_time_now * 16;
	start_time_sched = rt_time_now + delay_start_time_sched;

	printf("************** Iniciando escalonamento **************\n");

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

	time(&aclock); // Pega tempo em segundos.
	newtime = localtime(&aclock);
	start_time_sched_segundos = 3600 * newtime->tm_hour + 60 * newtime->tm_min + newtime->tm_sec;

	printf("#Tempo atual        =======> %s", asctime(newtime));
	printf("#Tempo em segundos  =======> %lu s \n\n", start_time_sched_segundos);

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

	printf("\nFim do Escalonamento %s\n", texto_preto);
}

int main(void) {
	printf("\n\nIniciando o escalonamento das tarefas...\n\n");

	create_tasks();

	delete_tasks();

	return 0 ;
}
