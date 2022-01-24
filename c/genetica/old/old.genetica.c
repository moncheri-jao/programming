#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define N 200
#define NGENI 18
#define M 20

void GeneraDNA(int*, int*); //matrix pointer N*NGENI, model vector pointer

int Fitness(int*,int*,int*); //matrix pointer, vector pointer*2

int SelezionaGenitore(int*, int);

void Riproduzione(int*, int*, int*, int);//matrix pointer*2, vector pointer, int

int modeldna[NGENI-1];
int current_generation[N][NGENI-1];
int next_generation[N-1][NGENI-1];
int contageni[NGENI-1];
int sum_geni;

int main (void) { 
	int seed;
	seed = time(NULL);
	srand48(seed);
	double Efit;
	FILE* fit;
	int sum;
	fit = fopen("fitness.dat","w");
	GeneraDNA(*current_generation, modeldna);
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < NGENI; j++) {
			printf("%d",current_generation[i][j]);
		}
		printf("\n");
	}
	for(int i = 0; i < M; i++) {
		sum_geni = Fitness(*current_generation, modeldna, contageni);
		Riproduzione(*next_generation, *current_generation, contageni, sum_geni);
		for (int i = 0; i < NGENI; i++) {
			sum += contageni[i];
		}
		Efit = (double)NGENI - (double)sum/(double)NGENI;
		fprintf(fit,"%.7d,%.5lf\n",i,Efit);
		printf("Generazione: %.4d\tE[fit]%.5lf\n",i,Efit);
	}
	fclose(fit);
//	system("python3 fitness.py");
	// chiama python per plottare
	return 0;
}

void GeneraDNA(int* current_generation, int* modeldna) { //N*NGENI !!!
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < NGENI; j++) {
			*(current_generation+i*j) = lrand48()%4;
		}
	}
	for (int k = 0; k < NGENI; k++) {
		modeldna[k] = lrand48()%4;
	}
}

int Fitness(int* current_generation, int* modeldna, int* contageni) {
	for (int i = 0; i < N; i++) {
		contageni[i] = 0;
	}
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < NGENI; j++) {
			if (*(current_generation+i*j) == *(modeldna+j)) {
				contageni[j]++;
			}
		}
	}
	int sum_geni;
	for (int i = 0; i < N; i++) {
		sum_geni += contageni[i];
	}
	return sum_geni;
}

int SelezionaGenitore(int* contageni, int sum_geni) {
	double y;
	y = drand48() + (double)(lrand48()%(sum_geni));
	int i, sum;
	for (i = 0; i < N; i++) {
		sum += contageni[i];
		i++;
		if ((double)sum >= y) {
			break;
		}
	} //vuole un for? necessito /*break*/
	return i;
}

void Riproduzione(int* next_generation, int* current_generation, int* contageni, int sum_geni) {
	int x, genitore1, genitore2;
	x = lrand48()%NGENI;
	genitore1 = SelezionaGenitore(contageni, sum_geni);
	genitore2 = SelezionaGenitore(contageni, sum_geni);
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < NGENI; j++) {
			if (j < x) {
				*(next_generation+i*j) = *(current_generation+genitore1*j);
			} else {
				*(next_generation+i*j) = *(current_generation+genitore2*j);
			}
		}
	}
}
