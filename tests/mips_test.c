#include "mips_test.h"

#include "compil.yy.h"
#include "compil.tab.h"

#define NB_TESTS 0

extern int nextquad;

extern struct quad global_code[1<<16];

int mips_test(){
    int i = 0;

    char * namefile = malloc(MAX_BUFFER_SIZE * sizeof(char));
    sprintf(namefile,"./tests/test%d.txt",i);
    char * namefile_out = malloc(MAX_BUFFER_SIZE * sizeof(char));
    sprintf(namefile_out,"./tests/test%d_out.asm",i);

    FILE * sortie = fopen(namefile_out,"w+");
    yyin = fopen(namefile, "r");

    if (sortie == NULL) {
        fprintf(stderr, "Error: unable to open output file test%d\n",i);
        return 1;
    }

    if (yyin == NULL) {
        fprintf(stderr, "Error: unable to open input file test%d\n",i);
        return 1;
    }

    nextquad = 0;
    yyrestart(yyin);
    int t = yyparse();
    if(t != 0){
        printf("FUCK !\n");
        return 1;
    }
    
    trad_MIPS(sortie,global_code,nextquad);

    // Affichage du code MIPS
    //printf("%s\n", mips_code);

    fclose(yyin);
    return 0;
}