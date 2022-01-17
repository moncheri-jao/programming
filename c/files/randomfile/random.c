#include <stdlib.h>
#include <stdio.h>
FILE *randomfile;
int k = 0;
double x = 0.;
int main () {
    int LEN = 0;
    printf("insert the how much random numbers I should print to a file 'randomfile.dat' (<1000)\n");
    scanf("%d",&LEN); //create some interactivity with user
    while ( LEN > 1000 ) {
	printf("ERROR: number too big, reinsert a new number\n");
        scanf("%d",&LEN); // checking...
    }
    double* data; //redefine data from array to pointer to obtain variability of allocated memory
    for (int i = 0; i < LEN+1; i++) { 
	*(data+i)=0; // empty the array!
    }
    printf("Generating file...\n");
    randomfile = fopen("randomfile.dat","w"); //open file
    if (randomfile == NULL) {
	printf("ERROR: unable to open file 'randomfile.dat'\n"); //check if open, else exit with nonzero code
	exit(1);
    }
    printf("Writing random numbers...\n");
    for (int i = 1; i < LEN + 1; i++) {
	x = (double)rand() / (double)RAND_MAX; //generate random numbers in (0,1)
	fprintf(randomfile, "%d\t%lf\n", i, x); //print randomfile numbers to file with index && tabbing
    }
    fclose(randomfile); //close the file
    randomfile = fopen("randomfile.dat", "r+"); // reopen ininverted array to file
    for (int i = 1; i < LEN + 1; i++) {
	fscanf(randomfile, "%d %lf", &k, &x); // read k and x from file
	*(data + LEN - k) = x; // assign x to data[LEN-k] (( INVERT ARRAY!!! ))
    }
    fprintf(randomfile,"\n-----------------------------\n");
    fprintf(randomfile,"\nINVERTING\n"); // Indicating inversion in LINE:21
    fprintf(randomfile,"\n-----------------------------\n"); // lines for clarityA
    printf("Inverting the array and printing it...\n");
    for (int i = 1; i < LEN + 1; i++) {
	fprintf(randomfile, "%d\t%f\n", i, *(data+i-1)); //print inverted array to file
    }
    fclose(randomfile);
    printf("Done!\n");
}
