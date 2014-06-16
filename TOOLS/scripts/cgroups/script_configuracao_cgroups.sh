#!/bin/bash
#
# Script de configuracao do cgroups para direcionar as tarefas do sistema operacional para o CPU0 e do rtai para o CPU1
#
# Copyright rawlinson.goncalves@gmail.com

service cgconfig restart
cgset -r cpuset.cpus=0 os_default

