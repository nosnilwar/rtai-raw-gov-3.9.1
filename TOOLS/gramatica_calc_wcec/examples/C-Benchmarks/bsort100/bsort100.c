/* bsort100.c */

/* All output disabled for wcsim */
//#define WCSIM 1

/* A read from this address will result in an known value of 1 */
#define KNOWN_VALUE (int) 2

/* A read from this address will result in an unknown value */
#define UNKNOWN_VALUE (int) 2

#include <time.h>
#include <sys/types.h>
#include <sys/times.h>
#include <stdio.h>

#define WORSTCASE 1
#define FALSE 0
#define TRUE 1
#define NUMELEMS 10000
#define MAXDIM   (NUMELEMS+1)

/* BUBBLESORT BENCHMARK PROGRAM:
 * This program tests the basic loop constructs, integer comparisons,
 * and simple array handling of compilers by sorting 10 arrays of
 * randomly generated integers.
 */

int Array[MAXDIM], Seed;
int factor;

main()
{
	int  Index, fact;
   int Sorted = FALSE;
   int Temp, LastIndex, i;
   
#ifndef WCSIM
   struct timeval StartTime, StopTime;
   float TotalTime;

   printf("\n *** BUBBLE SORT BENCHMARK TEST ***\n\n");
   printf("RESULTS OF TEST:\n\n");

   gettimeofday(&StartTime, NULL);
#endif

	#ifdef WORSTCASE
	   factor = -1;
	#else
	   factor = 1;
	#endif

	fact = factor;
	for (Index = 1; Index <= NUMELEMS; Index ++) /* max 10000 */
    {
	    Array[Index] = Index * fact * KNOWN_VALUE;
    }

/*
 * Sorts an array of integers of size NUMELEMS in ascending order.
 */
   for (i = 1; i <= NUMELEMS-1; i++) /* max 10000 */
   {
      Sorted = TRUE;
      for (Index = 1; Index <= NUMELEMS-1; Index ++) /* max 10000 */
      {
         if (Index > NUMELEMS-i)
            break;
 
         if (Array[Index] > Array[Index + 1])
         {
            Temp = Array[Index];
            Array[Index] = Array[Index+1];
            Array[Index+1] = Temp;
            Sorted = FALSE;
         }
      }

      if (Sorted)
         break;
   }

#ifndef WCSIM
   if (Sorted || i == 1)
      fprintf(stderr, "array was successfully sorted in %d passes\n", i-1);
   else
      fprintf(stderr, "array was unsuccessfully sorted in %d passes\n", i-1);
#endif

#ifndef WCSIM
   gettimeofday(&StopTime, NULL);
   TotalTime = (1000 * (StopTime.tv_sec - StartTime.tv_sec) + (StopTime.tv_usec - StartTime.tv_usec) / 1000) / 1000.0;

   printf("     - Number of elements sorted is %d (%ld CLOCKS_PER_SEC)\n", NUMELEMS, CLOCKS_PER_SEC);
   printf("     - Total time sorting is %3.3f seconds\n\n", TotalTime);
#endif
}