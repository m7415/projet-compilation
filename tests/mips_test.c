#include "mips_test.h"

#include "compil.yy.h"
#include "compil.tab.h"

#define NB_TESTS 0

extern int yyparse(void);
extern FILE *yyin;

extern int nextquad;

extern struct quad global_code[1<<16];

int mips_test(){
    printf("YES, I AM !\n");
    char * mips_code = malloc(MAX_PROG_SIZE * sizeof(char));
    char * namefile = "./tests/test2.txt";

    yyin = fopen(namefile, "r");
    if (yyin == NULL) {
        fprintf(stderr, "Error: unable to open input file test2\n");
        return 1;
    }

    int t = yyparse();

    for (int i = 0; i < nextquad; i++) {
        char* mips = quad_to_mips(global_code[i]);
        printf("ZA WARUDO !\n");
        print_quad(global_code[i]);
        strcat(mips_code,mips);
    }
    strcat(mips_code,"...\0");

    // Affichage du code MIPS
    printf("%s\n", mips_code);

    fclose(yyin);
    free(mips_code);

    return 0;
}