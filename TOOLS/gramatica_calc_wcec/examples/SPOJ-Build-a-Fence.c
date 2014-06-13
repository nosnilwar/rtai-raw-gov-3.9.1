/*
 * It's necessary to see that only a semicircle could give a maximized area.
 * So, to find the radius, only need to know semicircle formulas.
 */

#include <stdio.h>
#include <math.h>

float semicircle_area (float l) {

	return (l*l)/(2*M_PI);
}

int main () {

	float l;

	while (1) {
		scanf("%f", &l);
		if (!l) { break; }
		printf("%.2f\n", semicircle_area(l));
	}

	return 0;
}
