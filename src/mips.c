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

char* handle_quadop(struct quadop qo, FILE * sortie,int *pos_data,int *pos_code,int *numstr,int *numlab) {
    char * mips = malloc(MAX_OP_SIZE * sizeof(char));
    switch (qo.kind) {
        case QO_CST:
            sprintf(mips, "%d", qo.cst);
            break;
        case QO_CST_STRING:
            fseek(sortie,*pos_data,SEEK_SET);
            char *str = new_string(numstr);
            int temp = fprintf(sortie,"%s: .asciiz %s\n",str,qo.cst_str);
            *pos_data += temp;
            *pos_code += temp;
            fseek(sortie,*pos_code,SEEK_SET);
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

int handle_quad(struct quad q, FILE * sortie,int *pos_data,int *pos_code,int *numstr,int *numlab) {
    int temp = 0;
    switch (q.kind) {
        case Q_ECHO:
            temp = fprintf(sortie, "la $a0, %s\nli $v0, 4\nsyscall\n",
            handle_quadop(q.op1,sortie, pos_data, pos_code, numstr, numlab));
            break;
        case Q_IFEQ:
            temp = fprintf(sortie, "la $t0,%s\nla $t1,%s\nbeq $t0, $t1, %s\n",
            handle_quadop(q.op1,sortie, pos_data, pos_code, numstr, numlab), 
            handle_quadop(q.op2,sortie, pos_data, pos_code, numstr, numlab), 
            handle_quadop(q.res,sortie, pos_data, pos_code, numstr, numlab));
            break;
        case Q_IFDIFF:
            temp = fprintf(sortie, "la $t0,%s\nla $t1,%s\nbne $t0, $t1, %s\n",
            handle_quadop(q.op1,sortie, pos_data, pos_code, numstr, numlab), 
            handle_quadop(q.op2,sortie, pos_data, pos_code, numstr, numlab), 
            handle_quadop(q.res,sortie, pos_data, pos_code, numstr, numlab));
            break;
        case Q_GOTO:
            temp = fprintf(sortie, "b %s\n", 
            handle_quadop(q.res,sortie, pos_data, pos_code, numstr, numlab));
            break;
        case Q_GOTO_UNKNOWN:
            temp = fprintf(sortie, "b UNKNOWN\n");
            break;
        case Q_BIDON:
            temp = fprintf(sortie, "BIDON %s, %s, %s\n",
            handle_quadop(q.op1,sortie, pos_data, pos_code, numstr, numlab), 
            handle_quadop(q.op2,sortie, pos_data, pos_code, numstr, numlab), 
            handle_quadop(q.res,sortie, pos_data, pos_code, numstr, numlab));
            break;
        case Q_BIDON2:
            temp = fprintf(sortie, "BIDON2 %s, %s, %s\n",
            handle_quadop(q.op1,sortie, pos_data, pos_code, numstr, numlab), 
            handle_quadop(q.op2,sortie, pos_data, pos_code, numstr, numlab), 
            handle_quadop(q.res,sortie, pos_data, pos_code, numstr, numlab));
            break;
        case Q_SET:
            temp = fprintf(sortie, "MOVE %s, %s\n", 
            handle_quadop(q.op1,sortie, pos_data, pos_code, numstr, numlab), 
            handle_quadop(q.res,sortie, pos_data, pos_code, numstr, numlab));
            break;
        case Q_EXIT:
            temp = fprintf(sortie,"jr $ra\n");;
            break;
        default:
            temp = fprintf(sortie, "UNKNOWN\n");
            break;
    }
    *pos_code += temp;
    return 0;
}

int trad_MIPS(FILE * sortie,struct quad* quad_table, int nextquad /*+ table des symboles*/){
    int pos_data = 0;
    int pos_code = 0;

    int numstr = 0;
    int numlab = 0;

    // Data zone
    int temp = fprintf(sortie,".data\n");
    pos_data += temp;
    pos_code += temp;
    //variables globales ?
    pos_code += fprintf(sortie,".text\n");

    // Code zone
    pos_code += fprintf(sortie,".globl main\nmain:\n");

    for (int i = 0; i < nextquad; i++)
    {
        handle_quad(quad_table[i],sortie, &pos_data, &pos_code, &numstr, &numlab);
    }
    
    //pos_code += fprintf(sortie,"label1:\n");
    //code
    //...
    //fin du programme

    return 0;
}