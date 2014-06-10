#ifndef GRAPHML_WCEC_H
#define GRAPHML_WCEC_H

#include <stdio.h>
#include <string.h>

#include "../graph/graph_structs.h"
#include "handle_files.h"

#define WCEC_FOR_NOTDEF_FUNC 10

int compute_bb_wcec(struct basic_block *bb, struct cycles*);
void compute_ep_wcec(struct entrypoint *ep);
void compute_loop_wcec(struct basic_block *pseudo);
int dfs(struct basic_block *bb);
int dfs_loop(struct basic_block *pseudo, struct basic_block *lcondition,
														struct basic_block *bb);

/* NODE WCEC */
int compute_bb_wcec(struct basic_block *bb, struct cycles *cycles) {

	int i, line, wcec = 0;

	if (bb->status == STMT_PSEUDO)
		return wcec;

	if (bb->status == STMT_CALL) {
		if (bb->call != NULL) /* return the wcecp from the called function */
			wcec = bb->call->rwcec;
		else /* the called function is not define in the current file */
			wcec = WCEC_FOR_NOTDEF_FUNC;
		return wcec;
	}

	for (i = line = 0; i < cycles->len; i++) {

		/* if the next line is equals to the previous one, it's a FOR
		 * statement. So, don't sum the wcec with the same lines
		 */
		if (line == cycles->cyclesPerLine[i].line ||
										cycles->cyclesPerLine[i].cycles < 0)
			continue;

		line = cycles->cyclesPerLine[i].line;
		if (line >= bb->start_line && line <= bb->last_line) {
			/* let be zero the FOR node condition wcec, as in the README */
			if (bb->status == STMT_FOR) break;
			wcec += cycles->cyclesPerLine[i].cycles;
			cycles->cyclesPerLine[i].cycles *= -1;
		}
		else if (line > bb->last_line) break;
	}

	return wcec;
}

int dfs_loop (struct basic_block *pseudo, struct basic_block *lcondition,
													struct basic_block *bb) {

	int wcec, rwcec, tmp, stat;
	struct basic_block_list *child;

	// if bb has a break, do nothing. Hence, avoiding returning to pseudo node
	if (bb == pseudo) return 0;

	wcec = rwcec = bb->wcec;
	FOR_EACH_BB(child, bb->children) {
		stat = child->bb->status;

		// inner loop(s) and avoiding break cases to the current pseudo
		if (stat == STMT_PSEUDO && child->bb != pseudo)
			compute_loop_wcec(child->bb);

		// if reach the current loop condition
		if (stat == STMT_WHILE || stat == STMT_DO_WHILE || stat == STMT_FOR)
			tmp = child->bb->wcec;
		else
			tmp = dfs_loop(pseudo, lcondition, child->bb);

		if (tmp + wcec > rwcec)
			rwcec = tmp + wcec;
	}

	bb->rwcec = rwcec;
	return rwcec;
}

/* compute loop wcec by starting in the most external loop until find the most
 * inner. Then, compute the inner wcec and returning its value to the others
 * loop */
void compute_loop_wcec(struct basic_block *pseudo) {

	struct basic_block_list *child;
	int stat, wcec;

	// if the wcec has been already computed, just return
	if (pseudo->wcec != 0) return;

	// search for the loop condition between pseudo children
	FOR_EACH_BB(child, pseudo->children) {
		stat = child->bb->status;
		if ( (stat == STMT_WHILE || stat == STMT_DO_WHILE || stat == STMT_FOR)
				&& child->bb->start_line == pseudo->start_line )
		{
			wcec = dfs_loop(pseudo, child->bb, child->bb);
			break;
		}
	}

	// do-while statements don't do (iterations+1) comparison in the condition
	if (stat == STMT_DO_WHILE)
		wcec -= child->bb->wcec;

	child->bb->loop_wcec = wcec; // wcec of one loop iteration
	child->bb->rwcec = wcec;
	wcec = wcec * child->bb->iteration_num;

	pseudo->wcec = wcec; // total loop wcec
	pseudo->iteration_num = child->bb->iteration_num;
}

/* pre-fixed search in the graph */
int dfs (struct basic_block *bb) {

	int wcec, rwcec, tmp;
	struct basic_block_list *child;

	// if the node is a loop condition, do nothing. Hence, avoiding loops.
	tmp = bb->status;
	if (tmp == STMT_WHILE || tmp == STMT_DO_WHILE || tmp == STMT_FOR)
		return 0;

	wcec = rwcec = bb->wcec;
	FOR_EACH_BB(child, bb->children) {

		if (child->bb->status == STMT_PSEUDO) // compute loop wcec
			compute_loop_wcec(child->bb);

		tmp = dfs(child->bb);
		if (tmp + wcec > rwcec)
			rwcec = tmp + wcec;
	}

	bb->rwcec = rwcec;
	return rwcec;
}

/* Make a pre-fixed search in the graph, detected the pseudo nodes, calculate
 * wcec of each loop and compute the rwcec of each edge. In the return of the
 * search, return the greatest wcec of its children.
 */
void compute_ep_wcec (struct entrypoint *ep) {

	ep->rwcec = dfs(ep->begin);
	//fprintf(stderr, "\n>>>>>>>>>>>>> %d\n\n", ep->rwcec);
}


#endif /* GRAPHML_WCEC_H */
