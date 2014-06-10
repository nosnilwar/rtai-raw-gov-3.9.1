# This program is under GPL Licence
# Author: David Cohen <dacohen@gmail.com>
# Version: 0.1
#
# History:
# 2007-16-04: version 0.1 implemented

r"""This module gives support to deal with assembly files that have debug informations.
@def get_c_file: this function returns the C file related to an assembly file.
@def get_afc_dict: this function returns a dictionary relating the lines of code from a C file and its assembly instructions."""

import re

# Internal functions

def _read_file_lines(file_name):
	file = open(file_name, "r")
	lines = file.readlines()
	file.close()

	return lines

"""
With for statement a label divide the last and the first node of this statement
when the three expressions occured. So, the label case was handled to take
exactly instructions of each node, but other examples with lables will not be
right.
"""
def _find_asm_from_c(clines, slines):

	# regular expressions for instructions, loc and labels
	pattern_loc = r'^\s*\.loc\b\s+\d+\s+(\d+)\s+'
	pattern_inst = r'^\s+(\w+)[^\.]*(\.\w+)?.*'
	pattern_label = r'^(\.L\d+).*'

	# states of the automaton
	STAT_INIT = 0
	STAT_NEW_LOC = 1
	STAT_ADD_INSTR = 2
	STAT_LABEL = 3

	# structs to keep the map from C code to assembly
	afc_dict = {}		# map: line numer -> [ [list of instr], [...], ... ]
	label_dict = {}		# map: label -> [list of instr]
	instr_set = []
	labels_name = []

	# initial settings
	state = STAT_INIT;
	current_loc = -1

	for line in slines:

		res = re.search(pattern_inst, line)
		if res: # Found assembly instruction
			data = res.group(1, 2)	# (instruction, label or None)
			state = STAT_ADD_INSTR

		else:
			res = re.search(pattern_loc, line)
			if res: # Found loc
				data = res.group(1)
				state = STAT_NEW_LOC

			else:
				res = re.search(pattern_label, line)
				if res: # Found Label
					data = res.group(1)
					state = STAT_LABEL

				else:
					continue

		# States {
		if state == STAT_INIT:
			continue

		if state == STAT_NEW_LOC: # each loc is a line made of a list of instrs

			new_loc = int(data)
			if afc_dict.has_key(new_loc) == False:
				afc_dict[new_loc] = []

			afc_dict[new_loc].append([])
			current_loc = new_loc
			labels_name = []
			continue

		if state == STAT_LABEL:
			label = data
			labels_name.append(label)
			label_dict[label] = []

		if state == STAT_ADD_INSTR: # each instr is a tuple (instr, label)
			if current_loc > -1:
				tam = len(afc_dict[current_loc])
				afc_dict[current_loc][tam-1].append(data)

			# for consecutives labels
			for label in labels_name:
				label_dict[label].append(data)

			if data[0] == "b": # unconditional branch
				current_loc = -1
				labels_name = []
		# }

	#for key in afc_dict.keys():
		#print key, "\n", afc_dict[key]

	#print "\n------------------------\n"
	#for key in label_dict.keys():
		#print key, "\n", label_dict[key]

	return afc_dict, label_dict


def get_afc_dict(cfile):
	"""This function returns a dictionary relating the lines of code from a C file and its assembly instructions.
	@sfile: an assembly file with debug information."""

	sfile = cfile.replace(".c", ".s")
	clines = _read_file_lines(cfile)
	slines = _read_file_lines(sfile)

	afc_dict = _find_asm_from_c(clines, slines)

	return afc_dict
