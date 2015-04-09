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
#include <time.h>
#include <sys/time.h>

/* Definindo CONSTANTES... */
#define DEBUG 1

/* Definindo MACROS */
#define CPUID_RTAI 0 // para o Kernel o primeiro processador é o zero.
#define CPU_ALLOWED (CPUID_RTAI+1) // Processador 1

/* Definindo variaveis goblais*/
#define TICK_PERIOD 50000000 //Tempo em nano segundos... a cada 0.05 segundos tem o tick
#define FREQUENCIA_MAXIMA_PROCESSADOR 3000000 //kHz

/* Definicao da capacitancia do processador AMD Athlon II x2 250 */
#define AMD_ATHLON_II_X2_250_CAPACITANCIA 5 // pF (pico Farad) COULOMB/VOLT = 1 FARAD (F)

/* Definicao das tensoes por frequencia do processador AMD Athlon II x2 250 */
#define AMD_ATHLON_II_X2_250_TENSAO_FREQ_3000000_KHZ 1.425 // VOLTS (V)
#define AMD_ATHLON_II_X2_250_TENSAO_FREQ_2300000_KHZ 1.325 // VOLTS (V)
#define AMD_ATHLON_II_X2_250_TENSAO_FREQ_1800000_KHZ 1.225 // VOLTS (V)
#define AMD_ATHLON_II_X2_250_TENSAO_FREQ_800000_KHZ  1.125 // VOLTS (V)

#define STACK_SIZE 2000

/**********************************************/
#define QTD_TOTAL_TAREFAS 1
/**********************************************/

struct thread_param {
    int idTask; // Indica o ID da tarefa geral e sua prioridade sobre as outras. Quanto menor -> maior a prioridade.
    unsigned int cpuFrequencyMin;
    unsigned int cpuFrequencyInicial;
    unsigned int cpuVoltageInicial;
	int prioridade;
    RTIME deadline; // unidade -> counts
    RTIME periodo; // unidade -> counts
};

struct thread_param arrayThreadParams[QTD_TOTAL_TAREFAS];

/**************************************************************
 * DEFINICAO DAS TASKS...
 **************************************************************/
pthread_t Thread_Task;
RTIME tick_period;
RTIME start_timeline;
RTIME delay_start_timeline;

void *init_task(void *arg)
{
	RT_TASK *Task;
	struct thread_param *config = (struct thread_param*) arg;
	int idTask = config->idTask;
	unsigned long pidTask = 0;
	unsigned int cpuFrequencyAtual = 0; // KHz

	RTIME Tinicio;
	RTIME Tperiodo = 0; // unidade -> counts
	double Tperiodo_s = 0.0;
	int prioridade = config->prioridade;

//	clock_t begin, end;
//	double time_spent;

	struct timeval  tv1, tv2;

	if(!(Task = rt_thread_init(idTask, prioridade, 0, SCHED_FIFO, CPU_ALLOWED)))
	{
		printf("[ERRO] Não foi possível criar a tarefa [%d].\n", idTask);
		exit(1);
	}

	Tinicio = start_timeline;
	Tperiodo = config->periodo;
	Tperiodo_s = count2nano(Tperiodo)/1000000000.0;

	rt_allow_nonroot_hrt();
	rt_task_make_periodic(Task, Tinicio, Tperiodo);
	rt_change_prio(Task, prioridade);
	if(config->deadline > 0)
		rt_set_deadline(Task, config->deadline);

	pidTask = rt_cfg_get_pid(Task);
	printf("[TASK %2d] [%lu] Criada com Sucesso  =============== PERIODO => %llu count => %.2f segundos \n", idTask, pidTask, Tperiodo, Tperiodo_s);

	cpuFrequencyAtual = rt_cfg_cpufreq_get(CPUID_RTAI);
	printf("[TASK %2d] [%lu] Curr Freq: %8d Khz\n", idTask, pidTask, cpuFrequencyAtual);

	//TODO: TEMPO DE COMPUTACAO - OPCAO 1
//	begin = clock();
//	rt_cfg_set_cpu_frequency(Task, (int) config->cpuFrequencyMin);
//	end = clock();
//
//	time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
//	printf("[TASK %2d] [%lu] SET_FREQUENCY(%8d Khz);\n", idTask, pidTask, config->cpuFrequencyMin);
//	cpuFrequencyAtual = rt_cfg_cpufreq_get(CPUID_RTAI);
//	printf("[TASK %2d] [%lu] Curr Freq: %8d Khz\n", idTask, pidTask, cpuFrequencyAtual);
//	printf("[TASK %2d] [%lu] TEMPO DE COMPUTACAO SET FREQUENCY - USERSPACE => %.100f segundos\n", idTask, pidTask, time_spent);

	//TODO: TEMPO DE COMPUTACAO - OPCAO 2
	gettimeofday(&tv1, NULL);
	rt_cfg_set_cpu_frequency(Task, (int) config->cpuFrequencyMin);
	gettimeofday(&tv2, NULL);

	printf("[TASK %2d] [%lu] SET_FREQUENCY(%8d Khz);\n", idTask, pidTask, config->cpuFrequencyMin);
	cpuFrequencyAtual = rt_cfg_cpufreq_get(CPUID_RTAI);
	printf("[TASK %2d] [%lu] Curr Freq: %8d Khz\n", idTask, pidTask, cpuFrequencyAtual);
	printf("[TASK %2d] [%lu] TEMPO DE COMPUTACAO SET FREQUENCY - USERSPACE => %.50f segundos\n", idTask, pidTask, (double) (tv2.tv_usec - tv1.tv_usec) / 1000000 +
	         (double) (tv2.tv_sec - tv1.tv_sec));
	rt_task_delete(Task);

	return 0;
}
/**************************************************
 * FIM: DEFINICOES DA TAREFA
 **************************************************/

int manager_tasks(void)
{
	int contIdTask = 0;

	rt_set_periodic_mode();
	rt_make_hard_real_time();

	printf("************** Iniciando escalonamento **************\n");

	//rt_set_oneshot_mode();
	start_rt_timer(0);
	tick_period = nano2count(TICK_PERIOD); // 0.05 segundos...
	delay_start_timeline = tick_period * 20; // Delay: 2 segundo(s)
	start_timeline = rt_get_time() + delay_start_timeline;

	printf("TICK_PERIOD ================> %llu\n", tick_period);

	/**
	 * TASK(S)
	 */
	contIdTask = 0;//TASK:0
	arrayThreadParams[contIdTask].idTask = contIdTask;
	arrayThreadParams[contIdTask].periodo = tick_period * 320; // ~= 16 segundos
//	arrayThreadParams[contIdTask].deadline = 0.0013;
	arrayThreadParams[contIdTask].deadline = arrayThreadParams[contIdTask].periodo;
	arrayThreadParams[contIdTask].prioridade = 4;
//	arrayThreadParams[contIdTask].cpuFrequencyMin = VALOR_DEFAULT_FREQ_MIN_DESABILITADA; // KHz
	arrayThreadParams[contIdTask].cpuFrequencyMin = 3000000; // KHz
	arrayThreadParams[contIdTask].cpuFrequencyInicial = 3000000; // KHz
	arrayThreadParams[contIdTask].cpuVoltageInicial = AMD_ATHLON_II_X2_250_TENSAO_FREQ_1800000_KHZ; // Volts
	Thread_Task = rt_thread_create(init_task, &arrayThreadParams[contIdTask], 0);

	// Aguarda interrupcao do usuario... ou a conclusao dos periodos de todas as tarefas criadas...
	while(!getchar());

	stop_rt_timer();
	return 0;
}

void delete_tasks()
{
	rt_make_soft_real_time();
}

int main(int argc, char *argv[])
{
	printf("\n\nIniciando o escalonamento das tarefas...\n\n");

	manager_tasks();

	delete_tasks();

	printf("\n\nFim do Escalonamento\n");

	return 0 ;
}
