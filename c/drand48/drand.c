#include <stdlib.h>
#include <stdio.h>
#include <time.h>
int main(void) {
	int seed;
	double ran[10];
	seed = time(NULL);
	srand48(seed);
	for (int i = 0; i < 10; i++) {
		*(ran+i) = drand48();
		printf("%lf\n",ran[i]);
	}
}
