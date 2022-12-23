%{
#include <stdio.h>
#include <stdlib.h>
#include "quads.h"
#include "compil.tab.h"
#include "ll-list.h"

extern int yylex();
extern void yyerror(const char * msg);
void gencode(struct quad q); // ajouter le quad à notre code
void complete(struct list * l, size_t addr); // compléter les goto inconnus
int new_temp(); // générer une variable temporaire, et renvoyer son pointeur
                // dans la table des symboles
                //TODO !

int nextquad = 0; // compteur global de quads
struct quad global_code[1<<16]; // euh ça fait beaucoup là non ?


void gencode(struct quad q) {
    global_code[nextquad++] = q;
}

void complete(struct list * l, size_t addr) {
    struct list * next = l;
    printf("completing quads n° ");
    while(next != NULL) {
        printf("%lu ", next->addr);
        if(global_code[next->addr].kind != Q_GOTO_UNKNOWN
        && global_code[next->addr].kind != Q_IFEQ
        && global_code[next->addr].kind != Q_IFDIFF) {
            fprintf(stderr, "ERREUR : complete un quad qui n'est pas unknown ?-?\n");
        }
        else {
            global_code[next->addr].res.addr = addr;
            global_code[next->addr].res.kind = QO_ADDR;
            if( global_code[next->addr].kind == Q_GOTO_UNKNOWN ) {
                global_code[next->addr].kind = Q_GOTO;
            }
        }
        next = next->next;
    }
    printf("with %lu\n", addr);
}

int new_temp() {
    printf("call new_temp mais c'est pas encore fait, ça c'est padbol\n");
    return 0;
}

%}

%union {
    char * strval;
    int intval;
    // enum {
    //   not_null,
    //   null,
    //   eq,
    //   not_eq,
    //   greater_than,
    //   greater_equal,
    //   less_than,
    //   less_equal,
    //   not,
    //   and,
    //   or
    // } operande;
    char ident [MAX_IDENT_SIZE];
    char str [MAX_STRING_SIZE];
    struct {
        struct quadop res;
    } expr;

    struct  {
        struct list * true;
        struct list * false;
    } boolexpr;

    
    struct {
        struct list * next;
        int isempty; // uniquement pour les st, vaut 1 is st est %empty
    } instr_type;
}

%token KW_IF KW_THEN KW_FOR KW_DO KW_DONE KW_IN KW_WHILE KW_UNTIL KW_CASE
%token KW_ESAC KW_ECHO KW_READ KW_RETURN KW_EXIT KW_LOCAL KW_ELIF KW_ELSE
%token KW_FI KW_DECLARE KW_TEST KW_EXPR
%token<str> STRING_DOUBLE_QUOTE STRING_SINGLE_QUOTE MOT IDENTIFIER
%token<intval> NUMBER 
%token IS_DIFF
%token OP_NOT_NULL OP_NULL OP_EQ OP_NEQ OP_GT OP_GE OP_LT OP_LE
%token LOGIC_NOT LOGIC_AND LOGIC_OR
%token PLUS_OU_MOINS FOIS_DIV_MOD
%token ACCES_VARIABLE ACCES_ELEM_TABLEAU
%token ACCES_ARG
%token ACCES_LISTE_ARG ACCES_LISTE_TABLEAU
%token<intval> LAST_FUNC_STATUS

%type<expr> concatenation operande liste_operandes
%type<boolexpr> test_bloc test_expr test_expr2 test_expr3 test_instruction
%type<instr_type> liste_instructions instruction
%type<intval> M

%left '+' '-'
%left '*' '/' '%'

%start programme

%%

programme : liste_instructions {}
;

liste_instructions
: liste_instructions ';' M instruction {
    printf("$1.next : ");
    list_print($1.next);
    printf("\n$4.next : ");
    list_print($4.next);
    printf("\n$3 : %i", $3);

    complete($1.next, $3);
    $$.next = $4.next;
}
| instruction {
    printf("aaaa 3\n");
    $$.next = $1.next;
}
;

instruction
: IDENTIFIER '=' concatenation {}
| KW_IF test_bloc KW_THEN M liste_instructions KW_FI {
    complete($2.true, $4);
    // struct list * next = $2.false;
    $$.next = NULL;
    $$.next = list_concat($$.next, $2.false);
    $$.next = list_concat($$.next, $5.next);
    printf("if.next : ");
    list_print($$.next);
    printf("\n");
}
| KW_ECHO liste_operandes {
    // struct quadop val = quadop_cst_string("testouille");
    // struct quad q = quad_echo(val);
    struct quad q = quad_echo($2.res);
    gencode(q);
    $$.next = NULL;
}
| KW_EXIT {
    struct quad q = quad_exit(0);
    gencode(q);
    $$.next = NULL;
}
;

M: %empty {$$ = nextquad;}

/*
else_part
: KW_ELIF test_bloc KW_THEN liste_instructions else_part {}
| KW_ELSE liste_instructions {}
| %empty {}
;*/

concatenation
: concatenation operande {}
| operande { $$.res = $1.res; }
;

test_bloc : KW_TEST test_expr {
    $$.true = NULL;
    $$.true = list_concat($$.true, $2.true);
    $$.false = NULL;
    $$.false = list_concat($$.false, $2.false);
}

test_expr 
: test_expr LOGIC_OR test_expr2 {}
| test_expr2 {
    $$.true = NULL;
    $$.true = list_concat($$.true, $1.true);
    $$.false = NULL;
    $$.false = list_concat($$.false, $1.false);
}
;

test_expr2
: test_expr2 LOGIC_AND test_expr3 {}
| test_expr3 {
    $$.true = NULL;
    $$.true = list_concat($$.true, $1.true);
    $$.false = NULL;
    $$.false = list_concat($$.false, $1.false);
}
;

test_expr3
: '(' test_expr ')' {}
| LOGIC_NOT '(' test_expr ')' {}
| test_instruction  {
    $$.true = NULL;
    $$.true = list_concat($$.true, $1.true);
    $$.false = NULL;
    $$.false = list_concat($$.false, $1.false);
}
| LOGIC_NOT test_instruction {}
;

test_instruction
: concatenation '=' concatenation {
    $$.true = list_creer(nextquad);
    struct quad q = quad_ifeq($1.res, $3.res);
    gencode(q);

    $$.false = list_creer(nextquad);
    struct quad q2 = quad_goto_unknown();
    gencode(q2);

    printf("true : ");
    list_print($$.true);
    printf("\nfalse : ");
    list_print($$.false);
    printf("\n");
}
| concatenation IS_DIFF concatenation {
    $$.true = list_creer(nextquad);
    struct quad q = quad_ifdiff($1.res, $3.res);
    gencode(q);

    $$.false = list_creer(nextquad);
    struct quad q2 = quad_goto_unknown();
    gencode(q2);
}
| operateur1 concatenation {}
| operande operateur2 operande {}
;

liste_operandes
: liste_operandes operande {}
| operande { 
    // print_quadop($1.res);
    // printf(" ici\n");
    $$.res = $1.res;
}
| ACCES_LISTE_TABLEAU {}
;

operande
: ACCES_VARIABLE {}
| ACCES_ELEM_TABLEAU {}
| MOT {
    $$.res = quadop_cst_string($1);
}
| IDENTIFIER { // copie de la règle acceptant MOT
    // printf("aloalo ");
    $$.res = quadop_cst_string($1);
    // print_quadop($$.res);
    // printf("\n");
}
| ACCES_ARG {}
| ACCES_LISTE_ARG {}
| LAST_FUNC_STATUS {}
| STRING_DOUBLE_QUOTE {

    $$.res = quadop_cst_string($1);
}
| STRING_SINGLE_QUOTE {
    $$.res = quadop_cst_string($1);
}
/* il manque les $( expr ... ) et $( function call ) */
;

operateur1
: OP_NOT_NULL {}
| OP_NULL {}
;

operateur2
: OP_EQ {}
| OP_NEQ {}
| OP_GT {}
| OP_GE {}
| OP_LT {}
| OP_LE {}
;



%%

void yyerror(const char * msg) {
    fprintf(stderr, "%s\n", msg);
}
