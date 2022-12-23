#include "mips_test.h"

#include "compil.tab.h"

#define NB_TESTS 0
#define MAX_BUFFER_SIZE 1024

extern int yyparse(void);
extern FILE *yyin;

extern int nextquad;

extern struct quad global_code[1<<16];

int mips_test(){
    char * mips_code = malloc(MAX_BUFFER_SIZE * sizeof(mips_code));
    char * namefile = "./tests/test2.txt";

    yyin = fopen(namefile, "r");
    if (yyin == NULL) {
        fprintf(stderr, "Error: unable to open input file test2\n");
        return 1;
    }

    for (int i = 0; i < nextquad; i++) {
        char* mips = quad_to_mips(global_code[i]);
        sprintf(mips_code,mips);
        sprintf(mips_code,"\n");
    }
    sprintf(mips_code,"\0");

    // Affichage du code MIPS
    printf("%s\n", mips_code);

    fclose(yyin);
    free(mips_code);

    return 0;
}