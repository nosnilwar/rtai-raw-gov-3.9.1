#! /bin/bash
#----------------------------------------------------------------------
# Description: Put CPU to and backto full powersave mode
# Author: Artem S. Tashkinov <birdie at permonline.ru>
# Created at: Sun Jun 19 00:14:40 YEKST 2005
# Computer: home.birdie.net
# System: Linux 2.6.12-k8 on i686
#
# Thu Jul 1  19:18:10 2010
#  1.0 Added SMP support 
# Sun Dec 25 16:50:36 2011
#  1.1 Completely reworked modules loading mechanism
#      userspace governor
# Sun Jul 22 05:30:16 YEKT 2012
#  1.2 Set/Reset
#  Improved output
#
# Copyright (c) 2005-2012 Artem S. Tashkinov. All rights reserved.
#----------------------------------------------------------------------

version=1.1
DRIVER=powernow-k8
cpu0=/sys/devices/system/cpu/cpu0/cpufreq
max0=$cpu0/cpuinfo_max_freq
lim0=$cpu0/scaling_max_freq
SD=$cpu0/scaling_driver

if [ ! -f $SD -a "$1" != "-l" -a "$1" != "--load" ]; then
	echo "Error: cpufrequency subsystem is not running!"
	exit 1
fi

SG=/sys/devices/system/cpu/cpu*/cpufreq/scaling_governor

governors=`cat $cpu0/scaling_available_governors 2>&1`

for i in performance conservative userspace powersave ondemand; do
	cgovern=`echo $governors | grep $i`
	if [ -z "$cgovern" ]; then
		echo "CPU governor '$i' not found."
		module="cpufreq_$i"
		echo "Installing $module ... "
		modprobe $module >/dev/null 2>&1
		if [ "$?" != "0" ]; then
			echo "Error: can't load $module module. Do you have it installed?"
			exit 1
		else
			echo "OK"
		fi
	fi
done

test "$1" = "-l" -o "$1" = "--load" || current=`cat $SG`

case $1 in
	--version|-v) #print the version number
		echo "`basename $0` version "$version
		exit 0;;

	--help|-h) #Display the help screen
		echo "Usage: `basename $0` [OPTION]"
		echo "	-M --maximum		- performance mode (minimum powersavings)"
		echo "	-m --mimimum		- powersave mode (minimum performance)"
		echo "	-a --auto		- ondemand mode (rapid auto performance)"
		echo "	-c --conservative	- conservative mode (gradual auto performance)"
		echo "	-u --userspace FREQ	- user defined CPU frequency"
		echo "	-l --load		- load CPU powersave driver"
		echo "	-n --now		- show current mode"
		echo "	-s --set FREQ		- set maximum CPU frequency"
		echo "	-r --reset		- reset maximum CPU frequency"
		echo "	-v --version		- show application version and exit"
		echo "	-h --help		- show this help and exit"
		exit 0;;

	--load|-l)
		KDRIVER=`echo $DRIVER | sed 's/-/_/g'`
		if [ -z "`lsmod | grep $KDRIVER`" ]; then
			modprobe $DRIVER && echo "CPU powersave driver has been loaded successfully"
		else
			echo "CPU powersave driver is already loaded"
		fi
		exit;;

	--userspace|-u)
		allowed=`cat $cpu0/scaling_available_frequencies`
		if [ -z "$2" ]; then
			echo "Need an argument to continue. The possible frequences are: "
			echo $allowed
		else
			if [ -n "`echo "$allowed" | grep -w "$2"`" ]; then
				echo -n "Setting "$2" frequency ... "
				echo "userspace" | tee $SG > /dev/null
				echo "$2" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_setspeed > /dev/null
				[ "`cat $cpu0/scaling_cur_freq 2>/dev/null`" == "$2" ] && echo OK || echo Failed
			else
				echo "'$2' is not amongst allowed frequencies: "
				echo $allowed
			fi
		fi
		exit;;

	--conservative|-c)
		echo "conservative" | tee $SG > /dev/null
		echo "conservative mode has been activated"
		exit;;

	--minimum|-m)
		echo "powersave" | tee $SG > /dev/null
		echo "powersave mode has been activated"
		exit;;

	--maximum|-M)
		echo "performance" | tee $SG > /dev/null
		echo "performance mode has been activated"
		exit;;

	--set|-s)
		allowed=`cat $cpu0/scaling_available_frequencies`
		if [ -z "$2" ]; then
			echo "Need an argument to continue. The possible frequences are: "
			echo $allowed
		else
			if [ -n "`echo "$allowed" | grep -w "$2"`" ]; then
				echo "The current governor is: `cat $cpu0/scaling_governor`"
				echo "Setting maximum frequency ... "
				echo "$2" | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq > /dev/null
				cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq
			else
				echo "'$2' is not amongst allowed frequencies: "
				echo $allowed
			fi
		fi
		exit;;

	--reset|-r)
		echo "The current governor is: `cat $cpu0/scaling_governor`"
		echo "Resetting maximum frequency ... "
		cat $max0 | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq > /dev/null
		cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_max_freq
		exit;;

	--auto|-a)
		echo "ondemand" | tee $SG > /dev/null
		echo "auto (ondemand) mode has been activated"
		exit;;

	--now|-n|*)
		cmode=`cat $SG | sort | uniq`
		echo "$cmode mode is currently activated:"
		cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_cur_freq
		if [ "`cat $max0`" == "`cat $lim0`" ]; then
			echo "No frequency limit is enforced."
		else
			echo "Maximum allowed frequency is `cat $lim0` (out of `cat $max0`)"
		fi
		exit;;
esac