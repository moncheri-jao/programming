#include <stdio.h>
#include <stdlib.h>
unsigned hammingDistance (unsigned a, unsigned b) {	
	int invbina[64], invbinb[64];
	int i = 0;
	int j = 0;
	int k = 0;
	int dist = 0;
	for (k = 0; k < 65; k++) {
		invbina[k] = 0;
		invbinb[k] = 0;
	}
	do {
		invbina[i] = a % 2;
		a = a / 2;
		i++;
		printf("a_i=%d\n",a);
	} while(a > 0);
	do {
		invbinb[j] = b % 2;
		b = b / 2;
		j++;
	} while(b > 0);
	if (i > j) {
		k = i;
	} else {
		k = j;
	}
//	printf("i=%d,j=%d,k=%d\n",i,j,k);
//	int bina[k], binb[k];
//	int bina[i];
//	int binb[j];
//	for (int l = 0; l < k+1; l++) {
//		bina[k] = 0;
//		binb[k] = 0;
//	}
//	for (int l = 0; l < k+1; l++) {
//		bina[l] = invbina[k-l];
//	}
//	for (int l = 0; l < j+1; l++) {
//		binb[l] = invbinb[k-l];
//	}
	for (int l = k; l >= 0; l--) {
		if (invbina[l] != invbinb[l]) {
			dist++;
		}
	}
	if (i>30 && j>30) {
		dist--;
	}
//	DEBUG
	printf("debug bina: ");
	for (int l = 0; l < k+1; l++) {
		printf("%d",invbina[l]);
	}
	printf("\ndebug binb: ");
	for (int l = 0; l < k+1; l++) {
		printf("%d",invbinb[l]);
	}
	printf("\n");
	for (int l = 0; l < k+1; l++) {
		printf("%d\n",(invbina[l] != invbinb[l]));
	}
	printf("dist=%d\n",dist);
		return(dist);
}
int main () {
	hammingDistance(173,143);
	exit(0);
}
