#ifndef GRAPH_H
#define GRAPH_H

#include <stdio.h>

#include "graph_structs.h"
#include "stmt_structs.h"

extern struct entrypoint_list *__graph;
extern struct entrypoint *__current_ep;
extern int __common_node; 	/* It controls where a common node can be put. In
							 * cases where a node has been already created, like
							 * the then node in if statements, it can be used to
							 * put the correct start line of its scope.
							 * It just keeps the status of the current node in
							 * the entrypoint.
							 */

extern void _create_graph (void);
extern void _make_graphml (void);

/****** Entrypoint ******/

extern void _add_ep (char *name);
extern void _set_ep (char *name);
extern void _set_ep_last_line (int last_line);
extern void _add_bb_to_ep (struct basic_block*);
extern void _add_function (char *func_name, int line);
extern void _add_function_caller (char *func_name, int line);
extern void _add_common_node (int line);
extern void _add_return (int line);
extern void _add_break (int line);
extern void _add_continue (int line);
extern void _add_for_last_bb (void);
extern void _show_graph (void);
extern void _clean_graph (void);/*Remove some unecessary nodes.*/

/****** HANDLE STATEMENTS ******/

extern void _add_stmt (int type, int line);
extern void _add_stmt_then (int line);
extern void _add_stmt_then_end (void);
extern void _add_stmt_else (int line);
extern void _add_stmt_end (int line);

#endif /* GRAPH_H */
