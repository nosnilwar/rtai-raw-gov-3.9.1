#include <stdio.h>

int main () {

	int a;

	for (a = 0; a < 10; a++) {
		printf("\n");
		a++;
		if ( !(a-2) )
			break;
		//for (; a < 10;)
		//	a--;
	}

	//a = (a == 10) ? 1 : \
	//0;

	return 0;
}
