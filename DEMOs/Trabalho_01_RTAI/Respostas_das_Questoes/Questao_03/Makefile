#Makefile para a compilacao de pwmsignal_userspace.c
default:
	export PATH=$PATH:/usr/realtime/bin
	gcc `rtai-config --lxrt-cflags` `rtai-config --lxrt-ldflags` -o pwmsignal_userspace pwmsignal_userspace.c
