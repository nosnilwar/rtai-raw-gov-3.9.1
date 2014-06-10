#include <stdio.h>

int main (int argc, char **argv) {

	int a, b;

	a = 2; b++;
	if (a + argc < 10) {
		a = 3+2*4/6%213&a;
		a++;
	}
	else if (a + argc + b > 20) {
		a--;
		a *= 23;
	}
	else if (b + a - argc < 5) {
		a -= 42;
		if (a) {
			a++;
		}
		a = a*a*a;
		a = a*a*a;
	}
	else {
		a += b + argc;
	}

	a += 2;

	return 0;
}

