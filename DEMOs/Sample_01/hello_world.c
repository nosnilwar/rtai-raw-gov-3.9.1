#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <rtai_lxrt.h>
#include <sys/io.h>

static RT_TASK *main_Task;

int main(void)
{
	RT_TASK *Main_Task;
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
