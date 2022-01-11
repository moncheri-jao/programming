#include <stdlib.h>
#include <stdio.h>
void bubblesort(int *, int);
int main (void) {
        int data[3] = {0};
        int i = 0;
        for (i = 0; i < 3; i++) {
                printf("dammi 3 interi\n");
                scanf("%d", (data+i));
        }
        bubblesort(data,3);
        printf("[");
        for (i = 0; i < 3; i++) {
                printf("%d", data[i]);
        }
        printf("]\n");
        exit(0);
}
void bubblesort(int data[], int n) {
        int i, temp, *pd;
        for (i = 0; i < n-1; i++) {
                for (pd = data+n-1;pd > data + i; pd--){
                        if (*(pd-1) > *pd) {
                                temp = *(pd-1);
                                *(pd-1) = *pd;
                                *pd = temp;
                        }
                }
        }
}