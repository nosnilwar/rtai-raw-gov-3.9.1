#include <stdio.h>

void foo(void) {

	int a = 2;

	if (a)
		printf("opa!\n");
}

int main (int argc, char **argv) {

	int a, b;

	a = 2; b++;
	if (a) {
		a = 3+2*4/6%213&a;
		a++;
	}
	else if (!a) {
		a--;
		a *= 23;
		foo();
	}
	else if (12*13 - a) {
		a -= 42;
		if (a) {
			a++;
		}
		a = a*a*a;
		foo();
		a = a*a*a;
	}
	else {
		return 2;
	}

	a += 2;

//	a = (a > 10) ? a+a*a : a + 4 + argc;

	scanf("%d", &a);

	while (a < b) {
		if (a+argc < b)
			a++;
		else if (a-argc < b)
			b--;
	}

	printf("%d\n", a);

	return 0;
}

