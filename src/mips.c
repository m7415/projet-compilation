#include "mips.h"


int shift_write(struct file_asm * f, int position, char *chaine, ...) {
    
    FILE * fichier = f->sortie;
    int pointeur_init = ftell(fichier);

    // R2cupération de la taille du fichier
    fseek(fichier, 0, SEEK_END);
    int taille = ftell(fichier);
    // printf("taille : %i\n", taille);

    // Déplacement à la position spécifiée dans le fichier
    fseek(fichier, position, SEEK_SET);
    // printf("position : %i %li\n", position, ftell(fichier));

    // Lecture de la suite du fichier dans un buffer
    char * buffer = calloc(taille+1,1);
    size_t nb_octets_lus = fread(buffer, 1, taille, fichier);
    // printf("octets lus pour reste fichier : %lu\n", nb_octets_lus);
    // printf("buffer[0] int(char) : %i('%c')\n", buffer[0], buffer[0]);
    // printf("reste du fichier :\n'%s'\n",buffer);

    // Écriture de la chaîne de caractères à la position spécifiée dans le fichier
    int r = 0;
    fseek(fichier, position, SEEK_SET);
    va_list ap;
    va_start(ap,chaine);
    r += vfprintf(fichier, chaine, ap);
    va_end(ap);

    // Réécriture de la suite du fichier à la suite de la chaîne de caractères
    fwrite(buffer, sizeof(char), nb_octets_lus, fichier);

    // Déplacement à la fin du fichier
    fseek(fichier, pointeur_init+r, SEEK_SET);
    free(buffer);

    if(f->pos_data > position) {
        f->pos_data += r;
    }
    if(f->pos_main > position) {
        f->pos_main += r;
    }
    return r;
}



char * new_string(int *numstr) {
    char * str = malloc(MAX_MIPS_ID * sizeof(char));
    sprintf(str, ".s%d", *numstr);
    *numstr += 1;
    return str;
}

// char* handle_quadop(struct quadop qo, FILE * sortie,int *pos_data, int *numstr,int *numlab, int* table_label) {
char* handle_quadop(struct file_asm * f, struct quadop qo) {
    char * mips = malloc(MAX_OP_SIZE);
    char * chaine = malloc(MAX_OP_SIZE);
    char *str;
    switch (qo.kind) {
        case QO_CST:
            snprintf(mips, MAX_OP_SIZE, "%d", qo.cst);
            break;
        case QO_CST_STRING:
            str = new_string(&f->numstr);
            switch (qo.cst_str[0])
            {
            case '\"':
                snprintf(chaine,MAX_OP_SIZE,"   %s: .asciiz %s\n",str,qo.cst_str);
                break;
            case '\'':
                qo.cst_str[0] = '\"';
                qo.cst_str[strlen(qo.cst_str)-1] = '\"';
                snprintf(chaine,MAX_OP_SIZE,"   %s: .asciiz %s\n",str,qo.cst_str);
                break;
            default:
                snprintf(chaine,MAX_OP_SIZE,"   %s: .asciiz \"%s\"\n",str,qo.cst_str);
                break;
            }
            f->pos_data += shift_write(f, f->pos_data, chaine);
            snprintf(mips, MAX_OP_SIZE, "%s", str);
            free(str);
            break;
        case QO_IDENT:
            snprintf(mips, MAX_OP_SIZE, "%s", qo.ident);
            break;
        case QO_ADDR:
            if (f->table_label[qo.addr] == -1)
            {
                f->table_label[qo.addr] = f->numlab;
                f->numlab += 1;                
            }
            snprintf(mips, MAX_OP_SIZE, "_l%d",f->table_label[qo.addr]);
            break;
        default:
            snprintf(mips, MAX_OP_SIZE, "UNKNOWN");
            break;
    }
    free(chaine);
    return mips;
}

// int handle_quad(int i, struct quad q, FILE * sortie,int *pos_data, int *numstr,int *numlab, int* table_label, int * table_addr) {
int handle_quad(struct file_asm * f, struct quad q, int i) {
    int ecrit = 0;
    char * temp1;
    char * temp2;
    char * temp3;
    switch (q.kind) {
        case Q_ECHO:
            // switch (q.op1.kind) {
            //     case QO_CST:
            //         temp1 = handle_quadop(f, q.op1);
            //         ecrit = fprintf(f->sortie, "   la $a0, %s\n   li $v0, 1\n   syscall\n", temp1);
            //         free(temp1);
            //         break;
            //     case QO_CST_STRING:
            //         temp1 = handle_quadop(f, q.op1);
            //         ecrit = fprintf(f->sortie, "   la $a0, %s\n   li $v0, 4\n   syscall\n", temp1);
            //         free(temp1);
            //         break;
            //     case QO_IDENT:
            //         /* code */
            //         break;
            //     default:
            //         fprintf(stderr,"ERREUR !\n");
            //         break;
            // }
            temp1 = handle_quadop(f, q.op1);
            ecrit = fprintf(f->sortie,
                            "   la $a0, %s\n"
                            "   li $v0, 4\n"
                            "   syscall #print_str\n",
                            temp1);
            if(q.data.is_last == 0) {
                ecrit += fprintf(f->sortie, 
                                 "   la $a0, .single_space\n"
                                 "   li $v0, 4\n"
                                 "   syscall #espace après echo\n" );
            }
            free(temp1);
            break;
        case Q_IFEQ_STR:
            temp1 = handle_quadop(f, q.op1);
            temp2 = handle_quadop(f, q.op2);
            temp3 = handle_quadop(f, q.res);
            ecrit  = fprintf(f->sortie, 
                             "   la $a0, %s\n"
                             "   la $a1, %s\n"
                             "   jal compare\n"
                             "   beq $v0, 0, %s\n", 
                             temp1, temp2, temp3);
            free(temp1);
            free(temp2);
            free(temp3);
            break;
        case Q_IFDIFF_STR:
            temp1 = handle_quadop(f, q.op1);
            temp2 = handle_quadop(f, q.op2);
            temp3 = handle_quadop(f, q.res);
            ecrit  = fprintf(f->sortie, 
                             "   la $a0, %s\n"
                             "   la $a1, %s\n"
                             "   jal compare\n"
                             "   beq $v0, 1, %s\n", 
                             temp1, temp2, temp3);
            free(temp1);
            free(temp2);
            free(temp3);
            break;
        case Q_GOTO:
            temp1 = handle_quadop(f,q.res);
            ecrit = fprintf(f->sortie, "   b %s\n", temp1);
            free(temp1);
            break;
        case Q_GOTO_UNKNOWN:
            ecrit = fprintf(f->sortie, "   b UNKNOWN\n");
            break;
        case Q_BIDON:
            ecrit = fprintf(f->sortie, "   BIDON\n");
            break;
        case Q_BIDON2:
            ecrit = fprintf(f->sortie, "   BIDON2\n");
            break;
        case Q_SET:
            temp1 = handle_quadop(f,q.op1);
            temp3 = handle_quadop(f,q.res);
            ecrit  = fprintf(f->sortie, 
                             "   la $a0, %s\n"
                             "   la $a1, %s\n" 
                             "   la $a2, .empty_string\n"
                             "   jal concat\n",
                             temp3, temp1);
            free(temp1);
            free(temp3);
            break;
        case Q_CONCAT:
            temp1 = handle_quadop(f, q.op1);
            temp2 = handle_quadop(f, q.op2);
            temp3 = handle_quadop(f, q.res);
            ecrit  = fprintf(f->sortie,
                             "   la $a0, %s\n"
                             "   la $a1, %s\n"
                             "   la $a2, %s\n"
                             "   jal concat\n",
                             temp3, temp1, temp2);
            free(temp1);
            free(temp2);
            free(temp3);
            break;
        case Q_EXIT:
            ecrit = fprintf(f->sortie,"   li $v0, 10\n"
                                      "   syscall #EXIT\n");
            break;
        case Q_DECLARE:
            f->pos_data += shift_write(f, f->pos_data, "   %s: .space %i\n",
                                       q.op1.ident,DEFAULT_VAR_SIZE);

            f->pos_main += shift_write(f, f->pos_main,
                                       "# initialisation de %s\n"
                                       "   la $t0, %s\n"
                                       "   sb $t1, 0($t0)\n",
                                       q.op1.ident, q.op1.ident);
            break;
        case Q_IFEQ:
            temp1 = handle_quadop(f, q.op1);
            temp2 = handle_quadop(f, q.op2);
            temp3 = handle_quadop(f, q.res);
            ecrit  = fprintf(f->sortie,
                             "   la $a0, %s\n"
                             "   jal convert_entier\n"
                             "   move $a1, $v0\n"
                             "   la $a0, %s\n"
                             "   jal convert_entier\n"
                             "   beq $v0, $a1, %s\n",
                             temp1, temp2,temp3);
            free(temp1);
            free(temp2);
            free(temp3);
            break;
        case Q_IFDIFF:
            temp1 = handle_quadop(f, q.op1);
            temp2 = handle_quadop(f, q.op2);
            temp3 = handle_quadop(f, q.res);
            ecrit  = fprintf(f->sortie,
                             "   la $a0, %s\n"
                             "   jal convert_entier\n"
                             "   move $a1, $v0\n"
                             "   la $a0, %s\n"
                             "   jal convert_entier\n"
                             "   bne $v0, $a1, %s\n",
                             temp1, temp2,temp3);
            free(temp1);
            free(temp2);
            free(temp3);
            break;
        case Q_IFGT:
            temp1 = handle_quadop(f, q.op1);
            temp2 = handle_quadop(f, q.op2);
            temp3 = handle_quadop(f, q.res);
            ecrit  = fprintf(f->sortie,
                             "   la $a0, %s\n"
                             "   jal convert_entier\n"
                             "   move $a1, $v0\n"
                             "   la $a0, %s\n"
                             "   jal convert_entier\n"
                             "   bgt $v0, $a1, %s\n",
                             temp1, temp2,temp3);
            free(temp1);
            free(temp2);
            free(temp3);
            break;
        case Q_IFGE:
            temp1 = handle_quadop(f, q.op1);
            temp2 = handle_quadop(f, q.op2);
            temp3 = handle_quadop(f, q.res);
            ecrit  = fprintf(f->sortie,
                             "   la $a0, %s\n"
                             "   jal convert_entier\n"
                             "   move $a1, $v0\n"
                             "   la $a0, %s\n"
                             "   jal convert_entier\n"
                             "   bge $v0, $a1, %s\n",
                             temp1, temp2,temp3);
            free(temp1);
            free(temp2);
            free(temp3);
            break;
        case Q_IFLT:
            temp1 = handle_quadop(f, q.op1);
            temp2 = handle_quadop(f, q.op2);
            temp3 = handle_quadop(f, q.res);
            ecrit  = fprintf(f->sortie,
                             "   la $a0, %s\n"
                             "   jal convert_entier\n"
                             "   move $a1, $v0\n"
                             "   la $a0, %s\n"
                             "   jal convert_entier\n"
                             "   blt $v0, $a1, %s\n",
                             temp1, temp2,temp3);
            free(temp1);
            free(temp2);
            free(temp3);
            break;
        case Q_IFLE:
            temp1 = handle_quadop(f, q.op1);
            temp2 = handle_quadop(f, q.op2);
            temp3 = handle_quadop(f, q.res);
            ecrit  = fprintf(f->sortie,
                             "   la $a0, %s\n"
                             "   jal convert_entier\n"
                             "   move $a1, $v0\n"
                             "   la $a0, %s\n"
                             "   jal convert_entier\n"
                             "   ble $v0, $a1, %s\n",
                             temp1, temp2,temp3);
            free(temp1);
            free(temp2);
            free(temp3);
            break;
        case Q_INV_SIGNE:
            temp1 = handle_quadop(f, q.op1);
            temp3 = handle_quadop(f, q.res);
            ecrit = fprintf(f->sortie,
                            "\n"
                            "   # %s <- (-1)*%s\n"
                            "   la $a0, %s\n"
                            "   jal convert_entier\n"
                            "   move $s0, $v0\n"
                            "   mul $s0, $s0, -1\n"
                            "   move $a0, $s0\n"
                            "   la $a1, %s\n"
                            "   jal convert_string\n"
                            "   #---\n",
                            temp3, temp1, temp1, temp3);
            free(temp1);
            free(temp3);
            break;
        case Q_ADD:
            temp1 = handle_quadop(f, q.op1);
            temp2 = handle_quadop(f, q.op2);
            temp3 = handle_quadop(f, q.res);
            ecrit = fprintf(f->sortie,
                            "\n"
                            "   # %s <- %s+%s\n"
                            "   la $a0, %s\n"
                            "   jal convert_entier\n"
                            "   move $s0, $v0\n"
                            "   la $a0, %s\n"
                            "   jal convert_entier\n"
                            "   move $s1, $v0\n"
                            "   add $a0, $s0, $s1\n"
                            "   la $a1, %s\n"
                            "   jal convert_string\n"
                            "   #---\n",
                            temp3, temp1, temp2, temp1, temp2, temp3);
            free(temp1);
            free(temp2);
            free(temp3);
            break;
        case Q_SUB:
            temp1 = handle_quadop(f, q.op1);
            temp2 = handle_quadop(f, q.op2);
            temp3 = handle_quadop(f, q.res);
            ecrit = fprintf(f->sortie,
                            "\n"
                            "   # %s <- %s-%s\n"
                            "   la $a0, %s\n"
                            "   jal convert_entier\n"
                            "   move $s0, $v0\n"
                            "   la $a0, %s\n"
                            "   jal convert_entier\n"
                            "   move $s1, $v0\n"
                            "   sub $a0, $s0, $s1\n"
                            "   la $a1, %s\n"
                            "   jal convert_string\n"
                            "   #---\n",
                            temp3, temp1, temp2, temp1, temp2, temp3);
            free(temp1);
            free(temp2);
            free(temp3);
            break;
        case Q_MUL:
            temp1 = handle_quadop(f, q.op1);
            temp2 = handle_quadop(f, q.op2);
            temp3 = handle_quadop(f, q.res);
            ecrit = fprintf(f->sortie,
                            "\n"
                            "   # %s <- %s*%s\n"
                            "   la $a0, %s\n"
                            "   jal convert_entier\n"
                            "   move $s0, $v0\n"
                            "   la $a0, %s\n"
                            "   jal convert_entier\n"
                            "   move $s1, $v0\n"
                            "   mul $a0, $s0, $s1\n"
                            "   la $a1, %s\n"
                            "   jal convert_string\n"
                            "   #---\n",
                            temp3, temp1, temp2, temp1, temp2, temp3);
            free(temp1);
            free(temp2);
            free(temp3);
            break;
        case Q_DIV:
            temp1 = handle_quadop(f, q.op1);
            temp2 = handle_quadop(f, q.op2);
            temp3 = handle_quadop(f, q.res);
            ecrit = fprintf(f->sortie,
                            "\n"
                            "   # %s <- %s/%s\n"
                            "   la $a0, %s\n"
                            "   jal convert_entier\n"
                            "   move $s0, $v0\n"
                            "   la $a0, %s\n"
                            "   jal convert_entier\n"
                            "   move $s1, $v0\n"
                            "   div $s0, $s1\n"
                            "   mflo $a0 # quotient\n"
                            "   la $a1, %s\n"
                            "   jal convert_string\n"
                            "   #---\n",
                            temp3, temp1, temp2, temp1, temp2, temp3);
            free(temp1);
            free(temp2);
            free(temp3);
            break;
        case Q_MOD:
            temp1 = handle_quadop(f, q.op1);
            temp2 = handle_quadop(f, q.op2);
            temp3 = handle_quadop(f, q.res);
            ecrit = fprintf(f->sortie,
                            "\n"
                            "   # %s <- %s%%%s\n"
                            "   la $a0, %s\n"
                            "   jal convert_entier\n"
                            "   move $s0, $v0\n"
                            "   la $a0, %s\n"
                            "   jal convert_entier\n"
                            "   move $s1, $v0\n"
                            "   div $s0, $s1\n"
                            "   mfhi $a0 # reste\n"
                            "   la $a1, %s\n"
                            "   jal convert_string\n"
                            "   #---\n",
                            temp3, temp1, temp2, temp1, temp2, temp3);
            free(temp1);
            free(temp2);
            free(temp3);
            break;
        default:
            ecrit = fprintf(f->sortie, "   UNKNOWN\n");
            fprintf(stderr, "quad n°%i non reconnu\n", i);
            exit(1);
            break;
    }
    f->table_addr[i] = ftell(f->sortie) - f->pos_data - ecrit;
    return 0;
}


int trad_mips(FILE * sortie,struct quad* quad_table, int nextquad /*+ table des symboles*/){

    struct file_asm f;
    f.sortie = sortie;
    f.numstr = 0;
    f.numlab = 0;

    fprintf(sortie, ".data\n");
    fprintf(sortie, "   .empty_string: .asciiz \"\"\n");
    fprintf(sortie, "   .single_space: .asciiz \" \"\n");
    fprintf(sortie, "   .align 2\n");
    fprintf(sortie, "   %s: .word\n", SYMB_LAST_FUNC_RETURN);

    f.pos_data = ftell(sortie);

    fprintf(sortie, "\n.text\n");
    fprintf(sortie, ".globl main\n\nmain:\n");
    fprintf(sortie, "# initialisations des variables (premier byte à zéro)\n");
    fprintf(sortie, "   li $t1, 0\n");
    f.pos_main = ftell(sortie);
    fprintf(sortie,"# fin des initialisations ----\n\n");

    f.table_label = malloc(nextquad*sizeof(int));
    for (int i = 0; i < nextquad; i++)
    {
        f.table_label[i] = -1;
    }

    f.table_addr = malloc(nextquad*sizeof(int));
    for (int i = 0; i < nextquad; i++)
    {
        f.table_addr[i] = 0;
    }

    for(int i = 0; i < nextquad; i++) {
        struct quad q = quad_table[i];
        handle_quad(&f, q, i);
    }

    char *chaine = malloc(MAX_OP_SIZE * sizeof(char));
    int position = f.pos_data;
    for (int i = 0; i < nextquad; i++)
    {
        if (f.table_label[i] != -1)
        {
            position += f.table_addr[i];
            position += shift_write(&f, position, "_l%d:\n", f.table_label[i]);
            position = position - f.table_addr[i];
        }
    }
    free(chaine);
    

    return 0;
}
