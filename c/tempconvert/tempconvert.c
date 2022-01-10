#include <stdio.h>
#include <stdint.h>

void tempConvert(double);
double tf = 0.;
int main () {
    printf("Inserisci la temperatura da convertire senza unità di misura\n");
    scanf("%lf",&tf);
    tempConvert(tf);
    return 0;
}
void tempConvert(double tf) {
    char *yn = "y";
    double offset = 32.;
    double t, tc, ftoc, ctof = 0.;
    ftoc = 5./9;
    ctof = 9./5;
    printf("Devi convertire in Celsius [Y/n]\n");
    scanf("%lf",&tc);
    if (yn == "" || yn == "y") {
	// da F
	t = (tf - offset) * ftoc;
    } else if (yn == "n") {
	// da C
	t = (tf * ctof) + offset;
    }
    printf("La temperatura convertita è: %lf\n",t);
}
