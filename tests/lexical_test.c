#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

// Inclure les en-têtes générés par Flex pour utiliser les fonctions de l'analyseur lexical
#include "lexer.h"

int lexical_test() {
  // Initialiser l'analyseur lexical en utilisant la fonction générée par Flex
  yylex_init();

  // Définir un tableau de chaînes de test à analyser
  char* test_cases[] = {
    "hello",
    "123",
    "+",
    "-",
    "*",
    "/",
    "=",
    "==",
    "!",
    "!=",
    ">",
    ">=",
    "<",
    "<=",
    "(",
    ")",
    "{",
    "}",
    "[",
    "]",
    ";",
    ",",
    ".",
    ":",
    "?",
    "...",
    "hello_world",
    "helloWorld",
    "HelloWorld",
    "hello123",
    "hello_123",
    "123hello",
    "\"hello world\"",
    "\"hello\\nworld\"",
    "\"hello\\\"world\"",
  };

  // Définir un tableau de tokens attendus pour chaque chaîne de test
  int expected_tokens[] = {
    TOKEN_IDENTIFIER,
    TOKEN_INTEGER,
    TOKEN_PLUS,
    TOKEN_MINUS,
    TOKEN_MULTIPLY,
    TOKEN_DIVIDE,
    TOKEN_ASSIGN,
    TOKEN_EQUAL,
    TOKEN_NOT,
    TOKEN_NOT_EQUAL,
    TOKEN_GREATER,
    TOKEN_GREATER_EQUAL,
    TOKEN_LESS,
    TOKEN_LESS_EQUAL,
    TOKEN_LEFT_PAREN,
    TOKEN_RIGHT_PAREN,
    TOKEN_LEFT_BRACE,
    TOKEN_RIGHT_BRACE,
    TOKEN_LEFT_BRACKET,
    TOKEN_RIGHT_BRACKET,
    TOKEN_SEMICOLON,
    TOKEN_COMMA,
    TOKEN_DOT,
    TOKEN_COLON,
    TOKEN_QUESTION,
    TOKEN_ELLIPSIS,
    TOKEN_IDENTIFIER,
    TOKEN_IDENTIFIER,
    TOKEN_IDENTIFIER,
    TOKEN_IDENTIFIER,
    TOKEN_IDENTIFIER,
    TOKEN_INTEGER,
    TOKEN_STRING,
    TOKEN_STRING,
    TOKEN_STRING,
  };


  // Pour chaque chaîne de test
  for (int i = 0; i < sizeof(test_cases) / sizeof(char*); i++) {
    // Définir un pointeur vers la chaîne courante
    char* str = test_cases[i];

    // Utiliser l'analyseur lexical pour analyser la chaîne
    int token = yylex();

    // Vérifier que le token renvoyé par l'analyseur est celui attendu
    assert(token == expected_tokens[i]);
  }

  // Nettoyer l'analyseur lexical
  yylex_destroy();

  return 0;
}