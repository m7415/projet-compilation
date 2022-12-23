#include "quads.h"
#include "compil.yy.h"
#include "compil.tab.h"

extern int nextquad;

extern struct quad global_code[1<<16];

int main(){

    // int t = yylex();

    // while(t != 0) {
    //     printf("%i\n", t );
    //     t = yylex();
    // }
    int t = yyparse();
    printf("résultat de la compil : %i\n",t);
    printf("nbre total de quads : %i\n",nextquad);
    for(int i=0; i<nextquad; i++) {
        printf("%03i. ", i);
        print_quad(global_code[i]);
    }
    return 0;
}