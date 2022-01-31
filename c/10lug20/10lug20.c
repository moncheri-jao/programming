#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

void memorizza_in_array(int, int*);
int verifica_numero(int, int*);

int main(void) {
	int seed, coeff[2], n = 0;
	seed = time(NULL);
	srand48(seed);
	do {
		n = lrand48()%100;
		memorizza_in_array(n,coeff);
	} while(verifica_numero(n,coeff));
	return 0;
}

void memorizza_in_array(int n, int* coeff) {
	int dec, unit;
	dec = n / 10;
	unit = n%10;
	*coeff = dec;
	*(coeff+1) = unit;
}

int verifica_numero(int n, int* coeff) {
	int boolean = 1, sum, rev;
	sum = coeff[0]+coeff[1];
	printf("n = %d, c1c2 = %d%d, S = %d\n",n,coeff[0],coeff[1],sum);
	rev = coeff[1]*10+coeff[0];
	if (n+sum == rev) {
		printf("Intero che soddisfa la condizione n = %d\n", n);
		boolean = 0;
	}
	return boolean;
}
