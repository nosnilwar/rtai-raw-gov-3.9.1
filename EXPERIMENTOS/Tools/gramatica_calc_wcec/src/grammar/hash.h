/*
 * Hash function based on McKenzie, Harries and Bell (1990).
 * 
 * This table will only store functions declare in the file that will be
 * parser. It will have 100 positions to hold colisions in each bucket.
 * Each identifier has 31 bytes: 30 for characteres + null.
 *
 * Colisions in the table will be treated in sequence, so, the first identifier
 * will be in the first position, the second one in the second position and so
 * on.
 */

#include <stdio.h>
#include <string.h>

#define k 4
#define N 1403
#define COLISIONS 100

struct bucket {

	char ident[100][31];
};

static struct bucket funcTable[N];


static int hash (char *ident);
void initTable (void);
int addIdent (char *id);
int findIdent (char *id);
void show_table(void);


static int hash (char *ident) {
 
 	long long int h;
 	int i;
 
 	h = 0;
	for (i = 0; i < strlen(ident); i++)
		h = k*h + (int)ident[i];

	return (int) (h % N);
}

void initTable (void) {

	int i, j;

	for (i = 0; i < N; i++)
		for (j = 0; j < COLISIONS; j++)
			funcTable[i].ident[j][0] = 0;
}

/* return 1 if the function is new in the table or zero if it's not */
int addIdent (char *id) {
 
 	int h, i, add = 0;

	h = hash(id);
	for (i = 0; i < COLISIONS; i++) {

		/* identifier already stored */
		if ( strcmp(funcTable[h].ident[i], id) == 0 )
			break;

		/* if it's true, the id can be stored */
		else if (funcTable[h].ident[i][0] == 0) {
			strcpy (funcTable[h].ident[i], id);
			add = 1;
			break;
		}
	}

	if (i == COLISIONS)
		fprintf(stderr, "In Function Table: No more space to hold colision!");

	return add;
}

/*
 * return 1 if the function is declared in the current file, or 0 if it's a
 * external function.
*/
int findIdent (char *ident) {

	int i, h = hash(ident);

	for (i = 0; i < COLISIONS; i++)
		if ( strcmp(funcTable[h].ident[i], ident) == 0 )
			return 1;

	return 0;
}

void show_table (void) {

	int i, j;

	fprintf(stderr, "\n====== Show Function Table ====\n\n");
	for (i = 0; i < N; i++)
		for (j = 0; j < COLISIONS; j++) {
			if (funcTable[i].ident[j][0] == 0) break;
			fprintf(stderr, "%s\n", funcTable[i].ident[j]);
		}
	fprintf(stderr, "\n===============================\n\n");
}
