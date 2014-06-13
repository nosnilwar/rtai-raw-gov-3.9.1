#ifndef HANDLE_FILES_H
#define HANDLE_FILES_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// maximum number of lines in the instruction file
#define MAX_LINES 1000

struct cycles* readInstrFile (char *cFile_name);
int loop_iteration_num (char *cFile_name, struct basic_block *loop_cond);

struct cyclesLine {

	int line; // the line number in the C code
	int cycles; // the wcec need to execute this C line code
};

struct cycles {

	int len; // the length of the below array
	struct cyclesLine *cyclesPerLine;
};

struct cycles* readInstrFile(char *cFile_name) {

	int line, cycle, i = 0, n;
	char *instrFile, *pos;
	struct cycles *cycles;

	n = strlen(cFile_name) + 6;
	instrFile = (char*) malloc (n*sizeof(char));
	strcpy(instrFile, cFile_name);
	pos = strstr(instrFile, ".c");
	strncpy(pos, ".instr", 7);

	freopen(instrFile, "r", stdin);

	cycles = (struct cycles*) malloc (sizeof(struct cycles));
	cycles->cyclesPerLine = (struct cyclesLine*) malloc
										(sizeof(struct cyclesLine)*MAX_LINES);
	while (scanf("%d %d", &line, &cycle) == 2) {
		cycles->cyclesPerLine[i].line = line;
		cycles->cyclesPerLine[i++].cycles = cycle;
	}

	cycles->len = i;
	fclose(stdin);

	return cycles;
}

int loop_iteration_num (char *cFile_name, struct basic_block *loop_cond) {

	int lines_to_read, length_iteration_str, iter;
	char line[201], *str1, *str2, *part_str1, numbers[] = "1234567890";
	FILE *file = fopen(cFile_name, "r");

	rewind(file);

	lines_to_read = 1;
	while (lines_to_read <= loop_cond->start_line) {
		str2 = fgets (line, 201, file);
		lines_to_read++;
	}

	// loop pattern to tell the number of iterations in a loop:
	// /* max <NUMBER> */
	str1 = strstr (line, "/* max");
	if (str1) {

		part_str1 = strpbrk (str1, numbers);

		length_iteration_str = (int) strspn (part_str1, numbers);

		// the number of iterations
		strncpy (str1, part_str1, length_iteration_str + 1);
		str1[length_iteration_str + 1] = '\0';

		iter = atoi(str1);
	}
	else
		iter = 1; /* the pattern wasn't matched, so assumes one iteration */

	return iter;
}

#endif /* HANDLE_FILES_H */
