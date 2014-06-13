#ifndef STMT_STRUCTS_H
#define STMT_STRUCTS_H

/*
 * One stmt can be a selection or iteration statement:
 *
 *	- if statments: use all of them - jmp_false is the else part;
 *
 *	- switch statements: use all of them: condition - to switch and for each
 * case in it, then - to case's scope, jmp_false - to default node, and the end
 * - to finish the switch scope;
 *
 * - while, do-while and for statements: they use just three parts, the
 * condition, then and end. One exception is the for statement when there's not
 * expression right after the last semicolon.
 */

#include <stdlib.h>

#define FOR_EACH_STMT(tmp, head) for(tmp = head->first; tmp != NULL; \
															tmp = tmp->next)
struct stmt {

	struct basic_block *condition, *end;
	struct basic_block *then, *jmp_false;
	struct stmt *prev, *next; /* next/previous stmt in the list */
};

/*
 * The main struct to stores all statements in a dual-link list.
 * Each function is parser separately, so there'll be different struct stmts for
 * each entrypoint in the graph.
 */
struct stmts {

	struct stmt *first;
	struct stmt *last;
};

/***** Handle Statements *****/

extern void add_stmt (int, struct stmts*, struct entrypoint*);
extern void add_stmt_then (int, struct stmts*, struct entrypoint*);
extern void add_stmt_else (int, struct stmts*, struct entrypoint*);
extern void add_current_bb_to_end_stmt (struct stmts*, struct entrypoint*);
extern void add_stmt_end_to_ep (int, struct stmts*, struct entrypoint*);
extern void make_while_stmt (struct stmt *stmt, struct entrypoint *ep);
extern void make_for_stmt (struct stmt *stmt, struct entrypoint *ep);
extern void make_do_while_stmt (int line, struct stmt*, struct entrypoint*);
extern void clean_stmt (struct basic_block*);

/***** Functions to give support to the above ones *****/

static struct stmts* create_stmts (void);
static struct stmt* create_stmt (int line);
static void add_stmt_in_stmts (struct stmt*, struct stmts*);
static void remove_stmt_from_stmts (struct stmt*, struct stmts*);

/* create a list of statements */
static struct stmts* create_stmts (void) {

	struct stmts *stmts;

	stmts = (struct stmts*) malloc (sizeof(struct stmts));
	stmts->first = stmts->last = NULL;

	return stmts;
}

/*
 * Create one element statement.
 * It's important to note that the then and else blocks will be created
 * according to the parser.
 */
static struct stmt* create_stmt (int line) {

	struct stmt *stmt;

	stmt = (struct stmt*) malloc (sizeof(struct stmt));
	stmt->condition = create_bb(line);
	stmt->condition->status = STMT_IF;
	stmt->end = create_bb(-1);
	stmt->end->status = STMT_END;
	stmt->then = NULL;
	stmt->jmp_false = NULL;
	stmt->prev = stmt->next = NULL;

	return stmt;
}

/*
 * Add another statement element to the list.
 * The insertion always happens in the end of the list.
 */
static void add_stmt_in_stmts (struct stmt *stmt, struct stmts *stmts) {

	if (stmts->first == NULL)
		stmts->first = stmt;
	else
		stmts->last->next = stmt;
	stmt->prev = stmts->last;
	stmts->last = stmt;
}

/*
 * Remove one statement from the list.
 * Note that the element is not remove at all, but its reference in the list is
 * lost, because the nodes that belongs to the statement, have been stored in
 * the list.
 */
static void remove_stmt_from_stmts (struct stmt *rm, struct stmts *stmts) {

	struct stmt *prev;

	prev = rm->prev;
	if (prev != NULL) { /* for the case when there's more than one statement */
		rm->prev = NULL;
		prev->next = NULL;
	}
	else /* if there's only one statement */
		stmts->first = NULL;
	stmts->last = prev;
}

#endif /* STMT_STRUCTS_H */
