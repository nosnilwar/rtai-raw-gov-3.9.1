#!/bin/bash

if [ -z "$GNUPLOT" ] ; then
	GNUPLOT=gnuplot
fi

NO_ARGS=0
E_OPTERROR=85

if [ $# -eq "$NO_ARGS" ]    # Script invoked with no command-line args?
then
  echo "Usage: `basename $0` options (-y)"
  exit $E_OPTERROR          # Exit and explain usage.
                            # Usage: scriptname -options
                            # Note: dash (-) necessary
fi


while getopts "y:" Option
do
  case $Option in
    y     ) YMAX=$OPTARG ;;
    *     ) echo "Unimplemented option chosen." && exit $E_OPTERROR;;   # Default.
  esac
done

shift $(($OPTIND - 1))

if [ -z "$YMAX" ] ; then
	echo "Specify -y N"
	exit $E_OPTERROR
fi

YRANGE="set yrange [100:$YMAX]"

for i in $@ ; do

PLOT="plot"
for j in `seq 1 6` ; do
	S=`expr 3 \* $j`
	PLOT=$PLOT" \"$i\" using $S:$(expr $S + 1):xticlabel(1) title \" `expr $j + 3`\","
done
PLOT=${PLOT%,}
echo $PLOT

GDFONTPATH=/usr/share/fonts/truetype/latex-xft-fonts/ $GNUPLOT << EOF
set term jpeg truecolor nocrop enhanced font "cmr10" 18
set decimalsign ','
set output "$i.jpg"
set grid
set xlabel "Podas Aplicadas"
set ylabel "Tempo (us)"
set title "Tempo de Computação"
#set key outside bmargin
set key box title "Quantidade\nde Tarefas"
$YRANGE

#set format  y "%.2f"
set logscale ycb
set style data histogram
set style histogram errorbars gap 2 lw 2
set xtics nomirror rotate by -45
set style fill solid border -1
set boxwidth 1
$PLOT

set output
set terminal pop
EOF
done