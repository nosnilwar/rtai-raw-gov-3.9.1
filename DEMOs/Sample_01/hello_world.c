#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <rtai_lxrt.h>
#include <sys/io.h>

#define TICK_TIME 1000000

static RT_TASK *main_Task;

int main(void)
{
	int hard_timer_running;
	RTIME sampling_interval;
	RT_TASK *Main_Task;

	if ((hard_timer_running = rt_is_hard_timer_running()))
	{
		printf("Skip hard real_timer setting...\n");
		sampling_interval = nano2count(TICK_TIME);
	}
	else
	{
		printf("Starting real time timer...\n");
		rt_set_oneshot_mode();
		start_rt_timer(0);
	}

	sampling_interval = nano2count(TICK_TIME);

	if (!(Main_Task = rt_task_init_schmod(nam2num("MNTSK"), 0, 0, 0, SCHED_FIFO, 0xF)))
	{
		printf("CANNOT INIT MAIN TASK\n");
		exit(1);
	}
	else
	{
		printf("HELLO WORLD - TAREFA CRIADA COM SUCESSO...\n");
		exit(1);
	}
	return 0;
}
