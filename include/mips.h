#ifndef MIPS_H
#define MIPS_H

#include <sys/types.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
#include "quads.h"

#define MAX_OP_SIZE 128
#define MAX_PROG_SIZE 4096
#define MAX_INST_SIZE 128
#define MAX_MIPS_ID 32
#define DEFAULT_VAR_SIZE 1024


#ifndef SYMB_LAST_FUNC_RETURN
#define SYMB_LAST_FUNC_RETURN ".last_func_return"
#endif
#ifndef SYMB_ARGC
#define SYMB_ARGC ".argc"
#endif
#ifndef SYMB_ARGV
#define SYMB_ARGV ".argv"
#endif


// un objet pour contenir les infos
// du fichier (au lieu de passer 15 args à chaque fois)
struct file_asm {
    FILE * sortie;
    int pos_data;
    int pos_main;
    int pos_initiale_main;
    int * table_label;
    int * table_addr;
    int numstr;
    int numlab;
    int nbquad;
};

// écrit à la position demandée, et renvois le nombre d'octets écrit
int shift_write(struct file_asm * f, int position, char * chaine, ...);

char * new_string(int *numstr);

// Fonction de traduction de quadop en code assembleur MIPS
// char* handle_quadop(struct quadop qo, FILE * sortie,int *pos_data,int *numstr,int *numlab, int* table_addr);
char * handle_quadop(struct file_asm * f, struct quadop qo);

// Fonction de traduction de quad en code assembleur MIPS
// int handle_quad(int i, struct quad q, FILE * sortie,int *pos_data,int *numstr,int *numlab, int* table_label, int * table_addr);
int handle_quad(struct file_asm * f, struct quad q, int i);

int trad_mips(FILE * sortie,struct quad* quad_table, int nextquad /*+ table des symboles*/);


#endif