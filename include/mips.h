#ifndef MIPS_H
#define MIPS_H

#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "quads.h"

#define MAX_OP_SIZE 128
#define MAX_PROG_SIZE 4096

// Fonction de traduction de quadop en code assembleur MIPS
char* quadop_to_mips(struct quadop qo);

// Fonction de traduction de quad en code assembleur MIPS
char* quad_to_mips(struct quad q);


#endif