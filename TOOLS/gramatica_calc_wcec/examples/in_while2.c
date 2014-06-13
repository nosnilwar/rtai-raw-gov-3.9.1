#include <stdio.h>

int main () {

	int a = 2;

	while (a > 10) { /* max 10 */
		a++;
		printf("\n");
		while (a < 20) { /* max 5 */
			if (a == 10)
				a++;
			else
				break;
			while (a < 18) /* max 20 */
				a++;
			a++;
		}
	}

	a++;
	if (a) {
		if (a > 10)
			a--;
	}

	return 0;
}
