#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <stdbool.h>

void bubblesort(double*,int);

int seed, len, j = 0;
double arr[999];

int main(void) {
	seed = time(NULL);
	srand48(seed);
	printf("Insert the amount of random numbers you want to generate inside an array (n<1000)\nIt will generate a file sorting.txt with the array and its indexing if there will be more than 64 numbers\n");
	scanf("%d", &len);
	while (len > 1000) {
		printf("ERROR: insert a value SMALLER than 1000\n");
		scanf("%d", &len);
	}
	for (int i = 0; i < len-1; i++) {
		arr[i] = drand48();
	}
//	BRANCHING FOR LARGE NUMBERS AND GENERATING FILE
	if (len > 64) {
		printf("Generating file...\n");
		FILE *sort;
		sort = fopen("sorting.txt","w");
		printf("Inserting non sorted values of the array...\n");
		for (int i = 0; i < len-1; i++) {
			fprintf(sort,"%d\t%lf\n",i,arr[i]);
			j++;
		}
		printf("Sorting...\n");
		bubblesort(arr, len);
		printf("Inserting sorted values of the array...\n");
		fprintf(sort,"\n----------- SORTED VALUES -----------\n");
		for (int i = 0; i < len-1; i++) {
			fprintf(sort,"%d\t%lf\n",j,arr[i]);
		}
		printf("Done!\n");
		fclose(sort);
		exit(EXIT_SUCCESS);
	} else {
		printf("Printing unsorted array...\n[");
		for (int i = 0; i < len-1; i++) {
			printf(" %lf ",arr[i]);
		}
		printf("]\nSorting...\n");
		bubblesort(arr, len);
		printf("Printing sorted array...\n[");
		for (int i = 0; i < len-1; i++) {
			printf(" %lf ",arr[i]);
		}
		printf("]\nDone!\n");
		exit(EXIT_SUCCESS);
	}
}

void bubblesort(double* arr,int len) {
	double swap;
	bool flag;
	do {
		for (int i = 0; i < len-1; i++) {
			flag = false;
			if ( *arr > *(arr+1) ) {
				flag = true;
				swap = *arr;
				*arr = *(arr+1);
				*(arr+1) = swap;
			}
		}
	} while(flag);
}

