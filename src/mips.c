#include "mips.h"

// Fonction de traduction de quadop en code assembleur MIPS
char* quadop_to_mips(struct quadop qo) {
    char * mips = malloc(MAX_OP_SIZE * sizeof(char));
    switch (qo.kind) {
        case QO_CST:
            sprintf(mips, "$%d", qo.cst);
            break;
        case QO_IDENT:
            sprintf(mips, "%s", qo.ident);
            break;
        case QO_ADDR:
            sprintf(mips, "%p", (void*)qo.addr);
            break;
        default:
            sprintf(mips, "UNKNOWN");
            break;
    }
    return mips;
}

// Fonction de traduction de quad en code assembleur MIPS
char* quad_to_mips(struct quad q) {
    char *  mips = malloc(MAX_PROG_SIZE * sizeof(char));
    switch (q.kind) {
        case Q_IFEQ:
            sprintf(mips, "BEQ %s, %s, %s",
                     quadop_to_mips(q.op1), quadop_to_mips(q.op2), quadop_to_mips(q.res));
            break;
        case Q_IFDIFF:
            sprintf(mips, "BNE %s, %s, %s",
            quadop_to_mips(q.op1), quadop_to_mips(q.op2), quadop_to_mips(q.res));
            break;
        case Q_GOTO:
            sprintf(mips, "J %s", quadop_to_mips(q.res));
            break;
        case Q_GOTO_UNKNOWN:
            sprintf(mips, "J UNKNOWN");
            break;
        case Q_BIDON:
            sprintf(mips, "BIDON %s, %s, %s",
            quadop_to_mips(q.op1), quadop_to_mips(q.op2), quadop_to_mips(q.res));
            break;
        case Q_BIDON2:
            sprintf(mips, "BIDON2 %s, %s, %s",
            quadop_to_mips(q.op1), quadop_to_mips(q.op2), quadop_to_mips(q.res));
            break;
        case Q_SET:
            sprintf(mips, "MOVE %s, %s", quadop_to_mips(q.op1), quadop_to_mips(q.res));
            break;
        default:
            sprintf(mips, "UNKNOWN");
            break;
    }
    return mips;
}