%{
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <stdnoreturn.h> // pour fatal
#include <stdarg.h> // pour fatal
#include "table_symb.h"
#include "quads.h"
#include "compil.tab.h"
#include "ll-list.h"

// #define PRINT_DEBUG // COMMENTER CA POUR RETIRER LES DEBUG


#ifdef PRINT_DEBUG
#define DEBUG if(1)
#else
#define DEBUG if(0)
#endif

extern int yylex();
extern void yyerror(const char * msg);
void gencode(struct quad q); // ajouter le quad à notre code
void complete(struct list * l, size_t addr); // compléter les goto inconnus
struct entry * new_temp(); // générer une nouvelle entry, renvoyer son pointeur

void fatal(const char * msg, ...); // affiche un msg d'erreur formaté (comme printf)
// puis exit 1;


int nextquad = 0; // compteur global de quads
struct quad global_code[1<<16]; // euh ça fait beaucoup là non ?
int nb_temp = 0; // le nombre d'identifieurs temporaires créés (pour assurer l'unicité de ceux-ci)

struct ctx_stack * ctx_stack; // le stack de table de symboles

struct ctx_stack * liste_symbole; // la liste de tout les symboles
// (sans distinction de portée)
// > il faut free dans le main !!

void gencode(struct quad q) {
    global_code[nextquad++] = q;
}

void complete(struct list * l, size_t addr) {
    struct list * next = l;
    DEBUG printf("completing quads n° ");
    while(next != NULL) {
        DEBUG printf("%lu ", next->addr);
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
    DEBUG printf("with %lu\n", addr);
}

void complete_single(int quad_num, size_t addr) {
    if(quad_num >= nextquad) {
        fprintf(stderr, 
            "complete_single d'un quad qui n'existe pas : %i\n", quad_num);
        return;
    }
    if(global_code[quad_num].kind != Q_GOTO_UNKNOWN
    && global_code[quad_num].kind != Q_IFEQ
    && global_code[quad_num].kind != Q_IFDIFF) {
        fprintf(stderr, "ERREUR : complete un quad qui n'est pas unknown ?-?\n");
    }
    else {
        DEBUG printf("completing quad n° %i with %lu\n", quad_num, addr);
        global_code[quad_num].res.addr = addr;
        global_code[quad_num].res.kind = QO_ADDR;
        if( global_code[quad_num].kind == Q_GOTO_UNKNOWN ) {
            global_code[quad_num].kind = Q_GOTO;
        }
    }
}

struct entry * new_temp() {
    // printf("call new_temp mais c'est pas encore fait, ça c'est padbol\n");
    char name[MAX_IDENT_SIZE]; // 32 chars, incluant le \0
    int rand_nb = rand(); // nombre au hasard
    snprintf(name, MAX_IDENT_SIZE, "_tmp_%010d%05d", rand_nb, nb_temp++);
    // grace aux formats, on sait que name prend exactement 20 caractères (21 en comptant \0)
    DEBUG printf("nouvel ident (par new_temp) : '%s'\n",name);
    
    return create_entry(name, E_STR);
}


noreturn void fatal(const char *msg, ...)
{
    va_list ap;
    va_start(ap, msg);
    vfprintf(stderr, msg, ap);
    fprintf(stderr, "\n");
    va_end(ap);
    exit(1);
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
        enum {
            else_empty, else_elif, else_else
        } type;
        int debut_instr;
        int debut_cond;
        struct list * next;
    } else_part_type;

    
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
%token EQUAL NOT_EQUAL
%token OP_NOT_NULL OP_NULL OP_EQ OP_NEQ OP_GT OP_GE OP_LT OP_LE
%token LOGIC_NOT LOGIC_AND LOGIC_OR
%token PLUS_OU_MOINS FOIS_DIV_MOD
%token O_PAR C_PAR O_BRACKET C_BRACKET O_CURLY_BRACKET C_CURLY_BRACKET SEMICOLON
%token DOLLAR
%token QUESTION_MARK
%token<str> ACCES_VARIABLE
%token ACCES_ELEM_TABLEAU
%token ACCES_ARG
%token ACCES_LISTE_ARG ACCES_LISTE_TABLEAU
%token<intval> LAST_FUNC_STATUS

%type<expr> concatenation operande liste_operandes
%type<boolexpr> test_bloc test_expr test_expr2 test_expr3 test_instruction
%type<instr_type> liste_instructions instruction
%type<else_part_type> else_part
%type<intval> M G


%left '+' '-'
%left '*' '/' '%'

%start programme

%%

programme : {
    // srand(time(NULL)); // pour le générateur de nombre aléatoire, utilisé dans newtemp()
    srand(0); // (aléatoire fixe pour les tests)

    ctx_stack = create_ctx_stack();
    liste_symbole = create_ctx_stack();

    } liste_instructions {
    free_ctx_stack(ctx_stack, 0);
}
| %empty {}
;

liste_instructions
: liste_instructions SEMICOLON M instruction {
    // printf("$1.next : ");
    // list_print($1.next);
    // printf("\n$4.next : ");
    // list_print($4.next);
    // printf("\n$3 : %i\n", $3);

    complete($1.next, $3);
    list_free($1.next);
    $$.next = $4.next;
}
| instruction {
    // printf("aaaa 3\n");
    $$.next = $1.next;
}
;

instruction
: IDENTIFIER EQUAL concatenation {
    DEBUG printf("declaration ident : '%s'\n", $1);

    struct quadop ident = quadop_ident($1);

    if( lookup(ctx_stack, $1) == NULL ) {
        struct entry * id = create_entry($1, E_STR);
        newname(ctx_stack, id);
        struct quad q_decl = quad_declare(ident);
        gencode(q_decl);
        if( lookup(liste_symbole, $1) == NULL ) {
            newname(liste_symbole, id);
        }
    }

    struct quad q = quad_set(ident, $3.res);
    gencode(q);

    $$.next = NULL;
}
| KW_IF test_bloc KW_THEN M liste_instructions else_part KW_FI {
    complete($2.true, $4);
    list_free($2.true);
    // struct list * next = $2.false;
    $$.next = NULL;
    if($6.type == else_elif) {
        complete($2.false, $6.debut_cond);
        list_free($2.false);
    }
    else if ($6.type == else_else) {
        complete($2.false, $6.debut_instr);
        list_free($2.false);
    }
    else {
        $$.next = list_concat($$.next, $2.false);
    }
    $$.next = list_concat($$.next, $5.next);
    $$.next = list_concat($$.next, $6.next);

    ////// struct list * tmp = list_creer($x);
    ////// // printf("(if) créé liste avec %i\n", $x);
    ////// $$.next = list_concat($$.next, tmp);

    // printf("else_part.next : ");
    // list_print($6.next);
    // printf("\n");

    DEBUG printf("if.next : ");
    DEBUG list_print($$.next);
    DEBUG printf("\n");
}
| KW_WHILE M test_bloc KW_DO M liste_instructions G KW_DONE {
    complete($3.true, $5);
    list_free($3.true);
    complete_single($7, $2);

    complete($6.next, $2);
    list_free($6.next);

    $$.next = NULL;
    $$.next = list_concat($$.next, $3.false);
}
/*
Pour until, le test_bloc génère un goto qui est inutile
Parce que si la condition est vraie, alors on sort (next)
Sinon on continue, mais on a un goto qui pointe vers le quad suivant
C'est pas très grave, on peut imaginer une optimisation qui supprimerait
les goto qui pointent vers le quad juste après eux
*/
| KW_UNTIL M test_bloc KW_DO M liste_instructions G KW_DONE {
    complete($3.false, $5);
    list_free($3.false);
    complete_single($7, $2);

    complete($6.next, $2);
    list_free($6.next);

    $$.next = NULL;
    $$.next = list_concat($$.next, $3.true);
}
| KW_ECHO liste_operandes {
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


else_part
: G KW_ELIF M test_bloc KW_THEN M liste_instructions else_part {
    complete($4.true, $6);
    list_free($4.true);
    $$.type=else_elif;
    $$.debut_cond = $3;
    $$.debut_instr = $6;

    $$.next = NULL;
    if($8.type == else_elif) {
        complete($4.false, $8.debut_cond);
        list_free($4.false);
    }
    else if ($8.type == else_else) {
        complete($4.false, $8.debut_instr);
        list_free($4.false);
    }
    else {
        $$.next = list_concat($$.next, $4.false);
    }
    $$.next = list_concat($$.next, $7.next);
    $$.next = list_concat($$.next, $8.next);

    /////// // printf("truc à faire avec %i\n", $x);
    /////// struct list * tmp = list_creer($x);
    /////// // printf("(elsepart) créé liste avec %i\n", $x);
    /////// $$.next = list_concat($$.next, tmp);

    struct list * tmp2 = list_creer($1);
    $$.next = list_concat($$.next, tmp2);

    // printf("inside_else_part.next : ");
    // list_print($$.next); // WTF (ça a l'air de s'etre calmé mtn...)
    // printf("\n");
}
| G KW_ELSE M liste_instructions M {
    $$.type = else_else;
    $$.debut_instr = $3;
    struct list * tmp2 = list_creer($1);
    $$.next = list_concat($$.next, tmp2);
}
| %empty {
    $$.type = else_empty;
    $$.next = NULL;
}
;

M: %empty {$$ = nextquad;}
G: %empty {
    $$ = nextquad;
    gencode(quad_goto_unknown());
}

/*
else_part
: KW_ELIF test_bloc KW_THEN liste_instructions else_part {}
| KW_ELSE liste_instructions {}
| %empty {}
;*/

concatenation
: concatenation operande {
    struct entry * nv_temp = new_temp();
    struct quadop ident_tmp = quadop_ident(nv_temp->name);
    struct quad q_concat = quad_concat(ident_tmp, $1.res, $2.res);
    gencode(quad_declare(ident_tmp));
    newname(ctx_stack, nv_temp);
    newname(liste_symbole, nv_temp);
    gencode(q_concat);
    $$.res = ident_tmp;
}
| operande { $$.res = $1.res; }
;

test_bloc : KW_TEST test_expr {
    $$.true = NULL;
    $$.true = list_concat($$.true, $2.true);
    $$.false = NULL;
    $$.false = list_concat($$.false, $2.false);
}

test_expr 
: test_expr LOGIC_OR M test_expr2 {
    complete($1.false, $3);
    list_free($1.false);
    $$.true = list_concat($1.true, $4.true);
    /*
Un goto inutile ici (qui pointe vers l'instruction suivante)
    */
    $$.false = $4.false;
}
| test_expr2 {
    $$.true = NULL;
    $$.true = list_concat($$.true, $1.true);
    $$.false = NULL;
    $$.false = list_concat($$.false, $1.false);
}
;

test_expr2
: test_expr2 LOGIC_AND M test_expr3 {
    complete($1.true, $3); // si vrai à gauche, test à droite
    list_free($1.true);
    $$.true = $4.true; // si le 2e test est vrai, la condition est vraie
    $$.false = list_concat($1.false, $4.false);
}
| test_expr3 {
    $$.true = NULL;
    $$.true = list_concat($$.true, $1.true);
    // list_free($1.true);
    $$.false = NULL;
    $$.false = list_concat($$.false, $1.false);
    // list_free($1.false);
}
;

test_expr3
: O_PAR test_expr C_PAR {
    $$.true = $2.true;
    $$.false = $2.false;
}
| LOGIC_NOT O_PAR test_expr C_PAR {
    $$.true = $3.false;
    $$.false = $3.true;
}
| test_instruction  {
    $$.true = NULL;
    $$.true = list_concat($$.true, $1.true);
    // list_free($1.true);
    $$.false = NULL;
    $$.false = list_concat($$.false, $1.false);
    // list_free($1.false);
}
| LOGIC_NOT test_instruction {
    $$.true = $2.false;
    $$.false = $2.true;
}
;

test_instruction
: concatenation EQUAL concatenation {
    $$.true = list_creer(nextquad);
    struct quad q = quad_ifeq($1.res, $3.res);
    gencode(q);

    $$.false = list_creer(nextquad);
    struct quad q2 = quad_goto_unknown();
    gencode(q2);

    DEBUG printf("true : ");
    DEBUG list_print($$.true);
    DEBUG printf("\nfalse : ");
    DEBUG list_print($$.false);
    DEBUG printf("\n");
}
| concatenation NOT_EQUAL concatenation {
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
: ACCES_VARIABLE {
    DEBUG printf("accès à la variable : %s\n", $1);
    struct entry * e = lookup(ctx_stack, $1);
    if( e == NULL ) {
        fatal("Erreur : accès à une variable non définie : '%s'\n", $1);
    }
    struct quadop ident = quadop_ident(e->name);
    $$.res = ident;
}
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
