#!/bin/bash
#
# Script de compilacao do rtai
#
# Copyright rawlinson.goncalves@gmail.com

# wget --no-check-certificate https://www.rtai.org/RTAI/rtai-3.5.tar.bz2

# tar xvf rtai-3.5.tar.bz2 -C /usr/src/

# cd /usr/src

# Entrar na pasta do linux alvo... que ira se tornar rtai...
# cd /usr/src/linux-2.6.19

# escolher o patch especifico com a versao do kernel alvo...
# patch -p1 -b < ../rtai-3.5/base/arch/i386/patches/hal-linux-2.6.19-i386-1.7-01.patch

# Agora vc tem q recompilar o kernel... e depois reiniciar o sistema com esse novo kernel...

# Agora compilando o rtai...

beep -l 1000

cd /usr/src/rtai-raw-gov-3.9.1

mkdir build

cd build

make -f ../makefile

make install

echo "Voce pode reiniciar o seu sistema e testar o novo Kernel com o RTAI instalado... ;-)"

beep -l 10000 -f 250

# NAO ESQUECER DE INCLUIR O PATH NO ARQUIVO /etc/profile
#PATH=$PATH:/usr/realtime/include
#export
#PATH=$PATH:/usr/realtime/bin
#export
