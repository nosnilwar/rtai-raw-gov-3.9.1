#include <stdio.h>

int main (void) {

	int a, *b, *c[4], d = 3;

	a = 2;

	for (a = 3; a < 10; a++) {
		a = 2;
		a = 2;
		for (a = 2; a < 10; a++) {
			a += 2;
		}
		while (a < 20) {
			a += 2;
		}
		do {
			a--;
		} while(a);
		a = 9;
	}

	return 0;
}

