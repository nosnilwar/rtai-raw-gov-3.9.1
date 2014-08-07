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
#include <sys/mman.h>
#include <fcntl.h>
#include <sched.h>
#include <rtai_lxrt.h>

/* Definindo CONSTANTES... */
#define DEBUG 1
#define FLAG_HABILITAR_TIMER_EXPERIMENTO 1 // 0 - Por ciclos de execucao e 1 - Por tempo de execucao
#define FLAG_HABILITAR_RAW_MONITOR 1 // 0 - DESABILITADO e 1 - HABILITADO
#define FLAG_HABILITAR_PONTOS_CONTROLE 1 // 0 - DESABILITADO e 1 - HABILITADO
#define FLAG_HABILITAR_SECS 1 // 0 - DESABILITADO e 1 - HABILITADO

#define VALOR_HABILITAR_SECS 1
#define VALOR_DESABILITAR_SECS 0

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

/** Quantidade de ciclos de execucao das tarefas... **/
#define QTD_CICLOS_EXPERIMENTOS 3 // MMC * 3

/* Definindo MACROS */
#define CPUID_RTAI 0 // para o Kernel o primeiro processador é o zero.
#define CPU_ALLOWED (CPUID_RTAI+1) // Processador 1

/* Definindo variaveis goblais*/
#define TICK_PERIOD 50000000 //Tempo em nano segundos... a cada 0.05 segundos tem o tick

#define STACK_SIZE 2000

char arrayTextoCorIdTask[4][8] = {"\033[31m", "\033[32m", "\033[37m", "\033[36m"}; // O texto no qual as tarefas serao imprimidas na tela.

RTIME timerInicioExperimento = 0;
RTIME timerTerminoExperimento = 0;
RTIME tempoTotalExperimento = 0;
#define TEMPO_AMOSTRAGEM_ESTATISTICA_PARCIAL_CPU 30 // segundos

//#define TEMPO_MAXIMO_EXECUCAO_EXPERIMENTO (180) // segundos -> 3 minutos
#define TEMPO_MAXIMO_EXECUCAO_EXPERIMENTO (300) // segundos -> 5 minutos
//#define TEMPO_MAXIMO_EXECUCAO_EXPERIMENTO (1 * 3600) // segundos -> 1 horas
//#define TEMPO_MAXIMO_EXECUCAO_EXPERIMENTO (2 * 3600) // segundos -> 2 horas
//#define TEMPO_MAXIMO_EXECUCAO_EXPERIMENTO (3 * 3600) // segundos -> 3 horas

// variaveis globais do sistema de estatistica...
int cpuid_stats = 0;
unsigned long long total_time;
unsigned long long before_total_time;
unsigned long long after_total_time;
struct cpufreq_sysfs_stats *beforeStats;
struct cpufreq_sysfs_stats *afterStats;
unsigned long before_total_trans;
unsigned long after_total_trans;

// DEFINICAO DAS TASKS...
#define WCEC_CNT 1421126000 // cycles -> frequencia ideal => 800 Mhz
int idTaskCnt = 0;
int qtdPeriodosCnt = 1;
int qtdMaxPeriodosCnt = QTD_CICLOS_EXPERIMENTOS * 8;
RT_TASK *Task_Cnt;
pthread_t Thread_Cnt;
long int WCEC_Cnt = WCEC_CNT;
long int RWCEC_Cnt = WCEC_CNT;
long int SEC_Cnt = 0; // cycles
RTIME Tperiodo_Cnt = 0; // unidade -> counts
unsigned int cpuFrequencyAtual_Cnt = 0; // KHz
unsigned int cpuFrequencyMin_Cnt = 1800000; // KHz
unsigned int cpuFrequencyInicial_Cnt = 1800000; // KHz
unsigned int cpuVoltageInicial_Cnt = 5; // V
//---------------

#define WCEC_MATMULT 0 // cycles -> frequencia ideal => 3.0 Ghz
int idTaskMatmult = 1;
int qtdPeriodosMatmult = 1;
int qtdMaxPeriodosMatmult = QTD_CICLOS_EXPERIMENTOS * 9;
RT_TASK *Task_Matmult;
pthread_t Thread_Matmult;
long int WCEC_Matmult = WCEC_MATMULT;
long int RWCEC_Matmult = WCEC_MATMULT;
long int SEC_Matmult = 0; // cycles
RTIME Tperiodo_Matmult = 0; // unidade -> counts
unsigned int cpuFrequencyAtual_Matmult = 0; // KHz
unsigned int cpuFrequencyMin_Matmult = 800000; // KHz
unsigned int cpuFrequencyInicial_Matmult = 3000000; // KHz
unsigned int cpuVoltageInicial_Matmult = 5; // V
//---------------

#define WCEC_BSORT 13400970050 // cycles -> frequencia ideal => 1.8 Ghz
int idTaskBsort = 2;
int qtdPeriodosBsort = 1;
int qtdMaxPeriodosBsort = QTD_CICLOS_EXPERIMENTOS * 8;
RT_TASK *Task_Bsort;
pthread_t Thread_Bsort;
long int WCEC_Bsort = WCEC_BSORT;
long int RWCEC_Bsort = WCEC_BSORT;
long int SEC_Bsort = 0; // cycles
RTIME Tperiodo_Bsort = 0; // unidade -> counts
unsigned int cpuFrequencyAtual_Bsort = 0; // KHz
unsigned int cpuFrequencyMin_Bsort = 1800000; // KHz
unsigned int cpuFrequencyInicial_Bsort = 1800000; // KHz
unsigned int cpuVoltageInicial_Bsort = 5; // V
//---------------

#define WCEC_CPUSTATS 0 // OBS.: SENDO ZERO O RAW MONITOR NAO INFLUENCIA NA EXECUTACAO DA TAREFA.
int idTaskCpuStats = 3;
int qtdPeriodosCpuStats = 1;
RT_TASK *Task_CpuStats;
pthread_t Thread_CpuStats;
long int WCEC_CpuStats = WCEC_CPUSTATS;
long int RWCEC_CpuStats = WCEC_CPUSTATS;
long int SEC_CpuStats = 0; // cycles
RTIME Tperiodo_CpuStats = 0; // unidade -> counts
unsigned int cpuFrequencyAtual_CpuStats = 0; // KHz
unsigned int cpuFrequencyMin_CpuStats = 800000; // KHz
unsigned int cpuFrequencyInicial_CpuStats = 800000; // KHz
unsigned int cpuVoltageInicial_CpuStats = 5; // V

int flagFimExecucao = 0;

RTIME tick_period;
RTIME start_timeline;
RTIME delay_start_timeline;

unsigned int reajustarCpuFreq(int idTask, RT_TASK *task, long int RWCEC)
{
	double cpu_frequency_target = 0.0; // Conterah a frequencia que o processador terah que assumir para que a tarefa conclua seu processamento dentro do seu deadline.
	double tempoRestanteProcessamento = 0.0; // Conterah o tempo restante que a tarefa tem para concluir sua execucao.
	RTIME tick_timer_atual; // possui o timer do processador RTAI atualizado...
	RTIME period = 0;
	RTIME periodic_resume_time = 0;

	tick_timer_atual = rt_get_time();
	period = rt_cfg_get_period(task);
	periodic_resume_time = rt_cfg_get_periodic_resume_time(task);

	tempoRestanteProcessamento = (count2nano(periodic_resume_time + period - tick_timer_atual)) / 1000000000.0; // UNIDADE AQUI EH counts -> Transformando de nanosegundo(s) para segundo(s) (10^9).
	if(tempoRestanteProcessamento <= 0)
		tempoRestanteProcessamento = 1;

#if DEBUG == 1
	printf("%s[TASK %d] - cpu_frequency_target = RWCEC(%ld) / TRP(%f) ===> TIMER(%llu)\n", arrayTextoCorIdTask[idTask], idTask, RWCEC, tempoRestanteProcessamento, count2nano(tick_timer_atual));
#endif

	cpu_frequency_target = (RWCEC / tempoRestanteProcessamento) ; // Unidade: Ciclos/segundo (a conversao para segundos foi feita acima 10^9)
	cpu_frequency_target = cpu_frequency_target / 1000.0; // Unidade: Khz (convertendo para de Hz para KHz)
	rt_cfg_set_cpu_frequency(task, (int) cpu_frequency_target);

	return(cpu_frequency_target);
}

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
void print_cpu_stats(struct cpufreq_sysfs_stats *beforeStats, struct cpufreq_sysfs_stats *afterStats, unsigned long before_total_trans, unsigned long after_total_trans, unsigned long long total_time)
{
	unsigned long total_trans;

	total_trans = after_total_trans - before_total_trans;

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
		printf("\n\n");
		printf("Tempo Total: (%llu) usertime units -> (USERTIME_UNIT * 10ms = X ms)\n", total_time);

		if (total_trans)
			printf("Num. Total de Transições: (%lu)\n", total_trans);
		else
			printf("\n");

		printf("\n\n");
	}
}

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

	for (OuterIndex = 0; OuterIndex < MAXSIZE; OuterIndex++) // xorl + addl + addq + cmpl + jne = 8 cycles
		for (InnerIndex = 0; InnerIndex < MAXSIZE; InnerIndex++) // cmpq + jne = 5 cycles
			Array[OuterIndex][InnerIndex] = RandomIntegerCnt(); // call + movl + addq = 7 cycles

	RWCEC_Cnt = RWCEC_Cnt - 588056000; // Quantidade de ciclos da inicializacao do array.

#if FLAG_HABILITAR_RAW_MONITOR == 1
	rt_cfg_set_rwcec(Task_Cnt, RWCEC_Cnt);
#endif
	return 0;
}

void SumCnt(matrixCnt Array)
{
	unsigned int cpuFrequencyAtual = 0; // KHz

	register int Outer, Inner;

	int Ptotal = 0; /* changed these to locals in order to drive worst case */
	int Ntotal = 0;
	int Pcnt = 0;
	int Ncnt = 0;
	int porcentagemProcessamento = 0;
	int porcentagemProcessamentoAnterior = -1;

	for (Outer = 0; Outer < MAXSIZE; Outer++) // xorl + jmp + cmpl + jne = 10 cycles
	{
		for (Inner = 0; Inner < MAXSIZE; Inner++) // cmpq + je + cmpq + jne = 7 cycles
		{
			if (Array[Outer][Inner] >= 0) { // movl + testl + jns  = 8 cycles
				Ptotal += Array[Outer][Inner]; // addl = 1 cycles
				Pcnt++; // addl = 1 cycles
			}
			else {
				Ntotal += Array[Outer][Inner]; // addl = 1 cycles
				Ncnt++; // addl = 1 cycles
			}
		}

		RWCEC_Cnt = RWCEC_Cnt - 119010; // Quantidade de ciclos do loop interno.

		porcentagemProcessamento = (int) ((Outer*MAXSIZE + Inner)*100)/(MAXSIZE*MAXSIZE);
		if(porcentagemProcessamento % 10 == 0 && porcentagemProcessamento != porcentagemProcessamentoAnterior)
		{
			cpuFrequencyAtual = rt_cfg_cpufreq_get(CPUID_RTAI);
			cpuFrequencyAtual_Cnt = rt_cfg_get_cpu_frequency(Task_Cnt);
			porcentagemProcessamentoAnterior = porcentagemProcessamento;
#if DEBUG == 1
			printf("%s[TASK %d] Processando... %3d%% ==============> Freq: %8d Khz ==============> Curr Freq: %8d Khz\n", arrayTextoCorIdTask[idTaskCnt], idTaskCnt, porcentagemProcessamento, cpuFrequencyAtual_Cnt, cpuFrequencyAtual);
#endif
#if FLAG_HABILITAR_RAW_MONITOR == 1
			rt_cfg_set_rwcec(Task_Cnt, RWCEC_Cnt);
#endif
		}
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
#if DEBUG == 1
	// Variaveis para realizar os calculos de tempo...
	struct tm *newtime;
	time_t aclock;
	float periodo_tarefa;
	float tempo_processamento_tarefa;
	RTIME terminoExecucao = 0;
	RTIME terminoPeriodo = 0;
	RTIME inicioExecucao = 0;
#endif

	RTIME Tinicio;
	int prioridade = idTaskCnt + 1;

	if(!(Task_Cnt = rt_thread_init(nam2num("TSKCNT"), prioridade, 0, SCHED_FIFO, CPU_ALLOWED)))
	{
		printf("[ERRO] Não foi possível criar a tarefa CNT (C-Benchmark).\n");
		exit(1);
	}

	Tinicio = start_timeline;
	Tperiodo_Cnt = tick_period * 180; // ~= 9 segundos (PERIODO == DEADLINE)
	//Tperiodo_Cnt = tick_period * 201; // ~= 10 segundos (PERIODO == DEADLINE)

	rt_allow_nonroot_hrt();
	rt_task_make_periodic(Task_Cnt, Tinicio, Tperiodo_Cnt);
	rt_change_prio(Task_Cnt, prioridade);

	printf("%s[TASK %d] Criada com Sucesso  ================> %llu\n", arrayTextoCorIdTask[idTaskCnt], idTaskCnt, Tperiodo_Cnt);

	//ESTATISTICAs: Obtendo as estatisticas do processador antes...
	beforeStats = rt_cfg_get_cpu_stats(cpuid_stats, &before_total_time);
	before_total_trans = rt_cfg_get_transitions(CPUID_RTAI);

#if FLAG_HABILITAR_TIMER_EXPERIMENTO == 0 // por ciclos de execucao
	while(qtdPeriodosCnt <= qtdMaxPeriodosCnt)
#else // por tempo de execucao
	while(!flagFimExecucao)
#endif
	{
#if DEBUG == 1
		inicioExecucao = rt_get_time(); //** PEGA O TEMPO DE INICIO DA EXECUCAO.
#endif
		// Inicializando WCEC e RWCEC...
		WCEC_Cnt = WCEC_CNT;
		RWCEC_Cnt = WCEC_CNT;
		SEC_Cnt = 0;

		// Inicializando informacoes importantes para o gerenciamento do Governor.
		cpuFrequencyInicial_Cnt = abs((WCEC_Cnt / (count2nano(Tperiodo_Cnt)/1000000000.0))/1000.0); // KHz
#if FLAG_HABILITAR_RAW_MONITOR == 1
		rt_cfg_init_info(Task_Cnt, WCEC_Cnt, cpuFrequencyMin_Cnt, cpuFrequencyInicial_Cnt, cpuVoltageInicial_Cnt);

#else
		rt_cfg_init_info(Task_Cnt, 0, cpuFrequencyMin_Cnt, cpuFrequencyInicial_Cnt, cpuVoltageInicial_Cnt);
#endif

		/** INICIO: PROCESSANDO A TAREFA... **/
		InitSeedCnt();
		TestCnt(Array);
		/** FIM: PROCESSANDO A TAREFA... **/

#if DEBUG == 1
		/** CALCULANDO TEMPO DE PROCESSAMENTO DA TAREFA... **/
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);
		terminoExecucao = rt_get_time(); //** PEGA O TEMPO DE FIM DA EXECUCAO.
		tempo_processamento_tarefa = count2nano(terminoExecucao - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).
		printf("%s[TASK %d] ##### Tempo processamento: %.10f => %s", arrayTextoCorIdTask[idTaskCnt], idTaskCnt, tempo_processamento_tarefa, asctime(newtime));
#endif
		rt_task_wait_period(); // **** WAIT

#if DEBUG == 1
		/** CALCULANDO TEMPO DE DURACAO DO PERIODO DA TAREFA... **/
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);
		terminoPeriodo = rt_get_time();
		periodo_tarefa = count2nano(terminoPeriodo - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).
		printf("%s[TASK %d] ##### Duracao do Periodo   ===========================================================> Duracao: %.10f => %s", arrayTextoCorIdTask[idTaskCnt], idTaskCnt, periodo_tarefa, asctime(newtime));
		printf("%s", texto_branco);
#endif
		qtdPeriodosCnt++;
	}

	printf("%s[TASK %d] ##### FIM EXECUCAO -> Total Periodos Executados: %d\n", arrayTextoCorIdTask[idTaskCnt], idTaskCnt, qtdPeriodosCnt);

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
void InitializeMatMult(matrixMatMult Array, int flagPermitirSecs)
{
	int OuterIndex = 0, InnerIndex = 0;
	int flagInsertSecs = 0;
	int porcentagemProcessamento = 0;
#if FLAG_HABILITAR_SECS == 1
	int limitInferiorSecs = 0; // %
	int limitSuperiorSecs = 52; // %
#endif

//	printf("Valores da Matriz: \n\n");
	for (OuterIndex = 0; OuterIndex < UPPERLIMIT; OuterIndex++)  // cmpl + jne = 1 cycles
	{
		//INSERINDO SECs na tarefa Matmult...
		porcentagemProcessamento = (int) ((OuterIndex*UPPERLIMIT + InnerIndex)*100)/(UPPERLIMIT*UPPERLIMIT); //
		flagInsertSecs = 0;
#if FLAG_HABILITAR_SECS == 1
		if(flagPermitirSecs && porcentagemProcessamento >= limitInferiorSecs && porcentagemProcessamento <= limitSuperiorSecs)
		{
			flagInsertSecs = 1;
		}
#endif

		for (InnerIndex = 0; InnerIndex < UPPERLIMIT; InnerIndex++)
		{
			if(flagInsertSecs)
			{
				Array[OuterIndex][InnerIndex] = 0;
			}
			else
			{
				Array[OuterIndex][InnerIndex] = RandomIntegerMatMult();
			}
//			printf("(%d)", Array[OuterIndex][InnerIndex]);
		}
	}

	if(RWCEC_Matmult > 0)
		RWCEC_Matmult = RWCEC_Matmult - 38554700; // Quantidade de ciclos da inicializacao do array.

#if FLAG_HABILITAR_RAW_MONITOR == 1
	rt_cfg_set_rwcec(Task_Matmult, RWCEC_Matmult);
#endif
}

// Multiplies arrays A and B and stores the result in ResultArray.
void MultiplyMatMult(matrixMatMult A, matrixMatMult B, matrixMatMult Res)
{
	unsigned int cpuFrequencyAtual = 0; // KHz

	unsigned int cpu_frequency_target = 0; // Conterah a frequencia que o processador terah que assumir para que a tarefa conclua seu processamento dentro do seu deadline.
	int porcentagemProcessamento = 0;
	int porcentagemProcessamentoAnterior = -1;
	int somaColunas = 0;

	register int Outer, Inner, Index;
	for (Outer = 0; Outer < UPPERLIMIT; Outer++)
	{
#if FLAG_HABILITAR_SECS == 1
		somaColunas = 0;
		for (Inner = 0; Inner < UPPERLIMIT; Inner++)
			somaColunas += A[Outer][Inner];
#else
		somaColunas = 1;
#endif

		for (Inner = 0; Inner < UPPERLIMIT; Inner++)
		{
			Res[Outer][Inner] = 0;
			if(somaColunas > 0)
			{
				for (Index = 0; Index < UPPERLIMIT; Index++)
					Res[Outer][Inner] += A[Outer][Index] * B[Index][Inner];
			}
			else // se for igual a zero... significa q a linha esta toda zerada...
			{
				SEC_Matmult = SEC_Matmult + 68776400; // cycles
			}
		}

		if(RWCEC_Matmult > 0)
			RWCEC_Matmult = RWCEC_Matmult - 68811849; // cycles

		porcentagemProcessamento = (int) ((Outer*UPPERLIMIT*UPPERLIMIT + Inner*UPPERLIMIT + Index)*100)/(UPPERLIMIT*UPPERLIMIT*UPPERLIMIT);
		if(porcentagemProcessamento % 10 == 0 && porcentagemProcessamento != porcentagemProcessamentoAnterior)
		{
#if FLAG_HABILITAR_RAW_MONITOR == 1
			rt_cfg_set_rwcec(Task_Matmult, RWCEC_Matmult);
#endif
			// PONTOS DE CONTROLE DO MATMULT
			porcentagemProcessamentoAnterior = porcentagemProcessamento;
			if(porcentagemProcessamento == 60 || porcentagemProcessamento == 90)
			{
#if FLAG_HABILITAR_PONTOS_CONTROLE == 1
				cpu_frequency_target = reajustarCpuFreq(idTaskMatmult, Task_Matmult, RWCEC_Matmult);
#endif
#if DEBUG == 1
				cpuFrequencyAtual = rt_cfg_cpufreq_get(CPUID_RTAI);
				cpuFrequencyAtual_Matmult = rt_cfg_get_cpu_frequency(Task_Matmult);
				printf("%s[TASK %d] Processando... %3d%% ==============> Freq: %8d Khz ==============> Curr Freq: %8d Khz ==============> Freq CALCULADA: %8d Khz\n", arrayTextoCorIdTask[idTaskMatmult], idTaskMatmult, porcentagemProcessamento, cpuFrequencyAtual_Matmult, cpuFrequencyAtual, cpu_frequency_target);
#endif
			}
			else
			{
#if DEBUG == 1
				cpuFrequencyAtual = rt_cfg_cpufreq_get(CPUID_RTAI);
				cpuFrequencyAtual_Matmult = rt_cfg_get_cpu_frequency(Task_Matmult);
				printf("%s[TASK %d] Processando... %3d%% ==============> Freq: %8d Khz ==============> Curr Freq: %8d Khz\n", arrayTextoCorIdTask[idTaskMatmult], idTaskMatmult, porcentagemProcessamento, cpuFrequencyAtual_Matmult, cpuFrequencyAtual);
#endif
			}
		}
	}
}

/*
 * Runs a multiplication test on an array.  Calculates and prints the
 * time it takes to multiply the matrices.
 */
void TestMatMult(matrixMatMult A, matrixMatMult B, matrixMatMult Res)
{
	InitializeMatMult(A, VALOR_HABILITAR_SECS);
	InitializeMatMult(B, VALOR_DESABILITAR_SECS);

	MultiplyMatMult(A, B, Res);
}

// Initializes the seed used in the random number generator.
void InitSeedMatMult(void)
{
	/* ***UPPSALA WCET***: changed Thomas Ls code to something simpler.
	SeedMatMult = KNOWN_VALUE - 1; */
	SeedMatMult = 1;

	if(RWCEC_Matmult > 0)
		RWCEC_Matmult = RWCEC_Matmult - 33; // cycles
}

void *init_task_matmult(void *arg)
{
#if DEBUG == 1
	// Variaveis para realizar os calculos de tempo...
	struct tm *newtime;
	time_t aclock;
	float periodo_tarefa;
	float tempo_processamento_tarefa;
	RTIME terminoExecucao = 0;
	RTIME terminoPeriodo = 0;
	RTIME inicioExecucao = 0;
#endif

	RTIME Tinicio;
	int prioridade = idTaskMatmult + 1;

	if(!(Task_Matmult = rt_thread_init(nam2num("TSKMAT"), prioridade, 0, SCHED_FIFO, CPU_ALLOWED)))
	{
		printf("[ERRO] Não foi possível criar a tarefa MatMult (C-Benchmark).\n");
		exit(1);
	}

	Tinicio = start_timeline;
	//Tperiodo_Matmult = tick_period * 160; // ~= 8 segundos (PERIODO == DEADLINE)
	Tperiodo_Matmult = tick_period * 161; // ~= 8 segundos (PERIODO == DEADLINE)

	rt_allow_nonroot_hrt();
	rt_task_make_periodic(Task_Matmult, Tinicio, Tperiodo_Matmult);
	rt_change_prio(Task_Matmult, prioridade);

	printf("%s[TASK %d] Criada com Sucesso  ================> %llu\n", arrayTextoCorIdTask[idTaskMatmult], idTaskMatmult, Tperiodo_Matmult);

#if FLAG_HABILITAR_TIMER_EXPERIMENTO == 0 // por ciclos de execucao
	while(qtdPeriodosMatmult <= qtdMaxPeriodosMatmult)
#else // por tempo de execucao
	while(!flagFimExecucao)
#endif
	{
#if DEBUG == 1
		inicioExecucao = rt_get_time(); //** PEGA O TEMPO DE INICIO DA EXECUCAO.
#endif
		// Inicializando WCEC e RWCEC...
		WCEC_Matmult = WCEC_MATMULT;
		RWCEC_Matmult = WCEC_MATMULT;
		SEC_Matmult = 0;

		// Inicializando informacoes importantes para o gerenciamento do Governor.
		cpuFrequencyInicial_Matmult = abs((WCEC_Matmult / (count2nano(Tperiodo_Matmult)/1000000000.0))/1000.0); // KHz
#if FLAG_HABILITAR_RAW_MONITOR == 1
		rt_cfg_init_info(Task_Matmult, WCEC_Matmult, cpuFrequencyMin_Matmult, cpuFrequencyInicial_Matmult, cpuVoltageInicial_Matmult);
#else
		rt_cfg_init_info(Task_Matmult, 0, cpuFrequencyMin_Matmult, cpuFrequencyInicial_Matmult, cpuVoltageInicial_Matmult);
#endif

		/** INICIO: PROCESSANDO A TAREFA... **/
		InitSeedMatMult();
		TestMatMult(ArrayA, ArrayB, ResultArray);
		/** FIM: PROCESSANDO A TAREFA... **/

#if DEBUG == 1
		/** CALCULANDO TEMPO DE PROCESSAMENTO DA TAREFA... **/
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);
		terminoExecucao = rt_get_time(); //** PEGA O TEMPO DE FIM DA EXECUCAO.
		tempo_processamento_tarefa = count2nano(terminoExecucao - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).
		printf("%s[TASK %d] ##### Tempo processamento: %.10f => %s", arrayTextoCorIdTask[idTaskMatmult], idTaskMatmult, tempo_processamento_tarefa, asctime(newtime));
#endif

		rt_task_wait_period(); // **** WAIT

#if DEBUG == 1
		/** CALCULANDO TEMPO DE DURACAO DO PERIODO DA TAREFA... **/
		terminoPeriodo = rt_get_time();
		periodo_tarefa = count2nano(terminoPeriodo - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).
		printf("%s[TASK %d] ##### Duracao do Periodo   ===========================================================> Duracao: %.10f\n", arrayTextoCorIdTask[idTaskMatmult], idTaskMatmult, periodo_tarefa);
		printf("%s", texto_branco);
#endif

		qtdPeriodosMatmult++;
	}

	printf("%s[TASK %d] ##### FIM EXECUCAO -> Total Periodos Executados: %d\n", arrayTextoCorIdTask[idTaskMatmult], idTaskMatmult, qtdPeriodosMatmult);

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

	if(RWCEC_Bsort > 0)
		RWCEC_Bsort = RWCEC_Bsort - 470052; // Quantidade de ciclos do loop interno e da declaracao das variaveis.
}

// Sorts an array of integers of size NUMELEMS in ascending order.
void BubbleSort(int Array[MAXDIM])
{
	unsigned int cpuFrequencyAtual = 0; // KHz

	int Sorted = FALSE;
	int Temp, /** LastIndex,**/ Index, i;

	int porcentagemProcessamento = 0;
	int porcentagemProcessamentoAnterior = -1;

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

		if(RWCEC_Bsort > 0)
			RWCEC_Bsort = RWCEC_Bsort - 1340050; // Quantidade de ciclos do loop interno e da declaracao das variaveis.

		porcentagemProcessamento = (int) ((i*NUMELEMS + Index)*100)/(NUMELEMS*NUMELEMS);
		if(porcentagemProcessamento % 10 == 0 && porcentagemProcessamento != porcentagemProcessamentoAnterior)
		{
			cpuFrequencyAtual = rt_cfg_cpufreq_get(CPUID_RTAI);
			cpuFrequencyAtual_Bsort = rt_cfg_get_cpu_frequency(Task_Bsort);
			porcentagemProcessamentoAnterior = porcentagemProcessamento;
#if DEBUG == 1
			printf("%s[TASK %d] Processando... %3d%% ==============> Freq: %8d Khz ==============> Curr Freq: %8d Khz\n", arrayTextoCorIdTask[idTaskBsort], idTaskBsort, porcentagemProcessamento, cpuFrequencyAtual_Bsort, cpuFrequencyAtual);
#endif
#if FLAG_HABILITAR_RAW_MONITOR == 1
			rt_cfg_set_rwcec(Task_Bsort, RWCEC_Bsort);
#endif
		}

		if (Sorted)
			break;
	}

#if DEBUG == 1
	cpuFrequencyAtual = rt_cfg_cpufreq_get(CPUID_RTAI);
	cpuFrequencyAtual_Bsort = rt_cfg_get_cpu_frequency(Task_Bsort);
	printf("%s[TASK %d] Processando... 100%% ==============> Freq: %8d Khz ==============> Curr Freq: %8d Khz\n", arrayTextoCorIdTask[idTaskBsort], idTaskBsort, cpuFrequencyAtual_Bsort, cpuFrequencyAtual);
#endif

	// Sinaliza para o RAW GOVERNOR que a tarefa concluio o seu processamento...
#if FLAG_HABILITAR_RAW_MONITOR == 1
	rt_cfg_set_rwcec(Task_Bsort, 0);
#endif
}

void *init_task_bsort(void *arg)
{
#if DEBUG == 1
	// Variaveis para realizar os calculos de tempo...
	struct tm *newtime;
	time_t aclock;
	float periodo_tarefa;
	float tempo_processamento_tarefa;
	RTIME terminoExecucao = 0;
	RTIME terminoPeriodo = 0;
	RTIME inicioExecucao = 0;
#endif

	RTIME Tinicio;
	int prioridade = idTaskBsort + 1;

	if(!(Task_Bsort = rt_thread_init(nam2num("TSKBSO"), prioridade, 0, SCHED_FIFO, CPU_ALLOWED)))
	{
		printf("[ERRO] Não foi possível criar a tarefa Bsort (C-Benchmark).\n");
		exit(1);
	}

	Tinicio = start_timeline;
	Tperiodo_Bsort = tick_period * 180; // ~= 9 segundos (PERIODO == DEADLINE)
	//Tperiodo_Bsort = tick_period * 201; // ~= 10 segundos (PERIODO == DEADLINE)

	rt_allow_nonroot_hrt();
	rt_task_make_periodic(Task_Bsort, Tinicio, Tperiodo_Bsort);
	rt_change_prio(Task_Bsort, prioridade);

	printf("%s[TASK %d] Criada com Sucesso  ================> %llu\n", arrayTextoCorIdTask[idTaskBsort], idTaskBsort, Tperiodo_Bsort);

#if FLAG_HABILITAR_TIMER_EXPERIMENTO == 0 // por ciclos de execucao
	while(qtdPeriodosBsort <= qtdMaxPeriodosBsort)
#else // por tempo de execucao
	while(!flagFimExecucao)
#endif
	{
#if DEBUG == 1
		inicioExecucao = rt_get_time(); //** PEGA O TEMPO DE INICIO DA EXECUCAO.
#endif
		// Inicializando WCEC e RWCEC...
		WCEC_Bsort = WCEC_BSORT;
		RWCEC_Bsort = WCEC_BSORT;
		SEC_Bsort = 0;

		// Inicializando informacoes importantes para o gerenciamento do Governor.
		cpuFrequencyInicial_Bsort = abs((WCEC_Bsort / (count2nano(Tperiodo_Bsort)/1000000000.0))/1000.0); // KHz
#if FLAG_HABILITAR_RAW_MONITOR == 1
		rt_cfg_init_info(Task_Bsort, WCEC_Bsort, cpuFrequencyMin_Bsort, cpuFrequencyInicial_Bsort, cpuVoltageInicial_Bsort);
#else
		rt_cfg_init_info(Task_Bsort, 0, cpuFrequencyMin_Bsort, cpuFrequencyInicial_Bsort, cpuVoltageInicial_Bsort);
#endif

		/** INICIO: PROCESSANDO A TAREFA... **/
		InitializeBsort(ArrayBsort);
		BubbleSort(ArrayBsort);
		/** FIM: PROCESSANDO A TAREFA... **/

#if DEBUG == 1
		/** CALCULANDO TEMPO DE PROCESSAMENTO DA TAREFA... **/
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);
		terminoExecucao = rt_get_time(); //** PEGA O TEMPO DE FIM DA EXECUCAO.
		tempo_processamento_tarefa = count2nano(terminoExecucao - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).
		printf("%s[TASK %d] ##### Tempo processamento: %.10f => %s", arrayTextoCorIdTask[idTaskBsort], idTaskBsort, tempo_processamento_tarefa, asctime(newtime));
#endif

		rt_task_wait_period(); // **** WAIT

#if DEBUG == 1
		/** CALCULANDO TEMPO DE DURACAO DO PERIODO DA TAREFA... **/
		time(&aclock); // Pega tempo em segundos.
		newtime = localtime(&aclock);
		terminoPeriodo = rt_get_time();
		periodo_tarefa = count2nano(terminoPeriodo - inicioExecucao) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).
		printf("%s[TASK %d] ##### Duracao do Periodo   ===========================================================> Duracao: %.10f => %s", arrayTextoCorIdTask[idTaskBsort], idTaskBsort, periodo_tarefa, asctime(newtime));
		printf("%s", texto_branco);
#endif

		qtdPeriodosBsort++;
	}

	printf("%s[TASK %d] ##### FIM EXECUCAO -> Total Periodos Executados: %d\n", arrayTextoCorIdTask[idTaskBsort], idTaskBsort, qtdPeriodosBsort);

	return 0;
}
/**************************************************
 * FIM: DEFINICOES DO C-BENCHMARK -> Bsort
 **************************************************/

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

/**************************************************
 * INICIO: DEFINICOES DO C-BENCHMARK -> CpuStats
 **************************************************/

void *init_task_cpustats(void *arg)
{
	unsigned int cpuFrequencyAtual = 0; // KHz
	int multiplicadorEstatisticasParciais = 1;

	RTIME Tinicio;
	int prioridade = idTaskCpuStats + 1;

	if(!(Task_CpuStats = rt_thread_init(nam2num("TSKCPU"), prioridade, 0, SCHED_FIFO, CPU_ALLOWED)))
	{
		printf("[ERRO] Não foi possível criar a tarefa Cpu Stats.\n");
		exit(1);
	}

	Tinicio = start_timeline;
	Tperiodo_CpuStats = tick_period * 180; // ~= 9 segundos (PERIODO == DEADLINE)
	//Tperiodo_CpuStats = tick_period * 201; // ~= 10 segundos (PERIODO == DEADLINE)

	rt_allow_nonroot_hrt();
	rt_task_make_periodic(Task_CpuStats, Tinicio, Tperiodo_CpuStats);
	rt_change_prio(Task_CpuStats, prioridade);

	printf("%s[TASK %d] Criada com Sucesso  ================> %llu\n", arrayTextoCorIdTask[idTaskCpuStats], idTaskCpuStats, Tperiodo_CpuStats);

	while(!flagFimExecucao)
	{
		// Inicializando WCEC e RWCEC...
		WCEC_CpuStats = WCEC_CPUSTATS;
		RWCEC_CpuStats = WCEC_CPUSTATS;
		SEC_CpuStats = 0;

		// Inicializando informacoes importantes para o gerenciamento do Governor.
		cpuFrequencyInicial_CpuStats = abs((WCEC_CpuStats / (count2nano(Tperiodo_CpuStats)/1000000000.0))/1000.0); // KHz
#if FLAG_HABILITAR_RAW_MONITOR == 1
		rt_cfg_init_info(Task_CpuStats, WCEC_CpuStats, cpuFrequencyMin_CpuStats, cpuFrequencyInicial_CpuStats, cpuVoltageInicial_CpuStats);
#else
		rt_cfg_init_info(Task_CpuStats, 0, cpuFrequencyMin_CpuStats, cpuFrequencyInicial_CpuStats, cpuVoltageInicial_CpuStats);
#endif

#if DEBUG == 1
		cpuFrequencyAtual = rt_cfg_cpufreq_get(CPUID_RTAI);
		cpuFrequencyAtual_CpuStats = rt_cfg_get_cpu_frequency(Task_CpuStats);
		printf("%s[TASK %d] Processando... 100%% ==============> Freq: %8d Khz ==============> Curr Freq: %8d Khz\n", arrayTextoCorIdTask[idTaskCpuStats], idTaskCpuStats, cpuFrequencyAtual_CpuStats, cpuFrequencyAtual);
#endif

		/** INICIO: PROCESSANDO A TAREFA... CALCULANDO O TEMPO TOTAL DE EXECUCAO DO EXPERIMENTO. **/
		timerTerminoExperimento = rt_get_time();
		tempoTotalExperimento = count2nano(timerTerminoExperimento - timerInicioExperimento) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).

#if FLAG_HABILITAR_TIMER_EXPERIMENTO == 0 // por ciclos de execucao
		if(qtdPeriodosCnt >= qtdMaxPeriodosCnt && qtdPeriodosMatmult >= qtdMaxPeriodosMatmult && qtdPeriodosBsort >= qtdMaxPeriodosBsort)
#else
		if(tempoTotalExperimento >= TEMPO_MAXIMO_EXECUCAO_EXPERIMENTO)
#endif
		{
			flagFimExecucao = 1; // FLAG QUE INDICA AS TAREFAS QUE O EXPERIMENTO TERMINOU...

			// Obtendo as estatisticas do processador depois...
			afterStats = rt_cfg_get_cpu_stats(cpuid_stats, &after_total_time);
			after_total_trans = rt_cfg_get_transitions(CPUID_RTAI);
		}
		else if(tempoTotalExperimento >= (multiplicadorEstatisticasParciais * TEMPO_AMOSTRAGEM_ESTATISTICA_PARCIAL_CPU))
		{
			printf("************** ESTATISTICAS PARCIAIS **************\n");
			multiplicadorEstatisticasParciais = multiplicadorEstatisticasParciais + 1;

			// Obtendo as estatisticas do processador depois...
			afterStats = rt_cfg_get_cpu_stats(cpuid_stats, &after_total_time);
			after_total_trans = rt_cfg_get_transitions(CPUID_RTAI);

			total_time = after_total_time - before_total_time;
			print_cpu_stats(beforeStats, afterStats, before_total_trans, after_total_trans, total_time);
		}
		/** FIM: PROCESSANDO A TAREFA... **/

		rt_task_wait_period(); // **** WAIT

		qtdPeriodosCpuStats++;
	}

	printf("%s[TASK %d] ##### FIM EXECUCAO -> Total Periodos Executados: %d\n", arrayTextoCorIdTask[idTaskCpuStats], idTaskCpuStats, qtdPeriodosCpuStats);

	printf("************** ESTATISTICAS FINAL **************\n");

	// Obtendo as estatisticas do processador depois...
	total_time = after_total_time - before_total_time;
	print_cpu_stats(beforeStats, afterStats, before_total_trans, after_total_trans, total_time);

	return 0;
}
/**************************************************
 * FIM: DEFINICOES DO C-BENCHMARK -> CpuStats
 **************************************************/

int manager_tasks(void)
{
	rt_set_periodic_mode();
	rt_make_hard_real_time();

	printf("************** Iniciando escalonamento **************\n");

#if DEBUG == 1
	printf("=> [SIM] DEBUG\n");
#else
	printf("=> [NAO] DEBUG\n");
#endif
#if FLAG_HABILITAR_RAW_MONITOR == 1
	printf("=> [SIM] RAW MONITOR\n");
#else
	printf("=> [NAO] RAW MONITOR\n");
#endif
#if FLAG_HABILITAR_PONTOS_CONTROLE == 1
	printf("=> [SIM] PONTOS DE CONTROLE\n");
#else
	printf("=> [NAO] PONTOS DE CONTROLE\n");
#endif
#if FLAG_HABILITAR_SECS == 1
	printf("=> [SIM] SEC's\n");
#else
	printf("=> [NAO] SEC's\n");
#endif

	//rt_set_oneshot_mode();
	start_rt_timer(0);
	tick_period = nano2count(TICK_PERIOD);
	delay_start_timeline = tick_period * 20; // Delay: 2 segundo(s)
	start_timeline = rt_get_time() + delay_start_timeline;

	printf("TICK_PERIOD ================> %llu\n", tick_period);

	Thread_Cnt = rt_thread_create(init_task_cnt, NULL, 0);
	Thread_Matmult = rt_thread_create(init_task_matmult, NULL, 0);
	Thread_Bsort = rt_thread_create(init_task_bsort, NULL, 0);
	Thread_CpuStats = rt_thread_create(init_task_cpustats, NULL, 0);

	//** PEGA O TEMPO DE INICIO DA EXECUCAO.
	timerInicioExperimento = rt_get_time();

	// Aguarda interrupcao do usuario... ou a conclusao dos periodos de todas as tarefas criadas...
	while(!getchar());
	flagFimExecucao = 1;

	stop_rt_timer();
	return 0;
}

void delete_tasks(void)
{
	rt_make_soft_real_time();

	rt_task_delete(Task_Cnt);
	rt_task_delete(Task_Matmult);
	rt_task_delete(Task_Bsort);
	rt_task_delete(Task_CpuStats);
}

int main(void)
{
	printf("\n\nIniciando o escalonamento das tarefas...\n\n");

	manager_tasks();

	delete_tasks();

	printf("\n\nFim do Escalonamento %s\n", texto_branco);

	return 0 ;
}
