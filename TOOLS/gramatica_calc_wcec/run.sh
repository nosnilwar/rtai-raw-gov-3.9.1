#! /bin/bash

# check if the file passed exists
if [ ! -f $1 ]
then
	echo -e "Error No Such File Found: $1\n" 1>&2
	exit 1
fi

function stop_script() {
	echo -e "\nError $1: Stop Running...\n"
	exit 1
}


# =========== create filename to uncrustify stdout and the directory output/
file_in=$1
file=$(echo $file_in | sed 's/.*\///g') # remove path
file=${file%.*} # remove current extension

dir="output/"
file_out=$dir$file"_uncrustify.c"
[ ! -d $dir ] && mkdir $dir


# ========== format the input file
echo -e "\n===== Parser Uncrustify =====\n" 1>&2

./tools/uncrustify/uncrustify-0.59/src/uncrustify -c \
					tools/uncrustify/ben_modified.cfg -f $file_in -o $file_out
[ $? != 0 ] && stop_script "Uncristify" # check if status was successful


# ========== generate the instruction-cycle file of the input file
echo -e "\n\n===== Generate Instruction-Cycle File =====\n" 1>&2

#TODO:RAWLINSON
#./tools/arm-linux-gcc-4.3.2/bin/arm-linux-gcc -g -S $file_out -o ${file_out%.*}".s"
#[ $? != 0 ] && stop_script "ARM-GCC" # check if status was successful

gcc -g -S $file_out -o ${file_out%.*}".s"
[ $? != 0 ] && stop_script "GCC" # check if status was successful

python src/c2asm/gen_instr_file.py $file_out
[ $? != 0 ] && stop_script "Instruction-Cycle" #check if status was successful


# ========== parser the input file
echo -e "\n\n===== Parser Grammar ========\n" 1>&2

file_graphml=${file_out%.*}
file_graphml=$file_graphml".graphml"
./src/parser $file_out 1>$file_graphml
[ $? != 0 ] && stop_script "Grammar" # check if status was successful


echo -e "Done\n" 1>&2

