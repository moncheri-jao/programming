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
		exit(1);
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
/*funzione di integrazione MONTECARLO*/
double MC_corponero(double T, int N, double (*f)(double,double)) { /*chiama la variabile T come parametro per calcolare f, chiama il numero di tiri da fare e poi chiama un puntatore a funzione [VEDI RIGA 71]*/
	double nustar = 0., numin = 0.05, fnu, maxA, integral, nu, numax; /*dichiarazione variabili e inizializzazione come da esercizio*/
	unsigned long long int count = 0; /*dichiarazione variabile di conteggio per MC INIZIALIZZATA A ZERO*/
	nustar = 2.82*T; /*trovo valore nu per cui è max f(nu,T) [[LEGGE DI WIEN in questo caso]]*/
	numax = 10*nustar; /*trovo la "x" massima di integrazione*/
	maxA = (numax - numin)*(f(nustar,T) - f(numin,T)); /*trovo l'area del quadrato su cui è inscritta l'area di integrazione*/
	for(unsigned long long int i = 0; i < N; i++) { /*faccio partire l'algoritmo tra 0 ed il numero N che gli ho passato in argomento*/
		nu = drand48()*( numax - numin ) + numin; /*trovo una "x" a caso all'interno dell'intervallo di integrazione*/
		fnu = drand48()*f(nustar,T); /*trovo una "y" a caso dentro il RETTANGOLO SCELTO*/
//		printf("nu = %lf, f(nu,T) = %lf\n", nu, fnu);
		if(fnu <= f(nu,T)) {
			count++; /*se la "y" è sotto la y vera della funzione allora incremento la variabile count*/
		}
	}
	printf("count = %lld, maxA = %lf\n", count, maxA);
	integral = (count/(double)N)*maxA; /*faccio la formuletta*/
	return(integral);
}/*Il puntatore a funzione (l'ultimo della lista delle variabili della funzione) qui ti dice come verrà chiamata la funzione DENTRO LO SCOPE DELLA FUNZIONE. Se scrivo f(nu,T) qui, se nel main scrivo alla posizione del puntatore la funzione planckeq [vedi riga 50] lui pesca la funzione e la usa qua dentro dove ho scritto f(nu,T). ATTENZIONE! Se nel main uso una funzione diversa da quella per cui l'ho inteso nel prototipo E nella stesura del codice della funzione, devo stare attento che sia dello stesso tipo, CIOÈ: se qua mi ciuccia due double e ciccia un double, posso dargli nel main solo funzioni che ciucciano due double e cicciano un double*/

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
