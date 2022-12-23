#include "quads.h"

void print_quad(struct quad q) {
    if( q.kind == Q_GOTO) {
        printf("GOTO ");
        print_quadop(q.res);
    }
    else if(q.kind == Q_GOTO_UNKNOWN) {
        printf("GOTO ?");
        // printf("GOTO <addr>?");
    }
    else if(q.kind == Q_IFDIFF) {
        printf("IF ");
        print_quadop(q.op1);
        printf(" != ");
        print_quadop(q.op2);
        printf(" GOTO ");
        print_quadop(q.res);
    }
    else if(q.kind == Q_IFEQ) {
        printf("IF ");
        print_quadop(q.op1);
        printf(" == ");
        print_quadop(q.op2);
        printf(" GOTO ");
        print_quadop(q.res);
    }
    else if(q.kind == Q_SET) {
        printf("SET ");
        print_quadop(q.res);
        printf(" TO ");
        print_quadop(q.op1);
    }
    else if(q.kind == Q_BIDON) {
        printf("XXXX ");
        print_quadop(q.op1);
    }
    else if(q.kind == Q_BIDON2) {
        printf("YYYY ");
        print_quadop(q.op1);
    }
    else if(q.kind == Q_EXIT) {
        printf("EXIT ");
        print_quadop(q.op1);
    }
    else if(q.kind == Q_ECHO) {
        printf("ECHO ");
        print_quadop(q.op1);
    }
    else {
        printf("UNRECOGNIZED QUAD");
    }
    printf("\n");
}

// #define PRINTTYPES

void print_quadop(struct quadop op) {
    #ifndef PRINTTYPES
    if(op.kind == QO_CST) {
        printf("%d", op.cst);
    }
    else if(op.kind == QO_ADDR) {
        printf("%ld", op.addr);
    }
    else if(op.kind == QO_UNKNOWN) {
        printf("?");
    }
    else if(op.kind == QO_IDENT) {
        printf("%s", op.ident);
    }
    else if(op.kind == QO_CST_STRING) {
        printf("%s",op.cst_str);
    }
    #else
    if(op.kind == QO_CST) {
        printf("<cst>%d", op.cst);
    }
    else if(op.kind == QO_ADDR) {
        printf("<addr>%ld", op.addr);
    }
    else if(op.kind == QO_UNKNOWN) {
        printf("<addr>?");
    }
    else if(op.kind == QO_IDENT) {
        printf("<ident>%s", op.ident);
    }
    else if(op.kind == QO_CST_STRING) {
        printf("<cst_str>%s",op.cst_str);
    }
    #endif
    else {
        printf("?!?!");
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


struct quad quad_set(char * id, struct quadop val) {
    struct quad q;
    q.kind = Q_SET;
    q.op1 = val;
    q.res = quadop_ident(id);
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