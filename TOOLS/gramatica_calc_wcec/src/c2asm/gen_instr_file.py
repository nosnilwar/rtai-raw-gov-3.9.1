# -*- coding: utf-8 -*-

from asmfc import *
from calculate_wcec import *
import sys

def main():

	# make C lines refer to assembler instructions
	if (len(sys.argv) < 2):
		sys.stderr.write("Error: C File is Missing!\n")
		sys.exit(1)

	cFile = sys.argv[1]
	insFile = cFile.replace(".c", ".instr")
	print "Generating: " + insFile

	instr_dic, labels_dic = get_afc_dict(cFile)

	# get ARM instructions and their cycles
	#TODO:RAWLINSON... armCyclesFile = "src/c2asm/powerAsm.txt"
	armCyclesFile = "src/c2asm/powerAsm_AMD_Athlon_x86.txt"
	table = init_wcec_table(armCyclesFile)

	# generate a file that contains in each line the line of each instruction
	# in the C code and its WCEC
	instrFile = file(insFile, "w")
	cInstrLines = instr_dic.keys()
	cInstrLines.sort()
	for cLine in cInstrLines:
		# each line can have more than one instruction list, ex: for statements
		for instr_list in instr_dic[cLine]:
			cycles = cal_wcec(instr_list, labels_dic, table)
			instrFile.write(str(cLine) + "\t" + str(cycles) + "\n")
	instrFile.close()

if __name__ == "__main__":
	main()

