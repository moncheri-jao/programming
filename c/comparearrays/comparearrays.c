#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#define q 8

bool compareArrays(const int *, const int *, size_t n);

int main(void) {
    int array1[q]={121,144,19,161,19,144,19,11},array2[q]={14641,20736,361,25921,361,20736,361,121};
    bool yeah = compareArrays(array1,array2,8);
    printf("%d\n",yeah);
    return 0;
}

bool compareArrays(const int *a, const int *b, size_t n) {
    int j = 0;
    for (int i = 0; i < n; i++) {
	for (j = 0; j < n; j++) {
	    if ((*(a+i))*(*(a+i)) != *(b+j)) {
		j++;
	    } 
	}
	if (i == n-1 && (*(a+i))*(*(a+i)) != *(b+j)) {
	    return false;
	}
    }
    return true;
}
