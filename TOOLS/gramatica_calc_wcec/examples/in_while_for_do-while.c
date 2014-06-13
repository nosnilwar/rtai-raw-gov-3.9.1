#include <stdio.h>

int main (void) {

	int a, *b, *c[3], d = 3;

	a = 2;
	while (a) {
		a = 2;
		while (a) {
			a = 2;
			a = 2;
		}
		a = 2;
		for (a;a;a) {
			a = 2;
		}
		a = 2;
		do {
			a = 2;
		} while (a);
	}

	for (a;a;a) {
		a = 2;
		a = 2;
		for (a;a;a) {
			a = 2;
			a = 2;
		}
		while (a) {
			a = 2;
		}
		a = 2;
	}

	do {
		a++;
		for (a;a;a) {
			a = 2;
		}
		a++;
		while (a) {
			a = 2;
		}
		do {
			a = 2;
		} while (a);
	} while(a);
	
	return 0;
}
