#include <stdio.h>

int main (void) {

	int a, *b[2], *c[2][2], d = 3;

	a = 2;

	while (a < 20) {
		a += 2;
		while (a < 6) {
			a += 2;
		}
		for (a += 2; a < 6; a++) {
			a++;
		}
		do {
			a += 2;
		} while (a < 10);
	}

	return 0;
}
