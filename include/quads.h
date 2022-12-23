#ifndef QUADS_H
#define QUADS_H

#include <sys/types.h>
#include <stdio.h>
#include <string.h>
// #include "../generated-src/compil.tab.h"

#define MAX_IDENT_SIZE 32 // 32 caractères pour un identificateur (y compris le \0 final)
#define MAX_STRING_SIZE 1024 // taille des chaines jsp

struct quadop {
    enum /*quadop_kind*/ {QO_CST,
                          QO_CST_STRING,
                          QO_IDENT,
                          QO_ADDR,
                          QO_UNKNOWN} kind;
    union {
        int cst;
        char ident[MAX_IDENT_SIZE];
        char cst_str[MAX_STRING_SIZE];
        size_t addr;
    }; // union anonyme
};


struct quad {
    enum {
        Q_IFEQ,
        Q_IFDIFF,
        Q_GOTO,
        Q_GOTO_UNKNOWN,
        Q_BIDON,
        Q_BIDON2,
        Q_SET,
        Q_EXIT,
        Q_ECHO
    } kind;
    struct quadop op1, op2, res;
};

void print_quad(struct quad q);
void print_quadop(struct quadop op);

struct quadop quadop_cst(int v);
struct quadop quadop_cst_string(char * v);
struct quadop quadop_ident(char * id);
struct quadop quadop_addr(size_t addr);
struct quadop quadop_addr_unknown();

struct quad quad_ifeq(struct quadop op1, struct quadop op2);
struct quad quad_ifdiff(struct quadop op1, struct quadop op2);
struct quad quad_goto(struct quadop addr);
struct quad quad_goto_unknown();
struct quad quad_bidon(int v);
struct quad quad_bidon2(int v);
struct quad quad_set(char * id, struct quadop val);
struct quad quad_exit(int v);
struct quad quad_echo(struct quadop val); // un peu fourbe, psk en MIPS ça demande un appel à une primitive


#endif