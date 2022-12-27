#include "mips.h"

void shift_write(char *chaine, int * position, FILE *fichier) {
    // R2cupération de la taille du fichier
    fseek(fichier, 0, SEEK_END);
    int taille = ftell(fichier);

    // Déplacement à la position spécifiée dans le fichier
    fseek(fichier, *position, SEEK_SET);

    // Lecture de la suite du fichier dans un buffer
    char buffer[taille];
    size_t nb_octets_lus = fread(buffer, sizeof(char), taille, fichier);

    // Écriture de la chaîne de caractères à la position spécifiée dans le fichier
    fseek(fichier, *position, SEEK_SET);
    fwrite(chaine, sizeof(char), strlen(chaine), fichier);
    *position += strlen(chaine);

    // Réécriture de la suite du fichier à la suite de la chaîne de caractères
    fwrite(buffer, sizeof(char), nb_octets_lus, fichier);

    // Déplacement à la fin du fichier
    fseek(fichier, 0, SEEK_END);
}


char * new_string(int *numstr) {
    char * str = malloc(MAX_MIPS_ID * sizeof(char));
    sprintf(str, "_s%d", *numstr);
    *numstr += 1;
    return str;
}

char* handle_quadop(struct quadop qo, FILE * sortie,int *pos_data, int *numstr,int *numlab, int* table_label) {
    char * mips = malloc(MAX_OP_SIZE * sizeof(char));
    char *chaine = malloc(MAX_OP_SIZE * sizeof(char));
    char *str;
    switch (qo.kind) {
        case QO_CST:
            sprintf(mips, "%d", qo.cst);
            break;
        case QO_CST_STRING:
            str = new_string(numstr);
            switch (qo.cst_str[0])
            {
            case '\"':
                sprintf(chaine,"    %s: .asciiz %s\n",str,qo.cst_str);
                break;
            case '\'':
                qo.cst_str[0] = '\"';
                qo.cst_str[strlen(qo.cst_str)-1] = '\"';
                sprintf(chaine,"    %s: .asciiz %s\n",str,qo.cst_str);
                break;
            default:
                sprintf(chaine,"    %s: .asciiz \"%s\"\n",str,qo.cst_str);
                break;
            }
            shift_write(chaine,pos_data,sortie);
            sprintf(mips, "%s", str);
            free(str);
            break;
        case QO_IDENT:
            sprintf(mips, "%s", qo.ident);
            break;
        case QO_ADDR:
            if (table_label[qo.addr] == -1)
            {
                table_label[qo.addr] = *numlab;
                *numlab += 1;                
            }
            sprintf(mips,"_l%d",table_label[qo.addr]);
            break;
        default:
            sprintf(mips, "UNKNOWN");
            break;
    }
    free(chaine);
    return mips;
}

int handle_quad(int i, struct quad q, FILE * sortie,int *pos_data, int *numstr,int *numlab, int* table_label, int * table_addr) {
    int ecrit = 0;
    char * temp1;
    char * temp2;
    char * temp3;
    switch (q.kind) {
        case Q_ECHO:
            switch (q.op1.kind) {
                case QO_CST:
                    temp1 = handle_quadop(q.op1,sortie, pos_data, numstr, numlab, table_label);
                    ecrit = fprintf(sortie, "   la $a0, %s\n   li $v0, 1\n   syscall\n", temp1);
                    free(temp1);
                    break;
                case QO_CST_STRING:
                    temp1 = handle_quadop(q.op1,sortie, pos_data, numstr, numlab, table_label);
                    ecrit = fprintf(sortie, "   la $a0, %s\n   li $v0, 4\n   syscall\n", temp1);
                    free(temp1);
                    break;
                case QO_IDENT:
                    /* code */
                    break;
                default:
                    fprintf(stderr,"ERREUR !\n");
                    break;
            }
            break;
        case Q_IFEQ:
            temp1 = handle_quadop(q.op1,sortie, pos_data, numstr, numlab, table_label);
            temp2 = handle_quadop(q.op2,sortie, pos_data, numstr, numlab, table_label);
            temp3 = handle_quadop(q.res,sortie, pos_data, numstr, numlab, table_label);
            ecrit = fprintf(sortie, "   la $t0,%s\n   la $t1,%s\n   beq $t0, $t1, %s\n", temp1, temp2, temp3);
            free(temp1);
            free(temp2);
            free(temp3);
            break;
        case Q_IFDIFF:
            temp1 = handle_quadop(q.op1,sortie, pos_data, numstr, numlab, table_label);
            temp2 = handle_quadop(q.op2,sortie, pos_data, numstr, numlab, table_label);
            temp3 = handle_quadop(q.res,sortie, pos_data, numstr, numlab, table_label);
            ecrit = fprintf(sortie, "   la $t0,%s\n   la $t1,%s\n   bne $t0, $t1, %s\n", temp1, temp2, temp3);
            free(temp1);
            free(temp2);
            free(temp3);
            break;
        case Q_GOTO:
            temp1 = handle_quadop(q.res,sortie, pos_data, numstr, numlab, table_label);
            ecrit = fprintf(sortie, "   b %s\n", temp1);
            free(temp1);
            break;
        case Q_GOTO_UNKNOWN:
            ecrit = fprintf(sortie, "   b UNKNOWN\n");
            break;
        case Q_BIDON:
            ecrit = fprintf(sortie, "   BIDON\n");
            break;
        case Q_BIDON2:
            ecrit = fprintf(sortie, "   BIDON2\n");
            break;
        case Q_SET:
            temp1 = handle_quadop(q.op1,sortie, pos_data, numstr, numlab, table_label);
            temp2 = handle_quadop(q.res,sortie, pos_data, numstr, numlab, table_label);
            ecrit = fprintf(sortie, "   MOVE %s, %s\n", temp1, temp2);
            break;
        case Q_EXIT:
            ecrit = fprintf(sortie,"    jr $ra\n");;
            break;
        default:
            ecrit = fprintf(sortie, "   UNKNOWN\n");
            break;
    }
    table_addr[i] = ftell(sortie) - *pos_data - ecrit;
    return 0;
}

int trad_MIPS(FILE * sortie,struct quad* quad_table, int nextquad /*+ table des symboles*/){
    int pos_data = 0;

    int numstr = 0;
    int numlab = 0;

    int table_label[nextquad];
    for (int i = 0; i < nextquad; i++)
    {
        table_label[i] = -1;
    }

    int table_addr[nextquad];
    for (int i = 0; i < nextquad; i++)
    {
        table_addr[i] = 0;
    }

    // Data zone
    pos_data += fprintf(sortie,".data\n");

    //variables globales ?
    fprintf(sortie,".text\n");

    // Code zone
    fprintf(sortie,".globl main\nmain:\n");

    for (int i = 0; i < nextquad; i++)
    {
        handle_quad(i, quad_table[i],sortie, &pos_data, &numstr, &numlab, table_label, table_addr);
    }

    char *chaine = malloc(MAX_OP_SIZE * sizeof(char));
    int position = pos_data;
    for (int i = 0; i < nextquad; i++)
    {
        if (table_label[i] != -1)
        {
            position += table_addr[i];
            sprintf(chaine,"_l%d:\n",table_label[i]);
            shift_write(chaine, &position, sortie);
            position = position - table_addr[i];
        }
    }
    free(chaine);
    
    
    //pos_code += fprintf(sortie,"label1:\n");
    //code
    //...
    //fin du programme

    return 0;
}