#include <linux/module.h>
#include <asm/io.h>
#include <rtai_posix.h>

#define DESIRED_TICK 1000000    /* 1ms */

static int ioport=0x378;
module_param(ioport,int,0664);
MODULE_PARM_DESC(ioport,"Porta para I/O");

static RTIME rttick;
volatile static int end=0;

static void *blink_thread(void *port)
{
	char data=0;
	rt_task_make_periodic(rt_whoami(),rt_get_time(),1000*rttick);
	while(!end)
	{
		rt_task_wait_period();
		outb(data,*((int*)port));
		data=data^0x01;
	}
	pthread_exit(0);
	return NULL;
}

int init_module(void)
{
	pthread_t blink_id;
	rt_set_oneshot_mode();
	rttick=start_rt_timer(nano2count(DESIRED_TICK));
	pthread_create(&blink_id,NULL,blink_thread,(void *)&ioport);
	return 0;
}

void cleanup_module(void)
{
	end=1;
	stop_rt_timer();
	outb(0,ioport);
}

MODULE_AUTHOR("Walter Fetter Lages <w.fetter@ieee.org>");
MODULE_DESCRIPTION("Exemplo de tarefa com thread POSIX");
MODULE_VERSION("1.0.0");
MODULE_LICENSE("GPL");
