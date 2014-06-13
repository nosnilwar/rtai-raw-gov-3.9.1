#include <stdio.h>

int fat(int n) {

    int fat, i;

    if (n == 0 || n == 1) {
        fat = 1;
    }

	else {
		i = n;
		fat = 1;
		while(i > 1) {
		    fat = fat * i;
		    i--;
		}
	}

    return fat;
}

int main() {

    int n = fat(3);
    return 0;
}
