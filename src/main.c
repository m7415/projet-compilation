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

    FILE * output = stdout;

    static struct option long_options[] = {
        {"version", no_argument, 0, 'v'},
        {"tos", no_argument, 0, 't'},
        {0, 0, 0, 0}
    };

    // Traitement des options en utilisant getopt
    while((option = getopt_long(argc, argv, "hvo:t",long_options,NULL)) != -1) {
        switch(option) {
        case 'h':
            printf("Usage : %s [-h] [-o fichier_sortie] fichier_entree\n", argv[0]);
            return 0;
        case 'v':
            printf("Simon PERNAS\n"
                   "Anthony RIGOLI\n"
                   "Baptiste SALIOU\n"
                   "Maxime PETITPOISSON\n");
            return 0;
        case 'o':
            output = fopen(optarg, "w+");
            break;
        case 't':
            /* printf("liste des symboles :\n");
            print_ctx_stack(liste_symbole); */
            break;
        default:
            fprintf(stderr, "Option inconnue ou argument manquant : '%c'\n", optopt);
            return 1;
        }
    }

    // Les arguments restants (s'il y en a) sont traités ici
    char *filename = malloc(MAX_BUFF_SIZE*sizeof(char));
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
    
    yylex_destroy(); // juste pour valgrind <3

    if(t != 0) {
        return 1;
    }

    trad_mips(output, global_code, nextquad);

    free_ctx_stack(liste_symbole, 1);
    fclose(output);

    return 0;
}