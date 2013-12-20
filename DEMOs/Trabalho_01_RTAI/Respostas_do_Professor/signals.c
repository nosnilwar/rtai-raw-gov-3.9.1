#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/module.h>
#include <rtai.h>
#include <rtai_sched.h>

#define TICK	2500000000ll
#define SHIFT	3000000000ll

static RT_TASK signal_a;
static RT_TASK signal_b;

static int signal_a_value;
static int signal_b_value;

static void signal_a_thread(long data)
{
	while (1) {
		signal_a_value = !signal_a_value;
		printk(KERN_INFO "[%Ld] signal A now in %s.\n",
			count2nano(rt_get_time()),
			signal_a_value ? "up" : "down");
		rt_task_wait_period();
	}
}

static void signal_b_thread(long data)
{
	while (1) {
		signal_b_value = !signal_b_value;
		printk(KERN_INFO "[%Ld] signal B now in %s.\n",
			count2nano(rt_get_time()),
			signal_b_value ? "up" : "down");
		rt_task_wait_period();
	}
}

void __exit signal_clean(void)
{
	rt_task_delete(&signal_a);
	rt_task_delete(&signal_b);
	printk(KERN_INFO "Cleanup module function\n");
}

int __init signal_init(void)
{
	RTIME sampling;
	RTIME shift;

	signal_a_value = 0;
	signal_b_value = 0;

	rt_set_periodic_mode();

	rt_task_init(&signal_a, signal_a_thread, 0, 3000, 0, 0, NULL);
	rt_task_init(&signal_b, signal_b_thread, 0, 3000, 0, 0, NULL);

	sampling = start_rt_timer(nano2count(TICK));
	shift = nano2count(SHIFT);

	rt_task_make_periodic(&signal_a, rt_get_time() + sampling, sampling);
	rt_task_make_periodic(&signal_b, rt_get_time() + sampling +
				shift, sampling);

	rt_printk(KERN_INFO "Init module function\n");

	return 0;
}

module_init(signal_init);
module_exit(signal_clean);

MODULE_AUTHOR("My name here");
MODULE_DESCRIPTION("Simple module");
MODULE_LICENSE("GPL");
MODULE_VERSION("0.0.1");
