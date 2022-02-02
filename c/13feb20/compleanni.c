#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define NSAMPLE 10000
#define N 300

void PrintMessage(void); // stampa messaggio di descrizione
void FillArray(int*, int); // riempie array studenti
int CollectResult(int*, int); //

int main(void) {
	double probability;
	int seed, found, studenti[N], size;
	FILE* rstream;
	FILE* wstream;
	seed = time(NULL);
	srand48(seed);										// inizializzo funzione srand48()
	PrintMessage();										// stampo messaggio informativo
	rstream = fopen("input.dat", "r"); 							// apro file 'input.dat'
	if (rstream == NULL) {
		fprintf(stderr, "ERRORE: non è stato possibile aprire il file 'input.dat'\n");
	}											// verifico la corretta apertura del file 'input.dat'
	wstream = fopen("probability.dat", "w");						// apro (o creo) file 'probability.dat'
	while(fscanf(rstream,"%d",&size) != EOF) {
		found = 0;
		for(int j = 0; j < NSAMPLE; j++) {
			FillArray(studenti, size);
			found += CollectResult(studenti,size);
		}
		probability = (double)found/NSAMPLE;
		fprintf(wstream,"%.4d\t%7.4lf\n", size, probability);
	}
	fclose(wstream);
	fclose(rstream);
	return 0;
}

void PrintMessage(void){									// funzione di stampa messaggio informativo
	printf("=======================================================================\n");
	printf("Questo programma calcola la probabilità di trovare almeno due studenti che abbiano lo stesso mese di nascita\n");
	printf("=======================================================================\n");
}

void FillArray(int* studenti, int n) {				// prende puntatore ad inizio array studenti e dimensione da occupare
	int month;						// definisco valore 'month'
	for (int i = 0; i < n; i++) {
		month = lrand48()%12;				// estraggo month tra [0,11]
		studenti[i] = month;				// assegno valore a n caselle array studenti
	}
}

int CollectResult(int* studenti, int n) {			// prendo array studenti e dimensione
	int month, chk[11]={0};			// creo valore 'bool', month e contatore di controllo
	for (int i = 0; i < n; i++) {
		month = studenti[i];				// assegno a month il valore i-esimo di studenti e incremento contatore alla casella adeguata del mese ([0,11])
		chk[month]++;					
	}
	for(int i = 0; i < 12; i++) {
		if(chk[i] < 2) {
			return 0;
		}
	}
	return 1;
}
