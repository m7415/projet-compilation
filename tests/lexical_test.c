#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>

#include "lexical_test.h"

// Inclure les en-têtes générés par Flex pour utiliser les fonctions de l'analyseur lexical
#include "../compil.tab.h"
#include "../compil.yy.c"

// ============================================

int lexical_test() {

  // Définir un tableau de chaînes de test à analyser
  char* test_cases[] = {
    "if",
    "then",
    "for",
    "do",
    "done",
    "in",
    "while",
    "until",
    "case",
    "esac",
    "echo",
    "read",
    "return",
    "exit",
    "local",
    "elif",
    "else",
    "fi",
    "declare",
    "test",
    "expr"
  };

  // Définir un tableau de tokens attendus pour chaque chaîne de test
  int expected_tokens[] = {
    KW_IF,
    KW_THEN,
    KW_FOR,
    KW_DO,
    KW_DONE,
    KW_IN,
    KW_WHILE,
    KW_UNTIL,
    KW_CASE,
    KW_ESAC,
    KW_ECHO,
    KW_READ,
    KW_RETURN,
    KW_EXIT,
    KW_LOCAL,
    KW_ELIF,
    KW_ELSE,
    KW_FI,
    KW_DECLARE,
    KW_TEST,
    KW_EXPR,
  };

  // Pour chaque chaîne de test
  for (long unsigned int i = 0; i < sizeof(test_cases) / sizeof(char*); i++) {
    // Définir un pointeur vers la chaîne courante
    char* str = test_cases[i];

    YY_BUFFER_STATE buffer = yy_scan_string(str);

    // Utiliser l'analyseur lexical pour analyser la chaîne
    int token = yylex();

    // Vérifier que le token renvoyé par l'analyseur est celui attendu
    assert(token == expected_tokens[i]);

    yy_delete_buffer(buffer);
  }

  // Nettoyer l'analyseur lexical
  yylex_destroy();

  return 0;
}