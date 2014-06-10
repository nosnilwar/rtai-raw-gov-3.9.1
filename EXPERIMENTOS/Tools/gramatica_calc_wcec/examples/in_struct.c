#include <stdio.h>
#include <math.h>

typedef int inteiro;

struct opa {
	int agora;
};

struct {
	int agora;
} opa2;

struct opa3 {
	int agora;
} opa4;

struct opa wl;

int main () {

	int a = 1;
	tipo1 b;
	struct opa wl;

	scanf("%d", &a);
	if (a > b) {
		printf("a %d\n", a);
		a = pow(a, 2);
	}

	return 0;
}
