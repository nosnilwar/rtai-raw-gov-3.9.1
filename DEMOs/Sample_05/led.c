#include <sys/io.h>
#include <rtai_posix.h>

static volatile int end=0;

static void *blink_thread(void *port)
{
	char data=0;
	struct timespec delay;
	struct timespec period;

	rt_allow_nonroot_hrt();
	pthread_setschedparam_np(1,SCHED_FIFO,0,0xff,PTHREAD_HARD_REAL_TIME_NP);
	delay.tv_sec = delay.tv_nsec = 0;
	period.tv_sec=1;
	period.tv_nsec=0;
	pthread_make_periodic_np(pthread_self(), &delay, &period);

	while(!end)
	{
		pthread_wait_period_np();
		outb(data,*((int*)port));
		data=data^0x01;
	}

	outb(0,*((int*)port));
	pthread_soft_real_time_np();
	return NULL;
}

int main(int argc,char *argv[])
{
	pthread_t blink_id;
	const int ioport=0x378;

	start_rt_timer(0);
	pthread_create(&blink_id,NULL,blink_thread,(void *)&ioport);
	sleep(60);
	end=1;
	stop_rt_timer();
	return 0;
}
