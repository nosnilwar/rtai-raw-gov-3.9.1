#include <linux/module.h>
#include <asm/io.h>
#include <rtai_sched.h>

#define DESIRED_TICK 1000000    /* 1ms */

static int ioport = 0x378;
module_param(ioport, int, 0664);
MODULE_PARM_DESC(ioport, "Porta para I/O");

static RT_TASK blink_task;

static void blink_thread(long port)
{
	char data=0;
	for(;;) {
		outb(data,port);
		data=data^0x01;
		rt_task_wait_period();
	}
}

int init_module(void)
{
	RTIME tick;

	rt_set_oneshot_mode();
	tick = start_rt_timer(nano2count(DESIRED_TICK));
	rt_task_init(&blink_task, blink_thread, ioport, 2048, 1, 0, NULL);
	rt_task_make_periodic(&blink_task, rt_get_time(), 1000*tick);
	return 0;
}

void cleanup_module(void)
{
	stop_rt_timer();
	rt_task_delete(&blink_task);
	outb(0, ioport);
}

MODULE_AUTHOR("Walter Fetter Lages <w.fetter@ieee.org>");
MODULE_DESCRIPTION("Exemplo de tarefa com API nativa do RTAI");
MODULE_VERSION("1.0.0");
MODULE_LICENSE("GPL");
