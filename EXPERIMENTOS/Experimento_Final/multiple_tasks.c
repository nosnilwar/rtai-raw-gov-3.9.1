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
#define CPU_ALLOWED 1 // Processador 1

/* Definindo variaveis goblais*/
#define TICK_PERIOD 20000000 //Tempo em nano segundos... a cada 0.02 segundos tem o tick

char arrayTextoCorIdTask[4][8] = {"\033[31m", "\033[32m", "\033[34m", "\033[36m"}; // O texto no qual as tarefas serao imprimidas na tela.

int idTaskCnt = 0;
int qtdPeriodosCnt = 1;
int qtdMaxPeriodosCnt = 4;
static RT_TASK *Task_Cnt;
static pthread_t Thread_Cnt;

int idTaskMatmult = 1;
int qtdPeriodosMatmult = 1;
int qtdMaxPeriodosMatmult = 5;
static RT_TASK *Task_Matmult;
static pthread_t Thread_Matmult;

int idTaskBsort = 2;
int qtdPeriodosBsort = 1;
int qtdMaxPeriodosBsort = 4;
static RT_TASK *Task_Bsort;
static pthread_t Thread_Bsort;

int flagFimExecucao = 0;

RTIME tick_period;
RTIME start_timeline;
RTIME delay_start_timeline;

/**************************************************
 * INICIO: DEFINICOES DO C-BENCHMARK -> CNT
 **************************************************/
//#define WORSTCASE_CNT 1
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
  int porcentagemProcessamento = 0;
  int porcentagemProcessamentoAnterior = -1;

  long int WCEC = 1764504180; // cycles
  unsigned int cpuFrequencyAtual = 0; // Hz
  unsigned int cpuFrequencyMin = 1800000; // Hz
  unsigned int cpuFrequencyInicial = 1800000; // Hz
  unsigned int cpuVoltageInicial = 5; // V

  rt_cfg_init_info(Task_Cnt, WCEC, cpuFrequencyMin, cpuFrequencyInicial, cpuVoltageInicial); // Inicializando informacoes importantes para o gerenciamento do Governor.

  for (Outer = 0; Outer < MAXSIZE; Outer++) { //Maxsize = 100
	 for (Inner = 0; Inner < MAXSIZE; Inner++) {
#ifdef WORSTCASE_CNT
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
     }

	porcentagemProcessamento = (int) ((Outer*MAXSIZE + Inner)*100)/(MAXSIZE*MAXSIZE);
	if(porcentagemProcessamento % 10 == 0 && porcentagemProcessamento != porcentagemProcessamentoAnterior)
	{
		cpuFrequencyAtual = rt_cfg_get_cpu_frequency(Task_Cnt);
		printf("%s[TASK %d] Processando... %3d%% =====> Freq: %8d Khz\n", arrayTextoCorIdTask[idTaskCnt], idTaskCnt, porcentagemProcessamento, cpuFrequencyAtual);
		porcentagemProcessamentoAnterior = porcentagemProcessamento;

		rt_cfg_set_rwcec(Task_Cnt, (WCEC * (100 - porcentagemProcessamento))/100);
	}
  }

  Postotal = Ptotal;
  Poscnt = Pcnt;
  Negtotal = Ntotal;
  Negcnt = Ncnt;

  // Sinaliza para o RAW GOVERNOR que a tarefa concluio o seu processamento...
  rt_cfg_set_rwcec(Task_Cnt, 0);
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

static void *init_task_cnt(void *arg)
{
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
	int prioridade = idTaskCnt;

	if(!(Task_Cnt = rt_thread_init(nam2num("TSKCNT"), prioridade, 0, SCHED_FIFO, CPU_ALLOWED)))
	{
		printf("[ERRO] Não foi possível criar a tarefa CNT (C-Benchmark).\n");
		exit(1);
	}

	Tinicio = start_timeline;
	//Tperiodo = tick_period * 501; // ~= 10 segundos (PERIODO == DEADLINE)
	Tperiodo = tick_period * 450; // ~= 9 segundos (PERIODO == DEADLINE)

	rt_task_make_periodic(Task_Cnt, Tinicio, Tperiodo);

	printf("%s[TASK %d] Criada com Sucesso  =======> %llu\n", arrayTextoCorIdTask[idTaskCnt], idTaskCnt, Tperiodo);

	while(!flagFimExecucao && qtdPeriodosCnt <= qtdMaxPeriodosCnt)
	{
		inicioExecucao = rt_get_cpu_time_ns(); //** PEGA O TEMPO DE INICIO DA EXECUCAO.

		/** INICIO: PROCESSANDO A TAREFA... **/
		InitSeedCnt();
		TestCnt(Array);
		/** FIM: PROCESSANDO A TAREFA... **/

		/** CALCULANDO TEMPO DE PROCESSAMENTO DA TAREFA... **/
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);
		terminoExecucao = rt_get_cpu_time_ns(); //** PEGA O TEMPO DE FIM DA EXECUCAO.
		tempo_processamento_tarefa = (terminoExecucao - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).

		printf("%s[TASK %d] ##### Tempo processamento: %.10f => %s", arrayTextoCorIdTask[idTaskCnt], idTaskCnt, tempo_processamento_tarefa, asctime(newtime));

		rt_task_wait_period(); // **** WAIT

		/** CALCULANDO TEMPO DE DURACAO DO PERIODO DA TAREFA... **/
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);
		terminoPeriodo = rt_get_cpu_time_ns();
		periodo_tarefa = (terminoPeriodo - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).

		printf("%s[TASK %d] ##### Duracao do Periodo   ==================================================> Duracao: %.10f => %s", arrayTextoCorIdTask[idTaskCnt], idTaskCnt, periodo_tarefa, asctime(newtime));
		printf("%s", texto_preto);

		qtdPeriodosCnt++;
	}

	printf("%s[TASK %d] ##### FIM EXECUCAO\n", arrayTextoCorIdTask[idTaskCnt], idTaskCnt);

	return 0;
}
/**************************************************
 * FIM: DEFINICOES DO C-BENCHMARK -> CNT
 **************************************************/

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

/**************************************************
 * INICIO: DEFINICOES DO C-BENCHMARK -> MatMult
 *
 * MATRIX MULTIPLICATION BENCHMARK PROGRAM:
 * This program multiplies 2 square matrices resulting in a 3rd
 * matrix. It tests a compiler's speed in handling multidimensional
 * arrays and simple arithmetic.
 **************************************************/
#define UPPERLIMIT 770 // OBS.: chegou a 830 sem nenhum problema. ;)
typedef int matrixMatMult [UPPERLIMIT][UPPERLIMIT];
int SeedMatMult;
matrixMatMult ArrayA, ArrayB, ResultArray;

// Generates random integers between 0 and 8095
int RandomIntegerMatMult(void)
{
   SeedMatMult = ((SeedMatMult * 133) + 81) % 8095;
   return (SeedMatMult);
}

// Intializes the given array with random integers.
void InitializeMatMult(matrixMatMult Array)
{
   int OuterIndex, InnerIndex;
//   printf("Valores da Matriz: \n\n");
   for (OuterIndex = 0; OuterIndex < UPPERLIMIT; OuterIndex++)
      for (InnerIndex = 0; InnerIndex < UPPERLIMIT; InnerIndex++)
      {
         Array[OuterIndex][InnerIndex] = RandomIntegerMatMult();
//         printf("(%d)", Array[OuterIndex][InnerIndex]);
      }
}

// Multiplies arrays A and B and stores the result in ResultArray.
void MultiplyMatMult(matrixMatMult A, matrixMatMult B, matrixMatMult Res)
{
   int porcentagemProcessamento = 0;
   int porcentagemProcessamentoAnterior = -1;

   //double tempoProcessamento = 0.0;
   long int WCEC = 9071928490; // cycles
   unsigned int cpuFrequencyAtual = 0; // Hz
   unsigned int cpuFrequencyMin = 800000; // Hz
   unsigned int cpuFrequencyInicial = 1800000; // Hz
   unsigned int cpuVoltageInicial = 5; // V

   rt_cfg_init_info(Task_Matmult, WCEC, cpuFrequencyMin, cpuFrequencyInicial, cpuVoltageInicial); // Inicializando informacoes importantes para o gerenciamento do Governor.

   register int Outer, Inner, Index;
   for (Outer = 0; Outer < UPPERLIMIT; Outer++)
   {
      for (Inner = 0; Inner < UPPERLIMIT; Inner++)
      {
         Res [Outer][Inner] = 0;
         for (Index = 0; Index < UPPERLIMIT; Index++)
            Res[Outer][Inner] += A[Outer][Index] * B[Index][Inner];
       }

		porcentagemProcessamento = (int) ((Outer*UPPERLIMIT*UPPERLIMIT + Inner*UPPERLIMIT + Index)*100)/(UPPERLIMIT*UPPERLIMIT*UPPERLIMIT);
		if(porcentagemProcessamento % 10 == 0 && porcentagemProcessamento != porcentagemProcessamentoAnterior)
		{
			cpuFrequencyAtual = rt_cfg_get_cpu_frequency(Task_Matmult);
			printf("%s[TASK %d] Processando... %3d%% =====> Freq: %8d Khz\n", arrayTextoCorIdTask[idTaskMatmult], idTaskMatmult, porcentagemProcessamento, cpuFrequencyAtual);
			porcentagemProcessamentoAnterior = porcentagemProcessamento;

			rt_cfg_set_rwcec(Task_Matmult, (WCEC * (100 - porcentagemProcessamento))/100);

			if(porcentagemProcessamento == 60)
			{
				rt_cfg_set_cpu_frequency(Task_Matmult, 800000);
			}
		}
   }

   // Sinaliza para o RAW GOVERNOR que a tarefa concluio o seu processamento...
   rt_cfg_set_rwcec(Task_Matmult, 0);
}

/*
 * Runs a multiplication test on an array.  Calculates and prints the
 * time it takes to multiply the matrices.
 */
void TestMatMult(matrixMatMult A, matrixMatMult B, matrixMatMult Res)
{
   InitializeMatMult(A);
   InitializeMatMult(B);

   MultiplyMatMult(A, B, Res);
}

// Initializes the seed used in the random number generator.
void InitSeedMatMult(void)
{
  /* ***UPPSALA WCET***:
     changed Thomas Ls code to something simpler.
   SeedMatMult = KNOWN_VALUE - 1; */
   SeedMatMult = 1;
}

static void *init_task_matmult(void *arg)
{
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
	int prioridade = idTaskMatmult + 1;

	if(!(Task_Matmult = rt_thread_init(nam2num("TSKMAT"), prioridade, 0, SCHED_FIFO, CPU_ALLOWED)))
	{
		printf("[ERRO] Não foi possível criar a tarefa MatMult (C-Benchmark).\n");
		exit(1);
	}

	Tinicio = start_timeline;
	Tperiodo = tick_period * 401; // ~= 8 segundos (PERIODO == DEADLINE)

	rt_task_make_periodic(Task_Matmult, Tinicio, Tperiodo);

	printf("%s[TASK %d] Criada com Sucesso  =======> %llu\n", arrayTextoCorIdTask[idTaskMatmult], idTaskMatmult, Tperiodo);

	while(!flagFimExecucao && qtdPeriodosMatmult <= qtdMaxPeriodosMatmult)
	{
		inicioExecucao = rt_get_cpu_time_ns(); //** PEGA O TEMPO DE INICIO DA EXECUCAO.

		/** INICIO: PROCESSANDO A TAREFA... **/
		InitSeedMatMult();
		TestMatMult(ArrayA, ArrayB, ResultArray);
		/** FIM: PROCESSANDO A TAREFA... **/

		/** CALCULANDO TEMPO DE PROCESSAMENTO DA TAREFA... **/
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);
		terminoExecucao = rt_get_cpu_time_ns(); //** PEGA O TEMPO DE FIM DA EXECUCAO.
		tempo_processamento_tarefa = (terminoExecucao - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).

		printf("%s[TASK %d] ##### Tempo processamento: %.10f => %s", arrayTextoCorIdTask[idTaskMatmult], idTaskMatmult, tempo_processamento_tarefa, asctime(newtime));

		rt_task_wait_period(); // **** WAIT

		/** CALCULANDO TEMPO DE DURACAO DO PERIODO DA TAREFA... **/
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);
		terminoPeriodo = rt_get_cpu_time_ns();
		periodo_tarefa = (terminoPeriodo - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).

		printf("%s[TASK %d] ##### Duracao do Periodo   ==================================================> Duracao: %.10f => %s", arrayTextoCorIdTask[idTaskMatmult], idTaskMatmult, periodo_tarefa, asctime(newtime));
		printf("%s", texto_preto);

		qtdPeriodosMatmult++;
	}

	printf("%s[TASK %d] ##### FIM EXECUCAO\n", arrayTextoCorIdTask[idTaskMatmult], idTaskMatmult);

	return 0;
}
/**************************************************
 * FIM: DEFINICOES DO C-BENCHMARK -> MatMult
 **************************************************/

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

/**************************************************
 * INICIO: DEFINICOES DO C-BENCHMARK -> Bsort
 **************************************************/

#define KNOWN_VALUE (int) 2 /* A read from this address will result in an known value of 1 */
#define UNKNOWN_VALUE (int) 2 /* A read from this address will result in an unknown value */
#define WORSTCASE 1
#define FALSE 0
#define TRUE 1
#define NUMELEMS 10000
#define MAXDIM   (NUMELEMS+1)

// Globals
int ArrayBsort[MAXDIM], Seed;
int factor;

// Initializes given array with randomly generated integers.
void InitializeBsort(int Array[MAXDIM])
{
	int  Index, fact;

#ifdef WORSTCASE
	factor = -1;
#else
	factor = 1;
#endif

	fact = factor;
	for (Index = 1; Index <= NUMELEMS; Index ++)
		Array[Index] = Index * fact * KNOWN_VALUE;
}

// Sorts an array of integers of size NUMELEMS in ascending order.
void BubbleSort(int Array[MAXDIM])
{
   int Sorted = FALSE;
   int Temp, /** LastIndex,**/ Index, i;

   int porcentagemProcessamento = 0;
   int porcentagemProcessamentoAnterior = -1;

   long int WCEC = 6500290074; // cycles
   unsigned int cpuFrequencyAtual = 0; // Hz
   unsigned int cpuFrequencyMin = 1800000; // Hz
   unsigned int cpuFrequencyInicial = 1800000; // Hz
   unsigned int cpuVoltageInicial = 5; // V

   rt_cfg_init_info(Task_Bsort, WCEC, cpuFrequencyMin, cpuFrequencyInicial, cpuVoltageInicial); // Inicializando informacoes importantes para o gerenciamento do Governor.

   for (i = 1; i <= NUMELEMS-1; i++) /* apsim_loop 1 0 */
   {
      Sorted = TRUE;
      for (Index = 1; Index <= NUMELEMS-1; Index ++) /* apsim_loop 10 1 */
	  {
         if (Index > NUMELEMS-i)
            break;

         if (Array[Index] > Array[Index + 1])
         {
            Temp = Array[Index];
            Array[Index] = Array[Index+1];
            Array[Index+1] = Temp;
            Sorted = FALSE;
         }
      }

	  porcentagemProcessamento = (int) ((i*NUMELEMS + Index)*100)/(NUMELEMS*NUMELEMS);
	  if(porcentagemProcessamento % 10 == 0 && porcentagemProcessamento != porcentagemProcessamentoAnterior)
	  {
		cpuFrequencyAtual = rt_cfg_get_cpu_frequency(Task_Bsort);
		printf("%s[TASK %d] Processando... %3d%% =====> Freq: %8d Khz\n", arrayTextoCorIdTask[idTaskBsort], idTaskBsort, porcentagemProcessamento, cpuFrequencyAtual);
	  	porcentagemProcessamentoAnterior = porcentagemProcessamento;

	  	rt_cfg_set_rwcec(Task_Bsort, (WCEC * (100 - porcentagemProcessamento))/100);
	  }

      if (Sorted)
         break;
   }
   cpuFrequencyAtual = rt_cfg_get_cpu_frequency(Task_Bsort);
   printf("%s[TASK %d] Processando... 100%% =====> Freq: %8d Khz\n", arrayTextoCorIdTask[idTaskBsort], idTaskBsort, cpuFrequencyAtual);

   // Sinaliza para o RAW GOVERNOR que a tarefa concluio o seu processamento...
   rt_cfg_set_rwcec(Task_Bsort, 0);
}

static void *init_task_bsort(void *arg)
{
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
	int prioridade = idTaskBsort + 1;

	if(!(Task_Bsort = rt_thread_init(nam2num("TSKBSO"), prioridade, 0, SCHED_FIFO, CPU_ALLOWED)))
	{
		printf("[ERRO] Não foi possível criar a tarefa Bsort (C-Benchmark).\n");
		exit(1);
	}

	Tinicio = start_timeline;
	//Tperiodo = tick_period * 501; // ~= 10 segundos (PERIODO == DEADLINE)
	Tperiodo = tick_period * 450; // ~= 9 segundos (PERIODO == DEADLINE)

	rt_task_make_periodic(Task_Bsort, Tinicio, Tperiodo);

	printf("%s[TASK %d] Criada com Sucesso  =======> %llu\n", arrayTextoCorIdTask[idTaskBsort], idTaskBsort, Tperiodo);

	while(!flagFimExecucao && qtdPeriodosBsort <= qtdMaxPeriodosBsort)
	{
		inicioExecucao = rt_get_cpu_time_ns(); //** PEGA O TEMPO DE INICIO DA EXECUCAO.

		/** INICIO: PROCESSANDO A TAREFA... **/
		InitializeBsort(ArrayBsort);
	    BubbleSort(ArrayBsort);
		/** FIM: PROCESSANDO A TAREFA... **/

		/** CALCULANDO TEMPO DE PROCESSAMENTO DA TAREFA... **/
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);
		terminoExecucao = rt_get_cpu_time_ns(); //** PEGA O TEMPO DE FIM DA EXECUCAO.
		tempo_processamento_tarefa = (terminoExecucao - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).

		printf("%s[TASK %d] ##### Tempo processamento: %.10f => %s", arrayTextoCorIdTask[idTaskBsort], idTaskBsort, tempo_processamento_tarefa, asctime(newtime));

		rt_task_wait_period(); // **** WAIT

		/** CALCULANDO TEMPO DE DURACAO DO PERIODO DA TAREFA... **/
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);
		terminoPeriodo = rt_get_cpu_time_ns();
		periodo_tarefa = (terminoPeriodo - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).

		printf("%s[TASK %d] ##### Duracao do Periodo   ==================================================> Duracao: %.10f => %s", arrayTextoCorIdTask[idTaskBsort], idTaskBsort, periodo_tarefa, asctime(newtime));
		printf("%s", texto_preto);

		qtdPeriodosBsort++;
	}

	printf("%s[TASK %d] ##### FIM EXECUCAO\n", arrayTextoCorIdTask[idTaskBsort], idTaskBsort);

	return 0;
}
/**************************************************
 * FIM: DEFINICOES DO C-BENCHMARK -> Bsort
 **************************************************/

//TODO: copiado do cpufrequtils-8
static void print_speed(unsigned long speed)
{
	unsigned long tmp;

	if (speed > 1000000) {
		tmp = speed % 10000;
		if (tmp >= 5000)
			speed += 10000;
		printf ("%7u.%02u GHz", ((unsigned int) speed/1000000),
			((unsigned int) (speed%1000000)/10000));
	} else if (speed > 100000) {
		tmp = speed % 1000;
		if (tmp >= 500)
			speed += 1000;
		printf ("%10u MHz", ((unsigned int) speed / 1000));
	} else if (speed > 1000) {
		tmp = speed % 100;
		if (tmp >= 50)
			speed += 100;
		printf ("%7u.%01u MHz", ((unsigned int) speed/1000),
			((unsigned int) (speed%1000)/100));
	} else
		printf ("%10lu kHz", speed);

	return;
}

//TODO: copiado do cpufrequtils-8
void print_cpu_stats(struct cpufreq_sysfs_stats *beforeStats, struct cpufreq_sysfs_stats *afterStats, unsigned long long total_time)
{
	printf("\n\nEstatísticas do Processador...\n\n");
	if (beforeStats && afterStats) {
		printf("** cpufreq stats: **\n");
		while (beforeStats && afterStats) {
			printf("-> ");
			if(beforeStats->frequency == afterStats->frequency)
			{
				print_speed(beforeStats->frequency);
				printf(": %.4f%%", (100.0 * (afterStats->time_in_state - beforeStats->time_in_state)) / total_time);
			}
			else
			{
				printf("-> ERROR: frequências inválidas! :(");
			}

			beforeStats = beforeStats->next;
			afterStats = afterStats->next;
			if (beforeStats && afterStats)
				printf("\n");
		}
	}
}

int manager_tasks(void)
{
	int cpuid_stats = 0;
	unsigned long long total_time;
	unsigned long long before_total_time;
	unsigned long long after_total_time;
	struct cpufreq_sysfs_stats *beforeStats;
	struct cpufreq_sysfs_stats *afterStats;

	start_rt_timer(TICK_PERIOD);

	rt_make_hard_real_time();

	Thread_Cnt = rt_thread_create(init_task_cnt, NULL, 0);
	Thread_Matmult = rt_thread_create(init_task_matmult, NULL, 0);
	Thread_Bsort = rt_thread_create(init_task_bsort, NULL, 0);

	printf("************** Iniciando escalonamento **************\n");

	tick_period = nano2count(TICK_PERIOD);
	delay_start_timeline = tick_period * 100; // Delay: 2 segundos
	start_timeline = rt_get_time() + delay_start_timeline;

	printf("TICK_PERIOD =======> %llu\n", tick_period);

	// Obtendo as estatisticas do processador antes...
	beforeStats = rt_cfg_get_cpu_stats(cpuid_stats, &before_total_time);

	// Aguarda interrupcao do usuario... ou a conclusao dos periodos de todas as tarefas criadas...
	while(!getchar());
	flagFimExecucao = 1;

	// Obtendo as estatisticas do processador depois...
	afterStats = rt_cfg_get_cpu_stats(cpuid_stats, &after_total_time);

	total_time = after_total_time - before_total_time;
	print_cpu_stats(beforeStats, afterStats, total_time);

	stop_rt_timer();
	return 0;
}

void delete_tasks(void)
{
	rt_make_soft_real_time();

	rt_thread_delete(Task_Cnt);
	rt_thread_delete(Task_Matmult);
	rt_thread_delete(Task_Bsort);
}

int main(void)
{
	printf("\n\nIniciando o escalonamento das tarefas...\n\n");

	manager_tasks();

	delete_tasks();

	printf("\n\nFim do Escalonamento %s\n", texto_preto);

	return 0 ;
}
