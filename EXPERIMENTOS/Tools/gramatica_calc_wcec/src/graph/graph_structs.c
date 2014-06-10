
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "graph_structs.h"

/************************ CREATE STRUCTS *************************/

struct entrypoint_list* init_graph(void) {

	struct entrypoint_list *ep_list;

	ep_list = (struct entrypoint_list*) malloc (sizeof(struct entrypoint_list));
	ep_list->ep = ep_list->end = NULL;

	return ep_list;
}

struct entrypoint* create_ep(char *name) {

	struct entrypoint *ep;
	static int id_ep = 0; /* static variable in a local scope */

	ep = (struct entrypoint*) malloc (sizeof(struct entrypoint));
	ep->name = (char*) malloc ((strlen(name)+1)*sizeof(char));
	strcpy(ep->name, name);
	ep->id = id_ep++;
	ep->rwcec = ep->color = 0;
	ep->begin = ep->current_bb = NULL;
	ep->bbs = ep->callees = NULL;
	ep->next_ep = NULL;

	return ep;
}

struct basic_block_list* create_bb_list_elem(void) {

	struct basic_block_list *bb_list;

	bb_list = (struct basic_block_list*)malloc(sizeof(struct basic_block_list));
	bb_list->bb = NULL;
	bb_list->next_bb = NULL;

	return bb_list;
}

struct basic_block* create_bb(int start_line) {

	struct basic_block *bb;

	bb = (struct basic_block*) malloc (sizeof(struct basic_block));
	bb->ep = bb->call = NULL;
	bb->parents = bb->children = NULL;
	bb->loop_last_node = bb->loop_then = NULL;
	bb->start_line = start_line;
	bb->last_line = -1;
	bb->call_name = NULL;
	bb->status = STMT_COMMON;

	return bb;
}

/************************ ADD ELEMENTS ***************************/

/*------ for entrypoints ------*/

/* create entrypoint and add to the list */
void add_entrypoint (char *name, struct entrypoint_list *list) {

	struct entrypoint *ep;

	ep = create_ep(name);
	if (list->ep == NULL) /* empty list */
		list->ep = ep;
	else
		list->end->next_ep = ep;
	list->end = ep;
}

/* add bb to bbs on entrypoint */
void add_bb_to_entrypoint (struct basic_block *new, struct entrypoint *ep) {

	struct basic_block_list *bbl;

	new->ep = ep; /* set from what ep this node belongs */
	set_current_bb (new, ep); /* set which node is the current one */
	if (!ep->begin) ep->begin = new;
	if (!ep->bbs) { /* empty list */
		ep->bbs = create_bb_list_elem();
		ep->bbs->bb = new;
		return;
	}
	/* one or more bbs in function scope */
	bbl = get_last_bb_list (ep->bbs);
	bbl->next_bb = create_bb_list_elem();
	bbl->next_bb->bb = new;
}

/* add a new caller to caller list on entrypoint */
void add_callee_to_entrypoint(struct basic_block *callee,struct entrypoint *ep){

	struct basic_block_list *call;

	callee->call = ep; /* set what ep this node calls */
	if (!ep->callees) { /* empty list */
		ep->callees = create_bb_list_elem();
		ep->callees->bb = callee;
		return;
	}
	/* one or more callees */
	call = get_last_bb_list (ep->callees);
	call->next_bb = create_bb_list_elem();
	call->next_bb->bb = callee;
}

/*------ for basic blocks ------*/

void add_bb (struct basic_block *father, struct basic_block *bb) {

	if (father == NULL) /* root node */
		return;

	/* add father to parent list of bb */
	add_bb_in_list(father, &bb->parents);

	/* add bb to children list of father*/
	add_bb_in_list(bb, &father->children);
}

void add_bb_in_list (struct basic_block *bb, struct basic_block_list **list) {

	struct basic_block_list *last, *new;

	new = create_bb_list_elem();
	new->bb = bb;
	if (!(*list)) /* empty list */
		*list = new;
	else {
		last = get_last_bb_list(*list);
		last->next_bb = new;
	}
}

/************************ REMOVE ELEMENTS ************************/

void remove_bb (struct basic_block *bb) {

	remove_bb_from_entrypoint(bb);
	remove_bb_from_parents(bb);
	remove_bb_from_children(bb);
	remove_callee_from_entrypoint(bb);
	free(bb);
}

/* remove the reference to bb in bb list in the entrypoint */
void remove_bb_from_entrypoint (struct basic_block *bb) {

	struct entrypoint *ep;
	struct basic_block_list *prev_bb, *current_bb;

	ep = bb->ep;
	//prev_bb = get_elem_before_bb (ep->bbs, bb);

	/* remove bb from ep->bbs where prev_bb is the previous element in that
	 * list */
	remove_bb_in_list(&ep->bbs, bb);
}

void remove_bb_from_parents (struct basic_block *bb) {

	struct basic_block_list *parent, *remove, *prev_child;

	for (parent = bb->parents; parent != NULL;) {

		/* remove from parent children */
		//prev_child = get_elem_before_bb (parent->bb->children, bb);

		/* remove bb from parent->bb->children where prev_child is the previous
		 * element in that list */
		remove_bb_in_list(&parent->bb->children, bb);

		/* remove parent */
		remove = parent;
		parent = parent->next_bb;
		free(remove);
	}

	bb->parents = NULL;
}

void remove_bb_from_children (struct basic_block *bb) {

	struct basic_block_list *prev_parent, *child, *remove;

	for (child = bb->children; child != NULL;) {

		/* remove from child parents */
		//prev_parent = get_elem_before_bb (child->bb->parents, bb);
	
		/* remove bb from child->bb->parents where prev_parent is the previous
		 * element in that list */
		remove_bb_in_list(&child->bb->parents, bb);

		/* remove child */
		remove = child;
		child = child->next_bb;
		free(remove);
	}
	
	bb->children = NULL;
}

void remove_callee_from_entrypoint (struct basic_block *bb) {

	struct entrypoint *ep;
	struct basic_block_list *prev_caller, *current_bb;

	if (bb->call == NULL) return;

	ep = bb->call;
	//prev_caller = get_elem_before_bb (ep->callees, bb);

	/* remove bb from ep->callees where prev_caller is the previous element in
	 * that list */
	remove_bb_in_list(&ep->callees, bb);
}

void remove_bb_in_list (struct basic_block_list **list, struct basic_block *bb){

	struct basic_block_list *prev, *remove;

	prev = get_elem_before_bb (*list, bb);
	if (prev == NULL) /* there's no element to be removed */
		return;

	/* there's only one element or bb is the first one in the list */
	if (prev->bb == bb) {
		/* there's only one element in the list */
		if (prev->next_bb == NULL)
			*list = NULL;
		/* bb is the first list element */
		else {
			*list = prev->next_bb;
			prev->next_bb = NULL;
		}
		remove = prev;
	}

	/* take the previous element of bb in the list and remove bb */
	else {
		remove = prev->next_bb;
		prev->next_bb = remove->next_bb;
	}

	remove->next_bb = NULL;
	remove->bb = NULL;
	free(remove);
}
