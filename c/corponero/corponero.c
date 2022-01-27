#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>

#define POINTS 200
#define NTEMP 6

int immettiN(void);
double planckeq(double, double);
double MC_corponero(double, int, double (*)(double,double));
void calcspectra(double (*)[3], double (*)(double,double), FILE*);

int main(void) {
	FILE* stream;
	int N, seed;
	double T = 0.5, T4 = 0., integ, spectra[POINTS][3];
	seed = time(NULL);
	srand48(seed);
	stream = fopen("emittanza.dat", "w");
	if (stream == NULL) {
		printf("ERRORE: Non è stato possibile creare il file 'emittanza.dat'\n");
		exit(-1);
	}
	N = immettiN();
	// T tra 0.5 e 1
	for (int i = 0; i < NTEMP; i++) {
		integ = MC_corponero(T, N, planckeq);
		T4 = T*T*T*T;
		fprintf(stream, "%.8lf %.8lf\n", T4, integ); // fstampa T^4 e int f(nu,T)
		printf("T = %.8lf, int = %.8lf\n", T, integ);
		T += 0.1;
	}
	fclose(stream);
	calcspectra(spectra, planckeq, stream);
	return(0);
}

int immettiN(void) {
	int N;
	printf("Inserisci il valore di N (10^5 <= N <= 10^6)\n");
	scanf("%d",&N);
	while(N < 1e5 || N > 1e6) {
		printf("ERRORE: Inserire un valore valido (10^5 <= N <= 10^6)\n");
		scanf("%d",&N);
	}
	return(N);
}

double planckeq(double nu, double T) {
	return( nu*nu*nu/(exp(nu/T)-1) );
}

double MC_corponero(double T, int N, double (*f)(double,double)) {
	double nustar = 0., numin = 0.05, fnu, maxA, integral, nu, numax;
	unsigned long long int count = 0;
	nustar = 2.82*T;
	numax = 10*nustar;
//	nustar = 2.82*10*T;
	maxA = (numax - numin)*(f(nustar,T) - f(numin,T));
	for(unsigned long long int i = 0; i < N; i++) {
		nu = drand48()*( numax - numin ) + numin;
		fnu = drand48()*f(nustar,T);
//		printf("nu = %lf, f(nu,T) = %lf\n", nu, fnu);
		if(fnu <= f(nu,T)) {
			count++;
		}
	}
	printf("count = %lld, maxA = %lf\n", count, maxA);
	integral = (count/(double)N)*maxA;
	return(integral);
}

void calcspectra (double spectra[][3], double (*f)(double,double), FILE* stream) {
	double nu = 0.05;
	stream = fopen("spectra.dat","w");
	for(int i = 0; i < POINTS; i++) {
		spectra[i][0] = nu;
		spectra[i][1] = f(nu,0.6);
		spectra[i][2] = f(nu,1.0);
		nu += 0.05;
	}
	for(int j = 0; j < POINTS; j++) {
		fprintf(stream,"%lf %lf %lf\n", spectra[j][0], spectra[j][1], spectra[j][2]);
	}
	fclose(stream);
}
