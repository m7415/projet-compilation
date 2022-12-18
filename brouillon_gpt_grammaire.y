%{
#include <stdio.h>
#include <stdlib.h>

int yyerror(const char *s) {
  fprintf(stderr, "%s\n", s);
  return 0;
}

int yywrap() {
  return 1;
}
%}

%union {
    char * strval;
    int intval;
}

%token KW_IF, KW_THEN, KW_FOR, KW_DO, KW_DONE, KW_IN, KW_WHILE, KW_UNTIL, KW_CASE, KW_ESAC, KW_READ, KW_RETURN, KW_EXIT, KW_LOCAL, KW_ELIF, KW_ELSE, KW_FI, KW_DECLARE, KW_TEST, KW_EXPR
%token<strval> STRING_DOUBLE_QUOTE, STRING_SINGLE_QUOTE
%token<intval> NUMBER
%token IDENTIFIER
%token IS_EQ, IS_DIFF
%token OP_NOT_NULL, OP_NULL, OP_EQ, OP_NEQ, OP_GT, OP_LT, OP_LE
%token LOGIC_NOT, LOGIC_AND, LOGIC_OR


%left '+' '-'
%left '*' '/' '%'

%start programme

%%

programme: liste_instructions
       ;

liste_instructions: liste_instructions ';' instruction
                 | instruction
                 ;

instruction: IDENTIFIER '=' concaténation
           | IDENTIFIER '[' opérande_entier ']' '=' concaténation
           | 'declare' IDENTIFIER '[' 'entier' ']'
           | 'if' test_bloc 'then' liste_instructions else_part
           | 'for' IDENTIFIER 'do' liste_instructions 'done'
           | 'for' IDENTIFIER 'in' liste_opérandes 'do' liste_instructions 'done'
           | 'while' test_bloc 'do' liste_instructions 'done'
           | 'until' test_bloc 'do' liste_instructions 'done'
           | 'case' opérande 'in' liste_cas 'esac'
           | 'echo' liste_opérandes
           | 'read' IDENTIFIER
           | 'read' IDENTIFIER '[' opérande_entier ']'
           | déclaration_de_fonction
           | appel_de_fonction
           | 'return'
           | 'return' opérande_entier
           | 'exit'
           | 'exit' opérande_entier
           ;

else_part: 'elif' test_bloc 'then' liste_instructions else_part
         | 'else' liste_instructions
         | 
         ;

liste_cas: liste_cas 'ltre' ')' liste_instructions ';;'
         | 'ltre' ')' liste_instructions ';;'
         ;

ltre: mot
    | STRING
    | '\'' STRING '\''
    | ltre '|' mot
    | ltre '|' STRING
    | ltre '|' '\'' STRING '\''
    | '*'
    ;

liste_opérandes: liste_opérandes opérande
               | opérande
               | '$''{' IDENTIFIER [*] '}'
               ;

concaténation: concaténation opérande
             | opérande
             ;

test_bloc: 'test' test_expr
         ;

test_expr: test_expr '-o' test_expr2
         | test_expr2
         ;

test_expr2: test_expr2 '-a' test_expr3
          | test_expr3
          ;

test_expr3: '(' test_expr ')'
          | '!' '(' test_expr ')'
          | test_instruction
          | '!' test_instruction
          ;

test_instruction: