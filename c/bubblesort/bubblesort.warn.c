// sorts arrays via a (void) bubblesort function
#include <stdlib.h>
#include <stdio.h>
#include <time.h> // include time.h for srand48 seed
void bubblesort(int*, int); // bubblesort function prototype
int main (void) { // apparently I'm an idiot and I have to place the shit inside main
        int len = 0, mod = 0, seed = 0, *arr; // initialize all values + seed & pointer
        seed = time(NULL); // set seed as time from 1/1/1970 in ms
        srand48(seed); // initialize random number generation
        printf("Insert the length of the random array\n"); 
        scanf("%d", &len); // define the length of the random array from cli
        printf("Insert the range of the random numbers (>0)\n");
        scanf("%d", &mod); // get the mod for the random number generation
        for (int i = 0; i < len; i++) {
                *(arr + i) = 0; // initialize the variable array to 0
        }
        for (int i = 0; i < len; i++) {
                *(arr + i) = lrand48() % (mod+1); // insert the random numbers in [0,mod] inside the array
        }
        printf("Here's the unsorted array:\n");
        printf("[ ");
        for (int i = 0; i < len; i++) {
                printf("%d ", *(arr+i)); // print the unsorted array
        }
        printf("]\n");
        bubblesort(arr,len); // sort the array
        printf("Here's the sorted array:\n");
        printf("[ ");
        for (int i = 0; i < len; i++) {
                printf("%d ", *(arr+i)); // print the sorted array
        }
        printf("]\n");
        exit(0);
}
void bubblesort(int *arr, int len) {
        int *ptr, temp; // initialize temp integer and pointer to int
        for (int i = 0; i < len-1; i++) { // loop len-1 times the array
                for (ptr = arr+len-1; ptr>arr+i; ptr--) { // start from the end of the array and move backwards till you reach the sorted part of the memory (arr+i)
                        if (*(ptr-1) > *ptr) { // if the previous is bigger than the next then
                                temp = *(ptr-1); // assign previous to temp
                                *(ptr-1) = *ptr; // switch
                                *ptr = temp; // assign temp to next
                        }
                }
        }
}
