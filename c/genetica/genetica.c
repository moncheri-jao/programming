#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define N 200
#define NGENI 18
#define M 20

void GeneraDNA(int cgen[N][NGENI], int* model);
int Fitness(int cgen[N][NGENI], int* model, int* count);
int SelezionaGenitore(int* count, int sum);
void Riproduzione(int ngen[N][NGENI], int cgen[N][NGENI], int* count, int sum);

int main(void) {
	int current_generation[N][NGENI], modeldna[NGENI], contageni[N] = {0}, seed = time(NULL), next_generation[N][NGENI], fit;
	FILE* pfit;
	srand48(seed);
//	INIZIO PROGRAMMA
	pfit = fopen("fitness.dat", "w");
	GeneraDNA(current_generation, modeldna);
	for (int i = 0; i < M; i++) {
		fit = Fitness(current_generation, modeldna, contageni);
		Riproduzione(next_generation, current_generation, contageni, fit);
		printf("E[fit]: %lf\n", NGENI-fit/(double)N);
		fprintf(pfit,"Gen: %d\tFit: %lf\n",i+1, NGENI-fit/(double)N);
	}
	return 0; 
}

int Fitness(int cgen[N][NGENI], int* model, int* count) {
	int sum = 0;
	for(int i = 0; i < N; i++) {
		*(count+i) = 0;
		for(int j = 0; j < NGENI; j++) {
			if (*(*(cgen+i)+j) == *(model+j)) {
				*(count+i)+=1;
				sum++;
			}
		}
	}
	return sum;
}

void GeneraDNA(int cgen[N][NGENI], int* model) {
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < NGENI; j++) {
			*(*(cgen+i)+j) = lrand48() % 4;
		}
	}
	for (int k = 0; k < N; k++) {
		*(model+k) = lrand48() % 4;
	}
}

int SelezionaGenitore(int* count, int sum) {
	double y = 0., csum = 0.;
	int i= 0;
	y = drand48() + (double)(lrand48()%sum);
	while (!(csum >= y)) {
		csum += (double)count[i];
		i++;
	}
	return i;
}

void Riproduzione(int ngen[N][NGENI], int cgen[N][NGENI], int* count, int sum) {
	int genitore1, genitore2, x;
	x = lrand48()%NGENI;
	for (int i = 0; i < N; i++) {
		genitore1 = SelezionaGenitore(count, sum);
		genitore2 = SelezionaGenitore(count, sum);
		for (int j = 0; j < x; j++) {
			ngen[i][j] = cgen[genitore1][j];
		}
		for (int k = x; k < NGENI; k++) {
			ngen[i][k] = cgen[genitore2][k];
		}
		for (int l = 0; l < NGENI; l++) {
			cgen[i][l] = ngen[i][l];
		}
	}
}
