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
rtai-load > logs_finais_2/log_COM_MONITOR_SEM_PC_01.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 1"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 02 -> RAW_MONITOR[X] - PC[X] - QTD_PC[01] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_01_PC_02.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 1"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 03 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[01] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_01_PC_03.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 2"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 04 -> RAW_MONITOR[X] - PC[X] - QTD_PC[02] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_02_PC_04.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 2"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 05 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[02] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_02_PC_05.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 3"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 06 -> RAW_MONITOR[X] - PC[X] - QTD_PC[03] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_03_PC_06.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 3"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 07 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[03] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_03_PC_07.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 4"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 08 -> RAW_MONITOR[X] - PC[X] - QTD_PC[04] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_04_PC_08.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 4"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 09 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[04] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_04_PC_09.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 5"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 10 -> RAW_MONITOR[X] - PC[X] - QTD_PC[05] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_05_PC_10.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 5"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 11 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[05] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_05_PC_11.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 6"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 12 -> RAW_MONITOR[X] - PC[X] - QTD_PC[06] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_06_PC_12.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 6"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 13 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[06] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_06_PC_13.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 7"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 14 -> RAW_MONITOR[X] - PC[X] - QTD_PC[07] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_07_PC_14.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 7"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 15 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[07] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_07_PC_15.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 8"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 16 -> RAW_MONITOR[X] - PC[X] - QTD_PC[08] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_08_PC_16.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 8"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 17 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[08] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_08_PC_17.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 9"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 18 -> RAW_MONITOR[X] - PC[X] - QTD_PC[09] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_09_PC_18.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 9"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 19 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[09] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_09_PC_19.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 10"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 20 -> RAW_MONITOR[X] - PC[X] - QTD_PC[10] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_10_PC_20.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 10"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 21 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[10] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_10_PC_21.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 11"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 22 -> RAW_MONITOR[X] - PC[X] - QTD_PC[11] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_11_PC_22.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 11"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 23 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[11] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_11_PC_23.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 12"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 24 -> RAW_MONITOR[X] - PC[X] - QTD_PC[12] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_12_PC_24.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 12"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 25 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[12] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_12_PC_25.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 13"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 26 -> RAW_MONITOR[X] - PC[X] - QTD_PC[13] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_13_PC_26.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 13"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 27 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[13] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_13_PC_27.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 14"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 28 -> RAW_MONITOR[X] - PC[X] - QTD_PC[14] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_14_PC_28.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 14"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 29 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[14] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_14_PC_29.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 15"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 30 -> RAW_MONITOR[X] - PC[X] - QTD_PC[15] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_15_PC_30.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 15"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 31 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[15] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_15_PC_31.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 16"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 32 -> RAW_MONITOR[X] - PC[X] - QTD_PC[16] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_16_PC_32.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 16"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 33 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[16] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_16_PC_33.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 17"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 34 -> RAW_MONITOR[X] - PC[X] - QTD_PC[17] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_17_PC_34.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 17"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 35 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[17] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_17_PC_35.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 18"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 36 -> RAW_MONITOR[X] - PC[X] - QTD_PC[18] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_18_PC_36.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 18"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 37 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[18] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_18_PC_37.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 19"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 38 -> RAW_MONITOR[X] - PC[X] - QTD_PC[19] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_19_PC_38.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 19"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 39 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[19] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_19_PC_39.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="1 1 0 0 20"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 40 -> RAW_MONITOR[X] - PC[X] - QTD_PC[20] - Processando..."
rtai-load > logs_finais_2/log_COM_MONITOR_COM_20_PC_40.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------
#LAYOUT: |RAW_MONITOR|PC|SEC|FREQ_IDEAL_INICIAL|QTD_PC|
ARGV="0 1 0 0 20"
echo "$TARGET:lxrt:./$TARGET $ARGV;popall:Control+C para cancelar a execucao! ;)" > $RUNINFO
printf "Experimento 41 -> RAW_MONITOR[ ] - PC[X] - QTD_PC[20] - Processando..."
rtai-load > logs_finais_2/log_SEM_MONITOR_COM_20_PC_41.txt
printf " - Concluíudo. \n"
sleep 5

#---------------------------------------------------------------------------------------------------

printf "\n\nEXPERIMENTO FINALIZADO! \n\n"

