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
#define FLAG_HABILITAR_SECS 0 // 0 - DESABILITADO e 1 - HABILITADO
#define FLAG_CALCULAR_FREQUENCIA_INICIAL_IDEAL 0 // 0 - PEGA A FREQUENCIA INICIAL DA TAREFA e 1 - CALCULA A FREQUENCIA IDEAL DA TAREFA COM BASE NO TEMPO RESTANTES DE PROCESSAMENTO.

#define VALOR_HABILITAR_SECS 1
#define VALOR_DESABILITAR_SECS 0

/** TABELA DE CORES... **/
#define TEXTO_PRETO		"\033[30m" //Cor do primeiro plano preta
#define TEXTO_VERMELHO 	"\033[31m" //Cor do primeiro plano vermelha
#define TEXTO_VERDE 	"\033[32m" //Cor do primeiro plano verde
#define TEXTO_LARANJA 	"\033[33m" //Cor do primeiro plano laranja
#define TEXTO_AZUL 		"\033[34m" //Cor do primeiro plano azul
#define TEXTO_MAGENTA 	"\033[35m" //Cor do primeiro plano magenta
#define TEXTO_CIANO 	"\033[36m" //Cor do primeiro plano ciano
#define TEXTO_BRANCO 	"\033[37m" //Cor do primeiro plano branca
#define FUNDO_PRETO		"\033[40m" //Cor do fundo preta
#define FUNDO_VERMELHO	"\033[41m" //Cor do fundo vermelha
#define FUNDO_VERDE		"\033[42m" //Cor do fundo verde
#define FUNDO_LARANJA	"\033[43m" //Cor do  fundo laranja
#define FUNDO_AZUL		"\033[44m" //Cor do fundo azul
#define FUNDO_MAGENTA	"\033[45m" //Cor do fundo magenta
#define FUNDO_CIANO		"\033[46m" //Cor do fundo ciano
#define FUNDO_BRANCO	"\033[47m" //Cor do fundo branca

/* Definindo MACROS */
#define CPUID_RTAI 0 // para o Kernel o primeiro processador é o zero.
#define CPU_ALLOWED (CPUID_RTAI+1) // Processador 1

/* Definindo variaveis goblais*/
#define TICK_PERIOD 50000000 //Tempo em nano segundos... a cada 0.05 segundos tem o tick
#define FREQUENCIA_MAXIMA_PROCESSADOR 3000000 //kHz

/* Definicao da capacitancia do processador AMD Athlon II x2 250 */
#define AMD_ATHLON_II_X2_250_CAPACITANCIA 5 // pF (pico Farad) COULOMB/VOLT = 1 FARAD (F)

/* Definicao das tensoes por frequencia do processador AMD Athlon II x2 250 */
#define AMD_ATHLON_II_X2_250_TENSAO_FREQ_3000000_KHZ 1.3500 // VOLTS (V)
#define AMD_ATHLON_II_X2_250_TENSAO_FREQ_2300000_KHZ 1.2500 // VOLTS (V)
#define AMD_ATHLON_II_X2_250_TENSAO_FREQ_1800000_KHZ 1.1500 // VOLTS (V)
#define AMD_ATHLON_II_X2_250_TENSAO_FREQ_800000_KHZ  1.1250 // VOLTS (V)

#define STACK_SIZE 2000

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

// ESTRUTURA UTILIZADA PARA DEFINIR O MAIOR E O MENOR INTERVALO DOS DEADLINES PERDIDOS.
struct estatistica_deadlines_perdidos {
	int idTask; // Codigo da tarefa.
	unsigned long codPeriodo; // Numero da periodo da tarefa que ocorreu a perda de deadline.
	double tempoProcessamento_s; // tempo de processamento em segundos.
	double tempoUltrapassadoProcessamento_s; // tempo de processamento em segundos.
	int flagDeadlineSetado;
};
struct estatistica_deadlines_perdidos menorDeadlinePerdido;
struct estatistica_deadlines_perdidos maiorDeadlinePerdido;

/**********************************************/
#define NTASKS 16
/**********************************************/

char arrayTextoCorIdTask[NTASKS][8] = {
	TEXTO_VERMELHO,
	TEXTO_VERDE,
	TEXTO_CIANO,
	TEXTO_BRANCO,
	TEXTO_VERMELHO,
	TEXTO_VERDE,
	TEXTO_CIANO,
	TEXTO_BRANCO,
	TEXTO_VERMELHO,
	TEXTO_VERDE,
	TEXTO_CIANO,
	TEXTO_BRANCO,
	TEXTO_VERMELHO,
	TEXTO_VERDE,
	TEXTO_CIANO,
	TEXTO_BRANCO
}; // O texto no qual as tarefas serao imprimidas na tela.

struct thread_param {
    int idTask; // Indica o ID da tarefa geral e sua prioridade sobre as outras. Quanto menor -> maior a prioridade.
    int idSubTask; // Indica o ID da tarefa replicada dentro do sistema.
    unsigned int cpuFrequencyMin;
    unsigned int cpuFrequencyInicial;
    unsigned int cpuVoltageInicial;
};

/**************************************************************
 * DEFINICAO DAS TASKS...
 **************************************************************/

/** Quantidade de ciclos de execucao das tarefas... **/
#define QTD_CICLOS_EXPERIMENTOS 1 // MMC * 3

/** CNT **/
#define NTASKS_CNT 5
pthread_t Thread_Cnt_0;
pthread_t Thread_Cnt_1;
pthread_t Thread_Cnt_2;
pthread_t Thread_Cnt_3;
pthread_t Thread_Cnt_4;
#define WCEC_CNT 1421126000 // cycles -> frequencia ideal => 800 Mhz
unsigned long qtdPeriodosCnt[NTASKS_CNT] = {1, 1, 1, 1, 1};
unsigned long qtdDeadlinesVioladosCnt[NTASKS_CNT] = {0, 0, 0, 0, 0};
#define QTD_EXEC_POR_CICLOS_CNT 8
int qtdMaxPeriodosCnt = QTD_CICLOS_EXPERIMENTOS * QTD_EXEC_POR_CICLOS_CNT;
long int WCEC_Cnt[NTASKS_CNT] = {WCEC_CNT, WCEC_CNT, WCEC_CNT, WCEC_CNT, WCEC_CNT};
long int RWCEC_Cnt[NTASKS_CNT] = {WCEC_CNT, WCEC_CNT, WCEC_CNT, WCEC_CNT, WCEC_CNT};
long int SEC_Cnt[NTASKS_CNT] = {0, 0, 0, 0, 0}; // cycles
RTIME Tperiodo_Cnt = 0; // unidade -> counts
unsigned int cpuFrequencyAtual_Cnt = 0; // KHz
unsigned int cpuFrequencyMin_Cnt = 800000; // KHz
unsigned int cpuFrequencyInicial_Cnt = 800000; // KHz
unsigned int cpuVoltageInicial_Cnt = 5; // V
//---------------

/** Matmult **/
#define NTASKS_MATMULT 5
pthread_t Thread_Matmult_0;
pthread_t Thread_Matmult_1;
pthread_t Thread_Matmult_2;
pthread_t Thread_Matmult_3;
pthread_t Thread_Matmult_4;
#define WCEC_MATMULT 6910262639 // cycles -> frequencia ideal => 1.8 Ghz
unsigned long qtdPeriodosMatmult[NTASKS_MATMULT] = {1, 1, 1, 1, 1};
unsigned long qtdDeadlinesVioladosMatmult[NTASKS_MATMULT] = {0, 0, 0, 0, 0};
#define QTD_EXEC_POR_CICLOS_MATMULT 9
int qtdMaxPeriodosMatmult = QTD_CICLOS_EXPERIMENTOS * QTD_EXEC_POR_CICLOS_MATMULT;
long int WCEC_Matmult[NTASKS_MATMULT] = {WCEC_MATMULT, WCEC_MATMULT, WCEC_MATMULT, WCEC_MATMULT, WCEC_MATMULT};
long int RWCEC_Matmult[NTASKS_MATMULT] = {WCEC_MATMULT, WCEC_MATMULT, WCEC_MATMULT, WCEC_MATMULT, WCEC_MATMULT};
long int SEC_Matmult[NTASKS_MATMULT] = {0, 0, 0, 0, 0}; // cycles
RTIME Tperiodo_Matmult = 0; // unidade -> counts
unsigned int cpuFrequencyAtual_Matmult = 0; // KHz
unsigned int cpuFrequencyMin_Matmult = 800000; // KHz
unsigned int cpuFrequencyInicial_Matmult = 1800000; // KHz
unsigned int cpuVoltageInicial_Matmult = 5; // V
//---------------

/** Bsort **/
#define NTASKS_BSORT 5
pthread_t Thread_Bsort_0;
pthread_t Thread_Bsort_1;
pthread_t Thread_Bsort_2;
pthread_t Thread_Bsort_3;
pthread_t Thread_Bsort_4;
#define WCEC_BSORT 3000210009 // cycles -> frequencia ideal => 800 Mhz
unsigned long qtdPeriodosBsort[NTASKS_BSORT] = {1, 1, 1, 1, 1};
unsigned long qtdDeadlinesVioladosBsort[NTASKS_BSORT] = {0, 0, 0, 0, 0};
#define QTD_EXEC_POR_CICLOS_BSORT 8
int qtdMaxPeriodosBsort = QTD_CICLOS_EXPERIMENTOS * QTD_EXEC_POR_CICLOS_BSORT;
long int WCEC_Bsort[NTASKS_BSORT] = {WCEC_BSORT, WCEC_BSORT, WCEC_BSORT, WCEC_BSORT, WCEC_BSORT};
long int RWCEC_Bsort[NTASKS_BSORT] = {WCEC_BSORT, WCEC_BSORT, WCEC_BSORT, WCEC_BSORT, WCEC_BSORT};
long int SEC_Bsort[NTASKS_BSORT] = {0, 0, 0, 0, 0}; // cycles
RTIME Tperiodo_Bsort = 0; // unidade -> counts
unsigned int cpuFrequencyAtual_Bsort = 0; // KHz
unsigned int cpuFrequencyMin_Bsort = 800000; // KHz
unsigned int cpuFrequencyInicial_Bsort = 800000; // KHz
unsigned int cpuVoltageInicial_Bsort = 5; // V
//---------------

/** CpuStats **/
pthread_t Thread_CpuStats;
#define WCEC_CPUSTATS 0 // OBS.: SENDO ZERO O RAW MONITOR NAO INFLUENCIA NA EXECUTACAO DA TAREFA.
unsigned long qtdPeriodosCpuStats = 1;
unsigned long qtdDeadlinesVioladosCpuStats = 0;
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

/***************************************
 * Principais funcoes e metodos...
 ***************************************/
void printConfiguracoes(void)
{
	printf("\n************** CONFIGURACOES INICIAIS DO EXPERIMENTO **************\n");
#if DEBUG == 1
	printf("=> [SIM] DEBUG\n");
#else
	printf("=> [NAO] DEBUG\n");
#endif
#if FLAG_HABILITAR_TIMER_EXPERIMENTO == 0 // por ciclos de execucao
	printf("=> [SIM] EXPERIMENTACAO BASEADA EM CICLOS DE EXECUCAO\n");
	printf("=> [NAO] EXPERIMENTACAO BASEADA EM TEMPO DE EXECUCAO\n");
#else
	printf("=> [NAO] EXPERIMENTACAO BASEADA EM CICLOS DE EXECUCAO\n");
	printf("=> [SIM] EXPERIMENTACAO BASEADA EM TEMPO DE EXECUCAO\n");
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
#if FLAG_CALCULAR_FREQUENCIA_INICIAL_IDEAL == 1
	printf("=> [SIM] CALCULAR FREQUENCIA INICIAL IDEAL (COM BASE NO TEMPO RESTANTE DE PROCESSAMENTO DENTRO DO PERIODO)\n");
#else
	printf("=> [NAO] CALCULAR FREQUENCIA INICIAL IDEAL (COM BASE NO TEMPO RESTANTE DE PROCESSAMENTO DENTRO DO PERIODO)\n");
#endif
	printf("\n");
}

void verificarEstatisticaDeadline(int idTask, double periodo_s, unsigned long codPeriodo, double tempoProcessamento_s)
{
	double tempoUltrapassadoProcessamento_s = tempoProcessamento_s - periodo_s; // tempo de processamento ultrapassado em segundos.

	if(tempoUltrapassadoProcessamento_s > 0)
	{
		if(tempoUltrapassadoProcessamento_s >= maiorDeadlinePerdido.tempoUltrapassadoProcessamento_s || maiorDeadlinePerdido.flagDeadlineSetado == 0)
		{
			maiorDeadlinePerdido.idTask = idTask;
			maiorDeadlinePerdido.codPeriodo = codPeriodo;
			maiorDeadlinePerdido.tempoProcessamento_s = tempoProcessamento_s;
			maiorDeadlinePerdido.tempoUltrapassadoProcessamento_s = tempoUltrapassadoProcessamento_s;
			maiorDeadlinePerdido.flagDeadlineSetado = 1;
		}

		if(tempoUltrapassadoProcessamento_s <= menorDeadlinePerdido.tempoUltrapassadoProcessamento_s || menorDeadlinePerdido.flagDeadlineSetado == 0)
		{
			menorDeadlinePerdido.idTask = idTask;
			menorDeadlinePerdido.codPeriodo = codPeriodo;
			menorDeadlinePerdido.tempoProcessamento_s = tempoProcessamento_s;
			menorDeadlinePerdido.tempoUltrapassadoProcessamento_s = tempoUltrapassadoProcessamento_s;
			menorDeadlinePerdido.flagDeadlineSetado = 1;
		}
	}
}

RTIME getTempoProcessamento(int idTask, RT_TASK *task, unsigned long qtdPeriodosExecutados)
{//CYCLES: pushq+movq+subq = 10 cycles
	RTIME tempoProcessamento = 0; // Conterah o tempo restante que a tarefa tem para concluir sua execucao.
	RTIME tick_timer_atual; // possui o timer do processador RTAI atualizado...
	RTIME periodBase = 0;
	RTIME periodic_resume_time = 0;

	tick_timer_atual = rt_get_time();
	periodBase = rt_cfg_get_period(task) * qtdPeriodosExecutados;
	//TODO: comparar o periodBase com o periodic_resume_time...
	periodic_resume_time = rt_cfg_get_periodic_resume_time(task);

	tempoProcessamento = (count2nano(tick_timer_atual - periodic_resume_time)); // nanosegundo(s)
	return(tempoProcessamento);
}//CYCLES: movq+addq+popq+popq+ret = 15 cycles

RTIME getTempoRestanteProcessamento(int idTask, RT_TASK *task)
{//CYCLES: pushq+pushq+pushq+addq = 10 cycles
	RTIME tempoRestanteProcessamento = 0; // Conterah o tempo restante que a tarefa tem para concluir sua execucao.
	RTIME tick_timer_atual; // possui o timer do processador RTAI atualizado...
	RTIME period = 0;
	RTIME periodic_resume_time = 0;

	tick_timer_atual = rt_get_time();
	period = rt_cfg_get_period(task);
	periodic_resume_time = rt_cfg_get_periodic_resume_time(task);

	tempoRestanteProcessamento = (count2nano(periodic_resume_time + period - tick_timer_atual)); // nanosegundo(s)
	return(tempoRestanteProcessamento);
}//CYCLES: subq+popq+popq+popq+ret = 21 cycles

unsigned int reajustarCpuFreq(int idTask, RT_TASK *task, long int RWCEC)
{//CYCLES: pushq+movq+pushq+movq+pushq+movl+subq = 22 cycles
	double cpu_frequency_target = 0.0; // Conterah a frequencia que o processador terah que assumir para que a tarefa conclua seu processamento dentro do seu deadline.
	double tempoRestanteProcessamento = 0.0; // Conterah o tempo restante que a tarefa tem para concluir sua execucao.
	RTIME tempoRestanteProcessamento_ns = 0;
#if DEBUG == 1
	RTIME tick_timer_atual; // possui o timer do processador RTAI atualizado...
	unsigned long pidTask = rt_cfg_get_pid(task);
#endif

	tempoRestanteProcessamento_ns = getTempoRestanteProcessamento(idTask, task); //CYCLES: call+getTempoRestanteProcessamento() = 45 cycles
	tempoRestanteProcessamento = tempoRestanteProcessamento_ns / 1000000000.0; // Transformando de nanosegundo(s) para segundo(s) (10^9). //CYCLES: divsd = 16 cycles
	if(tempoRestanteProcessamento > 0)//CYCLES: movapd+movapd+movsd+andpd+andnpd+movapd+orpd = 20 cycles
	{
#if DEBUG == 1
		tick_timer_atual = rt_get_time();
		printf("%s[TASK %d] [%lu] - cpu_frequency_target = RWCEC(%ld) / TRP(%f) ===> TIMER(%llu)\n", arrayTextoCorIdTask[idTask], idTask, pidTask, RWCEC, tempoRestanteProcessamento, count2nano(tick_timer_atual));//CYCLES: movsd+movslq+movq+leaq+movq+movapd+movl+movl+movl+call = 31 cycles
#endif
		cpu_frequency_target = (RWCEC / tempoRestanteProcessamento) ; // Unidade: Ciclos/segundo (a conversao para segundos foi feita acima 10^9) //CYCLES: divsd+movsd+divsd = 37 cycles
		cpu_frequency_target = cpu_frequency_target / 1000.0; // Unidade: Khz (convertendo para de Hz para KHz) //CYCLES: divsd = 16 cycles
	}
	else /* QUER DIZER QUE A TAREFA ESTA COM O DEADLINE VIOLADO... :( -> ATRIBUI A MAIOR FREQUENCIA... */
	{
		cpu_frequency_target = FREQUENCIA_MAXIMA_PROCESSADOR;
#if DEBUG == 1
		tick_timer_atual = rt_get_time();
		printf("%s[TASK %d] [%lu] - cpu_frequency_target = RWCEC(%ld) / TRP(%f) ===> TIMER(%llu)\n", arrayTextoCorIdTask[idTask], idTask, pidTask, RWCEC, tempoRestanteProcessamento, count2nano(tick_timer_atual));//CYCLES: movsd+movslq+movq+leaq+movq+movapd+movl+movl+movl+call = 31 cycles
#endif
	}

	rt_cfg_set_cpu_frequency(task, (int) cpu_frequency_target);
	return(cpu_frequency_target);
}//CYCLES: addq+popq+popq+popq+ret = 18 cycles

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
	double energiaTotalConsumida_nj = 0; // Nano Joules (nJ)
	double energiaTotalConsumida_j = 0; // Joules (J)
	unsigned long qtdTotalCiclosFrequencia = 0; // segundos -> (USERTIME_UNIT * 10ms)
	unsigned long tempoUtilizacaoFrequencia_usertime = 0; // usertime units
	unsigned long tempoUtilizacaoFrequencia_s = 0; // segundos -> (USERTIME_UNIT * 10ms)
	unsigned long total_trans;

	total_trans = after_total_trans - before_total_trans;

	printf("\n-> Estatísticas do Processador...\n\n");
	if (beforeStats && afterStats) {
		printf("** cpufreq stats: **\n");
		while (beforeStats && afterStats) {
			printf("-> ");
			if(beforeStats->frequency == afterStats->frequency)
			{
				print_speed(beforeStats->frequency); //KHz
				tempoUtilizacaoFrequencia_usertime = afterStats->time_in_state - beforeStats->time_in_state;
				printf(": %.10f%%", (100.0 * tempoUtilizacaoFrequencia_usertime) / total_time);

				// Calculando consumo de energia do experimento...
				tempoUtilizacaoFrequencia_s = tempoUtilizacaoFrequencia_usertime * 10; // segundos
				qtdTotalCiclosFrequencia = (beforeStats->frequency * 1000) * tempoUtilizacaoFrequencia_s; // (Hz) * tempo em segundos
				switch(beforeStats->frequency)
				{
					case 3000000: // 3.0 GHz
						energiaTotalConsumida_nj += AMD_ATHLON_II_X2_250_CAPACITANCIA * qtdTotalCiclosFrequencia * (AMD_ATHLON_II_X2_250_TENSAO_FREQ_3000000_KHZ * AMD_ATHLON_II_X2_250_TENSAO_FREQ_3000000_KHZ);
					break;
					case 2300000: // 2.3 GHz
						energiaTotalConsumida_nj += AMD_ATHLON_II_X2_250_CAPACITANCIA * qtdTotalCiclosFrequencia * (AMD_ATHLON_II_X2_250_TENSAO_FREQ_2300000_KHZ * AMD_ATHLON_II_X2_250_TENSAO_FREQ_2300000_KHZ);
					break;
					case 1800000: // 1.8 GHz
						energiaTotalConsumida_nj += AMD_ATHLON_II_X2_250_CAPACITANCIA * qtdTotalCiclosFrequencia * (AMD_ATHLON_II_X2_250_TENSAO_FREQ_1800000_KHZ * AMD_ATHLON_II_X2_250_TENSAO_FREQ_1800000_KHZ);
					break;
					case 800000: // 800 MHz
						energiaTotalConsumida_nj += AMD_ATHLON_II_X2_250_CAPACITANCIA * qtdTotalCiclosFrequencia * (AMD_ATHLON_II_X2_250_TENSAO_FREQ_800000_KHZ * AMD_ATHLON_II_X2_250_TENSAO_FREQ_800000_KHZ);
					break;
					default:
						printf(" -> ERROR: frequências inválidas no calculo da energia consumida! :(");
					break;
				}
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

		energiaTotalConsumida_j = energiaTotalConsumida_nj / 1000000000.0;
		printf("\nCONSUMO TOTAL DE ENERGIA: %.5f J (joules) \n", energiaTotalConsumida_j);

		printf("\n\n");
	}
}

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
int InitializeCnt(RT_TASK *Task_Cnt, int idTask, int idSubTask, matrixCnt Array)
{
	register int OuterIndex, InnerIndex;

	for (OuterIndex = 0; OuterIndex < MAXSIZE; OuterIndex++) //CYCLES: xorl + addl + addq + cmpl + jne = 8 cycles
		for (InnerIndex = 0; InnerIndex < MAXSIZE; InnerIndex++) //CYCLES: cmpq + jne = 5 cycles
			Array[OuterIndex][InnerIndex] = RandomIntegerCnt(); //CYCLES: call + movl + addq = 7 cycles

	RWCEC_Cnt[idSubTask] = RWCEC_Cnt[idSubTask] - 588056000; // Quantidade de ciclos da inicializacao do array.

#if FLAG_HABILITAR_RAW_MONITOR == 1
	rt_cfg_set_rwcec(Task_Cnt, RWCEC_Cnt[idSubTask]);
#endif
	return 0;
}

void SumCnt(RT_TASK *Task_Cnt, int idTask, int idSubTask, matrixCnt Array)
{
#if DEBUG == 1
	unsigned long pidTask = rt_cfg_get_pid(Task_Cnt);
#endif

	unsigned int cpuFrequencyAtual = 0; // KHz

	register int Outer, Inner;

	int Ptotal = 0; /* changed these to locals in order to drive worst case */
	int Ntotal = 0;
	int Pcnt = 0;
	int Ncnt = 0;
	int porcentagemProcessamento = 0;
	int porcentagemProcessamentoAnterior = -1;

	for (Outer = 0; Outer < MAXSIZE; Outer++) //CYCLES: xorl + jmp + cmpl + jne = 10 cycles
	{
		for (Inner = 0; Inner < MAXSIZE; Inner++) //CYCLES: cmpq + je + cmpq + jne = 7 cycles
		{
			if (Array[Outer][Inner] >= 0) { //CYCLES: movl + testl + jns  = 8 cycles
				Ptotal += Array[Outer][Inner]; //CYCLES: addl = 1 cycles
				Pcnt++; //CYCLES: addl = 1 cycles
			}
			else {
				Ntotal += Array[Outer][Inner]; //CYCLES: addl = 1 cycles
				Ncnt++; //CYCLES: addl = 1 cycles
			}
		}

		RWCEC_Cnt[idSubTask] = RWCEC_Cnt[idSubTask] - 119010; // Quantidade de ciclos do loop interno. //CYCLES: subq = 4 cycles

		porcentagemProcessamento = (int) ((Outer*MAXSIZE + Inner)*100)/(MAXSIZE*MAXSIZE);
		if(porcentagemProcessamento % 10 == 0 && porcentagemProcessamento != porcentagemProcessamentoAnterior)
		{
			cpuFrequencyAtual = rt_cfg_cpufreq_get(CPUID_RTAI);
			cpuFrequencyAtual_Cnt = rt_cfg_get_cpu_frequency(Task_Cnt);//CYCLES: movl = 3 cycles
			porcentagemProcessamentoAnterior = porcentagemProcessamento;
#if DEBUG == 1
			printf("%s[TASK %d] [%lu] Processando... %3d%% ==============> Freq: %8d Khz ==============> Curr Freq: %8d Khz\n", arrayTextoCorIdTask[idTask], idTask, pidTask, porcentagemProcessamento, cpuFrequencyAtual_Cnt, cpuFrequencyAtual); //CYCLES: movl+movl+movq+movl+movslq+leaq+xorl+call = 21 cycles
#endif
#if FLAG_HABILITAR_RAW_MONITOR == 1
			rt_cfg_set_rwcec(Task_Cnt, RWCEC_Cnt[idSubTask]);
#endif
		}
	}

	Postotal = Ptotal;
	Poscnt = Pcnt;
	Negtotal = Ntotal;
	Negcnt = Ncnt;
}

int TestCnt(RT_TASK *Task_Cnt, int idTask, int idSubTask, matrixCnt Array)
{
	InitializeCnt(Task_Cnt, idTask, idSubTask, Array);
	SumCnt(Task_Cnt, idTask, idSubTask, Array);

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
	RT_TASK *Task_Cnt;
	struct thread_param *config = (struct thread_param*) arg;
	int idTask = config->idTask;
	int idSubTask = config->idSubTask;
	unsigned long pidTask = 0;

	RTIME tempoProcessamento_ns = 0;
	double tempoProcessamento_s;
#if FLAG_CALCULAR_FREQUENCIA_INICIAL_IDEAL == 1
	RTIME tempoRestanteProcessamento_ns = 0;
#endif

	RTIME tick_timer_atual; // possui o timer do processador RTAI atualizado...
	RTIME periodic_resume_time = 0;

	RTIME Tinicio;
	double Tperiodo_s = 0.0;
	int prioridade = idTask + 1;

	//if(!(Task_Cnt = rt_thread_init(nam2num("TSKCNT"), prioridade, 0, SCHED_FIFO, CPU_ALLOWED)))
	if(!(Task_Cnt = rt_thread_init(idTask, prioridade, 0, SCHED_FIFO, CPU_ALLOWED)))
	{
		printf("[ERRO] Não foi possível criar a tarefa CNT [%d] (C-Benchmark).\n", idTask);
		exit(1);
	}

	Tinicio = start_timeline;
	Tperiodo_Cnt = tick_period * 180; // ~= 9 segundos (PERIODO == DEADLINE)
	//Tperiodo_Cnt = tick_period * 201; // ~= 10 segundos (PERIODO == DEADLINE)
	Tperiodo_s = count2nano(Tperiodo_Cnt)/1000000000.0;

	rt_allow_nonroot_hrt();
	rt_task_make_periodic(Task_Cnt, Tinicio, Tperiodo_Cnt);
	rt_change_prio(Task_Cnt, prioridade);

	pidTask = rt_cfg_get_pid(Task_Cnt);
	printf("%s[TASK %d] [%lu] Criada com Sucesso  =============== PERIODO => %llu count => %.10f segundos \n", arrayTextoCorIdTask[idTask], idTask, pidTask, Tperiodo_Cnt, Tperiodo_s);

#if FLAG_HABILITAR_TIMER_EXPERIMENTO == 0 // por ciclos de execucao
	while(qtdPeriodosCnt[idSubTask] <= qtdMaxPeriodosCnt)
#else // por tempo de execucao
	while(!flagFimExecucao)
#endif
	{
#if DEBUG == 1
		tick_timer_atual = rt_get_time();
		periodic_resume_time = rt_cfg_get_periodic_resume_time(Task_Cnt);
		printf("%s[TASK %d] [%lu] ################### NOVA EXECUCAO (%lu) ####### RESUME_PERIOD(%llu) ####### START_TIMER(%llu) ####### \n", arrayTextoCorIdTask[idTask], idTask, pidTask, qtdPeriodosCnt[idSubTask], periodic_resume_time, tick_timer_atual);
#endif
		// Inicializando WCEC e RWCEC...
		WCEC_Cnt[idSubTask] = WCEC_CNT;
		RWCEC_Cnt[idSubTask] = WCEC_CNT;
		SEC_Cnt[idSubTask] = 0;

		// Inicializando informacoes importantes para o gerenciamento do Governor.
#if FLAG_CALCULAR_FREQUENCIA_INICIAL_IDEAL == 1
		tempoRestanteProcessamento_ns = getTempoRestanteProcessamento(idTask, Task_Cnt); //CYCLES = 42 cycles
		if(tempoRestanteProcessamento_ns > 0)
		{
			cpuFrequencyInicial_Cnt = abs((WCEC_Cnt[idSubTask] / (tempoRestanteProcessamento_ns/1000000000.0))/1000.0); // KHz //CYCLES: divsd+movq+divsd+divsd+movl+sarl+xorl+subl+movl = 66 cycles
		}
		else
		{
			/* OBS.:
			 * QUER DIZER QUE O DEADLINE DA TAREFA FOI VIOLADO... ENTAO EH APLICADO A MAIOR FREQUENCIA DO PROCESSADOR...
			 * PARA NAO ATRASAR A EXECUCAO DAS DEMAIS TAREFAS.
			 **/
			cpuFrequencyInicial_Cnt = FREQUENCIA_MAXIMA_PROCESSADOR;
		}
#endif

#if FLAG_HABILITAR_RAW_MONITOR == 1
		rt_cfg_init_info(Task_Cnt, WCEC_Cnt[idSubTask], config->cpuFrequencyMin, config->cpuFrequencyInicial, config->cpuVoltageInicial);
#else
		rt_cfg_init_info(Task_Cnt, 0, cpuFrequencyMin_Cnt, cpuFrequencyInicial_Cnt, cpuVoltageInicial_Cnt);
#endif

		/** INICIO: PROCESSANDO A TAREFA... **/
		InitSeedCnt();
		TestCnt(Task_Cnt, idTask, idSubTask, Array);
		/** FIM: PROCESSANDO A TAREFA... **/

		/** CALCULANDO TEMPO DE PROCESSAMENTO DA TAREFA... **/
		tempoProcessamento_ns = getTempoProcessamento(idTask, Task_Cnt, qtdPeriodosCnt[idSubTask]);
		tempoProcessamento_s = tempoProcessamento_ns / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).
#if DEBUG == 1
		printf("%s[TASK %d] [%lu] ##### Tempo Processamento: %.10f \n", arrayTextoCorIdTask[idTask], idTask, pidTask, tempoProcessamento_s);
#endif

		if(tempoProcessamento_s > Tperiodo_s)
		{
			qtdDeadlinesVioladosCnt[idSubTask]++;
#if DEBUG == 1
			printf("%s[TASK %d] [%lu] ##### DEADLINE VIOLADO!!!!!!!!!!!!! Periodo(%lu) Deadlines_Violados(%lu) \n", arrayTextoCorIdTask[idTask], idTask, pidTask, qtdPeriodosCnt[idSubTask], qtdDeadlinesVioladosCnt[idSubTask]);
#endif
			verificarEstatisticaDeadline(idTask, Tperiodo_s, qtdPeriodosCnt[idSubTask], tempoProcessamento_s);
		}
		rt_task_wait_period(); // **** WAIT
		qtdPeriodosCnt[idSubTask]++;
	}

	printf("%s[TASK %d] [%lu] ##### FIM EXECUCAO -> Total Periodos Executados: %lu -> Total Deadlines Violados: %lu\n", arrayTextoCorIdTask[idTask], idTask, pidTask, qtdPeriodosCnt[idSubTask], qtdDeadlinesVioladosCnt[idSubTask]);

	rt_task_delete(Task_Cnt);

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
void InitializeMatMult(RT_TASK *Task_Matmult, int idTask, int idSubTask, matrixMatMult Array, int flagPermitirSecs)
{ //CYCLES: pushq = 3 cycles
	int OuterIndex = 0, InnerIndex = 0;
	int flagInsertSecs = 0;
	int porcentagemProcessamento = 0;
#if FLAG_HABILITAR_SECS == 1
	int limitInferiorSecs = 30; // %
	int limitSuperiorSecs = 50; // %
#endif
	//CYCLES: cmpl + jne = 5 cycles

//	printf("Valores da Matriz: \n\n");
	for (OuterIndex = 0; OuterIndex < UPPERLIMIT; OuterIndex++)  //CYCLES: cmpl + jne = 5 cycles
	{
		//INSERINDO SECs na tarefa Matmult...
		porcentagemProcessamento = (int) ((OuterIndex*UPPERLIMIT + InnerIndex)*100)/(UPPERLIMIT*UPPERLIMIT);
		flagInsertSecs = 0;
#if FLAG_HABILITAR_SECS == 1
		if(flagPermitirSecs && porcentagemProcessamento >= limitInferiorSecs && porcentagemProcessamento <= limitSuperiorSecs) //CYCLES: movl+xorl+testl+je+leal+movl+sarl+imull+sarl+subl+cmpl+setle+movzbl+movq+xorl+jmp = 41 cycles
		{
			flagInsertSecs = 1;
		}
#endif

		for (InnerIndex = 0; InnerIndex < UPPERLIMIT; InnerIndex++) //CYCLES: cmpq+je+addl+addq+movl = 10 cycles
		{
			if(flagInsertSecs) //CYCLES: testl+jne = 5 cycles
			{
				Array[OuterIndex][InnerIndex] = 0; //CYCLES: movl = 3 cycles
			}
			else
			{
				Array[OuterIndex][InnerIndex] = RandomIntegerMatMult(); //CYCLES: addq+addq+movl+call+movl+movl+jmp = 18 cycles
			}
//			printf("(%d)", Array[OuterIndex][InnerIndex]);
		}
	}

	RWCEC_Matmult[idSubTask] = RWCEC_Matmult[idSubTask] - 19569558; // Quantidade de ciclos da inicializacao do array. //CYCLES: movq+subq+movq = 10 cycles

#if FLAG_HABILITAR_RAW_MONITOR == 1
	rt_cfg_set_rwcec(Task_Matmult, RWCEC_Matmult[idSubTask]);
#endif
}

// Multiplies arrays A and B and stores the result in ResultArray.
void MultiplyMatMult(RT_TASK *Task_Matmult, int idTask, int idSubTask, matrixMatMult A, matrixMatMult B, matrixMatMult Res)
{
#if DEBUG == 1
	unsigned long pidTask = rt_cfg_get_pid(Task_Matmult);
#endif
	unsigned int cpuFrequencyAtual = 0; // KHz

	unsigned int cpu_frequency_target = 0; // Conterah a frequencia que o processador terah que assumir para que a tarefa conclua seu processamento dentro do seu deadline.
	int porcentagemProcessamento = 0;
	int porcentagemProcessamentoAnterior = -1;
	int somaColunas = 0;

	register int Outer, Inner, Index;
	for (Outer = 0; Outer < UPPERLIMIT; Outer++) //CYCLES: xorl+xorl+cmpl+jne = 7 cycles
	{
#if FLAG_HABILITAR_SECS == 1
		somaColunas = 0;
		for (Inner = 0; Inner < UPPERLIMIT; Inner++) //CYCLES: cmpq+jne+movq+movq+xorl = 12 cycles
			somaColunas += A[Outer][Inner]; //CYCLES: addl+addq = 2 cycles
#else
		somaColunas = 1;
#endif

		for (Inner = 0; Inner < UPPERLIMIT; Inner++) //CYCLES: addl+addq+cmpl+jne+movq = 10 cycles
		{
			Res[Outer][Inner] = 0; //CYCLES: movl = 3 cycles
			if(somaColunas > 0) // CYCLES: testl+jle+movslq+xorl+leaq+xorl = 12 cycles
			{
				for (Index = 0; Index < UPPERLIMIT; Index++) //CYCLES: cmpq+jne = 5 cycles
					Res[Outer][Inner] += A[Outer][Index] * B[Index][Inner]; //CYCLES: movl+addq+imull+addq+addl+movl = 10 cycles
			}
			else // se for igual a zero... significa q a linha esta toda zerada...
			{
				SEC_Matmult[idSubTask] = SEC_Matmult[idSubTask] + 11550; //CYCLES: addq+jmp = 5 cycles
			}
		}

		RWCEC_Matmult[idSubTask] = RWCEC_Matmult[idSubTask] - 8923537; // cycles //CYCLES: movq+subq+movq = 10 cycles

		porcentagemProcessamento = (int) ((Outer*UPPERLIMIT*UPPERLIMIT + Inner*UPPERLIMIT + Index)*100)/(UPPERLIMIT*UPPERLIMIT*UPPERLIMIT); //CYCLES: movl+movl+movl+sarl+idivl+movl = 35 cycles
		if(porcentagemProcessamento % 10 == 0 && porcentagemProcessamento != porcentagemProcessamentoAnterior) //CYCLES: movl+movl+sarl+idivl+testl+je+cmpl+je = 39 cycles
		{
#if FLAG_HABILITAR_RAW_MONITOR == 1
			rt_cfg_set_rwcec(Task_Matmult, RWCEC_Matmult[idSubTask]);
#endif
			// PONTOS DE CONTROLE DO MATMULT
			porcentagemProcessamentoAnterior = porcentagemProcessamento;
			if(porcentagemProcessamento == 30 || porcentagemProcessamento == 60)// || porcentagemProcessamento == 90) //CYCLES: cmpl+je+cmpl+jne = 10 cycles
			{
#if FLAG_HABILITAR_PONTOS_CONTROLE == 1
				cpu_frequency_target = reajustarCpuFreq(idTask, Task_Matmult, RWCEC_Matmult[idSubTask]); //CYCLES: movq+movq+movl+call+movl = 15+reajustarCpuFreq() = 15 + 205 = 220 cycles
#endif
#if DEBUG == 1
				cpuFrequencyAtual = rt_cfg_cpufreq_get(CPUID_RTAI);
				cpuFrequencyAtual_Matmult = rt_cfg_get_cpu_frequency(Task_Matmult); //CYCLES: movl = 3 cycles
				printf("%s[TASK %d] [%lu] Processando... %3d%% ==============> Freq: %8d Khz ==============> Curr Freq: %8d Khz ==============> Freq CALCULADA: %8d Khz\n", arrayTextoCorIdTask[idTask], idTask, pidTask, porcentagemProcessamento, cpuFrequencyAtual_Matmult, cpuFrequencyAtual, cpu_frequency_target); //CYCLES: movl+movl+movl+movl+movslq+movl+movl+leaq+xorl+call+movl+jmp = 35 cycles
#endif
			}
			else
			{
#if DEBUG == 1
				cpuFrequencyAtual = rt_cfg_cpufreq_get(CPUID_RTAI);
				cpuFrequencyAtual_Matmult = rt_cfg_get_cpu_frequency(Task_Matmult); //CYCLES: movl = 3 cycles
				printf("%s[TASK %d] [%lu] Processando... %3d%% ==============> Freq: %8d Khz ==============> Curr Freq: %8d Khz\n", arrayTextoCorIdTask[idTask], idTask, pidTask, porcentagemProcessamento, cpuFrequencyAtual_Matmult, cpuFrequencyAtual); //CYCLES: addl+addq+movl+movl+movq+movl+movslq+leaq+xorl+call+movl+jmp = 31 cycles
#endif
			}
		}
	}
}

/*
 * Runs a multiplication test on an array.  Calculates and prints the
 * time it takes to multiply the matrices.
 */
void TestMatMult(RT_TASK *Task_Matmult, int idTask, int idSubTask, matrixMatMult A, matrixMatMult B, matrixMatMult Res)
{
	InitializeMatMult(Task_Matmult, idTask, idSubTask, A, VALOR_HABILITAR_SECS);
	InitializeMatMult(Task_Matmult, idTask, idSubTask, B, VALOR_DESABILITAR_SECS);

	MultiplyMatMult(Task_Matmult, idTask, idSubTask, A, B, Res);
}

// Initializes the seed used in the random number generator.
void InitSeedMatMult(int idTask, int idSubTask)
{
	/* ***UPPSALA WCET***: changed Thomas Ls code to something simpler.
	SeedMatMult = KNOWN_VALUE - 1; */
	SeedMatMult = 1; //CYCLES: movl+movl = 6 cycles

	RWCEC_Matmult[idSubTask] = RWCEC_Matmult[idSubTask] - 33; //CYCLES: movl+movl+ret = 11 cycles
}

void *init_task_matmult(void *arg)
{
	RT_TASK *Task_Matmult;
	struct thread_param *config = (struct thread_param*) arg;
	int idTask = config->idTask;
	int idSubTask = config->idSubTask;
	unsigned long pidTask = 0;

	RTIME tempoProcessamento_ns = 0;
	double tempoProcessamento_s;
#if FLAG_CALCULAR_FREQUENCIA_INICIAL_IDEAL == 1
	RTIME tempoRestanteProcessamento_ns = 0;
#endif

	RTIME tick_timer_atual; // possui o timer do processador RTAI atualizado...
	RTIME periodic_resume_time = 0;

	RTIME Tinicio;
	double Tperiodo_s = 0.0;;
	int prioridade = idTask + 1;

	//if(!(Task_Matmult = rt_thread_init(nam2num("TSKMAT"), prioridade, 0, SCHED_FIFO, CPU_ALLOWED)))
	if(!(Task_Matmult = rt_thread_init(idTask, prioridade, 0, SCHED_FIFO, CPU_ALLOWED)))
	{
		printf("[ERRO] Não foi possível criar a tarefa MatMult (C-Benchmark).\n");
		exit(1);
	}

	Tinicio = start_timeline;
	//Tperiodo_Matmult = tick_period * 160; // ~= 8 segundos (PERIODO == DEADLINE)
	Tperiodo_Matmult = tick_period * 160; // ~= 8 segundos (PERIODO == DEADLINE)
	Tperiodo_s = count2nano(Tperiodo_Matmult)/1000000000.0;

	rt_allow_nonroot_hrt();
	rt_task_make_periodic(Task_Matmult, Tinicio, Tperiodo_Matmult);
	rt_change_prio(Task_Matmult, prioridade);

	pidTask = rt_cfg_get_pid(Task_Matmult);
	printf("%s[TASK %d] [%lu] Criada com Sucesso  =============== PERIODO => %llu count => %.10f segundos\n", arrayTextoCorIdTask[idTask], idTask, pidTask, Tperiodo_Matmult, Tperiodo_s);

#if FLAG_HABILITAR_TIMER_EXPERIMENTO == 0 // por ciclos de execucao
	while(qtdPeriodosMatmult[idSubTask] <= qtdMaxPeriodosMatmult)
#else // por tempo de execucao
	while(!flagFimExecucao)
#endif
	{
#if DEBUG == 1
		tick_timer_atual = rt_get_time();
		periodic_resume_time = rt_cfg_get_periodic_resume_time(Task_Matmult);
		printf("%s[TASK %d] [%lu] ################### NOVA EXECUCAO (%lu) ####### RESUME_PERIOD(%llu) ####### START_TIMER(%llu) ####### \n", arrayTextoCorIdTask[idTask], idTask, pidTask, qtdPeriodosMatmult[idSubTask], periodic_resume_time, tick_timer_atual);
#endif
		// Inicializando WCEC e RWCEC...
		WCEC_Matmult[idSubTask] = WCEC_MATMULT;
		RWCEC_Matmult[idSubTask] = WCEC_MATMULT;
		SEC_Matmult[idSubTask] = 0;

		// Inicializando informacoes importantes para o gerenciamento do Governor.
#if FLAG_CALCULAR_FREQUENCIA_INICIAL_IDEAL == 1
		tempoRestanteProcessamento_ns = getTempoRestanteProcessamento(idTask, Task_Matmult); //CYCLES = 42 cycles
		if(tempoRestanteProcessamento_ns > 0)
		{
			cpuFrequencyInicial_Matmult = abs((WCEC_Matmult[idSubTask] / (tempoRestanteProcessamento_ns/1000000000.0))/1000.0); // KHz  //CYCLES: divsd+movq+divsd+divsd+movl+sarl+xorl+subl+movl = 66 cycles
		}
		else
		{
			/* OBS.:
			 * QUER DIZER QUE O DEADLINE DA TAREFA FOI VIOLADO... ENTAO EH APLICADO A MAIOR FREQUENCIA DO PROCESSADOR...
			 * PARA NAO ATRASAR A EXECUCAO DAS DEMAIS TAREFAS.
			 **/
			cpuFrequencyInicial_Matmult = FREQUENCIA_MAXIMA_PROCESSADOR;
		}
#endif

#if FLAG_HABILITAR_RAW_MONITOR == 1
		rt_cfg_init_info(Task_Matmult, WCEC_Matmult[idSubTask], config->cpuFrequencyMin, config->cpuFrequencyInicial, config->cpuVoltageInicial);
#else
		rt_cfg_init_info(Task_Matmult, 0, cpuFrequencyMin_Matmult, cpuFrequencyInicial_Matmult, cpuVoltageInicial_Matmult);
#endif

		/** INICIO: PROCESSANDO A TAREFA... **/
		InitSeedMatMult(idTask, idSubTask);
		TestMatMult(Task_Matmult, idTask, idSubTask, ArrayA, ArrayB, ResultArray);
		/** FIM: PROCESSANDO A TAREFA... **/

		/** CALCULANDO TEMPO DE PROCESSAMENTO DA TAREFA... **/
		tempoProcessamento_ns = getTempoProcessamento(idTask, Task_Matmult, qtdPeriodosMatmult[idSubTask]);
		tempoProcessamento_s = tempoProcessamento_ns / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).
#if DEBUG == 1
		printf("%s[TASK %d] [%lu] ##### Tempo Processamento: %.10f \n", arrayTextoCorIdTask[idTask], idTask, pidTask, tempoProcessamento_s);
#endif

		if(tempoProcessamento_s > Tperiodo_s)
		{
			qtdDeadlinesVioladosMatmult[idSubTask]++;
#if DEBUG == 1
			printf("%s[TASK %d] [%lu] @@@@@@@@@@@@@@@ ==> DEADLINE VIOLADO!!!!!!!!!!!!! Periodo(%lu) Deadlines_Violados(%lu) \n", arrayTextoCorIdTask[idTask], idTask, pidTask, qtdPeriodosMatmult[idSubTask], qtdDeadlinesVioladosMatmult[idSubTask]);
#endif
			verificarEstatisticaDeadline(idTask, Tperiodo_s, qtdPeriodosMatmult[idSubTask], tempoProcessamento_s);
		}

		rt_task_wait_period(); // **** WAIT
		qtdPeriodosMatmult[idSubTask]++;
	}

	printf("%s[TASK %d] [%lu] ##### FIM EXECUCAO -> Total Periodos Executados: %lu -> Total Deadlines Violados: %lu\n", arrayTextoCorIdTask[idTask], idTask, pidTask, qtdPeriodosMatmult[idSubTask], qtdDeadlinesVioladosMatmult[idSubTask]);

	rt_task_delete(Task_Matmult);

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
#define FALSE 0
#define TRUE 1
#define NUMELEMS 10000
#define MAXDIM   (NUMELEMS+1)

// Globals
int ArrayBsort[MAXDIM], Seed;
int factor;

// Initializes given array with randomly generated integers.
void InitializeBsort(int idTask, int idSubTask, int Array[MAXDIM])
{
	int  Index, fact;

	factor = -1; //CYCLES: movl+movl+movl+movl+movl = 15 cycles

	fact = factor;
	for (Index = 1; Index <= NUMELEMS; Index ++) //CYCLES: cmpl+jne+cmpl+jne = 10 cycles
		Array[Index] = Index * fact * KNOWN_VALUE; //CYCLES: movl+subl+addq+movl+subl+addq = 16 cycles

	RWCEC_Bsort[idSubTask] = RWCEC_Bsort[idSubTask] - 260034; //CYCLES: subq+movq+ret+subq+movq = 19 cycles
}

// Sorts an array of integers of size NUMELEMS in ascending order.
void BubbleSort(RT_TASK *Task_Bsort, int idTask, int idSubTask, int Array[MAXDIM])
{ //CYCLES: pushq+movl+pushq+movq+pushq+movl+pushq+pushq+pushq+movl+subq = 34 cycles
#if DEBUG == 1
	unsigned long pidTask = rt_cfg_get_pid(Task_Bsort);
#endif
	unsigned int cpuFrequencyAtual = 0; // KHz

	int Sorted = FALSE;
	int Temp, /** LastIndex,**/ Index, i;

	int porcentagemProcessamento = 0;
	int porcentagemProcessamentoAnterior = -1;

	for (i = 1; i <= NUMELEMS-1; i++) //CYCLES: movq+movl+movl+jmp+subl+jne = 18 cycles
	{
		Sorted = TRUE;
		for (Index = 1; Index <= NUMELEMS-1; Index ++) //CYCLES: addl+addq+cmpl+je = 7 cycles
		{
//			if (Index > NUMELEMS-i) //CYCLES: cmpl+jge = 5 cycles
//				break;

			if (Array[Index] >= Array[Index + 1]) //CYCLES: movl+movl+cmpl+jle = 11 cycles
			{
				Temp = Array[Index];
				Array[Index] = Array[Index+1]; //CYCLES: movl = 3 cycles
				Array[Index+1] = Temp; //CYCLES: movl+xorl = 4 cycles
				Sorted = FALSE;
			}
		}

		RWCEC_Bsort[idSubTask] = RWCEC_Bsort[idSubTask] - 300025; //CYCLES: subq+movq = 7 cycles

		porcentagemProcessamento = (int) ((i*NUMELEMS + Index)*100)/(NUMELEMS*NUMELEMS); //CYCLES: movl+movl+imull+movl+sarl+movl+sarl+subl = 25 cycles
		if(porcentagemProcessamento % 10 == 0 && porcentagemProcessamento != porcentagemProcessamentoAnterior) //CYCLES: movl+movl+imull+movl+sarl+sarl+subl+leal+leal+cmpl+je+cmpl+je = 36 cycles
		{
			cpuFrequencyAtual = rt_cfg_cpufreq_get(CPUID_RTAI);
			cpuFrequencyAtual_Bsort = rt_cfg_get_cpu_frequency(Task_Bsort); //CYCLES: movl = 3 cycles
			porcentagemProcessamentoAnterior = porcentagemProcessamento;
#if DEBUG == 1
			printf("%s[TASK %d] [%lu] Processando... %3d%% ==============> Freq: %8d Khz ==============> Curr Freq: %8d Khz\n", arrayTextoCorIdTask[idTask], idTask, pidTask, porcentagemProcessamento, cpuFrequencyAtual_Bsort, cpuFrequencyAtual); //CYCLES: movl+movl+movl+movl+movslq+leaq+xorl+call = 22 cycles
#endif
#if FLAG_HABILITAR_RAW_MONITOR == 1
			rt_cfg_set_rwcec(Task_Bsort, RWCEC_Bsort[idSubTask]);
#endif
		}

		if (Sorted)
			break;
	}
}

void *init_task_bsort(void *arg)
{
	RT_TASK *Task_Bsort;
	struct thread_param *config = (struct thread_param*) arg;
	int idTask = config->idTask;
	int idSubTask = config->idSubTask;
	unsigned long pidTask = 0;

	RTIME tempoProcessamento_ns = 0;
	double tempoProcessamento_s;
#if FLAG_CALCULAR_FREQUENCIA_INICIAL_IDEAL == 1
	RTIME tempoRestanteProcessamento_ns = 0;
#endif

	RTIME tick_timer_atual; // possui o timer do processador RTAI atualizado...
	RTIME periodic_resume_time = 0;

	RTIME Tinicio;
	double Tperiodo_s = 0.0;
	int prioridade = idTask + 1;

	//if(!(Task_Bsort = rt_thread_init(nam2num("TSKBSO"), prioridade, 0, SCHED_FIFO, CPU_ALLOWED)))
	if(!(Task_Bsort = rt_thread_init(idTask, prioridade, 0, SCHED_FIFO, CPU_ALLOWED)))
	{
		printf("[ERRO] Não foi possível criar a tarefa Bsort (C-Benchmark).\n");
		exit(1);
	}

	Tinicio = start_timeline;
	Tperiodo_Bsort = tick_period * 180; // ~= 9 segundos (PERIODO == DEADLINE)
	//Tperiodo_Bsort = tick_period * 201; // ~= 10 segundos (PERIODO == DEADLINE)
	Tperiodo_s = count2nano(Tperiodo_Bsort)/1000000000.0;

	rt_allow_nonroot_hrt();
	rt_task_make_periodic(Task_Bsort, Tinicio, Tperiodo_Bsort);
	rt_change_prio(Task_Bsort, prioridade);

	pidTask = rt_cfg_get_pid(Task_Bsort);
	printf("%s[TASK %d] [%lu] Criada com Sucesso  =============== PERIODO => %llu count => %.10f segundos\n", arrayTextoCorIdTask[idTask], idTask, pidTask, Tperiodo_Bsort, Tperiodo_s);

#if FLAG_HABILITAR_TIMER_EXPERIMENTO == 0 // por ciclos de execucao
	while(qtdPeriodosBsort[idSubTask] <= qtdMaxPeriodosBsort)
#else // por tempo de execucao
	while(!flagFimExecucao)
#endif
	{
#if DEBUG == 1
		tick_timer_atual = rt_get_time();
		periodic_resume_time = rt_cfg_get_periodic_resume_time(Task_Bsort);
		printf("%s[TASK %d] [%lu] ################### NOVA EXECUCAO (%lu) ####### RESUME_PERIOD(%llu) ####### START_TIMER(%llu) ####### \n", arrayTextoCorIdTask[idTask], idTask, pidTask, qtdPeriodosBsort[idSubTask], periodic_resume_time, tick_timer_atual);
#endif
		// Inicializando WCEC e RWCEC...
		WCEC_Bsort[idSubTask] = WCEC_BSORT;
		RWCEC_Bsort[idSubTask] = WCEC_BSORT;
		SEC_Bsort[idSubTask] = 0;

		// Inicializando informacoes importantes para o gerenciamento do Governor.
#if FLAG_CALCULAR_FREQUENCIA_INICIAL_IDEAL == 1
		tempoRestanteProcessamento_ns = getTempoRestanteProcessamento(idTask, Task_Bsort); //CYCLES = 42 cycles
		if(tempoRestanteProcessamento_ns > 0)
		{
			cpuFrequencyInicial_Bsort = abs((WCEC_Bsort[idSubTask] / (tempoRestanteProcessamento_ns/1000000000.0))/1000.0); // KHz  //CYCLES: divsd+movq+divsd+divsd+movl+sarl+xorl+subl+movl = 66 cycles
		}
		else
		{
			/* OBS.:
			 * QUER DIZER QUE O DEADLINE DA TAREFA FOI VIOLADO... ENTAO EH APLICADO A MAIOR FREQUENCIA DO PROCESSADOR...
			 * PARA NAO ATRASAR A EXECUCAO DAS DEMAIS TAREFAS.
			 **/
			cpuFrequencyInicial_Bsort = FREQUENCIA_MAXIMA_PROCESSADOR;
		}
#endif

#if FLAG_HABILITAR_RAW_MONITOR == 1
		rt_cfg_init_info(Task_Bsort, WCEC_Bsort[idSubTask], config->cpuFrequencyMin, config->cpuFrequencyInicial, config->cpuVoltageInicial);
#else
		rt_cfg_init_info(Task_Bsort, 0, cpuFrequencyMin_Bsort, cpuFrequencyInicial_Bsort, cpuVoltageInicial_Bsort);
#endif

		/** INICIO: PROCESSANDO A TAREFA... **/
		InitializeBsort(idTask, idSubTask, ArrayBsort);
		BubbleSort(Task_Bsort, idTask, idSubTask, ArrayBsort);
		/** FIM: PROCESSANDO A TAREFA... **/

		/** CALCULANDO TEMPO DE PROCESSAMENTO DA TAREFA... **/
		tempoProcessamento_ns = getTempoProcessamento(idTask, Task_Bsort, qtdPeriodosBsort[idSubTask]);
		tempoProcessamento_s = tempoProcessamento_ns / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).
#if DEBUG == 1
		printf("%s[TASK %d] [%lu] ##### Tempo Processamento: %.10f \n", arrayTextoCorIdTask[idTask], idTask, pidTask, tempoProcessamento_s);
#endif

		if(tempoProcessamento_s > Tperiodo_s)
		{
			qtdDeadlinesVioladosBsort[idSubTask]++;
#if DEBUG == 1
			printf("%s[TASK %d] [%lu] ##### DEADLINE VIOLADO!!!!!!!!!!!!! Periodo(%lu) Deadlines_Violados(%lu) \n", arrayTextoCorIdTask[idTask], idTask, pidTask, qtdPeriodosBsort[idSubTask], qtdDeadlinesVioladosBsort[idSubTask]);
#endif
			verificarEstatisticaDeadline(idTask, Tperiodo_s, qtdPeriodosBsort[idSubTask], tempoProcessamento_s);
		}

		rt_task_wait_period(); // **** WAIT
		qtdPeriodosBsort[idSubTask]++;
	}

	printf("%s[TASK %d] [%lu] ##### FIM EXECUCAO -> Total Periodos Executados: %lu -> Total Deadlines Violados: %lu\n", arrayTextoCorIdTask[idTask], idTask, pidTask, qtdPeriodosBsort[idSubTask], qtdDeadlinesVioladosBsort[idSubTask]);

	rt_task_delete(Task_Bsort);

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
	RT_TASK *Task_CpuStats;
	struct thread_param *config = (struct thread_param*) arg;
	int idTask = config->idTask;
	//int idSubTask = config->idSubTask;
	unsigned long pidTask = 0;

#if FLAG_HABILITAR_TIMER_EXPERIMENTO == 0 // por ciclos de execucao
	int contTasks = 0;
	int flagTerminoExperimentoGeral = 1;
#endif

	unsigned int cpuFrequencyAtual = 0; // KHz
	int multiplicadorEstatisticasParciais = 1;

	RTIME tempoProcessamento_ns = 0;
	double tempoProcessamento_s;
#if FLAG_CALCULAR_FREQUENCIA_INICIAL_IDEAL == 1
	RTIME tempoRestanteProcessamento_ns = 0;
#endif

	RTIME tick_timer_atual; // possui o timer do processador RTAI atualizado...
	RTIME periodic_resume_time = 0;

	RTIME Tinicio;
	double Tperiodo_s = 0.0;
	int prioridade = idTask + 1;

	if(!(Task_CpuStats = rt_thread_init(nam2num("TSKCPU"), prioridade, 0, SCHED_FIFO, CPU_ALLOWED)))
	{
		printf("[ERRO] Não foi possível criar a tarefa Cpu Stats.\n");
		exit(1);
	}

	Tinicio = start_timeline;
	Tperiodo_CpuStats = tick_period * 180; // ~= 9 segundos (PERIODO == DEADLINE)
	//Tperiodo_CpuStats = tick_period * 201; // ~= 10 segundos (PERIODO == DEADLINE)
	Tperiodo_s = count2nano(Tperiodo_CpuStats)/1000000000.0;

	rt_allow_nonroot_hrt();
	rt_task_make_periodic(Task_CpuStats, Tinicio, Tperiodo_CpuStats);
	rt_change_prio(Task_CpuStats, prioridade);

	pidTask = rt_cfg_get_pid(Task_CpuStats);
	printf("%s[TASK %d] [%lu] Criada com Sucesso  =============== PERIODO => %llu count => %.10f segundos\n", arrayTextoCorIdTask[idTask], idTask, pidTask, Tperiodo_CpuStats, Tperiodo_s);

	while(!flagFimExecucao)
	{
#if DEBUG == 1
		tick_timer_atual = rt_get_time();
		periodic_resume_time = rt_cfg_get_periodic_resume_time(Task_CpuStats);
		printf("%s[TASK %d] [%lu] ################### NOVA EXECUCAO (%lu) ####### RESUME_PERIOD(%llu) ####### START_TIMER(%llu) ####### \n", arrayTextoCorIdTask[idTask], idTask, pidTask, qtdPeriodosCpuStats, periodic_resume_time, tick_timer_atual);
#endif
		// Inicializando WCEC e RWCEC...
		WCEC_CpuStats = WCEC_CPUSTATS;
		RWCEC_CpuStats = WCEC_CPUSTATS;
		SEC_CpuStats = 0;

		// Inicializando informacoes importantes para o gerenciamento do Governor.
#if FLAG_CALCULAR_FREQUENCIA_INICIAL_IDEAL == 1
		tempoRestanteProcessamento_ns = getTempoRestanteProcessamento(idTask, Task_CpuStats); //CYCLES = 42 cycles
		if(tempoRestanteProcessamento_ns > 0)
		{
			cpuFrequencyInicial_CpuStats = abs((WCEC_CpuStats / (tempoRestanteProcessamento_ns/1000000000.0))/1000.0); // KHz  //CYCLES: divsd+movq+divsd+divsd+movl+sarl+xorl+subl+movl = 66 cycles
		}
		else
		{
			/* OBS.:
			 * QUER DIZER QUE O DEADLINE DA TAREFA FOI VIOLADO... ENTAO EH APLICADO A MAIOR FREQUENCIA DO PROCESSADOR...
			 * PARA NAO ATRASAR A EXECUCAO DAS DEMAIS TAREFAS.
			 **/
			cpuFrequencyInicial_CpuStats = FREQUENCIA_MAXIMA_PROCESSADOR;
		}
#endif

#if FLAG_HABILITAR_RAW_MONITOR == 1
		rt_cfg_init_info(Task_CpuStats, WCEC_CpuStats, config->cpuFrequencyMin, config->cpuFrequencyInicial, config->cpuVoltageInicial);
#else
		rt_cfg_init_info(Task_CpuStats, 0, cpuFrequencyMin_CpuStats, cpuFrequencyInicial_CpuStats, cpuVoltageInicial_CpuStats);
#endif

#if DEBUG == 1
		cpuFrequencyAtual = rt_cfg_cpufreq_get(CPUID_RTAI);
		cpuFrequencyAtual_CpuStats = rt_cfg_get_cpu_frequency(Task_CpuStats);
		printf("%s[TASK %d] [%lu] Processando... 100%% ==============> Freq: %8d Khz ==============> Curr Freq: %8d Khz\n", arrayTextoCorIdTask[idTask], idTask, pidTask, cpuFrequencyAtual_CpuStats, cpuFrequencyAtual);
#endif

		/** INICIO: PROCESSANDO A TAREFA... CALCULANDO O TEMPO TOTAL DE EXECUCAO DO EXPERIMENTO. **/
		timerTerminoExperimento = rt_get_time();
		tempoTotalExperimento = count2nano(timerTerminoExperimento - timerInicioExperimento) / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).

#if FLAG_HABILITAR_TIMER_EXPERIMENTO == 0 // por ciclos de execucao
		flagTerminoExperimentoGeral = 1;
		if(flagTerminoExperimentoGeral == 1)
		{
			for(contTasks=0; contTasks < NTASKS_CNT; contTasks++)
			{
				if(qtdPeriodosCnt[contTasks] < qtdMaxPeriodosCnt)
				{
					// O sistema ainda estah processando tarefas de tempo real.
					flagTerminoExperimentoGeral = 0;
					break;
				}
			}
		}
		if(flagTerminoExperimentoGeral == 1)
		{
			for(contTasks=0; contTasks < NTASKS_MATMULT; contTasks++)
			{
				if(qtdPeriodosMatmult[contTasks] < qtdMaxPeriodosMatmult)
				{
					// O sistema ainda estah processando tarefas de tempo real.
					flagTerminoExperimentoGeral = 0;
					break;
				}
			}
		}
		if(flagTerminoExperimentoGeral == 1)
		{
			for(contTasks=0; contTasks < NTASKS_BSORT; contTasks++)
			{
				if(qtdPeriodosBsort[contTasks] < qtdMaxPeriodosBsort)
				{
					// O sistema ainda estah processando tarefas de tempo real.
					flagTerminoExperimentoGeral = 0;
					break;
				}
			}
		}

		if(flagTerminoExperimentoGeral == 1)
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

		/** CALCULANDO TEMPO DE PROCESSAMENTO DA TAREFA... **/
		tempoProcessamento_ns = getTempoProcessamento(idTask, Task_CpuStats, qtdPeriodosCpuStats);
		tempoProcessamento_s = tempoProcessamento_ns / 1000000000.0; // Transformando de nanosegundo para segundo (10^9).
#if DEBUG == 1
		printf("%s[TASK %d] [%lu] ##### Tempo Processamento: %.10f \n", arrayTextoCorIdTask[idTask], idTask, pidTask, tempoProcessamento_s);
#endif

		if(tempoProcessamento_s > Tperiodo_s)
		{
			qtdDeadlinesVioladosCpuStats++;
#if DEBUG == 1
			printf("%s[TASK %d] [%lu] ##### DEADLINE VIOLADO!!!!!!!!!!!!! Periodo(%lu) Deadlines_Violados(%lu) \n", arrayTextoCorIdTask[idTask], idTask, pidTask, qtdPeriodosCpuStats, qtdDeadlinesVioladosCpuStats);
#endif
			verificarEstatisticaDeadline(idTask, Tperiodo_s, qtdPeriodosCpuStats, tempoProcessamento_s);
		}

		rt_task_wait_period(); // **** WAIT
		qtdPeriodosCpuStats++;
	}

	printf("%s[TASK %d] [%lu] ##### FIM EXECUCAO -> Total Periodos Executados: %lu -> Total Deadlines Violados: %lu\n", arrayTextoCorIdTask[idTask], idTask, pidTask, qtdPeriodosCpuStats, qtdDeadlinesVioladosCpuStats);

	rt_task_delete(Task_CpuStats);

	return 0;
}
/**************************************************
 * FIM: DEFINICOES DO C-BENCHMARK -> CpuStats
 **************************************************/

void exibirEstatisticaFinalExperimento(void)
{
	printf("%s", TEXTO_VERDE);

	printConfiguracoes();

	printf("************** ESTATISTICAS FINAL **************\n");

	// Obtendo as estatisticas do processador depois...
	if(!flagFimExecucao)
	{
		// Obtendo as estatisticas do processador depois...
		afterStats = rt_cfg_get_cpu_stats(cpuid_stats, &after_total_time);
		after_total_trans = rt_cfg_get_transitions(CPUID_RTAI);
	}
	total_time = after_total_time - before_total_time;
	print_cpu_stats(beforeStats, afterStats, before_total_trans, after_total_trans, total_time);

	printf("***************** DETALHAMENTO *****************\n");
	printf("-> Maior Deadline Ultrapassado:\n");
	if(maiorDeadlinePerdido.idTask > 0)
		printf("[TASK %d] Nr Periodo(%lu) Tempo de Processamento(%.10f) Tempo Excedido(%.10f) \n\n", maiorDeadlinePerdido.idTask, maiorDeadlinePerdido.codPeriodo, maiorDeadlinePerdido.tempoProcessamento_s, maiorDeadlinePerdido.tempoUltrapassadoProcessamento_s);
	else
		printf("* Nenhuma tarefa violou seu deadline! \n\n");

	printf("-> Menor Deadline Ultrapassado:\n");
	if(menorDeadlinePerdido.idTask > 0)
		printf("[TASK %d] Nr Periodo(%lu) Tempo de Processamento(%.10f) Tempo Excedido(%.10f) \n\n", menorDeadlinePerdido.idTask, menorDeadlinePerdido.codPeriodo, menorDeadlinePerdido.tempoProcessamento_s, menorDeadlinePerdido.tempoUltrapassadoProcessamento_s);
	else
		printf("* Nenhuma tarefa violou seu deadline! \n\n");
}

int manager_tasks(void)
{
	int contTask = 0;
	struct thread_param arrayThreadParams[NTASKS];

	rt_set_periodic_mode();
	rt_make_hard_real_time();

	// Inicializando variaveis globais...
	menorDeadlinePerdido.idTask = -1;
	menorDeadlinePerdido.codPeriodo = 0;
	menorDeadlinePerdido.tempoProcessamento_s = 0.0;
	menorDeadlinePerdido.tempoUltrapassadoProcessamento_s = 0.0;
	menorDeadlinePerdido.flagDeadlineSetado = 0;

	maiorDeadlinePerdido.idTask = -1;
	maiorDeadlinePerdido.codPeriodo = 0;
	maiorDeadlinePerdido.tempoProcessamento_s = 0.0;
	maiorDeadlinePerdido.tempoUltrapassadoProcessamento_s = 0.0;
	maiorDeadlinePerdido.flagDeadlineSetado = 0;

	printf("************** Iniciando escalonamento **************\n");

	printConfiguracoes();

	//rt_set_oneshot_mode();
	start_rt_timer(0);
	tick_period = nano2count(TICK_PERIOD);
	delay_start_timeline = tick_period * 20; // Delay: 2 segundo(s)
	start_timeline = rt_get_time() + delay_start_timeline;

	printf("TICK_PERIOD ================> %llu\n", tick_period);

	contTask = 0;
	arrayThreadParams[contTask].idTask = 0;
	arrayThreadParams[contTask].idSubTask = 0;
	arrayThreadParams[contTask].cpuFrequencyMin = cpuFrequencyMin_Cnt;
	arrayThreadParams[contTask].cpuFrequencyInicial = cpuFrequencyInicial_Cnt;
	arrayThreadParams[contTask].cpuVoltageInicial = cpuVoltageInicial_Cnt;
	Thread_Cnt_0 = rt_thread_create(init_task_cnt, &arrayThreadParams[contTask], 0);

	contTask++;
	arrayThreadParams[contTask].idTask = 1;
	arrayThreadParams[contTask].idSubTask = 0;
	arrayThreadParams[contTask].cpuFrequencyMin = cpuFrequencyMin_Matmult;
	arrayThreadParams[contTask].cpuFrequencyInicial = cpuFrequencyInicial_Matmult;
	arrayThreadParams[contTask].cpuVoltageInicial = cpuVoltageInicial_Matmult;
	Thread_Matmult_0 = rt_thread_create(init_task_matmult, &arrayThreadParams[contTask], 0);

	contTask++;
	arrayThreadParams[contTask].idTask = 2;
	arrayThreadParams[contTask].idSubTask = 0;
	arrayThreadParams[contTask].cpuFrequencyMin = cpuFrequencyMin_Bsort;
	arrayThreadParams[contTask].cpuFrequencyInicial = cpuFrequencyInicial_Bsort;
	arrayThreadParams[contTask].cpuVoltageInicial = cpuVoltageInicial_Bsort;
	Thread_Bsort_0 = rt_thread_create(init_task_bsort, &arrayThreadParams[contTask], 0);

	contTask++;
	arrayThreadParams[contTask].idTask = 3;
	arrayThreadParams[contTask].idSubTask = 0;
	arrayThreadParams[contTask].cpuFrequencyMin = cpuFrequencyMin_CpuStats;
	arrayThreadParams[contTask].cpuFrequencyInicial = cpuFrequencyInicial_CpuStats;
	arrayThreadParams[contTask].cpuVoltageInicial = cpuVoltageInicial_CpuStats;
	Thread_CpuStats = rt_thread_create(init_task_cpustats, &arrayThreadParams[contTask], 0);

//	contTask++;
//	arrayThreadParams[contTask].idTask = 4;
//	arrayThreadParams[contTask].idSubTask = 1;
//	arrayThreadParams[contTask].cpuFrequencyMin = cpuFrequencyMin_Cnt;
//	arrayThreadParams[contTask].cpuFrequencyInicial = cpuFrequencyInicial_Cnt;
//	arrayThreadParams[contTask].cpuVoltageInicial = cpuVoltageInicial_Cnt;
//	Thread_Cnt_1 = rt_thread_create(init_task_cnt, &arrayThreadParams[contTask], 0);

	//** PEGA O TEMPO DE INICIO DA EXECUCAO.
	timerInicioExperimento = rt_get_time();

	//ESTATISTICAs: Obtendo as estatisticas do processador antes...
	beforeStats = rt_cfg_get_cpu_stats(cpuid_stats, &before_total_time);
	before_total_trans = rt_cfg_get_transitions(CPUID_RTAI);

	// Aguarda interrupcao do usuario... ou a conclusao dos periodos de todas as tarefas criadas...
	while(!getchar());

	exibirEstatisticaFinalExperimento();

	flagFimExecucao = 1;

	stop_rt_timer();
	return 0;
}

void delete_tasks(void)
{
	rt_make_soft_real_time();
}

int main(void)
{
	printf("\n\nIniciando o escalonamento das tarefas...\n\n");

	manager_tasks();

	delete_tasks();

	printf("\n\nFim do Escalonamento %s\n", TEXTO_BRANCO);

	return 0 ;
}
