/**************************************************************
* UNIVERSIDADE FEDERAL DO AMAZONAS                            *
* ENGENHARIA DA COMPUTACAO                                    *
* MESTRADO - ICOMP                                            *
*                                                             *
* Mestrando: Rawlinson da Silva Goncalves                     *
* E-mail   : rawlinson.goncalves@gmail.com                    *
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
#define TICK_PERIOD 50000000 //Tempo em nano segundos... a cada 0.05 segundos tem o tick

#define STACK_SIZE 2000

#define NTASKS 1

char arrayTextoCorIdTask[NTASKS][8] = {"\033[31m"};//, "\033[32m"};//, "\033[34m", "\033[36m"}; // O texto no qual as tarefas serao imprimidas na tela.

RT_TASK *arrayTasks[NTASKS];
pthread_t *arrayThreads[NTASKS];

RTIME tick_period;
RTIME timeline_sched;
RTIME delay_timeline_sched;

struct thread_param {
    int idTask;
};

/**************************************************
 * INICIO: DEFINICOES DO C-BENCHMARK -> CNT
 **************************************************/
#define MAXSIZE 7000
typedef int matrixCnt [MAXSIZE][MAXSIZE];

// Globals
matrixCnt Array;
int SeedCnt;
long int Postotal, Negtotal, Poscnt, Negcnt;

// Generates random integers between 0 and 8095
int RandomIntegerCnt(void)
{
   SeedCnt = ((SeedCnt * 133) + 81) % 8095;
   return SeedCnt;
}

// Intializes the given array with random integers.
int InitializeCnt(matrixCnt Array)
{
   register int OuterIndex, InnerIndex;

   for (OuterIndex = 0; OuterIndex < MAXSIZE; OuterIndex++) //100 + 1
      for (InnerIndex = 0; InnerIndex < MAXSIZE; InnerIndex++) //100 + 1
         Array[OuterIndex][InnerIndex] = RandomIntegerCnt();

   return 0;
}

void SumCnt(matrixCnt Array)
{
  register int Outer, Inner;

  int Ptotal = 0; /* changed these to locals in order to drive worst case */
  int Ntotal = 0;
  int Pcnt = 0;
  int Ncnt = 0;

  for (Outer = 0; Outer < MAXSIZE; Outer++) //Maxsize = 100
	 for (Inner = 0; Inner < MAXSIZE; Inner++)
#ifdef WORSTCASE
    	if (Array[Outer][Inner] >= 0) {
#else
    	if (Array[Outer][Inner] < 0) {
#endif
	  Ptotal += Array[Outer][Inner];
	  Pcnt++;
	}
	else {
	  Ntotal += Array[Outer][Inner];
	  Ncnt++;
	}

  Postotal = Ptotal;
  Poscnt = Pcnt;
  Negtotal = Ntotal;
  Negcnt = Ncnt;
}

int TestCnt(matrixCnt Array)
{
	InitializeCnt(Array);
	SumCnt(Array);

	return 0;
}

// Initializes the seed used in the random number generator.
int InitSeedCnt(void)
{
	SeedCnt = 0;
	return 0;
}

void *init_task_cnt(void *arg)
{
	int idTask = ((struct thread_param*) arg)->idTask;
	//RTIME taskDeadline = 0;
	//RTIME tick_timer_atual = 0;
	//RTIME tick_timer_restante = 0;

	// Variaveis para realizar os calculos de tempo...
	struct tm *newtime;
	time_t aclock;

	RTIME inicioExecucao = 0;
	RTIME terminoExecucao = 0;
	RTIME terminoPeriodo = 0;
	RTIME Tperiodo;
	RTIME Tinicio;
	float tempo_processamento_tarefa;
	float periodo_tarefa;
	int prioridade = idTask + 1;

	//double tempoProcessamento = 0.0;
	long int WCEC = 1764504180; // cycles
	unsigned int cpuFrequencyInicial = 1800000; // Hz
	unsigned int cpuVoltageInicial = 5; // V

	if(!(arrayTasks[idTask] = rt_task_init_schmod(idTask, prioridade, STACK_SIZE, 0, SCHED_FIFO, CPU_ALLOWED)))
	{
		printf("[ERRO] Não foi possível criar a tarefa CNT (C-Benchmark).\n");
		exit(1);
	}

	rt_allow_nonroot_hrt();

	Tinicio = timeline_sched;
	Tperiodo = tick_period * 241; // ~= 12 segundos (PERIODO == DEADLINE)

	rt_change_prio(arrayTasks[idTask], prioridade);
	rt_task_make_periodic(arrayTasks[idTask], Tinicio, Tperiodo);

	printf("%s[TASK %d] Criada com Sucesso  =======> %llu\n", arrayTextoCorIdTask[idTask], idTask, Tperiodo);

	while (1)
	{
		inicioExecucao = rt_get_cpu_time_ns(); //** PEGA O TEMPO DE INICIO DA EXECUCAO.

		rt_cfg_init_info(arrayTasks[idTask], WCEC, cpuFrequencyInicial, cpuVoltageInicial); // Lugar correto...

		/** INICIO: PROCESSANDO A TAREFA... **/
		InitSeedCnt();
		TestCnt(Array);
		/** FIM: PROCESSANDO A TAREFA... **/

		/** CALCULANDO TEMPO DE PROCESSAMENTO DA TAREFA... **/
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);
		terminoExecucao = rt_get_cpu_time_ns(); //** PEGA O TEMPO DE FIM DA EXECUCAO.
		tempo_processamento_tarefa = (terminoExecucao - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).

		printf("%s[TASK %d] ##### Tempo processamento: %.10f => %s", arrayTextoCorIdTask[idTask], idTask, tempo_processamento_tarefa, asctime(newtime));

		// Sinaliza para o RAW GOVERNOR que a tarefa concluio o seu processamento...
		rt_cfg_set_rwcec(arrayTasks[idTask], 0);

		rt_task_wait_period(); // **** WAIT

		/** CALCULANDO TEMPO DE DURACAO DO PERIODO DA TAREFA... **/
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);
		terminoPeriodo = rt_get_cpu_time_ns();
		periodo_tarefa = (terminoPeriodo - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).

		printf("%s[TASK %d] ##### Duracao do Periodo   ==================================================> Duracao: %.10f => %s", arrayTextoCorIdTask[idTask], idTask, periodo_tarefa, asctime(newtime));
		printf("%s", texto_preto);
	}
}
/**************************************************
 * FIM: DEFINICOES DO C-BENCHMARK -> CNT
 **************************************************/

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

	/*********************************************************
	* Iniciando C-Benchmark -> CNT
	**********************************************************/
	if((arrayThreadParams[0] = malloc(sizeof(*arrayThreadParams[0]))) == NULL)
	{
		printf("[ERRO] Não foi possivel criar os parametros da tarefa CNT (C-Benchmark).\n\n");
		return (-1);
	}
	else
	{
		arrayThreadParams[0]->idTask = 0;

		// Inicializando as tarefas...
		if(pthread_create(arrayThreads[0], 0, init_task_cnt, (void *)arrayThreadParams[0]))
		{
			printf("[ERRO] Não foi possível inicializar a Thread da tarefa CNT (C-Benchmark).\n");
			return(0);
		}
	}

	/*********************************************************
	* Iniciando C-Benchmark -> MatMult
	**********************************************************/
//	if((arrayThreadParams[1] = malloc(sizeof(*arrayThreadParams[1]))) == NULL)
//	{
//		printf("[ERRO] Não foi possivel criar os parametros da tarefa MatMult (C-Benchmark).\n\n");
//		return (-1);
//	}
//	else
//	{
//		arrayThreadParams[1]->idTask = 1;
//
//		// Inicializando as tarefas...
//		if(pthread_create(arrayThreads[1], 0, init_task_matmult, (void *)arrayThreadParams[1]))
//		{
//			printf("[ERRO] Não foi possível inicializar a Thread da tarefa MatMult (C-Benchmark).\n");
//			return(0);
//		}
//	}

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
