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

#define TICK_PERIOD 500500000 //Tempo em nano segundos...

#define STACK_SIZE 2000

#define NTASKS 2

char arrayTextoCorIdTask[NTASKS][8] = {"\033[31m", "\033[32m"};//, "\033[34m", "\033[36m"}; // O texto no qual as tarefas serao imprimidas na tela.

RT_TASK *arrayTasks[NTASKS];
pthread_t *arrayThreads[NTASKS];

RTIME tick_period, timeline_sched, delay_timeline_sched;

struct thread_param {
    int idTask;
};

void consumirProcessamento(unsigned int cpu_frequency, double tempo) // Frequencia em Hz e Tempo em segundos...
{
	clock_t start, end;
	double runTime;
	int i, num = 1, primes = 0;
	long cont;
	double qtdLoops;

	switch (cpu_frequency) {
		case 800000:
			qtdLoops = tempo * 300;
		break;

		case 1800000:
			qtdLoops = tempo * 674;
		break;

		default:
			qtdLoops = tempo * 300;
		break;
	}

	start = clock();
	for(cont=0;cont<=qtdLoops;cont++)
	{
		num = 0;
		while (num <= 1000) {
			i = 2;
			while (i <= num) {
				if(num % i == 0)
					break;
				i++;
			}
			if (i == num)
				primes++;
			num++;
		}
	}
	end = clock();
	runTime = (end - start) / (double) CLOCKS_PER_SEC;
	//printf("%s[TASK %d] This machine calculated all %d prime numbers under 1000 in %g seconds\n", arrayTextoCorIdTask[idTask], idTask, primes, runTime);
}

void *init_task(void *arg)
{
	int idTask = ((struct thread_param*) arg)->idTask;
	int contPeriodo = 0;
	RTIME taskDeadline = 0, tick_timer_atual = 0, tick_timer_restante = 0;
	int TEMPO_MINIMO_RESTANTE_PERIODO_4 = 123456789; // SOH EXEMPLO... :-P

	// Variaveis para realizar os calculos de tempo...
	struct tm *newtime;
	time_t aclock;

	RTIME inicioExecucao = 0;
	RTIME terminoExecucao = 0;
	RTIME terminoPeriodo = 0;
	RTIME Tperiodo, Tinicio;
	float tempo_processamento_tarefa;
	float periodo_tarefa;
	int prioridade = idTask + 1;

	double tempoProcessamento = 0.0;
	unsigned int cpu_frequency;

	if(!(arrayTasks[idTask] = rt_task_init_schmod(idTask, prioridade, STACK_SIZE, 0, SCHED_FIFO, CPU_ALLOWED)))
	{
		printf("[ERRO] Não foi possível criar a tarefa 1.\n");
		exit(1);
	}

	rt_allow_nonroot_hrt();

	Tinicio = timeline_sched;

	switch (idTask) {
		case 0:
			Tperiodo = tick_period * 6; // 3 segundos
		break;

		case 1:
			Tperiodo = tick_period * 8; // 4 segundos
		break;

		default:
			printf("[ERRO] A Tarefa %d nao possui periodo definido.\n", idTask);
			exit(1);
		break;
	}

	//rt_change_prio(arrayTasks[idTask], idTask);
	rt_task_make_periodic(arrayTasks[idTask], Tinicio, Tperiodo);

	printf("%s[TASK %d] Criada com Sucesso  =======> %llu\n", arrayTextoCorIdTask[idTask], idTask, Tperiodo);

	while (1)
	{
		contPeriodo = contPeriodo + 1;
		if(contPeriodo >= 4)
		{
			contPeriodo = 1;
		}

		rt_cfg_init_info(arrayTasks[idTask], 100, 800000, 800000, 3003); // Lugar correto...

		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);

		inicioExecucao = rt_get_cpu_time_ns();
		printf("%s[TASK %d] Processando...  0%% => %s", arrayTextoCorIdTask[idTask], idTask, asctime(newtime));
		rt_cfg_set_rwcec(arrayTasks[idTask], 100);

		cpu_frequency = 1800000;
		rt_cfg_set_cpu_frequency(arrayTasks[idTask], cpu_frequency);
		consumirProcessamento(cpu_frequency, tempoProcessamento = 0.25); //CODIGO PARA CONSUMIR PROCESSAMENTO...FREQ EM HZ E TEMPO EM SEGUNDOS...

		printf("%s[TASK %d] Processando... 25%%\n", arrayTextoCorIdTask[idTask], idTask);
		rt_cfg_set_rwcec(arrayTasks[idTask], 75);

		cpu_frequency = 1800000;
		rt_cfg_set_cpu_frequency(arrayTasks[idTask], cpu_frequency);
		consumirProcessamento(cpu_frequency, tempoProcessamento = 0.25); //CODIGO PARA CONSUMIR PROCESSAMENTO...FREQ EM HZ E TEMPO EM SEGUNDOS...

		printf("%s[TASK %d] Processando... 50%%\n", arrayTextoCorIdTask[idTask], idTask);
		rt_cfg_set_rwcec(arrayTasks[idTask], 50);

		cpu_frequency = 1800000;
		rt_cfg_set_cpu_frequency(arrayTasks[idTask], cpu_frequency);
		consumirProcessamento(cpu_frequency, tempoProcessamento = 0.25); //CODIGO PARA CONSUMIR PROCESSAMENTO...FREQ EM HZ E TEMPO EM SEGUNDOS...

		printf("%s[TASK %d] Processando... 75%%\n", arrayTextoCorIdTask[idTask], idTask);
		rt_cfg_set_rwcec(arrayTasks[idTask], 25);

		cpu_frequency = 1800000;
		rt_cfg_set_cpu_frequency(arrayTasks[idTask], cpu_frequency);
		if(contPeriodo == 4)
		{
			taskDeadline = rt_cfg_get_periodic_resume_time(arrayTasks[idTask]) + Tperiodo; //ATENCAO: FAZER FUNCAO PARA RETORNAR O PERIODO...
			tick_timer_atual = rt_time_h;
			if((taskDeadline - tick_timer_atual) >= TEMPO_MINIMO_RESTANTE_PERIODO_4)
			{
				cpu_frequency = 800000; // ECONOMIA DE ENERGIA AQUI...
			}
		}
		consumirProcessamento(cpu_frequency, tempoProcessamento = 0.25); //CODIGO PARA CONSUMIR PROCESSAMENTO...FREQ EM HZ E TEMPO EM SEGUNDOS...

		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);

		terminoExecucao = rt_get_cpu_time_ns();
		tempo_processamento_tarefa = (terminoExecucao - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).
		printf("%s[TASK %d] Processando... 100%% =======> Tempo processamento: %.10f => %s", arrayTextoCorIdTask[idTask], idTask, tempo_processamento_tarefa, asctime(newtime));

		// Sinaliza para o RAW GOVERNOR que a tarefa concluio o seu processamento...
		rt_cfg_set_rwcec(arrayTasks[idTask], 0);

		rt_task_wait_period(); // **** WAIT

		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);

		terminoPeriodo = rt_get_cpu_time_ns();
		periodo_tarefa = (terminoPeriodo - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).
		printf("%s[TASK %d] ##### Duracao do Periodo   ==================================================> Duracao: %.10f => %s", arrayTextoCorIdTask[idTask], idTask, periodo_tarefa, asctime(newtime));
		printf("%s", texto_preto);
	}
}

int create_tasks(void)
{
	int i;
	struct thread_param *arrayThreadParams[NTASKS];

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
	printf("TICK_PERIOD =======> %llu\n", tick_period);

	delay_timeline_sched = tick_period * 10;
	timeline_sched = rt_get_time() + delay_timeline_sched;

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
