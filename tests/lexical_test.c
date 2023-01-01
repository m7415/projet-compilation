#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>

#include "lexical_test.h"

// Inclure les en-têtes générés par Flex pour utiliser les fonctions de l'analyseur lexical
#include "quads.h"
#include "compil.tab.h"
#include "compil.yy.h"


// extern YY_BUFFER_STATE;
// extern YY_BUFFER_STATE yy_scan_string(char* str);

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
    "expr",
    "\"une chaine avec \\\"\"",
    "\'une chaine avec \\\'\'",
    "\"chaine avec char spéciaux : \n \t ; * µ\"",
    "un_identifier000",
    "42",
    "0_un_mot",
    "mot,é",
    "erreu$r", // renvois l'identifier "erreu", voir si c'est correct
    "+",
    "-",
    "*",
    "/",
    "%%",
    "${var}",
    "$?",
    "$*",
    "$0", // lexicalement bon, syntaxiquement faux
    "$1",
    "$102",
    "${tab[*]}",
    "${tab[21]}"
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
    STRING_DOUBLE_QUOTE,
    STRING_SINGLE_QUOTE,
    STRING_DOUBLE_QUOTE,
    IDENTIFIER,
    MOT,
    MOT,
    MOT,
    IDENTIFIER,
    PLUS_OU_MOINS,
    PLUS_OU_MOINS,
    FOIS_DIV_MOD,
    FOIS_DIV_MOD,
    FOIS_DIV_MOD,
    ACCES_VARIABLE,
    LAST_FUNC_STATUS,
    ACCES_LISTE_ARG,
    ACCES_ARG,
    ACCES_ARG,
    ACCES_ARG,
    ACCES_LISTE_TABLEAU,
    DOLLAR
  };

  // Pour chaque chaîne de test
  for (long unsigned int i = 0; i < sizeof(test_cases) / sizeof(char*); i++) {
    // Définir un pointeur vers la chaîne courante
    char* str = test_cases[i];

    YY_BUFFER_STATE buffer = yy_scan_string(str);
    // printf("testing \"%s\" ", str);
    // Utiliser l'analyseur lexical pour analyser la chaîne
    int token = yylex();
    // printf("\n");

    // Vérifier que le token renvoyé par l'analyseur est celui attendu
    assert(token == expected_tokens[i]);

    yy_delete_buffer(buffer);
  }

  // Nettoyer l'analyseur lexical
  yylex_destroy();

  return 0;
}