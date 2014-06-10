#ifndef GRAMMAR_H
#define GRAMMAR_H

#include "../c2cfgml/graphml.h"
#include "../graph/graph_structs.h"
#include "../graph/graph.h"
#include "hash.h"

/* This function initialize some important structs for the parser. */
void parser_init_structs (void) {

	initTable(); /* table with all functions name define in the current file */
	_create_graph();
}

/* Functions Declarations */
void parser_add_function (char *func_name, int line, short int type) {

	int DEFINITION = 1;
	struct basic_block *bb;

	/* store function if it is not in the table */
	if ( addIdent(func_name) )
		_add_ep(func_name);
	if (type != DEFINITION) return;

	_add_function (func_name, line);
}

/* When the parser ends */
void parser_last_commands (char *file) {

	struct entrypoint *ep;

	//show_table();
	//_show_graph();
	_clean_graph();
	//_show_graph();
	fprintf(stderr, "Parser finished!...Making Graphml\n");
	make_graphml(file, __graph);
}

#endif /* GRAMMAR_H */
