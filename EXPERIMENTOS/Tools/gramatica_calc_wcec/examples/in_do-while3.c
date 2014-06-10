#include <stdio.h>

int main () {

	int a = 0;

	a++;
	do {
		while(a < 5)
			a++;
		a--;
	} while (a > 10);

	a++;
	do {
		a--;
		while(a < 5)
			a++;
	} while (a > 10);

	while (1) {
		do
			printf("\n");
		while (1);
	}

	return 0;
}

