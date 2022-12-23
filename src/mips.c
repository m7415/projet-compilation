#include "mips.h"

// Fonction de traduction de quadop en code assembleur MIPS
char* quadop_to_mips(struct quadop qo) {
    static char mips[MAX_IDENT_SIZE + 8];
    switch (qo.kind) {
        case QO_CST:
            snprintf(mips, sizeof(mips), "$%d", qo.cst);
            break;
        case QO_IDENT:
            snprintf(mips, sizeof(mips), "%s", qo.ident);
            break;
        case QO_ADDR:
            snprintf(mips, sizeof(mips), "%p", (void*)qo.addr);
            break;
        default:
            snprintf(mips, sizeof(mips), "UNKNOWN");
            break;
    }
    return mips;
}

// Fonction de traduction de quad en code assembleur MIPS
char* quad_to_mips(struct quad q) {
    static char mips[256];
    switch (q.kind) {
        case Q_IFEQ:
            snprintf(mips, sizeof(mips), "BEQ %s, %s, %s",
                     quadop_to_mips(q.op1), quadop_to_mips(q.op2), quadop_to_mips(q.res));
            break;
        case Q_IFDIFF:
            snprintf(mips, sizeof(mips), "BNE %s, %s, %s",
            quadop_to_mips(q.op1), quadop_to_mips(q.op2), quadop_to_mips(q.res));
            break;
        case Q_GOTO:
            snprintf(mips, sizeof(mips), "J %s", quadop_to_mips(q.res));
            break;
        case Q_GOTO_UNKNOWN:
            snprintf(mips, sizeof(mips), "J UNKNOWN");
            break;
        case Q_BIDON:
            snprintf(mips, sizeof(mips), "BIDON %s, %s, %s",
            quadop_to_mips(q.op1), quadop_to_mips(q.op2), quadop_to_mips(q.res));
            break;
        case Q_BIDON2:
            snprintf(mips, sizeof(mips), "BIDON2 %s, %s, %s",
            quadop_to_mips(q.op1), quadop_to_mips(q.op2), quadop_to_mips(q.res));
            break;
        case Q_SET:
            snprintf(mips, sizeof(mips), "MOVE %s, %s", quadop_to_mips(q.op1), quadop_to_mips(q.res));
            break;
        default:
            snprintf(mips, sizeof(mips), "UNKNOWN");
            break;
    }
    return mips;
}