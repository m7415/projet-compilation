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

// deux symboles qui sont toujours définis dans MIPS
// dans ces variables, on charge la valeur convertis en entier des
// opérandes dans la règle <operande> <op2> <operande> (-eq, -neq, -lt...)
#define SYMB_OPERATEUR_2_GAUCHE ".op2_gauche"
#define SYMB_OPERATEUR_2_DROITE ".op2_droite"


extern int yylex();
extern void yyerror(const char * msg);
void gencode(struct quad q); // ajouter le quad à notre code
void complete(struct list * l, size_t addr); // compléter les goto inconnus
struct entry * new_temp(); // générer une nouvelle entry, renvoyer son pointeur
int is_numeric(char * s); // renvois 1 si s est uniquement composé de chiffres de 0 à 9

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
        && global_code[next->addr].kind != Q_IFDIFF
        && global_code[next->addr].kind != Q_IFGT
        && global_code[next->addr].kind != Q_IFGE
        && global_code[next->addr].kind != Q_IFLT
        && global_code[next->addr].kind != Q_IFLE
        && global_code[next->addr].kind != Q_IFEQ_STR
        && global_code[next->addr].kind != Q_IFDIFF_STR
        && global_code[next->addr].kind != Q_IFNULL_STR
        && global_code[next->addr].kind != Q_IFNOTNULL_STR) {
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
    // int rand_nb = rand(); // nombre au hasard
    snprintf(name, MAX_IDENT_SIZE, ".tmp_%d", nb_temp++);
    // grace au "." au début (accepté par MIPS mais pas par SOS), on est sur que le programme n'utilisait pas ça
    // et la numérotation assure l'unicité 
    // (sauf si on dépasse 10^(MAX_IDENT_SIZE-6) variables temporaires...)
    DEBUG printf("nouvel ident (par new_temp) : '%s'\n",name);
    
    return create_entry(name, E_STR);
}

int is_numeric(char * s) {
    for(int i=0; s[i] != '\0'; i++) {
        if( s[i] != '\"' && s[i] != '\'' && (s[i] < '0' || s[i] > '9') ) {
            return 0;
        }
    }
    return 1;
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
    enum {
      not_null,
      null,
      eq,
      not_eq,
      greater_than,
      greater_equal,
      less_than,
      less_equal
    } operateur1et2;
    enum {
        op_add,
        op_sub,
        op_mul,
        op_div,
        op_mod,
        op_none
    } op_arithm;

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
        // struct quadop res[32];
        struct qo_list * qo_list;
    } liste_expr;

    struct {
        struct list * next;
        int isempty; // uniquement pour les st, vaut 1 is st est %empty
    } instr_type;
}

%token KW_IF KW_THEN KW_FOR KW_DO KW_DONE KW_IN KW_WHILE KW_UNTIL KW_CASE
%token KW_ESAC KW_ECHO KW_READ KW_RETURN KW_EXIT KW_LOCAL KW_ELIF KW_ELSE
%token KW_FI KW_DECLARE KW_TEST KW_EXPR
%token<str> STRING_DOUBLE_QUOTE STRING_SINGLE_QUOTE MOT IDENTIFIER ACCES_LISTE_TABLEAU
%token<intval> NUMBER 
%token EQUAL NOT_EQUAL
%token OP_NOT_NULL OP_NULL OP_EQ OP_NEQ OP_GT OP_GE OP_LT OP_LE
%token LOGIC_NOT LOGIC_AND LOGIC_OR
%token<op_arithm> PLUS_OU_MOINS FOIS_DIV_MOD
%token O_PAR C_PAR O_BRACKET C_BRACKET O_CURLY_BRACKET C_CURLY_BRACKET SEMICOLON
%token DOLLAR
%token QUESTION_MARK
%token<str> ACCES_VARIABLE
%token ACCES_ELEM_TABLEAU
%token ACCES_ARG
%token ACCES_LISTE_ARG
%token<intval> LAST_FUNC_STATUS

%type<expr> concatenation operande
%type<liste_expr> liste_operandes
%type<expr> somme_entier produit_entier operande_entier
%type<boolexpr> test_bloc test_expr test_expr2 test_expr3 test_instruction
%type<instr_type> liste_instructions instruction
%type<else_part_type> else_part
%type<intval> M G
%type<operateur1et2> operateur1 operateur2
%type<op_arithm> opt_plus_ou_moins

%left '+' '-'
%left '*' '/' '%'

%start programme

%%

programme : {
    // srand(time(NULL)); // pour le générateur de nombre aléatoire, utilisé dans newtemp()
    srand(0); // (aléatoire fixe pour les tests)

    ctx_stack = create_ctx_stack();
    liste_symbole = create_ctx_stack();

    // struct entry * e = create_entry(SYMB_OPERATEUR_2_GAUCHE, E_STR); 
    // newname(ctx_stack, e);
    // newname(liste_symbole, e);
    // gencode(quad_declare(quadop_ident(e->name)));
    // e = create_entry(SYMB_OPERATEUR_2_DROITE, E_STR); 
    // newname(ctx_stack, e);
    // newname(liste_symbole, e);
    // gencode(quad_declare(quadop_ident(e->name)));

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
| KW_DECLARE IDENTIFIER O_BRACKET IDENTIFIER C_BRACKET {
    fatal("La taille précisée dans la création du tableau '%s' "
            "n'est pas une constante entière positive : '%s'\n",
            $2, $4);
    // règle dupliquée, on sait qu'un chiffre est un mot forcement
    // mais les identifier sont inclus dans les mots
    // cette règle permet d'afficher un message d'erreur clair
}
| KW_DECLARE IDENTIFIER O_BRACKET MOT C_BRACKET {
    if( lookup(ctx_stack, $2) != NULL ) {
        fatal("Définition d'un tableau avec un nom déjà utilisé : '%s'\n", $2);
    }
    if( ! is_numeric($4) ) {
        fatal("La taille précisée dans la création du tableau '%s' "
              "n'est pas une constante entière positive : '%s'\n",
              $2, $4);
    }
    struct entry * id = create_entry($2, E_TAB);
    id->taille = atoi($4);
    // DEBUG printf("création d'un nouveau tableau : %s[%i]\n", id->name, id->taille);
    newname_global(ctx_stack, id);
    newname_global(liste_symbole, id); // pas forcement besoin de "global" ici
    struct quadop ident = quadop_ident(id->name);
    struct quadop taille = quadop_cst_string($4);
    gencode( quad_declare_tab(ident, taille) );
    $$.next = NULL;
}
| IDENTIFIER O_BRACKET operande_entier C_BRACKET EQUAL concatenation{
    struct entry * ident = lookup(ctx_stack, $1);
    if( ident == NULL ) {
        fatal("Ce tableau n'existe pas : '%s'\n", $1);
    }
    if( ident->type != E_TAB ) {
        fatal("Cette variable n'est pas un tableau : '%s'\n", $1);
    }

    char tmp[32];
    snprintf(tmp, 32, "%i", ident->taille);
    struct quad q_verif_index = quad_ifge($3.res, quadop_cst_string(tmp));
    q_verif_index.res = quadop_cst_string("erreur_out_of_range");
    struct quad q_verif_index2 = quad_iflt($3.res, quadop_cst_string("0"));
    q_verif_index2.res = quadop_cst_string("erreur_out_of_range");
    gencode(q_verif_index);
    gencode(q_verif_index2);

    gencode( quad_set_tab( quadop_ident(ident->name), $3.res, $6.res) );

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
    // for(int i = 0; i < $2.nb_qo ; i++) {
    //     gencode( quad_echo($2.res[i]) );
    // }

    struct entry * tmp = NULL;
    struct quadop id_tmp;

    struct qo_list * next = $2.qo_list;
    while(next != NULL) {
        if(next->val.kind == QO_TAB_ELEM) {
            if(tmp == NULL) {
                tmp = new_temp();
                newname(ctx_stack,tmp);
                newname(liste_symbole, tmp);
                id_tmp = quadop_ident(tmp->name);
                gencode(quad_declare(id_tmp));
            }
            struct quadop id_tab = quadop_ident(next->val.tab.ident);
            struct quadop idx_tab = quadop_cst(next->val.tab.idx);
            gencode(quad_get_tab(id_tmp, id_tab, idx_tab));
            gencode (quad_echo(id_tmp) );
        }
        else {
            gencode(quad_echo(next->val));
        }
        next = next->next;
    }
    qo_list_free($2.qo_list);
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
| G KW_ELSE M liste_instructions {
    $$.type = else_else;
    $$.debut_instr = $3;
    struct list * tmp2 = list_creer($1);
    $$.next = list_concat($4.next, tmp2);
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
    struct quad q = quad_ifeq_str($1.res, $3.res);
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
    struct quad q = quad_ifdiff_str($1.res, $3.res);
    gencode(q);

    $$.false = list_creer(nextquad);
    struct quad q2 = quad_goto_unknown();
    gencode(q2);
}
| operateur1 concatenation {
    if( $1 == null ) {
        $$.true = list_creer(nextquad);
        struct quad q = quad_ifnull_str($2.res);
        gencode(q);
        $$.false = list_creer(nextquad);
        struct quad q2 = quad_goto_unknown(nextquad);
        gencode(q2);
    }
    else if( $1 == not_null ) {
        $$.true = list_creer(nextquad);
        struct quad q = quad_ifnotnull_str($2.res);
        gencode(q);
        $$.false = list_creer(nextquad);
        struct quad q2 = quad_goto_unknown(nextquad);
        gencode(q2);
    }
    else {
        fatal("Error (invalid operateur1)\n");
    }
}
| operande operateur2 operande {
    // vérification que c'est des entiers
    // si ce sont des constantes, on peut vérifier dès maintenant
    if( $1.res.kind == QO_CST_STRING ) {
        if( is_numeric($1.res.cst_str) == 0 ) {
            fatal("Erreur : valeur (gauche) constante non convertissable en entier : '%s'\n", $1.res.cst_str);
        }
    }
    if( $3.res.kind == QO_CST_STRING ) {
        if( is_numeric($3.res.cst_str) == 0 ) {
            fatal("Erreur : valeur (droite) constante non convertissable en entier : '%s'\n", $3.res.cst_str);
        }
    }
    // sinon, on doit faire la vérif au moment de l'exécution
    // dans la petite librairie MIPS qu'on a écrit, notre fonction
    // 'convert_entier' fait la vérification, et arrete l'exécution si besoin
    // donc générer les quads pour charger les valeurs de $1 et $3 fait
    // la vérification

    if( $2 == eq ) {
        $$.true = list_creer(nextquad);
        struct quad q = quad_ifeq($1.res, $3.res);
        gencode(q);
        $$.false = list_creer(nextquad);
        struct quad q2 = quad_goto_unknown(nextquad);
        gencode(q2);
    } else if ( $2 == not_eq ) {
        $$.true = list_creer(nextquad);
        struct quad q = quad_ifdiff($1.res, $3.res);
        gencode(q);
        $$.false = list_creer(nextquad);
        struct quad q2 = quad_goto_unknown(nextquad);
        gencode(q2);
    } else if ( $2 == greater_than ) {
        $$.true = list_creer(nextquad);
        struct quad q = quad_ifgt($1.res, $3.res);
        gencode(q);
        $$.false = list_creer(nextquad);
        struct quad q2 = quad_goto_unknown(nextquad);
        gencode(q2);        
    } else if ( $2 == greater_equal ) {
        $$.true = list_creer(nextquad);
        struct quad q = quad_ifge($1.res, $3.res);
        gencode(q);
        $$.false = list_creer(nextquad);
        struct quad q2 = quad_goto_unknown(nextquad);
        gencode(q2);
    } else if ( $2 == less_than ) {
        $$.true = list_creer(nextquad);
        struct quad q = quad_iflt($1.res, $3.res);
        gencode(q);
        $$.false = list_creer(nextquad);
        struct quad q2 = quad_goto_unknown(nextquad);
        gencode(q2);

    } else if ( $2 == less_equal ) {
        $$.true = list_creer(nextquad);
        struct quad q = quad_ifle($1.res, $3.res);
        gencode(q);
        $$.false = list_creer(nextquad);
        struct quad q2 = quad_goto_unknown(nextquad);
        gencode(q2);
    } else {
        fatal("Error (invalid operateur2)\n");
    }
}
;

liste_operandes
: liste_operandes operande {
    $$.qo_list = $1.qo_list;
    qo_list_append($$.qo_list, $2.res);
}
| operande { 
    $$.qo_list = qo_list_creer($1.res);
}
| ACCES_LISTE_TABLEAU {
    $$.qo_list = NULL;
    DEBUG printf("liste tableau : '%s'\n", $1);
    struct entry * tab = lookup(ctx_stack, $1);
    if( tab == NULL) {
        fatal("Accès un tableau non défini : '%s'\n", $1);
    }
    if( tab->type != E_TAB) {
        fatal("Cette variable n'est pas un tableau : '%s'\n", $1);
    }

    $$.qo_list = qo_list_creer( quadop_tab_elem($1, 0) );
    for(int i=1;i < tab->taille; i++) {
        qo_list_append($$.qo_list, quadop_tab_elem($1, i));
    }
    // DEBUG qo_list_print($$.qo_list);
}
;

operande
: ACCES_VARIABLE {
    DEBUG printf("accès à la variable : %s\n", $1);
    struct entry * e = lookup(ctx_stack, $1);
    if( e == NULL ) {
        fatal("Accès à une variable non définie : '%s'\n", $1);
    }
    struct quadop ident = quadop_ident(e->name);
    $$.res = ident;
}
| DOLLAR O_CURLY_BRACKET IDENTIFIER O_BRACKET operande_entier C_BRACKET C_CURLY_BRACKET {
    struct entry * e = lookup(ctx_stack, $3);
    if( e == NULL ) {
        fatal("Accès à un tableau non défini : '%s'\n", $3);
    }
    if( e->type != E_TAB ) {
        fatal("Cette variable n'est pas un tableau : '%s'\n", $3);
    }
    // struct quadop tab_elem = quadop_tab_elem()
    struct entry * tmp = new_temp();
    newname(ctx_stack,tmp);
    newname(liste_symbole, tmp);
    struct quadop id_tmp = quadop_ident(tmp->name);

    char tmp_taille[32];
    snprintf(tmp_taille, 32, "%i", e->taille);
    struct quad q_verif_index = quad_ifge($5.res, quadop_cst_string(tmp_taille));
    q_verif_index.res = quadop_cst_string("erreur_out_of_range");
    struct quad q_verif_index2 = quad_iflt($5.res, quadop_cst_string("0"));
    q_verif_index2.res = quadop_cst_string("erreur_out_of_range");
    gencode(q_verif_index);
    gencode(q_verif_index2);

    gencode(quad_declare(id_tmp));
    gencode(quad_get_tab(id_tmp, quadop_ident(e->name), $5.res));

    $$.res = id_tmp;
}
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
| DOLLAR O_PAR KW_EXPR somme_entier C_PAR {
    $$.res = $4.res;
}
/* il manque les $( expr ... ) et $( function call ) */
;

operateur1
: OP_NOT_NULL { $$ = not_null; }
| OP_NULL { $$ = null; }
;

operateur2
: OP_EQ { $$ = eq; }
| OP_NEQ { $$ = not_eq; }
| OP_GT { $$ = greater_than; }
| OP_GE { $$ = greater_equal; }
| OP_LT { $$ = less_than; }
| OP_LE { $$ = less_equal; }
;

somme_entier
: somme_entier PLUS_OU_MOINS produit_entier {
    struct entry * res = new_temp();
    newname(ctx_stack, res);
    newname(liste_symbole, res);
    struct quadop ident_res = quadop_ident(res->name);
    gencode(quad_declare(ident_res));
    if($2 == op_add) {
        gencode( quad_add(ident_res, $1.res, $3.res) );
    }
    else if($2 == op_sub) {
        gencode (quad_sub(ident_res, $1.res, $3.res) );
    }
    else {
        fatal("Erreur opérateur plus_ou_moins (bizarre)\n");
    }
    $$.res = ident_res;
}
| produit_entier {
    $$.res = $1.res;
}
;

produit_entier
: produit_entier FOIS_DIV_MOD operande_entier {
    struct entry * res = new_temp();
    newname(ctx_stack, res);
    newname(liste_symbole, res);
    struct quadop ident_res = quadop_ident(res->name);
    gencode(quad_declare(ident_res));
    if($2 == op_mul) {
        gencode( quad_mul(ident_res, $1.res, $3.res) );
    }
    else if($2 == op_div) {
        gencode (quad_div(ident_res, $1.res, $3.res) );
    }
    else if($2 == op_mod) {
        gencode (quad_mod(ident_res, $1.res, $3.res) );
    }
    else {
        fatal("Erreur opérateur fois_div_mod (bizarre)\n");
    }
    $$.res = ident_res;
}
| operande_entier {
    $$.res = $1.res;
}
;

operande_entier
: opt_plus_ou_moins ACCES_VARIABLE {
    DEBUG printf("(op_entier) accès à la variable : %s\n", $2);
    struct entry * e = lookup(ctx_stack, $2);
    if( e == NULL ) {
        fatal("Erreur : accès à une variable non définie : '%s'\n", $2);
    }
    struct quadop ident = quadop_ident(e->name);
    if($1 != op_sub) { // rien, ou un '+'
        $$.res = ident;
    }
    else { // un '-'
        struct entry * inv = new_temp();
        newname(ctx_stack, inv);
        newname(liste_symbole, inv);
        struct quadop ident_inv = quadop_ident(inv->name);
        gencode(quad_declare(ident_inv));
        gencode(quad_inv_signe(ident_inv, ident));
        $$.res = ident_inv;
    }
}
| opt_plus_ou_moins ACCES_ELEM_TABLEAU {}
| opt_plus_ou_moins ACCES_ARG {}
| opt_plus_ou_moins MOT { 
    if( is_numeric($2) == 0 ) {
        fatal("Erreur : valeur constante non convertissable en entier : '%s'\n", $1);
    }
    struct quadop val = quadop_cst_string($2);
    if( $1 != op_sub ) {
        $$.res = val;
    }
    else {
        struct entry * inv = new_temp();
        newname(ctx_stack, inv);
        newname(liste_symbole, inv);
        struct quadop ident_inv = quadop_ident(inv->name);
        gencode(quad_declare(ident_inv));
        gencode(quad_inv_signe(ident_inv, val));
        $$.res = ident_inv;
    }
}
| O_PAR somme_entier C_PAR {
    $$.res = $2.res;
}

opt_plus_ou_moins
: PLUS_OU_MOINS { $$ = $1; }
| %empty { $$ = op_none; }

%%

void yyerror(const char * msg) {
    fprintf(stderr, "%s\n", msg);
}
