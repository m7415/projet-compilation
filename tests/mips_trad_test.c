#include "mips_trad_test.h"

#include "compil.yy.h"
#include "compil.tab.h"

#define NB_TESTS 16
#define NB_TESTS_TESTES 14

extern int nextquad;

extern struct quad global_code[1<<16];

extern struct ctx_stack * liste_symbole;

int mips_test(){
    char *filenames[NB_TESTS] = {
        "test0",
        "test1",
        "test2",
        "test3",
        "test4",
        "test_arithm_cond",
        "test_calculs",
        "test_cond",
        "test_elif",
        "test_empty",
        "test_func",
        "test_until",
        "test_while",
        "test_str_cond",
        "test_for",
        "test_tab"
    };

    int i = 0;

    char namefile[MAX_BUFFER_SIZE];
    char namefile_out[MAX_BUFFER_SIZE];
    char namefile_out_quads[MAX_BUFFER_SIZE];
    for (int i = 0; i < NB_TESTS_TESTES; i++)
    {
        snprintf(namefile,MAX_BUFFER_SIZE,"./tests/in/%s.sh",filenames[i]);
        snprintf(namefile_out,MAX_BUFFER_SIZE,"./tests/out/%s_out.asm",filenames[i]);
        snprintf(namefile_out_quads,MAX_BUFFER_SIZE,"./tests/out/%s_out.q",filenames[i]);

        FILE * sortie = fopen(namefile_out,"w+");
        FILE * sortie_quads = fopen(namefile_out_quads,"w+");
        yyin = fopen(namefile, "r");


        if (sortie == NULL) {
            fprintf(stderr, "Error: unable to open output file %s\n",filenames[i]);
            return 1;
        }

        if (yyin == NULL) {
            fprintf(stderr, "Error: unable to open input file %s\n",filenames[i]);
            return 1;
        }

        int t = yyparse();
        
        if(t != 0){
            printf("FUCK !\n");
            return 1;
        }

        for(int i=0; i<nextquad; i++) {
            fprintf(sortie_quads, "%-3i: ", i);
            print_quad(global_code[i], sortie_quads);
        }

        fclose(sortie_quads);
        
        // Traduction en MIPS
        if (trad_mips(sortie,global_code,nextquad) == 0) {
            printf("La traduction de %s à réussie !\n",filenames[i]);
            } else {
            printf("La traduction de %s à échoué.\n",filenames[i]);
        }

        nextquad = 0;
        // free_ctx_stack(liste_symbole,1);
        yyrestart(yyin);
    }

    fclose(yyin);
    // free_ctx_stack(liste_symbole,1);
    return 0;
}