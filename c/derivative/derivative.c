#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double f(double);
double derivative(double (*)(double), double, double); // gen undef function (double) , x (double), epsilon (double)

int main(void) {
//	double eps = .1;
//	printf("Epsilon\tDerivata\n");
//	while(eps > 1.e-5) {
//		printf("%e\t%lf\n", eps, derivative(f, 1, eps));
//		eps /= 10;
//	}
//
//	MIGLIORIE
//
	FILE *datafile;
	double eps = 1.e-10;
	double range = 1.;
	double x = 1.;
	printf("Insert a maximum value for x {[1,x)}\n");
	scanf("%lf", &range);
	datafile = fopen("der.csv", "w");
	printf("x\t\tf'(x)\n");
	while (x < range) {
		printf("%lf\t%lf\n", x, derivative(f, x, eps));
		fprintf(datafile,"%lf,%lf\n", x, derivative(f, x, eps));
		x += .1;
	}
	fclose(datafile);
	return 0;
}

double f(double x) { 
	return sqrt(x); // return math.h function or whatever
}

double derivative(double (*f)(double), double x, double eps) {
	return( (f(x+eps) - f(x)) / eps ); // evaluate "limit" ((for small eps values)
}

