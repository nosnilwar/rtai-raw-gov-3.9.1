/* led1.c, an LXRT LED blinker */
#include<pthread.h>
#include<rtai.h>
#include<rtai_lxrt.h>
#include<sys/mman.h>
#include<sys/io.h>
// delay in nanoseconds
#define TICKS 500000000

int main(void)
{
	RT_TASK *task;
	int priority = 0, i;
	int stack_size = 4096;
	int msg_size = 0; // use default

	// get enough privilege to
	// access the I/O ports.
	iopl(3);
	task = rt_task_init_sched(nam2num("main"),priority, stack_size, msg_size);
	if(task == 0) exit(1);

	rt_set_oneshot_mode();
	start_rt_timer(0);
	mlockall(MCL_CURRENT|MCL_FUTURE);
	rt_make_hard_real_time();

	for(i = 0; i < 10; i++)
	{
		outb(0xff, 0x378);
		rt_printk("1");
		rt_sleep(nano2count(TICKS));

		outb(0x0, 0x378);
		rt_printk("0");
		rt_sleep(nano2count(TICKS));
	}

	// back to non-rt land!
	rt_make_soft_real_time();
	stop_rt_timer();
	rt_task_delete(task);

	return 0;
}
