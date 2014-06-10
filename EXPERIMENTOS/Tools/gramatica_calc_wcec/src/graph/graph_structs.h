#ifndef GRAPH_STRUCTS_H
#define GRAPH_STRUCTS_H

#include <stdio.h>
#include <string.h>

#define FOR_EACH_BB(tmp, head) for(tmp = head; tmp != NULL; \
															tmp = tmp->next_bb)
#define FOR_EACH_ENTRY(tmp, head) for(tmp = head; tmp != NULL; \
															tmp = tmp->next_ep)
#define PRINT_STR(tmp) (fprintf(stderr, "%s", tmp))
#define PRINT_INT(tmp) (fprintf(stderr, "%d", tmp))


enum {	STMT_COMMON = 0, STMT_NONE, STMT_PSEUDO,
		STMT_IF, STMT_THEN, STMT_ELSE, STMT_END, STMT_ELSE_IF,
		STMT_SWITCH, STMT_CASE, STMT_DEFAULT,
		STMT_WHILE, STMT_FOR, STMT_DO_WHILE,
		STMT_CALL, STMT_RETURN, STMT_BREAK, STMT_CONTINUE };

/************** BASIC BLOCK DEFINITION **************/

/* each basic block is a node of a function scope */

struct basic_block_list {

	struct basic_block *bb;
	struct basic_block_list *next_bb;
};

struct basic_block {

	struct entrypoint *ep; /* function that has this node */
	struct entrypoint *call; /* function that this node calls */
	struct basic_block_list *parents; /* sources */
	struct basic_block_list *children; /* destinations */

	/* common for all nodes */
	char *call_name;
	int rwcec, wcec, id, max_rwcec, color, start_line, last_line;
	int status;

	/* common for loop */
	char isloop;
	int iteration_num;
	int loop_wcec;
	int loop_parent; /* to know which nodes in the loop are parents of it */
	/*the following nodes are the begin and end of the longest path in a loop */
	struct basic_block *loop_last_node; /*the last node to be executed*/
	struct basic_block *loop_then; /* the first node, after the condition, to be
									  executed */
};

extern struct basic_block_list* create_bb_list_elem(void);
extern struct basic_block* create_bb(int start_line);

extern void add_bb (struct basic_block *father, struct basic_block *bb);
extern void add_bb_in_list (struct basic_block*, struct basic_block_list**);

extern void remove_bb(struct basic_block*);
extern void remove_bb_from_parents(struct basic_block*);
extern void remove_bb_from_children(struct basic_block*);
extern void remove_bb_in_list (struct basic_block_list**, struct basic_block*);

static struct basic_block_list* get_last_bb_list (struct basic_block_list*);
static struct basic_block_list* get_elem_before_bb (struct basic_block_list*,
													struct basic_block*);

static inline void set_start_line (struct basic_block *bb, int start_line);
static inline void set_last_line (struct basic_block *bb, int last_line);
static inline void change_bb_status (struct basic_block *bb, int status);
static int get_list_size (struct basic_block_list*);
static void show_bb (struct basic_block*);
static void show_bb_status (struct basic_block*);
static void show_bb_parents (struct basic_block*);
static void show_bb_children (struct basic_block*);


/************** ENTRYPOINT DEFINITION **************/

/* each entrypoint is a function define in the file */

/* it's a list with just a single link whose elements are insert in the end */
struct entrypoint_list {

	struct entrypoint *ep, *end;
};

struct entrypoint {

	char *name;
	int id, rwcec, color;
	struct basic_block *begin;
	struct basic_block *current_bb;

	struct basic_block_list *bbs; /* hold all of its nodes */
	struct basic_block_list *callees; /* where this entrypoint is called */

	struct entrypoint *next_ep; /* go to the next entrypoint */
};

extern struct entrypoint_list* init_graph(void);
extern struct entrypoint* create_ep(char *name);

extern void add_entrypoint (char *name, struct entrypoint_list*);
/* add to bbs and see if it's the start node */
extern void add_bb_to_entrypoint (struct basic_block*, struct entrypoint*);
/* add the caller to entrypoint callee list */
extern void add_callee_to_entrypoint (struct basic_block*, struct entrypoint*);

extern void remove_bb_from_entrypoint(struct basic_block*);
extern void remove_callee_from_entrypoint(struct basic_block*);

static inline void set_current_bb (struct basic_block*, struct entrypoint*);
static struct entrypoint* get_entrypoint (char*, struct entrypoint_list*);
static void show_entrypoint (struct entrypoint*);
static void show_entrypoint_callees (struct entrypoint*);


/******** SOME DEFINITIONS TO ENTRYPOINTS **********/

static inline void set_current_bb(struct basic_block *bb,struct entrypoint *ep){

	ep->current_bb = bb;
}

static struct entrypoint* get_entrypoint (char *name, struct entrypoint_list *eps) {

	struct entrypoint *ep;

	FOR_EACH_ENTRY (ep, eps->ep)
		if ( strcmp(ep->name, name) == 0 )
			break;

	return ep;
}

static void show_entrypoint (struct entrypoint *ep) {

	struct basic_block_list *bb;

	fprintf(stderr, "\n============== entrypoint name: %s =======\n", ep->name);

	show_entrypoint_callees(ep);
	fprintf(stderr, "\nNODES:\n");
	FOR_EACH_BB (bb, ep->bbs)
		show_bb(bb->bb);

	fprintf(stderr, "\n======= end show entrypoint %s ========\n\n", ep->name);
}

static void show_entrypoint_callees (struct entrypoint *ep) {

	struct basic_block_list *call;

	if (!ep->callees)
		fprintf(stderr, "\nthis function is not call!\n\n");
	else {
		fprintf(stderr, "\nCALLERS:\n");
		FOR_EACH_BB (call, ep->callees)
			fprintf(stderr,"\tbb in function %s, start line %d end line %d\n",
				call->bb->ep->name,	call->bb->start_line, call->bb->last_line);
	}
}

/******** SOME DEFINITIONS TO BASIC BLOCKS **********/

static inline void set_start_line (struct basic_block *bb, int start_line) {

	bb->start_line = start_line;
}

static inline void set_last_line (struct basic_block *bb, int last_line) {

	if (bb->last_line != -1) return;
	if (bb->start_line <= last_line-1)
		bb->last_line = last_line-1;
	else
		bb->last_line = last_line;
}

static inline void change_bb_status (struct basic_block *bb, int status) {

	bb->status = status;
}

static struct basic_block_list* get_last_bb_list(struct basic_block_list *list){

	struct basic_block_list *bb;

	if (list == NULL) return NULL;
	bb = list;
	while (bb->next_bb != NULL)
		bb = bb->next_bb;

	return bb;
}

/*
 * if the bb is return, it means that the list has one element or it is the
 * first element in the list.
 */
static struct basic_block_list* get_elem_before_bb(struct basic_block_list *list,
													struct basic_block *bb) {

	struct basic_block_list *prev;

	if (!list) return NULL; /* empty list */
	if (list->bb == bb) return list;
	prev = list;
	while (prev != NULL && prev->next_bb->bb != bb)
		prev = prev->next_bb;

	return prev;
}

static int get_list_size (struct basic_block_list *list) {

	struct basic_block_list *bb;
	int size = 0;

	FOR_EACH_BB (bb, list)
		size++;

	return size;
}

static void show_bb (struct basic_block *bb) {

	fprintf(stderr, "\n------------------\n\n");
	fprintf(stderr, "bb in function: %s, start line: %d, last line: %d\n\n",
								bb->ep->name, bb->start_line, bb->last_line);
	show_bb_status(bb);
	if (!bb->call_name)
		fprintf(stderr, "\n\tcall: NO!\n");
	else
		fprintf(stderr, "\n\tcall: %s\n", bb->call_name);

	show_bb_parents(bb);
	show_bb_children(bb);
}

static void show_bb_parents (struct basic_block *bb) {

	struct basic_block_list *parent;

	fprintf(stderr, "\n\tparents:\n");
	if (!bb->parents) {
		fprintf(stderr, "\t\tnull\n");
		return;
	}

	FOR_EACH_BB (parent, bb->parents) {
		fprintf(stderr, "\t\tbb start line %d last line %d ",
								parent->bb->start_line, parent->bb->last_line);
		show_bb_status(parent->bb);
	}
}

static void show_bb_children (struct basic_block *bb) {

	struct basic_block_list *child;

	fprintf(stderr, "\n\tchildren:\n");
	if (!bb->children) {
		fprintf(stderr, "\t\tnull\n");
		return;
	}

	FOR_EACH_BB (child, bb->children) {
		fprintf(stderr, "\t\tbb start line %d last line %d ",
								child->bb->start_line, child->bb->last_line);
		show_bb_status(child->bb);
	}
}

static void show_bb_status (struct basic_block *bb) {

	fprintf(stderr, "status ");
	switch (bb->status) {
		case STMT_COMMON:
			fprintf(stderr, "COMMON\n");
			break;
		case STMT_CALL:
			fprintf(stderr, "CALL\n");
			break;
		case STMT_IF:
			fprintf(stderr, "IF\n");
			break;
		case STMT_THEN:
			fprintf(stderr, "THEN\n");
			break;
		case STMT_ELSE:
			fprintf(stderr, "ELSE\n");
			break;
		case STMT_END:
			fprintf(stderr, "END\n");
			break;
		case STMT_ELSE_IF:
			fprintf(stderr, "ELSE-IF\n");
			break;
		case STMT_SWITCH:
			fprintf(stderr, "SWITCH\n");
			break;
		case STMT_CASE:
			fprintf(stderr, "CASE\n");
			break;
		case STMT_DEFAULT:
			fprintf(stderr, "DEFAULT\n");
			break;
		case STMT_WHILE:
			fprintf(stderr, "WHILE first line %d\n",
											bb->loop_then->start_line);
			break;
		case STMT_FOR:
			fprintf(stderr, "FOR first line %d\n",
											bb->loop_then->start_line);
			break;
		case STMT_DO_WHILE:
			fprintf(stderr, "DO-WHILE first line %d\n",
											bb->loop_then->start_line);
			break;
		case STMT_RETURN:
			fprintf(stderr, "RETURN\n");
			break;
		case STMT_BREAK:
			fprintf(stderr, "BREAK\n");
			break;
		case STMT_CONTINUE:
			fprintf(stderr, "CONTINUE\n");
			break;
		case STMT_PSEUDO:
			fprintf(stderr, "PSEUDO\n");
			break;
		default:
			fprintf(stderr, "NO!\n");
	}
}

#endif /* GRAPH_STRUCTS_H */
