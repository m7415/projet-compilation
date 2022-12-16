#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

// Inclure les en-têtes générés par Bison pour utiliser les fonctions de l'analyseur syntaxique
#include "parser.h"

int syntax_test() {
  // Initialiser l'analyseur syntaxique en utilisant la fonction générée par Bison
  yyparse_init();

  // Définir un tableau de chaînes de test à analyser
  char* test_cases[] = {
    "id = 1 + 2",
    "id[2] = 1 + 2",
    "declare id[10]",
    "if test 1 == 2 then id = 1 else id = 2",
    "for id do id = 1 done",
    "for id in 1 2 3 do id = 1 done",
    "while test 1 == 2 do id = 1 done",
    "until test 1 == 2 do id = 1 done",
    "case 1 in 2 3 4) id = 1;; 5 6 7) id = 2;; esac",
    "echo 1 2 3",
    "read id",
    "read id[2]",
    "function func() { id = 1 }",
    "func()",
    "return",
    "return 1",
    "exit",
    "exit 1",
  };

  // Définir un tableau de résultats attendus pour chaque chaîne de test
  int expected_results[] = {
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
  };

  // Pour chaque chaîne de test, utiliser l'analyseur syntaxique pour analyser la chaîne et vérifier que le résultat renvoyé est celui attendu en utilisant la macro `assert`:
  for (int i = 0; i < sizeof(test_cases) / sizeof(char*); i++) {
    // Définir un pointeur vers la chaîne courante
    char* str = test_cases[i];

    // Utiliser l'analyseur syntaxique pour analyser la chaîne
    int result = yyparse();

    // Vérifier que le résultat renvoyé par l'analyseur syntaxique est celui attendu
    assert(result == expected_results[i]);
  }

  // Nettoyer l'analyseur syntaxique
  yyparse_destroy();

  return 0;
}