#include <stdio.h>

int colour[200];
int visited[200];
int queue[200];

// colours 0 and 1
int bfs(int G[200][200], int n) {
	int j, begin = 0, end = 0, v, i;

	for (j = 0; j < n; j++) {
		visited[j] = colour[j] = 0;
	}

	visited[0]	 = colour[0] = 1;
	begin		 = end = 0;
	queue[end++] = 0;

	while (begin < n) {
		v = queue[begin++];
		//printf("noh %d colour %d\n", v, colour[v]);
		for (j = 0; j < n; j++) {
			if (G[v][j]) {
				if (!visited[j]) {
					colour[j] = (colour[v] + 1) % 2;
					//printf("\tfilho %d colour %d\n", j, colour[j]);
					visited[j]	 = 1;
					queue[end++] = j;
				}
				// if it's already been visited
				else if (colour[j] == colour[v]) {
					return(0);
				}
			}
		}
	}

	return(1);    // it can be bicoloured
}


int main(void) {
	int i, j, v, e, result;
	int G[200][200], n, edges;

	scanf("%d", &n);
	while (n != 0) {
		for (i = 0; i < n; i++) {
			for (j = 0; j < n; j++) {
				G[i][j] = 0;
			}
		}

		scanf("%d", &edges);
		while (edges > 0) {
			scanf("%d %d", &v, &e);
			G[v][e] = G[e][v] = 1;
			edges--;
		}

		/*
		 * for (i = 0; i < n; i++) {
		 *      for (j = 0; j < n; j++)
		 *              printf("%d ", G[i][j]);
		 *      printf("\n");
		 * }
		 */

		result = bfs(G, n);
		if (result) {
			printf("BICOLORABLE.\n");
		}
		else {
			printf("NOT BICOLORABLE.\n");
		}

		scanf("%d", &n);
	}

	return(0);
}
