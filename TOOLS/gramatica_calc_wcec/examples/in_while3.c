#include <stdio.h>

int main () {

	int a = 2;

	while(a > 10) { /* max 10 */
		a++;
		printf("\n");
	}

	a++;
	if (a) {
		if (a > 10)
			a--;
	}

	while (a < 20) { /* max 5 */
		if (a == 10)
			a += 20;
		a++;
	}

	return 0;
}

