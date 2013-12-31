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

#define TICK 500000000ll //0.5 seconds

SEM rMutex;

static RT_TASK Task_11;
static RT_TASK Task_12;
static RT_TASK Task_13;
static RT_TASK Task_21;
static RT_TASK Task_22;
static RT_TASK Task_31;
static RT_TASK Task_32;
static RT_TASK Task_33;

static void signalIchi(long t)
{

  while (1) {
      rt_sem_wait(&rMutex);

      rt_printk(KERN_INFO "Signal 1\n");

      rt_sleep(nano2count(TICK*2));

      rt_sem_signal(&rMutex);

      rt_task_wait_period();
  }

}

static void signalNi(long t)
{

  while (1) {
      rt_sem_wait(&rMutex);

      rt_printk(KERN_INFO "Signal 2\n");

      rt_sleep(nano2count(TICK*2));

      rt_sem_signal(&rMutex);

      rt_task_wait_period();


  }

}


static void signalSan(long t)
{

  while (1) {
      rt_sem_wait(&rMutex);

      rt_printk(KERN_INFO "Signal 3\n");

      rt_sleep(nano2count(TICK*2));

      rt_sem_signal(&rMutex);

      rt_task_wait_period();

  }

}

int __init hello_init(void)

{
  RTIME sampling;


  rt_task_init(&Task_11,
     signalIchi, 0, 3000, 0, 0, NULL);
  rt_task_init(&Task_12,
     signalIchi, 0, 3000, 0, 0, NULL);
  rt_task_init(&Task_13,
     signalIchi, 0, 3000, 0, 0, NULL);

  rt_task_init(&Task_21,
     signalNi, 0, 3000, 0, 0, NULL);
  rt_task_init(&Task_22,
     signalNi, 0, 3000, 0, 0, NULL);

  rt_task_init(&Task_31,
     signalSan, 0, 3000, 0, 0, NULL);
  rt_task_init(&Task_32,
     signalSan, 0, 3000, 0, 0, NULL);
  rt_task_init(&Task_33,
     signalSan, 0, 3000, 0, 0, NULL);


  sampling = start_rt_timer(nano2count(TICK));

  rt_sem_init(&rMutex,1);

  rt_task_make_periodic(&Task_11, rt_get_time(), sampling * 16);
  rt_task_make_periodic(&Task_12, rt_get_time(), sampling * 16);
  rt_task_make_periodic(&Task_13, rt_get_time(), sampling * 16);
  rt_task_make_periodic(&Task_21, rt_get_time(), sampling * 18);
  rt_task_make_periodic(&Task_22, rt_get_time(), sampling * 18);
  rt_task_make_periodic(&Task_31, rt_get_time(), sampling * 30);
  rt_task_make_periodic(&Task_32, rt_get_time(), sampling * 30);
  rt_task_make_periodic(&Task_33, rt_get_time(), sampling * 30);

  rt_change_prio(&Task_11, 2);
  rt_change_prio(&Task_12, 2);
  rt_change_prio(&Task_13, 2);
  rt_change_prio(&Task_21, 1);
  rt_change_prio(&Task_22, 1);
  rt_change_prio(&Task_31, 3);
  rt_change_prio(&Task_32, 3);
  rt_change_prio(&Task_33, 3);

  rt_printk(KERN_INFO "Init module function\n");
  return 0;
}


void __exit hello_clean(void)
{
  rt_task_delete(&Task_11);
  rt_task_delete(&Task_12);
  rt_task_delete(&Task_13);
  rt_task_delete(&Task_21);
  rt_task_delete(&Task_22);
  rt_task_delete(&Task_31);
  rt_task_delete(&Task_32);
  rt_task_delete(&Task_33);
  rt_printk(KERN_INFO "Cleanup module function\n");
  rt_printk(KERN_INFO "-----------------------\n");
}

module_init(hello_init);
module_exit(hello_clean);
MODULE_LICENSE("GPL");
MODULE_AUTHOR("Grupo X");
MODULE_DESCRIPTION("RTAI module");
MODULE_LICENSE("GPL");
MODULE_VERSION("0.0.1");

