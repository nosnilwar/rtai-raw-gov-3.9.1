#include <stdio.h>

int main () {

	int a = 0;

	do { 
		printf("\n");
		a++;
		a--;
		if (a)
			a++;
		a--;
	}
	while(a < 10);

	do { 
		do
			a++;
		while (a < 5);
		if (a)
			a++;
		a--;
	}
	while(a < 10);

	return 0;
}
