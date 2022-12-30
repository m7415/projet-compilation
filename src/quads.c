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
    else if(q.kind == Q_SET) {
        fprintf(file, "SET ");
        print_quadop(q.res, file);
        fprintf(file, " TO ");
        print_quadop(q.op1, file);
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
    else if(q.kind == Q_CONCAT) {
        fprintf(file, "SET ");
        print_quadop(q.res, file);
        fprintf(file, " TO CONCAT(");
        print_quadop(q.op1, file);
        fprintf(file, ", ");
        print_quadop(q.op2, file);
        fprintf(file, ")");
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
        fprintf(file, "<ident>%s", op.ident);
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


struct quad quad_set(struct quadop ident, struct quadop val) {
    struct quad q;
    q.kind = Q_SET;
    q.op1 = val;
    q.res = ident;
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
    return q;
}

struct quad quad_declare(struct quadop ident) {
    struct quad q;
    q.kind = Q_DECLARE;
    q.op1 = ident;
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