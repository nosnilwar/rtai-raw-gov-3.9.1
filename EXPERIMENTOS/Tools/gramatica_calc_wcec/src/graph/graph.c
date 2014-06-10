#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "graph_structs.h"
#include "stmt_structs.h"
#include "graph.h"

struct entrypoint_list *__graph;
struct entrypoint *__current_ep;
struct stmts *__lbls; /* stack for all statements */
int __current_node = STMT_NONE; /* status variable of the current node */

void _create_graph (void);
void _make_graphml (void);

void _create_graph (void) {

	__graph = init_graph();
	__lbls = create_stmts();
}

void _make_graphml (void) {

	make_graphml(__graph);
}

/* Entrypoint */

void _add_ep (char *name);
void _set_ep (char *name);
void _set_ep_last_line (int last_line);
void _add_bb_to_ep (struct basic_block*);
void _add_function (char *func_name, int line);
void _add_function_caller (char *func_name, int line);
void _add_common_node (int line);
void _add_return (int line);
void _add_break (int line);
void _add_continue (int line);
void _set_jmp_false (void);
void _show_graph (void);
void _clean_graph (void);

/* HANDLE STATEMENTS */

void _add_stmt (int stmt_type, int line);
void _add_stmt_then (int line);
void _add_stmt_then_end (void);
void _add_stmt_else (int line);
void _add_stmt_end (int line);

/*================= Entrypoint =================*/

void _add_ep (char *name) {
	add_entrypoint(name, __graph);
}

void _set_ep (char *name) {
	__current_ep = get_entrypoint(name, __graph);
}

void _set_ep_last_line (int last_line) {
	set_last_line(__current_ep->current_bb, last_line);
}

void _add_bb_to_ep (struct basic_block *bb) {

	add_bb(__current_ep->current_bb, bb);
	add_bb_to_entrypoint(bb, __current_ep);
}

void _add_function (char *func_name, int line) {

	struct basic_block *bb;

	_set_ep(func_name);

	/* add the first basic block to the current entrypoint */
	bb = create_bb(line);
	_add_bb_to_ep(bb);

	__current_node = STMT_NONE;

	//fprintf(stderr, "aqui line %d\n", line);
}

/* THIS FUNCTION MAY BE CHANGED !!!!!!!!!!!
 * this function helps to have the control when there's not a statement after
 * the last semicolon of for condition part.
 */
void _set_jmp_false (void) {
	struct stmt *stmt = __lbls->last;
	stmt->jmp_false = stmt->condition;
}

/*
 * It takes the current node and see if it's set to common node, if so, its line
 * is updated and the status changed.
 */
void _add_common_node (int line) {

	int status;
	struct basic_block *current_bb;

	if (__current_node == STMT_COMMON) {
		current_bb = __current_ep->current_bb;
		status = current_bb->status;

		/* create a new common node */
		if (status == STMT_CALL || status == STMT_PSEUDO) {
			current_bb = create_bb(-1);
			_add_bb_to_ep(current_bb);
		}
		else if (status == STMT_END || status == STMT_ELSE)
			current_bb->status = STMT_COMMON;

		set_start_line(current_bb, line);
		__current_node = STMT_NONE;
	}

	/* after a function call, return, break or continue, a new common node has
	 * to be create */
	else if (__current_node == STMT_CALL || __current_node == STMT_RETURN ||
			__current_node == STMT_BREAK || __current_node == STMT_CONTINUE )
		__current_node = STMT_COMMON;

	//fprintf(stderr, "aqui line %d\n", line);
}

void _add_function_caller (char *func_name, int line) {

	struct entrypoint *ep;
	struct basic_block *caller, *current_bb = __current_ep->current_bb;
	struct basic_block *return_bb;
	struct basic_block_list *last_bb, *parent;

	/* it has the function definition in the grammar, but it's not one. */
	if (func_name == NULL) return;

	set_last_line(current_bb, line);

	caller = create_bb(line);
	set_last_line(caller, line);
	caller->status = STMT_CALL;

	ep = get_entrypoint(func_name, __graph);
	if (ep != NULL) /* if function is define in the current file */
		add_callee_to_entrypoint(caller, ep);

	caller->call_name = (char*) malloc ((strlen(func_name)+1)*sizeof(char));
	strcpy(caller->call_name, func_name);

	/* check if the last node in ep is a return and if they have the same line*/
	last_bb = get_last_bb_list(__current_ep->bbs);
	return_bb = (last_bb != NULL) ? last_bb->bb : NULL;
	if (return_bb != NULL && return_bb->status == STMT_RETURN && \
												return_bb->start_line == line) {
		/* each parent of the return points now to the call node */
		FOR_EACH_BB(parent, return_bb->parents)
			add_bb(parent->bb, caller);
		remove_bb(return_bb); /* remove return from ep */
		add_bb_to_entrypoint(caller, __current_ep);
		_add_return(line); /* add again the return node */
		/*the current_bb is the one above the return and has a different line */
		set_current_bb(current_bb, __current_ep);
	}
	else
		_add_bb_to_ep(caller);

	__current_node = STMT_CALL;

	//fprintf(stderr, "aqui line %d\n", line);
}

/* return blocks can not be the current node */
void _add_return (int line) {

	struct basic_block *bb, *current_bb = __current_ep->current_bb;

	set_last_line(current_bb, line);

	bb = create_bb(line);
	set_last_line(bb, line);
	change_bb_status(bb, STMT_RETURN);

	/* set return as current node */
	_add_bb_to_ep (bb);
	/* set the previous node as the current one */
	set_current_bb(current_bb, __current_ep);

	__current_node = STMT_RETURN; /* a new node has to be created */

	//fprintf(stderr, "aqui line %d\n", line);
}

/* break blocks can not be the current node */
void _add_break (int line) {

	struct basic_block *bb, *end, *current_bb = __current_ep->current_bb;
	struct stmt *stmt = __lbls->last;

	set_last_line(current_bb, line);

	bb = create_bb(line);
	set_last_line(bb, line);
	change_bb_status(bb, STMT_BREAK);

	_add_bb_to_ep (bb);

	if (__lbls->last == NULL) return;
	stmt = __lbls->last;

	/* current stmt may be a switch */
	while (stmt->condition->status != STMT_WHILE &&
			stmt->condition->status != STMT_DO_WHILE &&
				stmt->condition->status != STMT_FOR &&
					stmt->condition->status != STMT_SWITCH)
		stmt = stmt->prev;
	end = stmt->end;

	/* break node points to the end */
	add_bb(bb, end);
	/* set the previous node as the current one */
	set_current_bb(current_bb, __current_ep);

	__current_node = STMT_BREAK; /* a new node has to be created */

	//fprintf(stderr, "aqui line %d\n", line);
}

void _add_continue (int line) {

	struct basic_block *bb, *current_bb = __current_ep->current_bb;
	struct stmt *stmt;

	set_last_line(current_bb, line);

	bb = create_bb(line);
	set_last_line(bb, line);
	change_bb_status(bb, STMT_CONTINUE);

	_add_bb_to_ep(bb);

	if (__lbls->last == NULL) return;
	stmt = __lbls->last;
	/* get the closest loop in the statement stack */
	while (stmt->condition->status != STMT_WHILE &&
			stmt->condition->status != STMT_DO_WHILE &&
				stmt->condition->status != STMT_FOR)
		stmt = stmt->prev;

	if (stmt->condition->status == STMT_FOR)
		add_bb(bb, stmt->jmp_false);
	else /* continue node points to the condition node */
	add_bb(bb, stmt->condition);
	/* set the previous node as the current one */
	set_current_bb(current_bb, __current_ep);

	__current_node = STMT_CONTINUE; /* a new node has to be created */

	//fprintf(stderr, "aqui line %d\n", line);
}

void _add_for_last_bb (void) {

	struct stmt *for_stmt;

	for_stmt = __lbls->last;
	for_stmt->jmp_false = for_stmt->condition;
}

/*
 * Remove some unecessary nodes.
 * The assigment "bbl = bbl->next_bb" is necessary to go to the next element in
 * the list. If it was done only inside the "for", the current element could be
 * remove and its reference to the next one in the list would be lost.
 */
void _clean_graph (void) {

	struct entrypoint *ep;
	struct basic_block_list *bbl;
	struct basic_block *bb;

	FOR_EACH_ENTRY (ep, __graph->ep) {
		for (bbl = ep->bbs; bbl != NULL; ) {
			bb = bbl->bb;
			bbl = bbl->next_bb;
			/* the root, last and call nodes don't need to be clean */
			if (bb->parents == NULL || bb->children == NULL || bb->call != NULL)
				continue;
			clean_stmt(bb);
		}
	}
}

void _show_graph (void) {

	struct entrypoint *ep;

	FOR_EACH_ENTRY (ep, __graph->ep)
		show_entrypoint (ep);
}

/*================= HANDLE STATEMENTS =================*/

void _add_stmt (int stmt_type, int line) {

	struct basic_block *current_bb = __current_ep->current_bb;

	/* if the statement is a switch */
	if (stmt_type == STMT_CASE && __lbls->last != NULL \
							&& __lbls->last->condition->status == STMT_CASE)
		_add_stmt_else(line);

	/* if it is a for with all the expressions: for(exp1;exp2;exp3), this node
	 * is the exp1. Then, the condition (exp2) is created. */
	else if (stmt_type == STMT_FOR) {
		set_last_line(current_bb, line);
		current_bb = create_bb(line);
		_add_bb_to_ep(current_bb);
	}

	current_bb = __current_ep->current_bb;
	set_last_line(current_bb, line);
	add_stmt(line, __lbls, __current_ep);

	/* now the current bb is the condition of the stmt */
	current_bb = __current_ep->current_bb;
	set_last_line(current_bb, line);
	change_bb_status(current_bb, stmt_type);

	//fprintf(stderr, "aqui line %d\n", line);
}

void _add_stmt_then (int line) {

	struct basic_block *current_bb = __current_ep->current_bb;
	struct stmt *stmt = __lbls->last;

	if (stmt && stmt->condition->status == STMT_FOR) {
		stmt->jmp_false = create_bb(line);
		set_last_line(stmt->jmp_false, line);
	}

	add_stmt_then(line, __lbls, __current_ep);
	__current_node = STMT_COMMON;

	//fprintf(stderr, "aqui line %d\n", line);
}

void _add_stmt_then_end (void) {

	add_current_bb_to_end_stmt(__lbls, __current_ep);

	//fprintf(stderr, "aqui line %d\n", line);
}

void _add_stmt_else (int line) {

	add_stmt_else(line, __lbls, __current_ep);
	__current_node = STMT_COMMON;

	//fprintf(stderr, "aqui line %d\n", line);
}

void _add_stmt_end (int line) {

	add_stmt_end_to_ep(line, __lbls, __current_ep);
	__current_node = STMT_COMMON;

	//fprintf(stderr, "aqui line %d\n", line);
}
