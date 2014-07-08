/* $Id: matmult.c,v 1.2 2005/04/04 11:34:58 csg Exp $ */

/* matmult.c */
/* was mm.c! */


/*----------------------------------------------------------------------*
 * To make this program compile under our assumed embedded environment,
 * we had to make several changes:
 * - Declare all functions in ANSI style, not K&R.
 *   this includes adding return types in all cases!
 * - Declare function prototypes
 * - Disable all output
 * - Disable all UNIX-style includes
 *
 * This is a program that was developed from mm.c to matmult.c by
 * Thomas Lundqvist at Chalmers.
 *----------------------------------------------------------------------*/
//#define UPPSALAWCET 1


/* ***UPPSALA WCET***:
   disable stupid UNIX includes */
#ifndef UPPSALAWCET
#include <time.h>
#include <sys/types.h>
#include <sys/times.h>
#include <stdio.h>
#endif

/*
 * MATRIX MULTIPLICATION BENCHMARK PROGRAM:
 * This program multiplies 2 square matrices resulting in a 3rd
 * matrix. It tests a compiler's speed in handling multidimensional
 * arrays and simple arithmetic.
 */

#define UPPERLIMIT 770

typedef int matrix [UPPERLIMIT][UPPERLIMIT];

int Seed;
matrix ArrayA, ArrayB, ResultArray;

/* Our picky compiler wants prototypes! */
void InitSeed(void);
void Initialize(matrix Array);
int RandomInteger(void);

void main()
{
    register int Outer, Inner, Index;

    InitSeed();
/* ***UPPSALA WCET***:
   no printing please! */
#ifndef UPPSALAWCET
   printf("\n   *** MATRIX MULTIPLICATION BENCHMARK TEST ***\n\n");
   printf("RESULTS OF THE TEST:\n");
#endif
    
#ifndef UPPSALAWCET
    struct timeval StartTime, StopTime;
    float TotalTime;
#endif
    
    /* ***UPPSALA WCET***: don't print or time */
#ifndef UPPSALAWCET
    gettimeofday(&StartTime, NULL);
#endif
    
    Initialize(ArrayA);
    Initialize(ArrayB);
    
    /*
     * Multiplies arrays A and B and stores the result in ResultArray.
     */
    for (Outer = 0; Outer < UPPERLIMIT; Outer++) /* max 770 */
    {
        for (Inner = 0; Inner < UPPERLIMIT; Inner++) /* max 770 */
        {
            ResultArray[Outer][Inner] = 0;
            for (Index = 0; Index < UPPERLIMIT; Index++) /* max 770 */
                ResultArray[Outer][Inner] += ArrayA[Outer][Index] * ArrayB[Index][Inner];
        }
    }

    /* ***UPPSALA WCET***: don't print or time */
#ifndef UPPSALAWCET
    gettimeofday(&StopTime, NULL);
    TotalTime = (1000 * (StopTime.tv_sec - StartTime.tv_sec) + (StopTime.tv_usec - StartTime.tv_usec) / 1000) / 1000.0;
    printf("    - Size of array is %d (%ld CLOCKS_PER_SEC)\n", UPPERLIMIT, CLOCKS_PER_SEC);
    printf("    - Total multiplication time is %3.3f seconds\n\n", TotalTime);
#endif
}

/*
 * Initializes the seed used in the random number generator.
 */
void InitSeed(void)
{
  /* ***UPPSALA WCET***:
     changed Thomas Ls code to something simpler.
   Seed = KNOWN_VALUE - 1; */
  Seed = 1;
}

/*
 * Intializes the given array with random integers.
 */
void Initialize(matrix Array)
{
   int OuterIndex, InnerIndex;

//   printf("Valores da Matriz: \n\n");
   for (OuterIndex = 0; OuterIndex < UPPERLIMIT; OuterIndex++) /* max 770 */
   {
      for (InnerIndex = 0; InnerIndex < UPPERLIMIT; InnerIndex++) /* max 770 */
      {
         Array[OuterIndex][InnerIndex] = RandomInteger();
//         printf("(%d)", Array[OuterIndex][InnerIndex]);
      }
   }
}

/*
 * Generates random integers between 0 and 8095
 */
int RandomInteger(void)
{
   Seed = ((Seed * 133) + 81) % 8095;
   return (Seed);
}