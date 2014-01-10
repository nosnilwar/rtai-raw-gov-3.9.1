#include <sys/io.h>
#include <rtai_lxrt.h>

#define DESIRED_TICK 1000000
#define IOPORT 0x378
#define CPU_ALLOWED 0xFF

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
	//maintsk=rt_task_init(nam2num("LED"),1,0,0);
	if(!(maintsk = rt_task_init_schmod(nam2num("LED"),1,0,0,SCHED_FIFO,CPU_ALLOWED))) {
		printf("CANNOT INIT HANDLER TASK > Task 1 <\n");
		exit(1);
	}

	/*
	 * Give a Linux process, or pthread, hard real time execution capabilities allowing full kernel preemption.
	 *
	 *  rt_make_hard_real_time makes the soft Linux POSIX real time process, from which it is called, a hard real
	 *  time LXRT process. It is important to remark that this function must be used only with soft Linux POSIX
	 *  processes having their memory locked in memory. See Linux man pages. Only the process itself can use this
	 *  functions, it is not possible to impose the related transition from another process.
	 *
	 *  Note that processes made hard real time should avoid making any Linux System call that can lead to a task
	 *  switch as Linux cannot run anymore processes that are made hard real time. To interact with Linux you
	 *  should couple the process that was made hard real time with a Linux buddy server, either standard or
	 *  POSIX soft real time. To communicate and synchronize with the buddy you can use the wealth of available
	 *  RTAI, and its schedulers, services.
	 *
	 *  After all it is pure nonsense to use a non hard real time Operating System, i.e. Linux, from within
	 *  hard real time processes.
	 */
	rt_make_hard_real_time();
	rt_task_make_periodic(maintsk,rt_get_time(),1000*tick);

	for(i=0; i < 100; i++)
	{
		rt_task_wait_period();
		outb(data,IOPORT);
		data=data^0x01;

		printf("*Acendendo LED: %llu\n", rt_get_time_ns());

		//while(1) printf("Rawlinson..kkkkkk :D  -> %llu\n", rt_get_time_ns()); // Consumindo Processador... hehehe :P

		rt_cfg_init_info(maintsk, 1001, 2002, 3003);

		printf("debug rawlinson -> 1001: %lu\n", rt_cfg_get_tsk_wcec(maintsk));
		printf("debug rawlinson -> 1001: %lu\n", rt_cfg_get_rwcec(maintsk));
		printf("debug rawlinson -> 2002: %d\n", rt_cfg_get_cpu_frequency(maintsk));
		printf("debug rawlinson -> 3003: %d\n", rt_cfg_get_cpu_voltage(maintsk));

//		rt_cfg_set_tsk_wcec(maintsk, 10001);
//		printf("debug rawlinson -> 10001: %llu\n", rt_cfg_get_tsk_wcec(maintsk));
//
//		rt_cfg_set_rwcec(maintsk, 20002);
//		printf("debug rawlinson -> 20002: %llu\n", rt_cfg_get_rwcec(maintsk));
//
//		rt_cfg_set_cpu_frequency(maintsk, 30003);
//		printf("debug rawlinson -> 30003: %d\n", rt_cfg_get_cpu_frequency(maintsk));
//
//		rt_cfg_set_cpu_voltage(maintsk, 40004);
//		printf("debug rawlinson -> 40004: %d\n", rt_cfg_get_cpu_voltage(maintsk));
	}

	/**
	 *  Return a hard real time Linux process, or pthread to the standard Linux behavior.
	 *
	 *  rt_make_soft_real_time returns to soft Linux POSIX real time a process, from which it is called,
	 *  that was made hard real time by a call to rt_make_hard_real_time.
	 *
	 *  Only the process itself can use this functions, it is not possible to impose the related transition
	 *  from another process.
	 */
	rt_make_soft_real_time();
	rt_task_delete(maintsk);

	/**
	 * stop_rt_timer stops the timer. The timer mode is set to periodic.
	 */
	stop_rt_timer();
	return 0;
}
