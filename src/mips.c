#include "mips.h"

char * new_string(int *numstr) {
    char * str = malloc(MAX_MIPS_ID * sizeof(char));
    sprintf(str, "_s%d", *numstr);
    *numstr += 1;
    return str;
}

char * new_label(int *numlab) {
    char * lab = malloc(MAX_MIPS_ID * sizeof(char));
    sprintf(lab, "%d", *numlab);
    *numlab += 1;
    return lab;
}

char* handle_quadop(struct quadop qo, FILE * sortie,int *pos_data, int *numstr,int *numlab) {
    char * mips = malloc(MAX_OP_SIZE * sizeof(char));
    switch (qo.kind) {
        case QO_CST:
            sprintf(mips, "%d", qo.cst);
            break;
        case QO_CST_STRING:
            fseek(sortie,*pos_data,SEEK_SET);
            char *str = new_string(numstr);
            *pos_data += fprintf(sortie,"%s: .asciiz %s\n",str,qo.cst_str);
            fseek(sortie,0,SEEK_END);
            sprintf(mips, "%s", str);
            break;
        case QO_IDENT:
            sprintf(mips, "%s", qo.ident);
            break;
        case QO_ADDR:
            sprintf(mips, "ADDR");
            break;
        default:
            sprintf(mips, "UNKNOWN");
            break;
    }
    return mips;
}

int handle_quad(struct quad q, FILE * sortie,int *pos_data, int *numstr,int *numlab) {
    switch (q.kind) {
        case Q_ECHO:
            fprintf(sortie, "la $a0, %s\nli $v0, 4\nsyscall\n",
            handle_quadop(q.op1,sortie, pos_data, numstr, numlab));
            break;
        case Q_IFEQ:
            fprintf(sortie, "la $t0,%s\nla $t1,%s\nbeq $t0, $t1, %s\n",
            handle_quadop(q.op1,sortie, pos_data, numstr, numlab), 
            handle_quadop(q.op2,sortie, pos_data, numstr, numlab), 
            handle_quadop(q.res,sortie, pos_data, numstr, numlab));
            break;
        case Q_IFDIFF:
            fprintf(sortie, "la $t0,%s\nla $t1,%s\nbne $t0, $t1, %s\n",
            handle_quadop(q.op1,sortie, pos_data, numstr, numlab), 
            handle_quadop(q.op2,sortie, pos_data, numstr, numlab), 
            handle_quadop(q.res,sortie, pos_data, numstr, numlab));
            break;
        case Q_GOTO:
            fprintf(sortie, "b %s\n", 
            handle_quadop(q.res,sortie, pos_data, numstr, numlab));
            break;
        case Q_GOTO_UNKNOWN:
            fprintf(sortie, "b UNKNOWN\n");
            break;
        case Q_BIDON:
            fprintf(sortie, "BIDON %s, %s, %s\n",
            handle_quadop(q.op1,sortie, pos_data, numstr, numlab), 
            handle_quadop(q.op2,sortie, pos_data, numstr, numlab), 
            handle_quadop(q.res,sortie, pos_data, numstr, numlab));
            break;
        case Q_BIDON2:
            fprintf(sortie, "BIDON2 %s, %s, %s\n",
            handle_quadop(q.op1,sortie, pos_data, numstr, numlab), 
            handle_quadop(q.op2,sortie, pos_data, numstr, numlab), 
            handle_quadop(q.res,sortie, pos_data, numstr, numlab));
            break;
        case Q_SET:
            fprintf(sortie, "MOVE %s, %s\n", 
            handle_quadop(q.op1,sortie, pos_data, numstr, numlab), 
            handle_quadop(q.res,sortie, pos_data, numstr, numlab));
            break;
        case Q_EXIT:
            fprintf(sortie,"jr $ra\n");;
            break;
        default:
            fprintf(sortie, "UNKNOWN\n");
            break;
    }
    return 0;
}

int trad_MIPS(FILE * sortie,struct quad* quad_table, int nextquad /*+ table des symboles*/){
    int pos_data = 0;

    int numstr = 0;
    int numlab = 0;

    // Data zone
    pos_data += fprintf(sortie,".data\n");

    //variables globales ?
    fprintf(sortie,".text\n");

    // Code zone
    fprintf(sortie,".globl main\nmain:\n");

    for (int i = 0; i < nextquad; i++)
    {
        handle_quad(quad_table[i],sortie, &pos_data, &numstr, &numlab);
    }
    
    //pos_code += fprintf(sortie,"label1:\n");
    //code
    //...
    //fin du programme

    return 0;
}