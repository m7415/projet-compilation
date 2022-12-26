#ifndef MIPS_H
#define MIPS_H

#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "quads.h"

#define MAX_OP_SIZE 128
#define MAX_PROG_SIZE 4096
#define MAX_INST_SIZE 128
#define MAX_MIPS_ID 32

char * new_string(int *numstr);

char * new_label(int *numlab);

// Fonction de traduction de quadop en code assembleur MIPS
char* handle_quadop(struct quadop qo, FILE * sortie,int *pos_data,int *numstr,int *numlab);

// Fonction de traduction de quad en code assembleur MIPS
int handle_quad(struct quad q, FILE * sortie,int *pos_data,int *numstr,int *numlab);


#endif