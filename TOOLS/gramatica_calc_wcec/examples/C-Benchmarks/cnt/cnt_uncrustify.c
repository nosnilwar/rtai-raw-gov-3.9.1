/* $Id: cnt.c,v 1.3 2005/04/04 11:34:58 csg Exp $ */

/* sumcntmatrix.c */

//#define UPPSALAWCET 1

/* ***UPPSALA WCET***:
 * disable stupid UNIX includes */
#ifndef UPPSALAWCET
#include <time.h>
#include <sys/types.h>
#include <sys/times.h>
#include <stdio.h>
#endif

// #define WORSTCASE 1

// #define MAXSIZE 100 Changed JG/Ebbe

#define MAXSIZE    7000

// Typedefs
typedef int matrix [MAXSIZE][MAXSIZE];

// Forwards declarations
int main(void);
int InitSeed(void);
int RandomInteger(void);

// Globals
int Seed;

matrix Array;

long int Postotal, Negtotal, Poscnt, Negcnt;

// The main function
int main(void) {
	register int OuterIndex, InnerIndex;
	register int Outer, Inner;
	int			 Ptotal = 0; /* changed these to locals in order to drive worst case */
	int			 Ntotal = 0;
	int			 Pcnt	= 0;
	int			 Ncnt	= 0;

	InitSeed();

#ifndef UPPSALAWCET
	printf("\n   *** MATRIX MULTIPLICATION BENCHMARK TEST ***\n\n");
	printf("RESULTS OF THE TEST:\n");
#endif

#ifndef UPPSALAWCET
	struct timeval StartTime, StopTime;
	float		   TotalTime;
#endif

	/* ***UPPSALA WCET***: don't print or time */
#ifndef UPPSALAWCET
	gettimeofday(&StartTime, NULL);
#endif

	// Inicializando o array...
	for (OuterIndex = 0; OuterIndex < MAXSIZE; OuterIndex++) { /* max 7000 */
		for (InnerIndex = 0; InnerIndex < MAXSIZE; InnerIndex++) { /* max 7000 */
			Array[OuterIndex][InnerIndex] = RandomInteger();
		}
	}

	// Realizando a soma...
	for (Outer = 0; Outer < MAXSIZE; Outer++) { /* max 7000 */
		for (Inner = 0; Inner < MAXSIZE; Inner++) { /* max 7000 */
//#ifdef WORSTCASE
			if (Array[Outer][Inner] >= 0) {
//#else
//            if (Array[Outer][Inner] < 0)
//            {
//#endif
				Ptotal += Array[Outer][Inner];
				Pcnt++;
			}
			else{
				Ntotal += Array[Outer][Inner];
				Ncnt++;
			}
		}
	}

	Postotal = Ptotal;
	Poscnt	 = Pcnt;
	Negtotal = Ntotal;
	Negcnt	 = Ncnt;

	/* ***UPPSALA WCET***: don't print or time */
#ifndef UPPSALAWCET
	gettimeofday(&StopTime, NULL);
	TotalTime = (1000 * (StopTime.tv_sec - StartTime.tv_sec) + (StopTime.tv_usec - StartTime.tv_usec) / 1000) / 1000.0;
	printf("    - Size of array is %d (%ld CLOCKS_PER_SEC)\n", MAXSIZE, CLOCKS_PER_SEC);
	printf("    - Num pos was %d and Sum was %lld\n", Poscnt, Postotal);
	printf("    - Num neg was %d and Sum was %lld\n", Negcnt, Negtotal);
	printf("    - Total multiplication time is %3.3f seconds\n\n", TotalTime);
#endif

	return(1);
}


// Initializes the seed used in the random number generator.
int InitSeed(void) {
	Seed = 0;
	return(0);
}


// Generates random integers between 0 and 8095
int RandomInteger(void) {
	Seed = ((Seed * 133) + 81) % 8095;
	return(Seed);
}
