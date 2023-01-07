#include "mips_trad_test.h"

#include "compil.yy.h"
#include "compil.tab.h"

#define NB_TESTS 16
#define NB_TESTS_TESTES 16

extern int nextquad;

extern struct quad global_code[1<<16];

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
        "test_tab",
        "test_for",
        "test_str_cond"
    };

    int i = 0;

    for (int i = 0; i < NB_TESTS_TESTES; i++)
    {
        char * namefile = malloc(MAX_BUFFER_SIZE * sizeof(char));
        sprintf(namefile,"./tests/in/%s.sh",filenames[i]);
        char * namefile_out = malloc(MAX_BUFFER_SIZE * sizeof(char));
        sprintf(namefile_out,"./tests/out/%s_out.asm",filenames[i]);

        FILE * sortie = fopen(namefile_out,"w+");
        yyin = fopen(namefile, "r");

        if (sortie == NULL) {
            fprintf(stderr, "Error: unable to open output file %s\n",filenames[i]);
            return 1;
        }

        if (yyin == NULL) {
            fprintf(stderr, "Error: unable to open input file %s\n",filenames[i]);
            return 1;
        }

        nextquad = 0;
        yyrestart(yyin);
        int t = yyparse();
        if(t != 0){
            printf("FUCK !\n");
            return 1;
        }
        
        // Traduction en MIPS
        if (trad_mips(sortie,global_code,nextquad) == 0) {
            printf("La traduction de %s à réussie !\n",filenames[i]);
            } else {
            printf("La traduction de %s à échoué.\n",filenames[i]);
        }
    }

    fclose(yyin);
    return 0;
}