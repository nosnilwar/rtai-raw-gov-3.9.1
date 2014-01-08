#include <linux/module.h>
#include <asm/io.h>
#include <rtai_sched.h>

#define DESIRED_TICK 1000000    /* 1ms */

static int ioport = 0x378;
module_param(ioport, int, 0664);
MODULE_PARM_DESC(ioport, "Porta para I/O");

static RT_TASK blink_task_1;
static RT_TASK blink_task_2;

static void blink_thread(long port)
{
	int cont=0,x=0;
	char data=0;
	for(;;) {
//		while(x<10000)
//		{
//			rt_printk(KERN_INFO "Rawlinson..kkkkkk :D\n"); // Consumindo Processador... hehehe :P
//			x++;
//		}

		outb(data,port);
		data=data^0x01;
		rt_printk(KERN_INFO "MODULO LED: %d\n", cont);
		rt_task_wait_period();

		cont++;
	}
}

int init_module(void)
{
	int cpuid1 = 0; // processador ID = 0
	int cpuid2 = 1; // processador ID = 1
	RTIME tick;

	rt_set_oneshot_mode(); // Passa a ter com referencia os ciclos de frequencia do CPU e nao o tempo...
	tick = start_rt_timer(nano2count(DESIRED_TICK));

	//TODO:RAWLINSON rt_task_init(&blink_task_1, blink_thread, ioport, 2048, 1, 0, NULL);
	rt_task_init_cpuid(&blink_task_1, blink_thread, ioport, 2048, 1, 0, NULL, cpuid2);
	rt_task_init_cpuid(&blink_task_2, blink_thread, ioport, 2048, 1, 0, NULL, cpuid2);

	rt_task_make_periodic(&blink_task_1, rt_get_time(), 1000*tick);
	rt_task_make_periodic(&blink_task_2, rt_get_time(), 10000*tick);
		return 0;
}

void cleanup_module(void)
{
	stop_rt_timer();
	rt_task_delete(&blink_task_1);
	rt_task_delete(&blink_task_2);
	outb(0, ioport);
}

MODULE_AUTHOR("Walter Fetter Lages <w.fetter@ieee.org>");
MODULE_DESCRIPTION("Exemplo de tarefa com API nativa do RTAI");
MODULE_VERSION("1.0.0");
MODULE_LICENSE("GPL");
