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

#define TICK 500000000 //0.5 seconds

static RT_TASK Task_1A;
static RT_TASK Task_2A;
static RT_TASK Task_1B;
static RT_TASK Task_2B;


/**
* @name upSignalA_Thread
*
* Representa a passagem do sinal PWM A do nivel baixo para alto.
*
*/
static void upSignalA_Thread(long t)
{

  while (1) {
                                                                           
    rt_printk(KERN_INFO "Up - Signal A\n");
                                                                            
    rt_task_wait_period();
    
  }
                                                                           
}

/**
* @name downSignalA_Thread
*
* Representa a passagem do sinal PWM A do nivel alto para baixo.
*
*/
static void downSignalA_Thread(long t)
{

  while (1) {
                                                                           
    rt_printk(KERN_INFO "Down - Signal A\n");
                                                                            
    rt_task_wait_period();
    
  }
                                                                           
}

/**
* @name upSignalB_Thread
*
* Representa a passagem do sinal PWM B do nivel baixo para alto.
*
*/
static void upSignalB_Thread(long t)
{

  while (1) {
                                                                           
    rt_printk(KERN_INFO "Up - Signal B\n");
                                                                            
    rt_task_wait_period();
    
  }
                                                                           
}

/**
* @name upSignalB_Thread
*
* Representa a passagem do sinal PWM B do nivel alto para baixo.
*
*/
static void downSignalB_Thread(long t)
{

  while (1) {
                                                                           
    rt_printk(KERN_INFO "Down - Signal B\n");
                                                                            
    rt_task_wait_period();
    
  }
                                                                           
}
                                                                            
int __init hello_init(void)
                                                                            
{
  RTIME sampling;                                                          
                                                                           
                                                                            
  rt_task_init(&Task_1A,                                                 
     downSignalA_Thread, 0, 3000, 0, 0, NULL);
  rt_task_init(&Task_2A,                                                 
     upSignalA_Thread, 0, 3000, 0, 0, NULL);
  rt_task_init(&Task_1B,                                                 
     upSignalB_Thread, 0, 3000, 0, 0, NULL);
  rt_task_init(&Task_2B,                                                 
     downSignalB_Thread, 0, 3000, 0, 0, NULL);


                                                                           
  sampling = start_rt_timer(nano2count(TICK));
                                                                           
  rt_task_make_periodic(&Task_1A, rt_get_time(), sampling * 10);
  rt_task_make_periodic(&Task_2A, rt_get_time() + sampling * 5, sampling * 10);
  rt_task_make_periodic(&Task_1B, rt_get_time() + sampling * 11, sampling * 10);
  rt_task_make_periodic(&Task_2B, rt_get_time() + sampling * 16, sampling * 10);

  rt_printk(KERN_INFO "Init module function");
  return 0;
}

                                                  
void __exit hello_clean(void)
{
  rt_task_delete(&Task_1A);
  rt_task_delete(&Task_1B);
  rt_task_delete(&Task_2A);
  rt_task_delete(&Task_2B);
  rt_printk(KERN_INFO "Cleanup module function");
}

module_init(hello_init);
module_exit(hello_clean);
MODULE_LICENSE("GPL");
MODULE_AUTHOR("Grupo X");
MODULE_DESCRIPTION("RTAI module");
MODULE_LICENSE("GPL");
MODULE_VERSION("0.0.1");

