#ifndef QUADS_H
#define QUADS_H

#include <sys/types.h>
#include <stdio.h>
#include <string.h>
// #include "../generated-src/compil.tab.h"

#define MAX_IDENT_SIZE 32 // 32 caractères pour un identificateur (y compris le \0 final)
#define MAX_STRING_SIZE 1024 // taille des chaines jsp

enum quadop_kind { 
    QO_CST,        // .cst
    QO_CST_STRING, // .cst_str
    QO_IDENT,      // .ident
    QO_TAB_ELEM,   // .ident et .cst (il n'y en a plus dans le code final)
    QO_ADDR,       // .addr
    QO_UNKNOWN     // <rien>
};  

struct quadop {
    enum quadop_kind kind;
    union {
        int cst;
        char ident[MAX_IDENT_SIZE];
        char cst_str[MAX_STRING_SIZE];
        size_t addr;
        struct {
            int idx;
            char ident[MAX_IDENT_SIZE];
        } tab;
    }; // union anonyme
};

enum quad_kind { 
    // comparaisons arithmétiques
    Q_IFEQ, // if op1 == op2 goto res   (-eq)
    Q_IFDIFF, // if op1 != op2 goto res (-neq)
    Q_IFGT, // if op1 > op2 goto res    (-gt)
    Q_IFGE, // if op1 >= op2 goto res   (-ge)
    Q_IFLT, // if op1 < op2 goto res    (-lt)
    Q_IFLE, // if op1 <= op2 goto res   (-le)
    // ----
    // comparaisons de string
    Q_IFNULL_STR, // if op1 == "" goto res    (-z)
    Q_IFNOTNULL_STR, // if op1 != "" got res  (-n)
    Q_IFEQ_STR, // if op1 == op2 goto res   ('=')
    Q_IFDIFF_STR, // if op1 != op2 goto res ('!=')
    // ----
    // opérations arithmétiques
    Q_ADD, // res <- op1 + op2
    Q_SUB, // res <- op1 - op2
    Q_MUL, // res <- op1 * op2
    Q_DIV, // res <- op1 // op2
    Q_MOD, // res <- op1 % op2 (reste de div)
    Q_INV_SIGNE, // res <- (-1)*op1
    // ----
    Q_GOTO, // goto res
    Q_GOTO_UNKNOWN, // goto ?? (normalement à la fin y en a pas)
    Q_GOTO_LABEL, // goto res, mais res est un QO_CST_STRING (pour jump sur des labels prédéfinis de erreur.s)
    Q_BIDON, // bidon op1
    Q_BIDON2, // bidon op1
    Q_EXIT, // exit op1
    Q_ECHO, // echo op1
    Q_SET, // res <- op1
    Q_SET_TAB, // res[op1] <- op2
    Q_GET_TAB, // res <- op1[op2] (res est un ident, op1 est un tableau, op2 cst_str)
    Q_DECLARE, // declare op1 (op1 est un QO_IDENT)
    Q_DECLARE_TAB, // declare op1[op2] (op1 est un QO_IDENT, op2 est un mot ne contenant que des chiffres)
    Q_CONCAT // (ident)res <- concat(op1, op2)
};

struct quad {
    enum quad_kind kind;
    struct quadop op1, op2, res;
    union { // infos en plus
        char is_last; // dans un echo, 1 si c'est le dernier qo
                      // 0 sinon (savoir si on met un esapce ou non)
    } data;
};

void print_quad(struct quad q, FILE * file_);
void print_quadop(struct quadop op, FILE * file_);

struct quadop quadop_cst(int v);
struct quadop quadop_cst_string(char * v);
struct quadop quadop_ident(char * id);
struct quadop quadop_tab_elem(char * id, int idx);
struct quadop quadop_addr(size_t addr);
struct quadop quadop_addr_unknown();

struct quad quad_ifeq(struct quadop op1, struct quadop op2);
struct quad quad_ifdiff(struct quadop op1, struct quadop op2);
struct quad quad_ifgt(struct quadop op1, struct quadop op2);
struct quad quad_ifge(struct quadop op1, struct quadop op2);
struct quad quad_iflt(struct quadop op1, struct quadop op2);
struct quad quad_ifle(struct quadop op1, struct quadop op2);
struct quad quad_ifeq_str(struct quadop op1, struct quadop op2);
struct quad quad_ifdiff_str(struct quadop op1, struct quadop op2);
struct quad quad_ifnull_str(struct quadop op1);
struct quad quad_ifnotnull_str(struct quadop op1);

struct quad quad_add(struct quadop res, struct quadop op1, struct quadop op2);
struct quad quad_sub(struct quadop res, struct quadop op1, struct quadop op2);
struct quad quad_mul(struct quadop res, struct quadop op1, struct quadop op2);
struct quad quad_div(struct quadop res, struct quadop op1, struct quadop op2);
struct quad quad_mod(struct quadop res, struct quadop op1, struct quadop op2);
struct quad quad_inv_signe(struct quadop res, struct quadop op1);

struct quad quad_goto(struct quadop addr);
struct quad quad_goto_unknown();
// struct quad quad_goto_label(struct quadop label);
struct quad quad_bidon(int v);
struct quad quad_bidon2(int v);
struct quad quad_set(struct quadop ident, struct quadop val);
struct quad quad_set_tab(struct quadop tab, struct quadop idx, struct quadop val);
struct quad quad_get_tab(struct quadop ident, struct quadop tab, struct quadop idx);
struct quad quad_exit(int v);
struct quad quad_echo(struct quadop val);
struct quad quad_declare(struct quadop ident);
struct quad quad_declare_tab(struct quadop ident, struct quadop taille);
struct quad quad_concat(struct quadop ident, struct quadop op1, struct quadop op2);

#endif