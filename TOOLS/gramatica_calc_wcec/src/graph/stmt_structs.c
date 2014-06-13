
#include "graph_structs.h"
#include "stmt_structs.h"

void add_stmt (int line, struct stmts *stmts, struct entrypoint *ep);
void add_stmt_then (int line, struct stmts *stmts, struct entrypoint *ep);
void add_stmt_else (int line, struct stmts *stmts, struct entrypoint *ep);
void add_current_bb_to_end_stmt (struct stmts *stmts, struct entrypoint *ep);
void add_end_stmt_to_ep (int line, struct stmts *stmts, struct entrypoint *ep);
void make_while_stmt (struct stmt *stmt, struct entrypoint *ep);
void make_for_stmt (struct stmt *stmt, struct entrypoint *ep);
void make_do_while_stmt (int line, struct stmt *stmt, struct entrypoint *ep);
void clean_stmt (struct basic_block*);
void clean_loops (struct basic_block *pseudo);

/* Add another statement in the list */
void add_stmt (int line, struct stmts *stmts, struct entrypoint *ep) {

	struct stmt *stmt;

	stmt = create_stmt(line);
	add_stmt_in_stmts(stmt, stmts);

	add_bb(ep->current_bb, stmt->condition);
	add_bb_to_entrypoint(stmt->condition, ep);
}

/*
 * Create and add the then block in the current statement and in the
 * entrypoint.
 */
void add_stmt_then (int line, struct stmts *stmts, struct entrypoint *ep) {

	struct basic_block *then;
	struct stmt *stmt;

	then = create_bb(line);
	change_bb_status(then, STMT_THEN);
	stmt = stmts->last;
	stmt->then = then;

	set_last_line(ep->current_bb, line);
	add_bb(ep->current_bb, then);
	add_bb_to_entrypoint(then, ep);
}

/*
 * Create and add the else block in the current statement and in the
 * entrypoint.
 */
void add_stmt_else (int line, struct stmts *stmts, struct entrypoint *ep) {

	struct basic_block *jmp_false;
	struct stmt *stmt;

	jmp_false = create_bb(line);
	change_bb_status(jmp_false, STMT_ELSE);
	stmt = stmts->last;
	stmt->jmp_false = jmp_false;

	set_last_line(ep->current_bb, line);
	add_bb(stmt->condition, jmp_false);
	add_bb_to_entrypoint(jmp_false, ep);
}

/*
 * Make the link between the current node in the entrypoint with the end
 * statement node.
 */
void add_current_bb_to_end_stmt (struct stmts *stmts, struct entrypoint *ep) {

	struct stmt *stmt;
	int status;

	stmt = stmts->last;
	status = stmt->condition->status;
	/*if (status == STMT_WHILE)
		add_bb(ep->current_bb, stmt->condition);
	else if (status == STMT_DO_WHILE)
		make_do_while_stmt(stmt, ep);
	else if (status == STMT_FOR)
		make_for_stmt(stmt, ep);
	else*/
		add_bb(ep->current_bb, stmt->end);

	//if (status == STMT_WHILE || status == STMT_DO_WHILE || status == STMT_FOR)
	//	stmt->condition->loop_start_node = stmt->then;
}

/*
 * This function is call when the statement ends, so the end node is set
 * and it is put in the entrypoint.
 * Notice that the current node in the entrypoint is never a condition
 * statement, because this function is only call in the end of a statement.
 */
void add_stmt_end_to_ep (int line, struct stmts *stmts, struct entrypoint *ep) {

	struct basic_block_list *parent, *parents, *keep_parent = NULL, *last, *tmp;
	struct stmt *stmt, *external_stmt;
	int status;

	set_last_line(ep->current_bb, line);
	stmt = stmts->last;
	set_start_line(stmt->end, line);
	status = stmt->condition->status;

	/* if statement doesn't have the else node */
	if (stmt->jmp_false == NULL || status == STMT_FOR) {

		if (status == STMT_WHILE) {
			make_while_stmt(stmt, ep);
			change_bb_status(stmt->end, STMT_PSEUDO);
			set_last_line(stmt->end, line);
		}

		else if (status == STMT_FOR) {
			make_for_stmt(stmt, ep);
			change_bb_status(stmt->end, STMT_PSEUDO);
			set_last_line(stmt->end, line);
		}

		/* set the line of do-while condition node */
		else if (status == STMT_DO_WHILE) {
			make_do_while_stmt(line, stmt, ep);
			change_bb_status(stmt->end, STMT_PSEUDO);
			set_last_line(stmt->end, line);
		}

		if (status != STMT_SWITCH)
			add_bb(stmt->condition, stmt->end);
	}

	/* the break in switch-case already points to the end of the swtich */
	if (status == STMT_CASE) free(stmt->end);
	else {
		/* if the current node doesn't have at least one child, so the end
		 * statement will be its child. Normally, it happens when an ELSE ends.
		 */
		if (ep->current_bb->children == NULL)
			add_bb(ep->current_bb, stmt->end);
		add_bb_to_entrypoint(stmt->end, ep);
	}
	remove_stmt_from_stmts(stmt, stmts);
}

void make_while_stmt (struct stmt *stmt, struct entrypoint *ep) {

	struct basic_block *current_bb = ep->current_bb;

	add_bb(current_bb, stmt->condition);
	stmt->condition->loop_then = stmt->then;
}

/*
 * For Statements: it's very similar to while statements, but, each semicolon of
 * it represents a node. The expression before the first semicolon is one node,
 * the expression in the middle is the condition and after that is the last node
 * of the FOR statement.
 *
 * Note: The jmp_false is the last expression of the for, so, when the for body
 * ends, its end points to jmp_false.
 */
void make_for_stmt (struct stmt *stmt, struct entrypoint *ep) {

	struct basic_block *current_bb, *for_last_expr;

	current_bb = ep->current_bb;
	for_last_expr = stmt->jmp_false;
	//set_last_line(bb, for_condition->start_line);
	add_bb(current_bb, for_last_expr);
	add_bb(for_last_expr, stmt->condition);
	add_bb_to_entrypoint(for_last_expr, ep);
	//add_bb(bb, for_condition);
	//add_bb_to_entrypoint(bb, ep);
	stmt->condition->loop_then = stmt->then;
	stmt->condition->loop_last_node = for_last_expr;
}

/*
 * Do-While Statements: there's pseudo-condition, a THEN part, the right
 * condition and the END part. The pseudo-condition is removed and all of its
 * parents go to its child (the THEN). Then, the right condition is set and
 * points to the THEN part.
 *
 * Notice that if the THEN part and the pseudo-condition have the same line,
 * maybe the child of the THEN part is another statement, so the correct THEN
 * is its child.
 */
void make_do_while_stmt (int line, struct stmt *stmt, struct entrypoint *ep) {

	struct basic_block_list *parent;
	struct basic_block *then, *condition;

	then = stmt->then;

	/* if they are in the same line, it means that there's no common or call
	 * node, maybe, there's another statement, so the THEN part is not necessary
	 * for the graph. This part is removed and the new THEN part is its child.
	 */
	if (stmt->condition->start_line == then->start_line) {
		then = then->children->bb;
		remove_bb(stmt->then);
		stmt->then = then;
		if (then->status == STMT_COMMON) then->status = STMT_THEN;
	}

	/* each parent of the pseudo-condition will points to the THEN part. */
	FOR_EACH_BB (parent, stmt->condition->parents)
		add_bb(parent->bb, then);
	remove_bb(stmt->condition);

	/* create the right do-while condition node */
	condition = create_bb(line); /* the line will be set when the END part will
								* be add */
	set_last_line(condition, line);

	add_bb(ep->current_bb, condition);
	add_bb(condition, stmt->then);
	change_bb_status(condition, STMT_DO_WHILE);
	add_bb_to_entrypoint(condition, ep);
	stmt->condition = condition;
	stmt->condition->loop_then = stmt->then;
}

/*
 * Nodes that can be merge if they have only one child:
 *
 *	- if the child is a caller node and its parent is not a caller: and they are
 * in the same line, they can be merge. If we have two nodes that are caller in
 * the same line, it means that the first caller uses the second one like:
 * printf("%d\n", sqrt(10)), so it can't be merge;
 *
 *	- if the father is a ELSE statement: and its child is a IF or CASE and is in
 * the same line, they can be merge, because an else-if statement is a else
 * follow by a if, so it can be merge in only one node to be a else-if. For CASE
 * statements, each CASE is like a if follow by an else that can be other CASE
 * or a DEFAULT statement, so an else -> case, can be merge in a CASE node;
 *
 *	- if the node is an END statement: it can be merge to any node, because it
 * just represents a node to point where a statement end and has no meaning to
 * the scope, so it can be merge to its child.
 *
 * Nodes that can be merge if they have only one father:
 *
 *	- if the child and father are in the same line, they can be merge, because
 * the statement that they represent is the same, so there's no need for two,
 * then the child is merge with its father.
 */
void clean_stmt (struct basic_block *bb) {

	struct basic_block_list *parents, *children;
	struct basic_block *parent, *child;
	int status, change = 0;

	/* comment this if to make the graph without pseudo nodes */
	if (bb->status == STMT_PSEUDO) {
		clean_loops(bb);
		return;
	}

	//fprintf(stderr, "\nclean linha %d\n", bb->start_line);
	if (get_list_size(bb->children) <= 1) {

		child = (bb->children) ? bb->children->bb : NULL;
		status = (child) ? child->status : STMT_NONE;

		/* merge when a child is a CALLER and its parent not */
		if (bb->status != STMT_CALL && status == STMT_CALL) {
			/* and both have the same line */
			if (child->start_line == bb->start_line)
				change = 1;
		}

		/* merge ELSE and IF, CASE or RETURN nodes */
		if (bb->status == STMT_ELSE) {
			change = 1;
			if (status == STMT_IF && child->start_line == bb->start_line)
				change_bb_status(child, STMT_ELSE_IF);
		}

		/* merge END, BREAK and CONTINUE node to anyone. Uncomment the last
		 * condition to make the graph withou pseudo nodes. */
		else if (bb->status == STMT_END || bb->status == STMT_BREAK ||
								bb->status == STMT_CONTINUE /*|| STMT_PSEUDO*/)
			change = 1;

		if (change) {
			FOR_EACH_BB (parents, bb->parents) {
				add_bb(parents->bb, child);
				status = parents->bb->status;
				/* to update loop first node in the scope if it changes, because
				 * the THEN will be merge with its child. In this case, the THEN
				 * node has only one child.
				 */
				if (bb->status == STMT_THEN && (status == STMT_WHILE ||
												status == STMT_FOR ||
												status == STMT_DO_WHILE) )
					parents->bb->loop_then = child;
			}
			remove_bb(bb);
		}

	} // end if

	if (get_list_size(bb->parents) == 1) {

		parent = bb->parents->bb;
		status = parent->status;

		/* Merge child with its parent if they are in the same line.
		 * The same status means that they can be callers such that one is a
		 * parameter of the other.
		 */
		if (bb->status != status && parent->start_line == bb->start_line) {
			children = bb->children;
			/* to update loop first node in the scope if it changes, because the
			 * then will be merge with its parent. In this case, the then node
			 * has only one child.
			 */
			if (bb->status == STMT_THEN && (status == STMT_WHILE ||
											status == STMT_FOR ||
											status == STMT_DO_WHILE) )
				parent->loop_then = children->bb;

			FOR_EACH_BB (children, bb->children)
				add_bb(parent, children->bb);

			remove_bb(bb);
		}
	}
}

void clean_loops (struct basic_block *pseudo) {

	struct basic_block *loop; /* condition node of a loop */
	struct basic_block *begin_node; /*while or for node, or then from do-while*/
	struct basic_block_list *parent, *tmp;
	int status, parentLine, loopBodyLine;

	/* get loop condition, another parents are BREAK nodes */
	FOR_EACH_BB(parent, pseudo->parents) {
		status = parent->bb->status;
		if (status == STMT_WHILE || status == STMT_DO_WHILE || status==STMT_FOR)
			break;
	}
	loop = parent->bb;
	pseudo->start_line = loop->start_line;
	pseudo->last_line = -1;

	/* each condition part of a loop has two child: PSEUDO and THEN */
	remove_bb_in_list(&pseudo->parents, loop);
	remove_bb_in_list(&loop->children, pseudo);
	begin_node = loop;
	if (loop->status == STMT_DO_WHILE) /* in do-while the begin is the THEN */
		begin_node = loop->children->bb;

	/* make a link between each parent of begin_node to pseudo, and keep track
	 * of the ones that are in the loop body. */
	loopBodyLine = begin_node->start_line;
	for (parent = begin_node->parents; parent != NULL; parent = tmp) {

		tmp = parent->next_bb;
		status = parent->bb->status;
		parentLine = parent->bb->start_line;

		// for WHILE, DO-WHILE statements and PSEUDO nodes
		//if (parentLine > loopBodyLine || status == STMT_PSEUDO)
		if (parentLine > loopBodyLine)
			continue;

		// for FOR statements, when the last node - the in/decrement expression
		// points to the condition one, do nothing
		else if (parentLine == loopBodyLine &&
										parent->bb == loop->loop_last_node)
			continue;

		add_bb(parent->bb, pseudo);
		remove_bb_in_list(&parent->bb->children, begin_node);
		remove_bb_in_list(&begin_node->parents, parent->bb);
	}

	// make the link between pseudo and the condition node
	add_bb(pseudo, loop);
}

