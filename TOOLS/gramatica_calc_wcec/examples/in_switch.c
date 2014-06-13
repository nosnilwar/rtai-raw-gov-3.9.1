#include <stdio.h>

int main() {
	int a = 3;

	printf("wilson!\n");

	switch (a) {
		case 1: {
			a--;
			a++;
			a--;
			break;
		}

		case 2:
			a += 2;
			if (a > 5) {
				a++;
				break;
			}
			else {
				a--;
				break;
			}

		case 3:
			a++;
			a--;
			break;

		default:
			a++;
			if (a > 10) {
				a += 2;
			}
			else{
				printf("\n");
			}
	}

	a += 3;
	a += 4;
	if (a > 20)
		switch(a) {
			case 1:
				a++;
				break;
			default:
				a -= 100;
		}

	a += 3;

	return(0);
}

