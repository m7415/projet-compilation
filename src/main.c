#include "quads.h"
#include "table_symb.h"
#include "compil.yy.h"
#include "compil.tab.h"
#include "mips.h"
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <getopt.h>

#define MAX_BUFF_SIZE 1024

extern int nextquad;

extern struct quad global_code[1<<16];

extern struct ctx_stack * liste_symbole;



int main(int argc, char* argv[]){

    int option;

    int print_tos = 1;
    int print_q = 1;

    FILE * output = stdout;
    FILE * output_quad = stdout;

    static struct option long_options[] = {
        {"version", no_argument, 0, 'v'},
        {"tos", no_argument, 0, 't'},
        {0, 0, 0, 0}
    };

    // Traitement des options en utilisant getopt
    while((option = getopt_long(argc, argv, "hvo:tq::",long_options,NULL)) != -1) {
        switch(option) {
        case 'h':
            printf("Usage : %s [-h] [-v --version] [-o fichier_sortie] [-t --tos] [-q] fichier_entree\n", argv[0]);
            break;
        case 'v':
            printf("Simon PERNAS\n"
                   "Anthony RIGOLI\n"
                   "Baptiste SALIOU\n"
                   "Maxime PETITPOISSON\n");
            break;
        case 'o':
            output = fopen(optarg, "w+");
            break;
        case 't':
            print_tos = 0;
            break;
        case 'q':
            if (optarg) {
                output_quad = fopen(optarg, "w+");
            }
            print_q = 0;
            break;
        default:
            fprintf(stderr, "Option inconnue ou argument manquant : '%c'\n", optopt);
            return 1;
        }
    }

    // Les arguments restants (s'il y en a) sont traités ici
    char *filename;
    if(optind < argc) {
        filename = argv[optind];
    } else {
        fprintf(stderr, "Aucun fichier d'entrée n'a été spécifié.\n");
        return 1;
    }

    yyin = fopen(filename, "r");

    if (yyin == NULL) {
        fprintf(stderr, "Error: unable to open input file %s\n",filename);
        return 1;
    }

    nextquad = 0;
    int t = yyparse();
    
    fclose(yyin);
    yylex_destroy(); // juste pour valgrind <3

    if(t != 0) {
        return 1;
    }

    if (print_tos == 0)
    {
        printf("Table des symboles :\n");
        print_ctx_stack(liste_symbole);
    }

    if (print_q == 0)
    {
        printf("nbre total de quads : %i\n",nextquad);
        for(int i=0; i<nextquad; i++) {
            fprintf(output_quad, "%-3i: ", i);
            print_quad(global_code[i], output_quad);
        }
    }
    

    trad_mips(output, global_code, nextquad);

    free_ctx_stack(liste_symbole, 1);
    fclose(output);

    return 0;
}