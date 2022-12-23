#ifndef MIPS_H
#define MIPS_H

#include <sys/types.h>
#include <stdio.h>
#include <string.h>
#include "quads.h"

// Fonction de traduction de quadop en code assembleur MIPS
char* quadop_to_mips(struct quadop qo);

// Fonction de traduction de quad en code assembleur MIPS
char* quad_to_mips(struct quad q);


#endif