#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <rtai_lxrt.h>
#include <sys/io.h>

#define TICK_TIME 2500000000ll
#define DELAY_TIME 3000000000ll
#define CPUMAP 0x1

typedef struct {
	char id;
	long long delay;
	long long period;
} t_info;

static int finish;

int signal_func(void *param)
{
	RT_TASK *rt_signal;
	//TODO: RTIME sampling;
	int value = 0;
	int rval = 0;
	char name[8];
	t_info *t = param;

	snprintf(name, 8, "S_%c", t->id);
	printf("%s\n", name);
	rt_signal = rt_thread_init(nam2num(name), 0, 0, SCHED_FIFO, CPUMAP);
	if (!rt_signal) {
		printf("Could not init real time signal %c\n", t->id);
		rval = -ENODEV;
		goto exit;
	}

	rt_task_make_periodic(rt_signal, rt_get_time() + t->period +
					t->delay, t->period);
	while (!finish) {
		value = !value;
		printf("[%Ld] signal %c now in %s.\n",
			rt_get_time_ns(),
			t->id,
			value ? "up" : "down");
		rt_task_wait_period();
	}
	rt_task_delete(rt_signal);

exit:
	pthread_exit(NULL);
	return rval;
}

int main(void)
{
	long signal_a;
	long signal_b;
	t_info a = {
		.id = 'A',
	};
	t_info b = {
		.id = 'B',
	};

	finish = 0;

	rt_set_periodic_mode();
	start_rt_timer(nano2count(TICK_TIME));
	rt_make_hard_real_time();

	a.delay = 0;
	a.period = nano2count(TICK_TIME);
	signal_a = rt_thread_create(&signal_func, &a, 500);
	if (!signal_a) {
		printf("Can not initialize signal A\n");
		return -ENODEV;
	}

	b.delay = nano2count(DELAY_TIME);
	b.period = nano2count(TICK_TIME);
	signal_b = rt_thread_create(&signal_func, &b, 500);
	if (!signal_b) {
		printf("Can not initialize signal B\n");
		return -ENODEV;
	}
	scanf("%d", &finish);
	finish = 1;

	rt_thread_join(signal_a);
	rt_thread_join(signal_b);
	pthread_exit(NULL);
	return 0;
}
