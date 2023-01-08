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
    for (int i = 0; i < f->nbquad; i++)
    {
        if (f->table_addr[i] > position)
        {
            f->table_addr[i] += r;
        }
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
                    case Q_IFNULL_STR:
            temp1 = handle_quadop(f, q.op1);
            temp2 = handle_quadop(f, q.res);
            ecrit  = fprintf(f->sortie, 
                             "   la $a0, %s\n"
                             "   la $a1, .empty_string\n"
                             "   jal compare\n"
                             "   beq $v0, 0, %s\n", 
                             temp1, temp2);
            free(temp1);
            free(temp2);
            break;
        case Q_IFNOTNULL_STR:
            temp1 = handle_quadop(f, q.op1);
            temp2 = handle_quadop(f, q.res);
            ecrit  = fprintf(f->sortie, 
                             "   la $a0, %s\n"
                             "   la $a1, .empty_string\n"
                             "   jal compare\n"
                             "   bne $v0, 0, %s\n", 
                             temp1, temp2);
            free(temp1);
            free(temp2);
            break;

        case Q_GOTO:
            if(q.res.kind != QO_CST_STRING ) {
                temp1 = handle_quadop(f,q.res);
                ecrit = fprintf(f->sortie, "   b %s\n", temp1);
                free(temp1);
            } else {
                ecrit = fprintf(f->sortie, "   b %s\n", q.res.cst_str);
            }
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
        case Q_READ:
            temp3 = handle_quadop(f, q.res);
            ecrit = fprintf(f->sortie,
                            "   # read -> %s\n"
                            "   li $v0, 8\n"
                            "   la $a0, .buffer_read # @ buf\n"
                            "   li $a1, %i # buf size\n"
                            "   syscall # read_str\n"
                            "   la $a0, .buffer_read\n"
                            "   jal strlen\n"
                            "   subi $t0, $v0, 1\n"
                            "   la $t2, .buffer_read\n"
                            "   add $t0, $t0, $t2\n"
                            "   li $t1, 0\n"
                            "   sb $t1, ($t0) #suppresion \\n\n"
                            "   la $a0, .buffer_read\n"
                            "   jal copy_string\n"
                            // "   move $s0, $v0 #stockage de la copie dans $s0\n"
                            "   la $a0, %s # res\n "
                            "   move $a1, $v0 # val\n"
                            "   la $a2, .empty_string\n"
                            "   jal concat\n"
                            "",
                            temp3,
                            DEFAULT_VAR_SIZE,
                            temp3);
            free(temp3);
            break;
        case Q_READ_TAB:
            temp1 = handle_quadop(f, q.op1); // idx
            temp3 = handle_quadop(f, q.res); // ident tab
            ecrit = fprintf(f->sortie,
                            "   # read -> %s[%s]\n"
                            "   li $v0, 8\n"
                            "   la $a0, .buffer_read # @ buf\n"
                            "   la $a1, %i # buf size\n"
                            "   syscall # read_str\n"
                            "   la $a0, .buffer_read\n"
                            "   jal strlen\n"
                            "   subi $t0, $v0, 1\n"
                            "   la $t2, .buffer_read\n"
                            "   add $t0, $t0, $t2\n"
                            "   li $t1, 0\n"
                            "   sb $t1, ($t0) #suppresion \\n\n"
                            "   la $a0, .buffer_read\n"
                            "   jal copy_string\n"
                            "   move $s3, $v0 #stockage de la copie dans $s3\n"

                            "   # tab_set\n"
                            "   la $a0, %s\n"
                            "   jal convert_entier # conversion index\n"
                            "   move $s0, $v0 # stockage de l'index dans $s0\n"
                            "   la $a0, .empty_string\n"
                            "   move $a1, $s0 # en cas d'erreur\n"
                            "   blt $s0, 0, erreur_out_of_range\n"
                            "   bge $s0, %i, erreur_out_of_range\n"

                            "   mul $s0, $s0, 4 # pour l'addresse dans le tableau\n"
                            "   la $t0, %s # addresse du tableau \n"
                            "   add $t0, $t0, $s0 # addresse de la case \n"
                            "   sw $s3, ($t0) # on stocke la copie\n"
                            "   # ----\n"
                            "",
                            temp3, temp1, 
                            DEFAULT_VAR_SIZE,
                            temp1,
                            q.data.taille,
                            temp3);
            free(temp3);
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
        case Q_SET_TAB:
            temp1 = handle_quadop(f,q.op1); // index tab
            temp2 = handle_quadop(f,q.op2); // valeur 
            temp3 = handle_quadop(f,q.res); // ident tab
            ecrit  = fprintf(f->sortie, 
                             "   # %s[%s] <- %s\n"
                             "   la $a0, %s\n"
                             "   jal convert_entier # conversion index\n"
                             "   move $s0, $v0 # stockage\n"
                             "   la $a0, .empty_string\n"
                             "   move $a1, $s0 # en cas d'erreur\n"
                             "   blt $s0, 0, erreur_out_of_range\n"
                             "   bge $s0, %i, erreur_out_of_range\n"
                             "   mul $s0, $s0, 4 # pour l'addresse dans le tableau\n"
                             "   la $a0, %s # copy_string\n"
                             "   jal copy_string\n"
                             "   move $s2, $v0 # on stocke $s2 dans le tableau\n" 
                             "   la $t0, %s\n"
                             "   add $t0, $t0, $s0\n"
                             "   sw $s2, ($t0)\n"
                             "   # ----\n",
                             temp3,temp1,temp2,
                             temp1,
                             q.data.taille,
                             temp2,
                             temp3);
            free(temp1);
            free(temp2);
            free(temp3);
            break;
        case Q_GET_TAB:
            temp1 = handle_quadop(f,q.op1); // ident tab
            temp2 = handle_quadop(f,q.op2); // idx tab
            temp3 = handle_quadop(f,q.res); // ident à modifier
            ecrit  = fprintf(f->sortie, 
                             "   # %s <- %s[%s]\n"
                             "   la $a0, %s\n"
                             "   jal convert_entier # conversion index\n"
                             "   move $s0, $v0 # stockage\n"
                             "   la $a0, .empty_string\n"
                             "   move $a1, $s0 # en cas d'erreur\n"
                             "   blt $s0, 0, erreur_out_of_range\n"
                             "   bge $s0, %i, erreur_out_of_range\n"
                             "   mul $s0, $s0, 4 # pour l'addresse dans le tableau\n"
                             "   la $t0, %s\n"
                             "   add $t0, $t0, $s0\n"
                            //  "   la $a0, %s\n"
                            //  "   move $a1, $t0\n"
                            //  "   la $a2, .empty_string\n"
                            //  "   jal concat\n"
                             "   # la $t1, %s\n"
                             "   lw $a1, ($t0)\n"
                             "   la $a0, %s\n"
                             "   la $a2, .empty_string\n"
                             "   jal concat\n"
                             "   # ----\n",
                             temp3,temp1,temp2,
                             temp2,
                             q.data.taille,
                             temp1,
                             temp1,
                             temp3);
            free(temp1);
            free(temp2);
            free(temp3);
            break;
        case Q_ARG_GLOB:
            temp1 = handle_quadop(f, q.op1);
            temp3 = handle_quadop(f, q.res);
            int num = q.op1.cst;
            ecrit = fprintf(f->sortie,
                            "   # %s <- .argv[%i]\n"
                            "   li $s0, %i # chargement de l'idx\n"
                            "   la $a0, .empty_string\n"
                            "   move $a1, $s0 # en cas d'erreur\n"
                            "   blt $s0, 0, erreur_out_of_range\n"
                            "   lw $t0, .argc\n"
                            "   bge $s0, $t0, erreur_out_of_range\n"
                            "   mul $s0, $s0, 4 # pour l'addresse dans le tableau\n"
                            "   la $t0, .argv\n"
                            "   add $t0, $t0, $s0\n"
                            "   lw $a1, ($t0)\n"
                            "   la $a0, %s\n"
                            "   la $a2, .empty_string\n"
                            "   jal concat\n"
                            "   # ----\n"
                            "",
                            temp3,num,
                            num,
                            temp3
                            );
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
        case Q_DECLARE_TAB:
            f->pos_data += shift_write(f, f->pos_data, 
                                       "   .align 2\n"
                                       "   %s: .space %i # %i*4\n",
                                       q.op1.ident,4*q.op2.cst, q.op2.cst);

            f->pos_main += shift_write(f, f->pos_main,
                                       "# initialisation du tableau %s\n"
                                       "   la $t0, %s\n"
                                       "",
                                       q.op1.ident,
                                       q.op1.ident);
            for(int i=0; i < q.op2.cst; i++) {
                f->pos_main += shift_write(f, f->pos_main,
                                       "   sw $t2 ($t0)\n"
                                       "   addi $t0, $t0, 4\n"
                                       );
            }
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
                             "   beq $a1, $v0, %s\n",
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
                             "   bne $a1, $v0, %s\n",
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
                             "   bgt $a1, $v0, %s\n",
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
                             "   bge $a1, $v0, %s\n",
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
                             "   blt $a1, $v0, %s\n",
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
                             "   ble $a1, $v0, %s\n",
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
    if(ecrit != 0)
        shift_write(f, ftell(f->sortie) - ecrit, "# quad %i\n", i);
    f->table_addr[i] = ftell(f->sortie) - ecrit;
    return 0;
}


int trad_mips(FILE * sortie,struct quad* quad_table, int nextquad /*+ table des symboles*/){

    struct file_asm f;
    f.sortie = sortie;
    f.numstr = 0;
    f.numlab = 0;
    f.nbquad = nextquad;

    fprintf(sortie, ".data\n");
    fprintf(sortie, "   .empty_string: .asciiz \"\"\n");
    fprintf(sortie, "   .single_space: .asciiz \" \"\n");
    fprintf(sortie, "   .line_feed: .asciiz \"\\n\"\n");
    fprintf(sortie, "   .buffer_read: .space %i\n", DEFAULT_VAR_SIZE);
    fprintf(sortie, "   .align 2\n");
    fprintf(sortie, "   %s: .word 0\n", SYMB_LAST_FUNC_RETURN);
    fprintf(sortie, "   %s: .word 0\n", SYMB_ARGC);
    fprintf(sortie, "   %s: .space 1024 # 4*256 args maximum\n", SYMB_ARGV);
    fprintf(sortie, "   .arg_concat: .space 1024 # concat de tout les args\n");

    f.pos_data = ftell(sortie);

    fprintf(sortie, "\n.text\n");
    fprintf(sortie, ".globl main\n\nmain:\n");
    fprintf(sortie, 
            "# chargement argc et argv\n"
            ""
            "   move $s0, $a0\n"
            "   la $t0, .argc\n"
            "   sw $s0, ($t0) #.argc contient mtn le nmbre d'arg\n"
            "   move $s1, $a1 #$s1 contient l'adresse des arguments\n"
            "   la $t2, .argv #adresse dans .argv\n"
            "   li $t3, 0 # compteur de boucle\n"
            "   la $t4, .argc\n"
            "   lw $t4, ($t4) # arret de boucle\n"

            "   sub $sp, $sp, 20\n"
            "   sw $t0, 0($sp)\n"
            "   sw $t1, 4($sp)\n"
            "   sw $t2, 8($sp)\n"
            "   sw $t3, 12($sp)\n"
            "   sw $t4, 16($sp)\n"
            "   la $a0, .arg_concat\n"
            "   la $a1, .empty_string\n"
            "   la $a2, .empty_string\n"
            "   jal concat\n"
            "   lw $t0, 0($sp)\n"
            "   lw $t1, 4($sp)\n"
            "   lw $t2, 8($sp)\n"
            "   lw $t3, 12($sp)\n"
            "   lw $t4, 16($sp)\n"
            "   addi $sp, $sp, 20\n"

            "loop_print_arg:\n"
            "   beq $t3, $t4, loop_print_arg_end\n"
            "   lw $t0, ($s1) # chargement d'un argument\n"
            "   sw $t0, ($t2) # stockage dans .argv\n"
            "   addi $s1, $s1, 4 # avancer dans les arguments\n"
            ""
            "   sub $sp, $sp, 20\n"
            "   sw $t0, 0($sp)\n"
            "   sw $t1, 4($sp)\n"
            "   sw $t2, 8($sp)\n"
            "   sw $t3, 12($sp)\n"
            "   sw $t4, 16($sp)\n"
            "   la $a0, .arg_concat\n"
            "   la $a1, .arg_concat\n"
            "   lw $a2, -4($s1)\n"
            "   jal concat\n"
            "   la $a0, .arg_concat\n"
            "   la $a1, .arg_concat\n"
            "   la $a2, .single_space\n"
            "   jal concat\n"
            // "   lw $a0, -4($s1)\n"
            // "   li $v0, 4\n"
            // "   syscall\n"
            "   lw $t0, 0($sp)\n"
            "   lw $t1, 4($sp)\n"
            "   lw $t2, 8($sp)\n"
            "   lw $t3, 12($sp)\n"
            "   lw $t4, 16($sp)\n"
            "   addi $sp, $sp, 20\n"
            
            "   addi $t2, $t2, 4 # avancer dans .argv\n"
            // "   la $a0, .line_feed\n"
            // "   li $v0, 4\n"
            // "   syscall\n"
            "   addi $t3, $t3, 1 # compteur de boucle\n"
            "   b loop_print_arg\n"
            "loop_print_arg_end:\n"

            "   la $a0, .arg_concat\n"
            "   jal strlen\n"
            "   la $t0, .arg_concat\n"
            "   add $t0, $t0, $v0\n"
            "   sub $t0, $t0, 1\n"
            "   li $t1, 0\n"
            "   sb $t1, ($t0)\n"
            // "   lw $a0, .argc\n"
            // "   li $v0, 1\n"
            // "   syscall\n"
            // "   la $t0, .argv\n"
            // "   lw $a0, ($t0)\n"
            // "   li $v0, 4\n"
            // "   syscall\n"
            // "   la $a0, .line_feed\n"
            // "   li $v0, 4\n"
            // "   syscall\n"
            // "   la $a0, .line_feed\n"
            // "   li $v0, 4\n"
            // "   syscall\n"
            // "   la $a0, .arg_concat\n"
            // "   li $v0, 4\n"
            // "   syscall\n"
            "");
    fprintf(sortie, "# initialisations des variables (premier byte à zéro)\n");
    fprintf(sortie, "   li $t1, 0\n");
    fprintf(sortie, "   la $t2, .empty_string\n");
    f.pos_main = ftell(sortie);
    f.pos_initiale_main = f.pos_main;
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
    for (int i = 0; i < nextquad; i++)
    {
        if (f.table_label[i] != -1)
        {
            shift_write(&f, f.table_addr[i], "_l%d:\n", f.table_label[i]);
        }
    }
    free(chaine);
    free(f.table_addr);
    free(f.table_label);
    

    return 0;
}
