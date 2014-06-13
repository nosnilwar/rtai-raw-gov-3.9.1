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

#include <signal.h>
#include <rtai_sem.h>
#include <rtai_mbx.h>


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
#define CPU_ALLOWED 0x1 // Processador 2

/* Definindo variaveis goblais*/
#define TICK_PERIOD 20000000 //Tempo em nano segundos... a cada 0.02 segundos tem o tick

int idTaskCnt = 0;
int idTaskMatMult = 1;
int idTaskBsort = 2;
int flagFimExecucao = 0;

#define NTASKS 1

char arrayTextoCorIdTask[NTASKS][8] = {"\033[31m"};//, "\033[32m", "\033[34m"};//, "\033[36m"}; // O texto no qual as tarefas serao imprimidas na tela.

static RT_TASK *arrayTasks[NTASKS];
static pthread_t arrayThreads[NTASKS];

RTIME tick_period;
RTIME start_timeline;
RTIME delay_start_timeline;

///**************************************************
// * INICIO: DEFINICOES DO C-BENCHMARK -> CNT
// **************************************************/
////#define WORSTCASE_CNT 1
//#define MAXSIZE 7000
//typedef int matrixCnt [MAXSIZE][MAXSIZE];
//
//// Globals
//matrixCnt Array;
//int SeedCnt;
//long int Postotal, Negtotal, Poscnt, Negcnt;
//
//// Generates random integers between 0 and 8095
//int RandomIntegerCnt(void)
//{
//   SeedCnt = ((SeedCnt * 133) + 81) % 8095;
//   return SeedCnt;
//}
//
//// Intializes the given array with random integers.
//int InitializeCnt(matrixCnt Array)
//{
//   register int OuterIndex, InnerIndex;
//
//   for (OuterIndex = 0; OuterIndex < MAXSIZE; OuterIndex++) //100 + 1
//      for (InnerIndex = 0; InnerIndex < MAXSIZE; InnerIndex++) //100 + 1
//         Array[OuterIndex][InnerIndex] = RandomIntegerCnt();
//
//   return 0;
//}
//
//void SumCnt(matrixCnt Array)
//{
//  register int Outer, Inner;
//
//  int Ptotal = 0; /* changed these to locals in order to drive worst case */
//  int Ntotal = 0;
//  int Pcnt = 0;
//  int Ncnt = 0;
//  int porcentagemProcessamento = 0;
//  int porcentagemProcessamentoAnterior = -1;
//
//  for (Outer = 0; Outer < MAXSIZE; Outer++) { //Maxsize = 100
//	 for (Inner = 0; Inner < MAXSIZE; Inner++) {
//#ifdef WORSTCASE_CNT
//    	if (Array[Outer][Inner] >= 0) {
//#else
//    	if (Array[Outer][Inner] < 0) {
//#endif
//		  Ptotal += Array[Outer][Inner];
//		  Pcnt++;
//		}
//		else {
//		  Ntotal += Array[Outer][Inner];
//		  Ncnt++;
//		}
//     }
//
//	porcentagemProcessamento = (int) ((Outer*MAXSIZE + Inner)*100)/(MAXSIZE*MAXSIZE);
//	if(porcentagemProcessamento % 10 == 0 && porcentagemProcessamento != porcentagemProcessamentoAnterior)
//	{
//		printf("%s[TASK %d] Processando... %d%%\n", arrayTextoCorIdTask[idTaskCnt], idTaskCnt, porcentagemProcessamento);
//		porcentagemProcessamentoAnterior = porcentagemProcessamento;
//
//		rt_cfg_set_rwcec(arrayTasks[idTaskCnt], (100 - porcentagemProcessamento));
//	}
//  }
//
//  Postotal = Ptotal;
//  Poscnt = Pcnt;
//  Negtotal = Ntotal;
//  Negcnt = Ncnt;
//}
//
//int TestCnt(matrixCnt Array)
//{
//	InitializeCnt(Array);
//	SumCnt(Array);
//
//	return 0;
//}
//
//// Initializes the seed used in the random number generator.
//int InitSeedCnt(void)
//{
//	SeedCnt = 0;
//	return 0;
//}
//
//static void *init_task_cnt(void *arg)
//{
//	// Variaveis para realizar os calculos de tempo...
//	struct tm *newtime;
//	time_t aclock;
//
//	RTIME inicioExecucao = 0;
//	RTIME terminoExecucao = 0;
//	RTIME terminoPeriodo = 0;
//	RTIME Tperiodo;
//	RTIME Tinicio;
//	float tempo_processamento_tarefa;
//	float periodo_tarefa;
//	int prioridade = idTaskCnt + 1;
//
//	//double tempoProcessamento = 0.0;
//	long int WCEC = 1764504180; // cycles
//	unsigned int cpuFrequencyInicial = 1800000; // Hz
//	unsigned int cpuVoltageInicial = 5; // V
//
//	if(!(arrayTasks[idTaskCnt] = rt_thread_init(nam2num("TSKCNT"), prioridade, 0, SCHED_FIFO, CPU_ALLOWED)))
//	{
//		printf("[ERRO] Não foi possível criar a tarefa CNT (C-Benchmark).\n");
//		exit(1);
//	}
//
//	rt_make_hard_real_time();
//	Tinicio = start_timeline;
//	Tperiodo = tick_period * 501; // ~= 10 segundos (PERIODO == DEADLINE)
//
//	rt_task_make_periodic(arrayTasks[idTaskCnt], Tinicio, Tperiodo);
//
//	printf("%s[TASK %d] Criada com Sucesso  =======> %llu\n", arrayTextoCorIdTask[idTaskCnt], idTaskCnt, Tperiodo);
//
//	while (1)
//	{
//		inicioExecucao = rt_get_cpu_time_ns(); //** PEGA O TEMPO DE INICIO DA EXECUCAO.
//
//		rt_cfg_init_info(arrayTasks[idTaskCnt], WCEC, cpuFrequencyInicial, cpuVoltageInicial); // Lugar correto...
//
//		/** INICIO: PROCESSANDO A TAREFA... **/
//		InitSeedCnt();
//		TestCnt(Array);
//		/** FIM: PROCESSANDO A TAREFA... **/
//
//		/** CALCULANDO TEMPO DE PROCESSAMENTO DA TAREFA... **/
//		time(&aclock); // Pega tempo em segundos.
//		newtime = localtime(&aclock);
//		terminoExecucao = rt_get_cpu_time_ns(); //** PEGA O TEMPO DE FIM DA EXECUCAO.
//		tempo_processamento_tarefa = (terminoExecucao - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).
//
//		printf("%s[TASK %d] ##### Tempo processamento: %.10f => %s", arrayTextoCorIdTask[idTaskCnt], idTaskCnt, tempo_processamento_tarefa, asctime(newtime));
//
//		// Sinaliza para o RAW GOVERNOR que a tarefa concluio o seu processamento...
//		rt_cfg_set_rwcec(arrayTasks[idTaskCnt], 0);
//
//		rt_task_wait_period(); // **** WAIT
//
//		/** CALCULANDO TEMPO DE DURACAO DO PERIODO DA TAREFA... **/
//		time(&aclock); // Pega tempo em segundos.
//		newtime = localtime(&aclock);
//		terminoPeriodo = rt_get_cpu_time_ns();
//		periodo_tarefa = (terminoPeriodo - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).
//
//		printf("%s[TASK %d] ##### Duracao do Periodo   ==================================================> Duracao: %.10f => %s", arrayTextoCorIdTask[idTaskCnt], idTaskCnt, periodo_tarefa, asctime(newtime));
//		printf("%s", texto_preto);
//	}
//
//	return 0;
//}
///**************************************************
// * FIM: DEFINICOES DO C-BENCHMARK -> CNT
// **************************************************/
//
////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//
///**************************************************
// * INICIO: DEFINICOES DO C-BENCHMARK -> MatMult
// *
// * MATRIX MULTIPLICATION BENCHMARK PROGRAM:
// * This program multiplies 2 square matrices resulting in a 3rd
// * matrix. It tests a compiler's speed in handling multidimensional
// * arrays and simple arithmetic.
// **************************************************/
//#define UPPERLIMIT 770 // OBS.: chegou a 830 sem nenhum problema. ;)
//typedef int matrixMatMult [UPPERLIMIT][UPPERLIMIT];
//int SeedMatMult;
//matrixMatMult ArrayA, ArrayB, ResultArray;
//
//// Generates random integers between 0 and 8095
//int RandomIntegerMatMult(void)
//{
//   SeedMatMult = ((SeedMatMult * 133) + 81) % 8095;
//   return (SeedMatMult);
//}
//
//// Intializes the given array with random integers.
//void InitializeMatMult(matrixMatMult Array)
//{
//   int OuterIndex, InnerIndex;
////   printf("Valores da Matriz: \n\n");
//   for (OuterIndex = 0; OuterIndex < UPPERLIMIT; OuterIndex++)
//      for (InnerIndex = 0; InnerIndex < UPPERLIMIT; InnerIndex++)
//      {
//         Array[OuterIndex][InnerIndex] = RandomIntegerMatMult();
////         printf("(%d)", Array[OuterIndex][InnerIndex]);
//      }
//}
//
//// Multiplies arrays A and B and stores the result in ResultArray.
//void MultiplyMatMult(matrixMatMult A, matrixMatMult B, matrixMatMult Res)
//{
//   int porcentagemProcessamento = 0;
//   int porcentagemProcessamentoAnterior = -1;
//
//   register int Outer, Inner, Index;
//   for (Outer = 0; Outer < UPPERLIMIT; Outer++)
//   {
//      for (Inner = 0; Inner < UPPERLIMIT; Inner++)
//      {
//         Res [Outer][Inner] = 0;
//         for (Index = 0; Index < UPPERLIMIT; Index++)
//            Res[Outer][Inner] += A[Outer][Index] * B[Index][Inner];
//       }
//
//		porcentagemProcessamento = (int) ((Outer*UPPERLIMIT*UPPERLIMIT + Inner*UPPERLIMIT + Index)*100)/(UPPERLIMIT*UPPERLIMIT*UPPERLIMIT);
//		if(porcentagemProcessamento % 10 == 0 && porcentagemProcessamento != porcentagemProcessamentoAnterior)
//		{
//			printf("%s[TASK %d] Processando... %d%%\n", arrayTextoCorIdTask[idTaskMatMult], idTaskMatMult, porcentagemProcessamento);
//			porcentagemProcessamentoAnterior = porcentagemProcessamento;
//
//			rt_cfg_set_rwcec(arrayTasks[idTaskMatMult], (100 - porcentagemProcessamento));
//		}
//   }
//}
//
///*
// * Runs a multiplication test on an array.  Calculates and prints the
// * time it takes to multiply the matrices.
// */
//void TestMatMult(matrixMatMult A, matrixMatMult B, matrixMatMult Res)
//{
//   InitializeMatMult(A);
//   InitializeMatMult(B);
//
//   MultiplyMatMult(A, B, Res);
//}
//
//// Initializes the seed used in the random number generator.
//void InitSeedMatMult(void)
//{
//  /* ***UPPSALA WCET***:
//     changed Thomas Ls code to something simpler.
//   SeedMatMult = KNOWN_VALUE - 1; */
//   SeedMatMult = 1;
//}
//
//static void *init_task_matmult(void *arg)
//{
//	// Variaveis para realizar os calculos de tempo...
//	struct tm *newtime;
//	time_t aclock;
//
//	RTIME inicioExecucao = 0;
//	RTIME terminoExecucao = 0;
//	RTIME terminoPeriodo = 0;
//	RTIME Tperiodo;
//	RTIME Tinicio;
//	float tempo_processamento_tarefa;
//	float periodo_tarefa;
//	int prioridade = idTaskMatMult + 1;
//
//	//double tempoProcessamento = 0.0;
//	long int WCEC = 9071928490; // cycles
//	unsigned int cpuFrequencyInicial = 1800000; // Hz
//	unsigned int cpuVoltageInicial = 5; // V
//
//	if(!(arrayTasks[idTaskMatMult] = rt_thread_init(nam2num("TSKMAT"), prioridade, 0, SCHED_FIFO, CPU_ALLOWED)))
//	{
//		printf("[ERRO] Não foi possível criar a tarefa MatMult (C-Benchmark).\n");
//		exit(1);
//	}
//
//	rt_make_hard_real_time();
//	Tinicio = start_timeline;
//	Tperiodo = tick_period * 401; // ~= 8 segundos (PERIODO == DEADLINE)
//
//	rt_task_make_periodic(arrayTasks[idTaskMatMult], Tinicio, Tperiodo);
//
//	printf("%s[TASK %d] Criada com Sucesso  =======> %llu\n", arrayTextoCorIdTask[idTaskMatMult], idTaskMatMult, Tperiodo);
//
//	while (1)
//	{
//		inicioExecucao = rt_get_cpu_time_ns(); //** PEGA O TEMPO DE INICIO DA EXECUCAO.
//
//		rt_cfg_init_info(arrayTasks[idTaskMatMult], WCEC, cpuFrequencyInicial, cpuVoltageInicial); // Lugar correto...
//
//		/** INICIO: PROCESSANDO A TAREFA... **/
//		InitSeedMatMult();
//		TestMatMult(ArrayA, ArrayB, ResultArray);
//		/** FIM: PROCESSANDO A TAREFA... **/
//
//		/** CALCULANDO TEMPO DE PROCESSAMENTO DA TAREFA... **/
//		time(&aclock); // Pega tempo em segundos.
//		newtime = localtime(&aclock);
//		terminoExecucao = rt_get_cpu_time_ns(); //** PEGA O TEMPO DE FIM DA EXECUCAO.
//		tempo_processamento_tarefa = (terminoExecucao - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).
//
//		printf("%s[TASK %d] ##### Tempo processamento: %.10f => %s", arrayTextoCorIdTask[idTaskMatMult], idTaskMatMult, tempo_processamento_tarefa, asctime(newtime));
//
//		// Sinaliza para o RAW GOVERNOR que a tarefa concluio o seu processamento...
//		rt_cfg_set_rwcec(arrayTasks[idTaskMatMult], 0);
//
//		rt_task_wait_period(); // **** WAIT
//
//		/** CALCULANDO TEMPO DE DURACAO DO PERIODO DA TAREFA... **/
//		time(&aclock); // Pega tempo em segundos.
//		newtime = localtime(&aclock);
//		terminoPeriodo = rt_get_cpu_time_ns();
//		periodo_tarefa = (terminoPeriodo - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).
//
//		printf("%s[TASK %d] ##### Duracao do Periodo   ==================================================> Duracao: %.10f => %s", arrayTextoCorIdTask[idTaskMatMult], idTaskMatMult, periodo_tarefa, asctime(newtime));
//		printf("%s", texto_preto);
//	}
//
//	return 0;
//}
///**************************************************
// * FIM: DEFINICOES DO C-BENCHMARK -> MatMult
// **************************************************/
//
////$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
//
///**************************************************
// * INICIO: DEFINICOES DO C-BENCHMARK -> Bsort
// **************************************************/
//
//#define KNOWN_VALUE (int) 2 /* A read from this address will result in an known value of 1 */
//#define UNKNOWN_VALUE (int) 2 /* A read from this address will result in an unknown value */
//#define WORSTCASE 1
//#define FALSE 0
//#define TRUE 1
//#define NUMELEMS 10000
//#define MAXDIM   (NUMELEMS+1)
//
//// Globals
//int ArrayBsort[MAXDIM], Seed;
//int factor;
//
//// Initializes given array with randomly generated integers.
//void InitializeBsort(int Array[MAXDIM])
//{
//	int  Index, fact;
//
//#ifdef WORSTCASE
//	factor = -1;
//#else
//	factor = 1;
//#endif
//
//	fact = factor;
//	for (Index = 1; Index <= NUMELEMS; Index ++)
//		Array[Index] = Index * fact * KNOWN_VALUE;
//}
//
//// Sorts an array of integers of size NUMELEMS in ascending order.
//void BubbleSort(int Array[MAXDIM])
//{
//   int Sorted = FALSE;
//   int Temp, /** LastIndex,**/ Index, i;
//
//   int porcentagemProcessamento = 0;
//   int porcentagemProcessamentoAnterior = -1;
//
//   for (i = 1; i <= NUMELEMS-1; i++) /* apsim_loop 1 0 */
//   {
//      Sorted = TRUE;
//      for (Index = 1; Index <= NUMELEMS-1; Index ++) /* apsim_loop 10 1 */
//	  {
//         if (Index > NUMELEMS-i)
//            break;
//
//         if (Array[Index] > Array[Index + 1])
//         {
//            Temp = Array[Index];
//            Array[Index] = Array[Index+1];
//            Array[Index+1] = Temp;
//            Sorted = FALSE;
//         }
//      }
//
//	  porcentagemProcessamento = (int) ((i*NUMELEMS + Index)*100)/(NUMELEMS*NUMELEMS);
//	  if(porcentagemProcessamento % 10 == 0 && porcentagemProcessamento != porcentagemProcessamentoAnterior)
//	  {
//	  	printf("%s[TASK %d] Processando... %d%%\n", arrayTextoCorIdTask[idTaskBsort], idTaskBsort, porcentagemProcessamento);
//	  	porcentagemProcessamentoAnterior = porcentagemProcessamento;
//
//	  	rt_cfg_set_rwcec(arrayTasks[idTaskBsort], (100 - porcentagemProcessamento));
//	  }
//
//      if (Sorted)
//         break;
//   }
//   printf("%s[TASK %d] Processando... 100%%\n", arrayTextoCorIdTask[idTaskBsort], idTaskBsort);
//}
//
//static void *init_task_bsort(void *arg)
//{
//	// Variaveis para realizar os calculos de tempo...
//	struct tm *newtime;
//	time_t aclock;
//
//	RTIME inicioExecucao = 0;
//	RTIME terminoExecucao = 0;
//	RTIME terminoPeriodo = 0;
//	RTIME Tperiodo;
//	RTIME Tinicio;
//	float tempo_processamento_tarefa;
//	float periodo_tarefa;
//	int prioridade = idTaskBsort + 1;
//
//	//double tempoProcessamento = 0.0;
//	long int WCEC = 6500290074; // cycles
//	unsigned int cpuFrequencyInicial = 1800000; // Hz
//	unsigned int cpuVoltageInicial = 5; // V
//
//	if(!(arrayTasks[idTaskBsort] = rt_thread_init(nam2num("TSKBSO"), prioridade, 0, SCHED_FIFO, CPU_ALLOWED)))
//	{
//		printf("[ERRO] Não foi possível criar a tarefa Bsort (C-Benchmark).\n");
//		exit(1);
//	}
//
//	rt_make_hard_real_time();
//	Tinicio = start_timeline;
//	Tperiodo = tick_period * 501; // ~= 10 segundos (PERIODO == DEADLINE)
//
//	rt_task_make_periodic(arrayTasks[idTaskBsort], Tinicio, Tperiodo);
//
//	printf("%s[TASK %d] Criada com Sucesso  =======> %llu\n", arrayTextoCorIdTask[idTaskBsort], idTaskBsort, Tperiodo);
//
//	while(!flagFimExecucao)
//	{
//		inicioExecucao = rt_get_cpu_time_ns(); //** PEGA O TEMPO DE INICIO DA EXECUCAO.
//
//		rt_cfg_init_info(arrayTasks[idTaskBsort], WCEC, cpuFrequencyInicial, cpuVoltageInicial); // Lugar correto...
//
//		/** INICIO: PROCESSANDO A TAREFA... **/
//		InitializeBsort(ArrayBsort);
//	    BubbleSort(ArrayBsort);
//		/** FIM: PROCESSANDO A TAREFA... **/
//
//		/** CALCULANDO TEMPO DE PROCESSAMENTO DA TAREFA... **/
//		time(&aclock); // Pega tempo em segundos.
//		newtime = localtime(&aclock);
//		terminoExecucao = rt_get_cpu_time_ns(); //** PEGA O TEMPO DE FIM DA EXECUCAO.
//		tempo_processamento_tarefa = (terminoExecucao - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).
//
//		printf("%s[TASK %d] ##### Tempo processamento: %.10f => %s", arrayTextoCorIdTask[idTaskBsort], idTaskBsort, tempo_processamento_tarefa, asctime(newtime));
//
//		// Sinaliza para o RAW GOVERNOR que a tarefa concluio o seu processamento...
//		rt_cfg_set_rwcec(arrayTasks[idTaskBsort], 0);
//
//		rt_task_wait_period(); // **** WAIT
//
//		/** CALCULANDO TEMPO DE DURACAO DO PERIODO DA TAREFA... **/
//		time(&aclock); // Pega tempo em segundos.
//		newtime = localtime(&aclock);
//		terminoPeriodo = rt_get_cpu_time_ns();
//		periodo_tarefa = (terminoPeriodo - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).
//
//		printf("%s[TASK %d] ##### Duracao do Periodo   ==================================================> Duracao: %.10f => %s", arrayTextoCorIdTask[idTaskBsort], idTaskBsort, periodo_tarefa, asctime(newtime));
//		printf("%s", texto_preto);
//	}
//
//	return 0;
//}
///**************************************************
// * FIM: DEFINICOES DO C-BENCHMARK -> Bsort
// **************************************************/

static RT_TASK *Slow_Task;
static SEM *barrier;
static volatile int end, slowjit, fastjit;
static void endme (int dummy) { end = 1; }
#define SLOWMUL  24
static volatile	RTIME start;
#define USEDFRAC 25  // in %
static MBX *mbx;

#if defined(CONFIG_UCLINUX) || defined(CONFIG_ARM) || defined(CONFIG_COLDFIRE)
#define TICK_TIME 1000000
#else
#define TICK_TIME 100000
#endif

static void *slow_fun(void *arg)
{
	int jit, period;
	RTIME expected;

	if (!(Slow_Task = rt_thread_init(nam2num("SLWTSK"), 3, 0, SCHED_FIFO, CPU_ALLOWED))) {
		printf("CANNOT INIT SLOW TASK\n");
		exit(1);
	}

	mlockall(MCL_CURRENT | MCL_FUTURE);
	rt_make_hard_real_time();
	rt_sem_wait_barrier(barrier);
	period = nano2count(SLOWMUL*TICK_TIME);
	expected = start + 9*nano2count(TICK_TIME);
	rt_task_make_periodic(Slow_Task, expected, period);
	while (!end) {
		jit = abs(count2nano(rt_get_time() - expected));
		if (jit > slowjit) {
			slowjit = jit;
		}
		printf("[TASK slow_fun] Processando...\n");
		rt_busy_sleep((SLOWMUL*TICK_TIME*USEDFRAC)/100);
		expected += period;
		rt_task_wait_period();
		printf("[TASK slow_fun] =========================> Fim periodo!\n");
	}
	rt_sem_wait_barrier(barrier);
	rt_make_soft_real_time();
	rt_thread_delete(Slow_Task);
	return 0;
}

int create_tasks(void)
{
	int prioridadeMainTask = 0;
	RT_TASK *Main_Task;

	signal(SIGHUP,  endme);
	signal(SIGINT,  endme);
	signal(SIGKILL, endme);
	signal(SIGTERM, endme);
	signal(SIGALRM, endme);

	if (!(Main_Task = rt_thread_init(nam2num("MAIN_TSK"), prioridadeMainTask, 0, SCHED_FIFO, CPU_ALLOWED))) {
		printf("CANNOT INIT MAIN TASK\n");
		exit(1);
	}

	if (!(mbx = rt_mbx_init(nam2num("MBX"), 1000))) {
		printf("ERROR OPENING MBX\n");
		exit(1);
	}

	start_rt_timer(0);
	barrier = rt_sem_init(nam2num("PREMSM"), 4);
	//TODO: rt_hard_timer_tick_cpuid(CPU_ALLOWED);

	arrayThreads[idTaskCnt] = rt_thread_create(slow_fun, NULL, 0);
//	arrayThreads[idTaskMatMult] = rt_thread_create(init_task_matmult, NULL, 0);
//	arrayThreads[idTaskBsort] = rt_thread_create(init_task_bsort, NULL, 0);

	printf("************** Iniciando escalonamento **************\n");

	tick_period = nano2count(TICK_PERIOD);
	delay_start_timeline = tick_period * 100; // Delay: 2 segundos
	start_timeline = rt_get_time() + delay_start_timeline;

	printf("TICK_PERIOD =======> %llu\n", tick_period);

	start = rt_get_time() + nano2count(200000000);
	rt_sem_wait_barrier(barrier);

	// Aguarda interrupcao do usuario...
	while(!getchar()); // Aguardo o usuario apertar alguma tecla para finalizar o escalonamento...
	flagFimExecucao = 1;
	end = 1;

	rt_sem_wait_barrier(barrier);

	rt_thread_join(arrayThreads[idTaskCnt]);
//	rt_thread_join(arrayThreads[idTaskMatMult]);
//	rt_thread_join(arrayThreads[idTaskBsort]);

	stop_rt_timer();
	rt_mbx_delete(mbx);
	rt_sem_delete(barrier);

	rt_thread_delete(Main_Task);

	return 0;
}

void delete_tasks(void)
{
	int i;

	rt_make_soft_real_time();

	for(i = 0; i < NTASKS; i++) {
		rt_thread_delete(arrayTasks[i]);
	}

	printf("\nFim do Escalonamento %s\n", texto_preto);
}

int main(void) {
	printf("\n\nIniciando o escalonamento das tarefas...\n\n");

	create_tasks();

	delete_tasks();

	return 0 ;
}
