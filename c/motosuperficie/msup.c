#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

#define N 200

double gammad(void);
void passo(int, double, double, double*, double*, double*);
int controllo(int, double, double*, double*);
void printer(int, int, double, double*, double*);

int main(void) {
	double gamma, dt = 0.02, t[N] = {0}, s[N] = {0}, v[N];
	int i = 0, seed;
	FILE* stream;
	seed = time(NULL);
	srand48(seed);
	gamma = gammad();
	printf("%lf\n",gamma);
	v[0] = 18;
	stream = fopen("traiettoria.dat", "w");
	fprintf(stream, "%lf\t%lf\t%lf\n",t[0],s[0],v[0]);
	for (i = 1; i < N; i++) {
		passo(i, dt, gamma, t, s, v);
		if (controllo(i, 25., s, v) == 1 ) {
			printer(1,i,gamma,s,v);
			break;
		} else if ( controllo(i, 25., s, v) == 2 ) {
			printer(2,i,gamma,s,v);
			break;
		} else if( i == N ) {
			printf("Raggiunto numero massimo di iterazioni\n");
		}
		fprintf(stream,"%lf\t%lf\t%lf\n",t[i],s[i],v[i]);
	}
	fclose(stream);
	return 0;
}

void printer(int caso, int i, double gamma, double* s, double* v) {
	if (caso == 1) {
		printf("La pallina si è fermata prima di raggiungere la buca al passo nr %d;\ngamma_d=%lf, s[%d]=%lf, v[%d]=%lf\n",i,gamma,i,s[i],i,v[i]);
	} else if (caso == 2) {
		printf("La pallina ha raggiunto la buca al passo nr %d;\ngamma_d=%lf, s[%d]=%lf, v[%d]=%lf\n",i,gamma,i,s[i],i,v[i]);
	}
}

double gammad(void) {
	/*return( drand48() + (double)(lrand48()%2) );*/
	return( drand48()*0.3+0.5 );
}

void passo(int i, double dt, double gamma, double* t, double* s, double* v) {
	t[i] = i*dt;
	s[i] = s[i-1]+v[i-1]*dt;
	v[i] = v[i-1]-9.81*gamma*dt;
}

int controllo(int i, double d, double* s, double* v) {
	int caso = -1;
	if (s[i] - d >= 0) {
		caso = 2;
	} else if (v[i] <= 0) {
		caso = 1;
	} else {
		caso = 0;
	}
	return caso;
}
