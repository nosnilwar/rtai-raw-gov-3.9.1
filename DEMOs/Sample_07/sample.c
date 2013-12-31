/**************************************************************
* UNIVERSIDADE FEDERAL DO AMAZONAS                            *
* ENGENHARIA DA COMPUTACAO                                    *
*                                                             *
* Disciplina: Programacao em Tempo Real                       *
* Programa  : pwmsignal.c                                     *
* Objetivo  : Utilizar tarefas de tempo real em um programa   *
*             no espaco do Kernel                             *
*                                                             *
* Autores:                                                    *
*   Adriano Mendes Gil                                        *
*   Jhony Braga da Silva                                      *
*   Rawlinson da Silva Goncalves                              *
*   Rogério Ramos                                             *
**************************************************************/

/* Inclusao das bibliotecas. */
#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/module.h>
#include <rtai.h>
#include <rtai_sched.h>
#include <rtai_sem.h>

#define TICK 500000000 //0.5 seconds

SEM rMutex;

static RT_TASK Task_1;
static RT_TASK Task_2;
static RT_TASK Task_3;

static void signalIchi(long t)
{
	while (1)
	{
		rt_sem_wait(&rMutex);

		rt_printk(KERN_INFO "TESTE - Signal 1\n");

		rt_sleep(nano2count(TICK * 6));

		rt_sem_signal(&rMutex);

		rt_task_wait_period();
	}
}


static void signalNi(long t)
{
	while (1)
	{
		rt_sem_wait(&rMutex);

		rt_printk(KERN_INFO "TESTE - Signal 2\n");

		rt_sleep(nano2count(TICK * 4));

		rt_sem_signal(&rMutex);

		rt_task_wait_period();
	}
}


static void signalSan(long t)
{
	while (1)
	{
		rt_sem_wait(&rMutex);

		rt_printk(KERN_INFO "TESTE - Signal 3\n");

		rt_sleep(nano2count(TICK * 6));

		rt_sem_signal(&rMutex);

		rt_task_wait_period();
	}
}


int __init hello_init(void)
{
	RTIME sampling;

	rt_printk(KERN_INFO "TESTE - *************************** INICIO *******************************\n");

	rt_task_init(&Task_1, signalIchi, 0, 3000, 0, 0, NULL);
	rt_task_init(&Task_2,   signalNi, 0, 3000, 0, 0, NULL);
	rt_task_init(&Task_3,  signalSan, 0, 3000, 0, 0, NULL);

	sampling = start_rt_timer(nano2count(TICK));

	rt_sem_init(&rMutex, 1);

	rt_task_make_periodic(&Task_1, rt_get_time() + sampling * 16, sampling * 16);
	rt_task_make_periodic(&Task_2, rt_get_time() + sampling * 18, sampling * 18);
	rt_task_make_periodic(&Task_3, rt_get_time() + sampling * 30, sampling * 30);

	rt_change_prio(&Task_1, 2);
	rt_change_prio(&Task_2, 1);
	rt_change_prio(&Task_3, 3);

	rt_printk(KERN_INFO "Init module function\n");
	return 0;
}


void __exit hello_clean(void)
{
	rt_task_delete(&Task_1);
	rt_task_delete(&Task_2);
	rt_task_delete(&Task_3);
	rt_printk(KERN_INFO "Cleanup module function\n");
	rt_printk(KERN_INFO "-----------------------\n");

	rt_printk(KERN_INFO "TESTE - *************************** FIM *******************************\n");
}

module_init(hello_init);
module_exit(hello_clean);
MODULE_LICENSE("GPL");
MODULE_AUTHOR("Grupo X");
MODULE_DESCRIPTION("RTAI module");
MODULE_LICENSE("GPL");
MODULE_VERSION("0.0.1");
