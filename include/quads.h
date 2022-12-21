#ifndef QUADS_H
#define QUADS_H

#include <sys/types.h>
#include <stdio.h>
#include <string.h>

#define MAX_IDENT_SIZE 32 // 32 caractères pour un identificateur (y compris le \0 final)

struct quadop {
    enum /*quadop_kind*/ {QO_CST,QO_IDENT,QO_ADDR,QO_UNKNOWN} kind;
    union {
        int cst;
        char ident[MAX_IDENT_SIZE];
        size_t addr;
    }; // union anonyme
};


struct quad {
    enum {Q_IFEQ, Q_IFDIFF, Q_GOTO, Q_GOTO_UNKNOWN, Q_BIDON, Q_BIDON2, Q_SET} kind;
    struct quadop op1, op2, res;
};

void print_quad(struct quad q);
void print_quadop(struct quadop op);

struct quadop quadop_cst(int v);
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


#endif