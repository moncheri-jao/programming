#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define N 1000000
#define M 10000 // numero passi

double gauss(void); // genera numero z tramite trasf. Box Muller
double calc_media(int, double); // calcola la media
double calc_var(int, double, double); // calcola la varianza
void SaveVal(int, double, double, double[3][100]); // salva in matrice 3 righe N/M colonne (100) |passi\n|media\n|varianza
void savetoStream(FILE*, double[3][100]); // salva su file matrice trasposta

int main(void) {
	int seed;
	double mat[3][100], avg, var, sum = 0, sumsq = 0;
	FILE* stream;
	seed = time(NULL);
	srand48(seed); // inizializza srand48() con seed = time(NULL)
	for (int i = 0; i < N+1; i++) {
		sum += gauss(); // somma tutte estrazioni di z
		sumsq = sum*sum; // calcola z^2 e somma tutti
		if (i%M==0 && i != 0) { // se i mod M = 0 allora
			avg = calc_media(i,sum); // calcola media
//			printf("avg=%lf\n",avg);
			var = calc_var(i,sumsq, avg); // usa media e calcola var
//			printf("var=%lf\n",var);
			SaveVal(i,avg,var,mat); // salva su matrice
		}
	}
	stream = fopen("stat.dat","w"); // crea/sovrascrivi file 'stat.dat'
	savetoStream(stream,mat); // chiama funzione che salva su file
	fclose(stream); // chiudi lo stream
	return 0; // ritorna 0 alla shell
}

void savetoStream(FILE* stream, double mat[3][100]) { // prende puntatore a file e mat
	for (int i = 0; i < 100; i++) {
		fprintf(stream,"%.0lf %.10lf %.10lf\n", mat[0][i], mat[1][i], mat[2][i]);
//		for (int j = 0; j < 3; j++) {
//			tmat[i][j] = mat[j][i];
//			fprintf(stream,"%.0lf %.1lf %.10lf\n",tmat[i][0], tmat[i][1], tmat[i][2]);
//		}
	}
} // traspone la matrice mat e salva su stream preso attraverso puntatore a file in input ( (stack) > OwO daddy what's smashing??? ) [[ porcoddio non mi serve invertire la matrice ]]

void SaveVal(int i, double avg, double var, double mat[3][100]) {
	int j;
	j = (i/M) - 1;
	mat[0][j] = i;
	mat[1][j] = avg;
	mat[2][j] = var;
}
double gauss(void) {
	double y1, y2;
	y1 = drand48();
	y2 = drand48();
	return( sqrt( -2*log(y1) )*sin(2*M_PI*y2) );
} // genera double da 2 num casuali y_i\in[0,1)

double calc_media(int i, double sum) {
	return(sum/i);
} // prende i tc. i%M==0, prende z_(j<=i) e calcola media

double calc_var(int i, double sumsq, double avg) {
	return(sumsq/i-avg);
}
