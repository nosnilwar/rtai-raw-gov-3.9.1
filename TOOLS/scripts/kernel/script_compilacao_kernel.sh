#!/bin/bash
#
# Script de compilacao do kernel
#
# Copyright rawlinson.goncalves@gmail.com

# Descompactar o kernel
#$ tar xjvf linux-2.6.34.tar.bz2 -C /usr/src/
#cd /usr/src/linux-linux-2.6.34


# Copiar o config do sistema atual
#cp /boot/config-2.6.32-5-amd64 .config

# Configurar as opcoes necessarias
#make menuconfig

# Processo de compilacao e instalacao...

beep -l 1000
make -j 10
make modules
make modules_install
make install

cd /boot/
rm -rf *.old
mkinitramfs -o initrd-2.6.38.8.img /lib/modules/2.6.38.8/

update-grub

echo "Voce pode reiniciar o seu sistema e testar o novo Kernel... ;-)"

beep -l 10000 -f 250
