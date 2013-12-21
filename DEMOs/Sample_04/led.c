#include <sys/io.h>
#include <rtai_lxrt.h>

#define DESIRED_TICK 1000000
#define IOPORT 0x378

int main(int argc,char *argv[])
{
	RT_TASK *maintsk;
	RTIME tick;
	int i;
	char data=0;

	printf("HELLO WORLD - Iniciando tarefa...\n");

	rt_allow_nonroot_hrt();
	rt_set_oneshot_mode();
	tick=start_rt_timer(nano2count(DESIRED_TICK));
	maintsk=rt_task_init(nam2num("LED"),1,0,0);
	rt_make_hard_real_time();
	rt_task_make_periodic(maintsk,rt_get_time(),1000*tick);

	for(i=0; i < 60; i++)
	{
		rt_task_wait_period();
		outb(data,IOPORT);
		data=data^0x01;

		printf("*Acendendo LED: %llu\n", rt_get_time_ns());
	}

	rt_make_soft_real_time();
	rt_task_delete(maintsk);
	stop_rt_timer();
	return 0;
}
