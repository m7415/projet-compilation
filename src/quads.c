#include "quads.h"

void print_quad(struct quad q, FILE * file_) {
    FILE * file;
    if(file_ == NULL) {
        file = stdout;
    }
    else {
        file = file_;
    }
    if( q.kind == Q_GOTO) {
        fprintf(file, "GOTO ");
        print_quadop(q.res, file);
    }
    else if(q.kind == Q_GOTO_UNKNOWN) {
        fprintf(file,"GOTO ?");
        // printf("GOTO <addr>?");
    }
    else if(q.kind == Q_GOTO_LABEL) {
        fprintf(file, "GOTO ");
        print_quadop(q.res, file);
    }
    else if(q.kind == Q_IFDIFF) {
        fprintf(file, "IF ");
        print_quadop(q.op1, file);
        fprintf(file, " != ");
        print_quadop(q.op2, file);
        fprintf(file, " GOTO ");
        print_quadop(q.res, file);
    }
    else if(q.kind == Q_IFEQ) {
        fprintf(file, "IF ");
        print_quadop(q.op1, file);
        fprintf(file, " == ");
        print_quadop(q.op2, file);
        fprintf(file, " GOTO ");
        print_quadop(q.res, file);
    }
    else if(q.kind == Q_IFGT) {
        fprintf(file, "IF ");
        print_quadop(q.op1, file);
        fprintf(file, " > ");
        print_quadop(q.op2, file);
        fprintf(file, " GOTO ");
        print_quadop(q.res, file);
    }
    else if(q.kind == Q_IFGE) {
        fprintf(file, "IF ");
        print_quadop(q.op1, file);
        fprintf(file, " >= ");
        print_quadop(q.op2, file);
        fprintf(file, " GOTO ");
        print_quadop(q.res, file);
    }
    else if(q.kind == Q_IFLT) {
        fprintf(file, "IF ");
        print_quadop(q.op1, file);
        fprintf(file, " < ");
        print_quadop(q.op2, file);
        fprintf(file, " GOTO ");
        print_quadop(q.res, file);
    }
    else if(q.kind == Q_IFLE) {
        fprintf(file, "IF ");
        print_quadop(q.op1, file);
        fprintf(file, " <= ");
        print_quadop(q.op2, file);
        fprintf(file, " GOTO ");
        print_quadop(q.res, file);
    }
    else if(q.kind == Q_IFEQ_STR) {
        fprintf(file, "IF ");
        print_quadop(q.op1, file);
        fprintf(file, " ==(str) ");
        print_quadop(q.op2, file);
        fprintf(file, " GOTO ");
        print_quadop(q.res, file);
    }
    else if(q.kind == Q_IFDIFF_STR) {
        fprintf(file, "IF ");
        print_quadop(q.op1, file);
        fprintf(file, " !=(str) ");
        print_quadop(q.op2, file);
        fprintf(file, " GOTO ");
        print_quadop(q.res, file);
    }
    else if(q.kind == Q_IFNULL_STR) {
        fprintf(file, "IF ");
        print_quadop(q.op1, file);
        fprintf(file, " == \"\" (null)");
        fprintf(file, " GOTO ");
        print_quadop(q.res, file);
    }
    else if(q.kind == Q_IFNOTNULL_STR) {
        fprintf(file, "IF ");
        print_quadop(q.op1, file);
        fprintf(file, " != \"\" (not null)");
        fprintf(file, " GOTO ");
        print_quadop(q.res, file);
    }
    else if(q.kind == Q_ADD) {
        fprintf(file, "SET ");
        print_quadop(q.res, file);
        fprintf(file, " TO ");
        print_quadop(q.op1, file);
        fprintf(file, " + ");
        print_quadop(q.op2, file);
    }
    else if(q.kind == Q_SUB) {
        fprintf(file, "SET ");
        print_quadop(q.res, file);
        fprintf(file, " TO ");
        print_quadop(q.op1, file);
        fprintf(file, " - ");
        print_quadop(q.op2, file);
    }
    else if(q.kind == Q_MUL) {
        fprintf(file, "SET ");
        print_quadop(q.res, file);
        fprintf(file, " TO ");
        print_quadop(q.op1, file);
        fprintf(file, " * ");
        print_quadop(q.op2, file);
    }
    else if(q.kind == Q_DIV) {
        fprintf(file, "SET ");
        print_quadop(q.res, file);
        fprintf(file, " TO ");
        print_quadop(q.op1, file);
        fprintf(file, " / ");
        print_quadop(q.op2, file);
    }
    else if(q.kind == Q_MOD) {
        fprintf(file, "SET ");
        print_quadop(q.res, file);
        fprintf(file, " TO ");
        print_quadop(q.op1, file);
        fprintf(file, " %% ");
        print_quadop(q.op2, file);
    }
    else if(q.kind == Q_INV_SIGNE) {
        fprintf(file, "SET ");
        print_quadop(q.res, file);
        fprintf(file, " TO (-1) * ");
        print_quadop(q.op1, file);
    }
    else if(q.kind == Q_SET) {
        fprintf(file, "SET ");
        print_quadop(q.res, file);
        fprintf(file, " TO ");
        print_quadop(q.op1, file);
    }
    else if(q.kind == Q_SET_TAB) {
        fprintf(file, "SET ");
        print_quadop(q.res, file);
        fprintf(file, "[");
        print_quadop(q.op1, file);
        fprintf(file, "] TO ");
        print_quadop(q.op2, file);
        fprintf(file, " (SET_TAB)");
    }
    else if(q.kind == Q_GET_TAB) {
        fprintf(file, "SET ");
        print_quadop(q.res, file);
        fprintf(file, " TO ");
        print_quadop(q.op1, file);
        fprintf(file, "[");
        print_quadop(q.op2, file);
        fprintf(file, "] (GET_TAB)");
    }
    else if(q.kind == Q_BIDON) {
        fprintf(file, "XXXX ");
        print_quadop(q.op1, file);
    }
    else if(q.kind == Q_BIDON2) {
        fprintf(file, "YYYY ");
        print_quadop(q.op1, file);
    }
    else if(q.kind == Q_EXIT) {
        fprintf(file, "EXIT ");
        print_quadop(q.op1, file);
    }
    else if(q.kind == Q_ECHO) {
        fprintf(file, "ECHO ");
        print_quadop(q.op1, file);
    }
    else if(q.kind == Q_DECLARE) {
        fprintf(file, "DECLARE ");
        print_quadop(q.op1, file);
    }
    else if(q.kind == Q_DECLARE_TAB) {
        fprintf(file, "DECLARE_TAB ");
        print_quadop(q.op1, file);
        fprintf(file, "[");
        print_quadop(q.op2, file);
        fprintf(file, "]");
    }
    else if(q.kind == Q_CONCAT) {
        fprintf(file, "SET ");
        print_quadop(q.res, file);
        fprintf(file, " TO CONCAT(");
        print_quadop(q.op1, file);
        fprintf(file, ", ");
        print_quadop(q.op2, file);
        fprintf(file, ")");
    }
    else if(q.kind == Q_READ) {
        fprintf(file, "READ IN ");
        print_quadop(q.res,file);
    }
    else if (q.kind == Q_READ_TAB) {
        fprintf(file, "READ IN TAB ");
        print_quadop(q.res, file);
        fprintf(file, "[");
        print_quadop(q.op1, file);
        fprintf(file, "]");
    }
    else {
        fprintf(file, "UNRECOGNIZED QUAD");
    }
    fprintf(file, "\n");
}

// #define PRINTTYPES

void print_quadop(struct quadop op, FILE * file_) {
    FILE * file;
    if(file_ == NULL) {
        file = stdout;
    }
    else {
        file = file_;
    }
    #ifndef PRINTTYPES
    if(op.kind == QO_CST) {
        fprintf(file, "%d", op.cst);
    }
    else if(op.kind == QO_ADDR) {
        fprintf(file, "%ld", op.addr);
    }
    else if(op.kind == QO_UNKNOWN) {
        fprintf(file, "?");
    }
    else if(op.kind == QO_IDENT) {
        fprintf(file, "IDENT[");
        fprintf(file, "%s", op.ident);
        fprintf(file, "]");
    }
    else if(op.kind == QO_TAB_ELEM) {
        fprintf(file, "TAB[%s][%i] (/!\\ devrait pas apparaitre /!\\) ", op.tab.ident, op.tab.idx);
    }
    else if(op.kind == QO_CST_STRING) {
        fprintf(file, "%s",op.cst_str);
    }
    #else
    if(op.kind == QO_CST) {
        fprintf(file, "<cst>%d", op.cst);
    }
    else if(op.kind == QO_ADDR) {
        fprintf(file, "<addr>%ld", op.addr);
    }
    else if(op.kind == QO_UNKNOWN) {
        fprintf(file, "<addr>?");
    }
    else if(op.kind == QO_IDENT) {
        fprintf(file, "IDENT[");
        fprintf(file, "%s", op.ident);
        fprintf(file, "]");
    }
    else if(op.kind == QO_TAB_ELEM) {
        fprintf(file, "TAB[%s][%i]", op.tab.ident,op.tab.idx);
    }
    else if(op.kind == QO_CST_STRING) {
        fprintf(file, "<cst_str>%s",op.cst_str);
    }
    #endif
    else {
        fprintf(file, "?!?!");
    }
}

struct quadop quadop_cst(int v) {
    struct quadop qo;
    qo.kind = QO_CST;
    qo.cst = v;
    return qo;
}

struct quadop quadop_cst_string(char * v) {
    struct quadop qo;
    qo.kind = QO_CST_STRING;
    strncpy(qo.cst_str, v, MAX_STRING_SIZE);
    return qo;
}

struct quadop quadop_ident(char * id) {
    struct quadop qo;
    qo.kind = QO_IDENT;
    strncpy(qo.ident,id,MAX_IDENT_SIZE);
    return qo;
}

struct quadop quadop_tab_elem(char * id, int idx) {
    struct quadop qo;
    qo.kind = QO_TAB_ELEM;
    strncpy(qo.tab.ident, id, MAX_IDENT_SIZE);
    qo.tab.idx = idx;
    return qo;
}

struct quadop quadop_addr(size_t addr) {
    struct quadop qo;
    qo.kind = QO_ADDR;
    qo.addr = addr;
    return qo;
}

struct quadop quadop_addr_unknown() {
    struct quadop qo;
    qo.kind = QO_UNKNOWN;
    return qo;
}


struct quad quad_ifeq(struct quadop op1, struct quadop op2) {
    struct quad q;
    q.kind = Q_IFEQ;
    q.res = quadop_addr_unknown();
    q.op1 = op1;
    q.op2 = op2;
    return q;
}
struct quad quad_ifdiff(struct quadop op1, struct quadop op2) {
    struct quad q;
    q.kind = Q_IFDIFF;
    q.res = quadop_addr_unknown();
    q.op1 = op1;
    q.op2 = op2;
    return q;
}
struct quad quad_ifgt(struct quadop op1, struct quadop op2) {
    struct quad q;
    q.kind = Q_IFGT;
    q.res = quadop_addr_unknown();
    q.op1 = op1;
    q.op2 = op2;
    return q;
}
struct quad quad_ifge(struct quadop op1, struct quadop op2) {
    struct quad q;
    q.kind = Q_IFGE;
    q.res = quadop_addr_unknown();
    q.op1 = op1;
    q.op2 = op2;
    return q;
}
struct quad quad_iflt(struct quadop op1, struct quadop op2) {
    struct quad q;
    q.kind = Q_IFLT;
    q.res = quadop_addr_unknown();
    q.op1 = op1;
    q.op2 = op2;
    return q;
}
struct quad quad_ifle(struct quadop op1, struct quadop op2) {
    struct quad q;
    q.kind = Q_IFLE;
    q.res = quadop_addr_unknown();
    q.op1 = op1;
    q.op2 = op2;
    return q;
}
struct quad quad_ifeq_str(struct quadop op1, struct quadop op2) {
    struct quad q;
    q.kind = Q_IFEQ_STR;
    q.res = quadop_addr_unknown();
    q.op1 = op1;
    q.op2 = op2;
    return q;
}
struct quad quad_ifdiff_str(struct quadop op1, struct quadop op2) {
    struct quad q;
    q.kind = Q_IFDIFF_STR;
    q.res = quadop_addr_unknown();
    q.op1 = op1;
    q.op2 = op2;
    return q;
}
struct quad quad_ifnull_str(struct quadop op1) {
    struct quad q;
    q.kind = Q_IFNULL_STR;
    q.res = quadop_addr_unknown();
    q.op1 = op1;
    return q;
}
struct quad quad_ifnotnull_str(struct quadop op1) {
    struct quad q;
    q.kind = Q_IFNOTNULL_STR;
    q.res = quadop_addr_unknown();
    q.op1 = op1;
    return q;
}

struct quad quad_add(struct quadop res, struct quadop op1, struct quadop op2) {
    struct quad q;
    q.kind = Q_ADD;
    q.res = res;
    q.op1 = op1;
    q.op2 = op2;
    return q;
}
struct quad quad_sub(struct quadop res, struct quadop op1, struct quadop op2) {
    struct quad q;
    q.kind = Q_SUB;
    q.res = res;
    q.op1 = op1;
    q.op2 = op2;
    return q;
}
struct quad quad_mul(struct quadop res, struct quadop op1, struct quadop op2) {
    struct quad q;
    q.kind = Q_MUL;
    q.res = res;
    q.op1 = op1;
    q.op2 = op2;
    return q;
}
struct quad quad_div(struct quadop res, struct quadop op1, struct quadop op2) {
    struct quad q;
    q.kind = Q_DIV;
    q.res = res;
    q.op1 = op1;
    q.op2 = op2;
    return q;
}
struct quad quad_mod(struct quadop res, struct quadop op1, struct quadop op2) {
    struct quad q;
    q.kind = Q_MOD;
    q.res = res;
    q.op1 = op1;
    q.op2 = op2;
    return q;
}
struct quad quad_inv_signe(struct quadop res, struct quadop op1) {
    struct quad q;
    q.kind = Q_INV_SIGNE;
    q.res = res;
    q.op1 = op1;
    return q;
}

struct quad quad_goto(struct quadop addr) {
    struct quad q;
    q.kind = Q_GOTO;
    q.res = addr;
    return q;
}

struct quad quad_goto_unknown() {
    struct quad q;
    q.kind = Q_GOTO_UNKNOWN;
    return q;
}

struct quad quad_goto_label(struct quadop label) {
    struct quad q;
    q.kind = Q_GOTO_LABEL;
    q.res = label;
    return q;
}


struct quad quad_set(struct quadop ident, struct quadop val) {
    struct quad q;
    q.kind = Q_SET;
    q.op1 = val;
    q.res = ident;
    return q;
}

struct quad quad_set_tab(struct quadop tab, struct quadop idx, struct quadop val) {
    struct quad q;
    q.kind = Q_SET_TAB;
    q.res = tab;
    q.op1 = idx;
    q.op2 = val;
    return q;
}

struct quad quad_get_tab(struct quadop ident, struct quadop tab, struct quadop idx) {
    struct quad q;
    q.kind = Q_GET_TAB;
    q.res = ident;
    q.op1 = tab;
    q.op2 = idx;
    return q;
}

struct quad quad_bidon(int v) {
    struct quad q;
    q.kind = Q_BIDON;
    q.op1 = quadop_cst(v);
    return q;
}
struct quad quad_bidon2(int v) {
    struct quad q;
    q.kind = Q_BIDON2;
    q.op1 = quadop_cst(v);
    return q;
}


struct quad quad_exit(int v) {
    struct quad q;
    q.kind = Q_EXIT;
    q.op1 = quadop_cst(v);
    return q;
}

struct quad quad_echo(struct quadop val) {
    struct quad q;
    q.kind = Q_ECHO;
    q.op1 = val;
    q.data.is_last = 0;
    return q;
}

struct quad quad_declare(struct quadop ident) {
    struct quad q;
    q.kind = Q_DECLARE;
    q.op1 = ident;
    return q;
}
struct quad quad_declare_tab(struct quadop ident, struct quadop taille) {
    struct quad q;
    q.kind = Q_DECLARE_TAB;
    q.op1 = ident;
    q.op2 = taille;
    return q;
}

struct quad quad_concat(struct quadop ident, struct quadop op1, struct quadop op2) {
    struct quad q;
    q.kind = Q_CONCAT;
    q.res = ident;
    q.op1 = op1;
    q.op2 = op2;
    return q;
}

struct quad quad_read(struct quadop ident) {
    struct quad q;
    q.kind = Q_READ;
    q.res = ident;
    return q;
}

struct quad quad_read_tab(struct quadop ident, struct quadop idx) {
    struct quad q;
    q.kind = Q_READ_TAB;
    q.res = ident;
    q.op1 = idx;
    return q;
}


