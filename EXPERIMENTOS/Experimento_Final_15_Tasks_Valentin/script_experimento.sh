#!/bin/bash
#
# Script de execucao do experimento final
# Copyright rawlinson.goncalves@gmail.com

TARGET=multiple_tasks
RUNINFO=.runinfo

make clean && make

printf "\n\n"
printf "*******************************************\n"
printf "* Rawlinson Gonçalves - Mestrado - iComp  *\n"
printf "* Copyright rawlinson.goncalves@gmail.com *\n"
printf "*******************************************\n"
printf "PROCESSANDO EXPERIMENTO \n"

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 0 0 0 0"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 01 -> RAW_MONITOR[X] - PC[ ] - QTD_PC[00] - Processando..."
rtai-load > logs_finais/log_COM_MONITOR_SEM_PC_01.txt
printf " - Concluíudo. \n"

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 1"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 02 -> RAW_MONITOR[X] - PC[X] - QTD_PC[01] - Processando..."
rtai-load > logs_finais/log_COM_MONITOR_COM_01_PC_02.txt
printf " - Concluíudo. \n"

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 1"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 03 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[01] - Processando..."
rtai-load > logs_finais/log_SEM_MONITOR_COM_01_PC_03.txt
printf " - Concluíudo. \n"

#---------------------------------------------------------------------------------------------------

printf "\n\nEXPERIMENTO FINALIZADO! \n\n"
