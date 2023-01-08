#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "syntax_test.h"
#include "quads.h"
#include "compil.yy.h"
#include "compil.tab.h"
#include "table_symb.h"


#define NB_TESTS 22
#define MAX_BUFFER_SIZE 1024

extern int nextquad;
extern struct ctx_stack * liste_symbole;

int syntax_test() {
  char *filenames[NB_TESTS] = {
    "./tests/in/test_arithm_cond.sh",
    "./tests/in/test_calculs.sh",
    "./tests/in/test_cond.sh",
    "./tests/in/test_elif.sh",
    "./tests/in/test_empty.sh",
    "./tests/in/test_for.sh",
    "./tests/in/test_func.sh",
    "./tests/in/test_str_cond.sh",
    "./tests/in/test_tab.sh",
    "./tests/in/test_until.sh",
    "./tests/in/test_while.sh",
    "./tests/in/test0.sh",
    "./tests/in/test1.sh",
    "./tests/in/test2.sh",
    "./tests/in/test3.sh",
    "./tests/in/test4.sh",
    "./tests/in/test_arg_glob.sh",
    "./tests/in/test_case.sh",
    "./tests/in/test_exple_sujet_2.sh",
    "./tests/in/test_read.sh",
    "./tests/in/test_tab_2.sh",
    "./tests/in/test_tab_3.sh"
  };

  int passed = 0;

  for (size_t i = 0; i < NB_TESTS; i++)
  {

    yyin = fopen(filenames[i], "r");
    if (yyin == NULL) {
      fprintf(stderr, "Error: unable to open input file %s\n",filenames[i]);
      return 1;
    }

    int result = yyparse();

    nextquad=0;
    yyrestart(yyin);

    if (result == 0) {
      printf("L'analyse de %s à réussie !\n",filenames[i]);
    } else {
      printf("L'analyse de %s à échoué.\n",filenames[i]);
      passed = 1;
    }

  }
  fclose(yyin);
  free_ctx_stack(liste_symbole,0);

  return passed;
}