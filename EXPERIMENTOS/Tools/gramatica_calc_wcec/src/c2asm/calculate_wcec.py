# *************************************************************************************
# -CURSO: Engenharia da Computacao --
# Obs.: Estudante na UFAM
# ***
# Carlos Bruno Oliveira Lopes
# ***
# --- versao 0.2 ---
#
# -Funcao: Calcula o ciclo de execucao do pior caso por bloco --
# ************************************************************************************


def init_wcec_table(tabAsm):
	# endereco de memoria para o arquivo
	pont = open (tabAsm, 'r')
	linesofile = pont.readlines()
	tab = {}
	for e in linesofile:
		elem = e.split()
		instr = str.lower(elem[0])
		cycles = int(elem[1])
		#energy = float(elem[2])
		#tab[instr] = [cycles, energy]
		tab[instr] = [cycles]

	return tab

# /* funcao que calcula o WCEC */
def cal_wcec (instr_list, labels_dict, wcec_table):

	wcec = 0;
	for instr_tuple in instr_list:
		instr = instr_tuple[0]
		if (wcec_table.get(instr) != None):
			wcec += wcec_table[instr][0]
			if (instr == "b"):
				label = instr_tuple[1]
				if (isinstance(labels_dict[label], list)): # compute label wcec
					tmp = cal_wcec(labels_dict[label], labels_dict,wcec_table)
					labels_dict[label] = tmp
				wcec += labels_dict[label]

	return wcec

# /* funcao que calcula a provavel energia consumida por cada bloco */
def cal_energy (linst, wcec_table):

	energy = 0;
	for e in linst:
		if (wcec_table.get(str.upper(e))!=None):
			energy = energy + wcec_table[str.upper(e)][1]

	return (energy)

def is_empty_cycle(ainst):
	for e in ainst:
		if (e > 0):
			return (1)
	return (0)

# funcao que calcula o wcec de cada bloco levando em conta o tamanho do pipeline do processador considerado
def cal_wcec_pipeline (linst, ibloco, wcec_table, tampipe):
	cycle_inst = []
	for e in linst:
		if (wcec_table.get(str.upper(e))!=None):
			cycle_inst.append(wcec_table.get(str.upper(e))[0])
		else: print str.upper(e)
	if (len(cycle_inst)>0):
		cycles_ibloco = cycle_inst[ibloco]
	else: cycles_ibloco = 0
	cycles=0
	cycle_ibloco = 0
	while (is_empty_cycle(cycle_inst)==1):
		if (cycles > len(cycle_inst)):
			upperbound = len(cycle_inst)
		else: upperbound = cycles

		i=0
		pipe=1
		while(i<upperbound):
			if ((cycle_inst[i] > 0) and (pipe <= tampipe)): # pipe <= 6. O 6 pode ser transformado em parametro e corresponderia ao tamanho do pipeline
				cycle_inst[i] = cycle_inst[i] - 1
				pipe = pipe+1

			i = i + 1
		cycles = cycles + 1

		if ((cycle_inst[ibloco] != cycles_ibloco) and (cycle_ibloco==0)):
			cycle_ibloco = cycles

	return (cycles-cycle_ibloco)
