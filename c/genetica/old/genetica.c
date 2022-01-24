#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <math.h>

#define N 200
#define NGENI 18
#define M 20

void GeneraDNA(int cgen[][NGENI], int model[]);
int Fitness(int cgen[][NGENI], int model[], int counts[]);
int SelezionaGenitore(int counts[], int sum);
void Riproduzione(int counts[], int sum, int newgen[][NGENI], int oldgen[][NGENI]);
double avg(int counts[]);

int main(void) {
	int seed = time(NULL);
	srand48(seed);
	int current_generation[N][NGENI] = {0}, modeldna[NGENI] = {0}, contageni[N] = {0}, sum, new_generation[N][NGENI];
	GeneraDNA(current_generation,modeldna);
	printf("modeldna:\n");
	for (int k = 0; k < NGENI; k++) {
		printf("%d", modeldna[k]);
	}
	printf("\ncurrent_gen\n");
	for (int i = 0; i < N; i++) {
		for(int j = 0; j < NGENI; j++) {
			printf("%d",current_generation[i][j]);
		}
		printf("\n");
	}
	printf("\n");
	for (int i = 0; i < M; i++) {
		Riproduzione(contageni, sum, new_generation, current_generation);
//		fitness = Fitness(current_generation, modeldna, contageni);
		printf("gen=%d\t%lf\n",i,NGENI-sum/(double)N);
	}
}

void GeneraDNA(int cgen[][NGENI], int model[]) {
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < NGENI; j++) {
			cgen[i][j] = lrand48() % 4;
		}
	}
	for (int k = 0; k < NGENI; k++) {
		model[k] = lrand48() % 4;
	}
}

int Fitness(int cgen[][NGENI], int model[], int counts[]) {
	int sum;
	for (int i = 0; i < N; i++) {
		counts[i] = 0;
		for(int j = 0; j < NGENI; j++) {
			if (cgen[i][j] == model[j]) {
				counts[i]++;
				sum++;
			}
		}
	}
	return sum;
}

int SelezionaGenitore(int counts[], int sum) {
	double y = 0;
	int i = 0;
	y = drand48() + (double)(lrand48()%sum);
	do {
		sum+=counts[i];
		i++;
	} while (y < sum);
	return i;
}

void Riproduzione(int counts[], int sum, int newgen[][NGENI], int oldgen[][NGENI]) {
	int gen1,gen2;
	int x = 0;
	for (int i = 0; i < N; i++) {
		gen1 = SelezionaGenitore(counts,sum);
		gen2 = SelezionaGenitore(counts,sum);
		x = lrand48()%NGENI;
		for (int j = 0; j < x; j++) {
			newgen[i][j] = oldgen[gen1][j];
		}
		for (int j = x; j < NGENI; j++) {
			newgen[i][j] = oldgen[gen2][j];
		}
	}
}

double avg(int counts[]) {
	double average;
	for (int i = 0; i < NGENI; i++) {
		average += counts[i];
	}
	return average/NGENI;
}
