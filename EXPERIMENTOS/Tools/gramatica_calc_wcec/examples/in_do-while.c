#include <stdio.h>

int main (void) {

	int *a, *b, *c[3], d = 3;

	*a = 2; *b = 20;

	do {
		(*a)++;
		for (*a = 0; *a < 10; (*a)++) {
			*a += 1;
		}
		*a += 2;
		while (*a < *b) {
			*a += 2;
		}
		do {
			*a += 2;
		} while (*a < *a + *b);
	} while(*a < 100);
	
	return 0;
}

