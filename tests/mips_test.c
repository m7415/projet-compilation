#include "mips_test.h"

#include "compil.yy.h"
#include "compil.tab.h"

#define NB_TESTS 0

extern int nextquad;

extern struct quad global_code[1<<16];

int mips_test(){
    char * mips_code = calloc(MAX_PROG_SIZE, sizeof(char));
    char * namefile = "./tests/test0.txt";

    yyin = fopen(namefile, "r");
    if (yyin == NULL) {
        fprintf(stderr, "Error: unable to open input file test0\n");
        return 1;
    }

    nextquad = 0;
    yyrestart(yyin);
    int t = yyparse();
    if(t != 0){
        printf("FUCK !\n");
        return 1;
    }

    char * mips = malloc(MAX_INST_SIZE * sizeof(char));
    for (int i = 0; i < nextquad; i++) {
        sprintf(mips,"%s\n",quad_to_mips(global_code[i]));
        strcat(mips_code,mips);
    }
    strcat(mips_code,"...\0");

    // Affichage du code MIPS
    printf("%s\n", mips_code);

    fclose(yyin);
    free(mips_code);
    free(mips);

    return 0;
}