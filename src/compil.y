%{
#include <stdio.h>
#include <stdlib.h>
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

// un symbole global qui contient le status de la dernière fonction exécutée
#ifndef SYMB_LAST_FUNC_RETURN
#define SYMB_LAST_FUNC_RETURN ".last_func_return"
// -> fait dans mips.c
#endif

extern int yylex();
extern int yylineno; // pour afficher la ligne d'une erreur
extern void yyerror(const char * msg);
void gencode(struct quad q); // ajouter le quad à notre code
void complete(struct list * l, size_t addr); // compléter les goto inconnus
struct entry * new_temp(char * name_); // générer une nouvelle entry, renvoyer son pointeur
// si name == NULL, le nom sera de la forme ".tmp_xx"
// si name != NULL, le nom sera de la forme ".tmp_xx_<name>"
int is_numeric(char * s); // renvois 1 si s est uniquement composé de chiffres de 0 à 9

void fatal(const char * msg, ...); // affiche un msg d'erreur formaté (comme printf)
// puis exit 1;


int nextquad = 0; // compteur global de quads
struct quad global_code[1<<16]; // valeur arbitrairement grande, pour éviter de devoir realloc...
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
    && global_code[quad_num].kind != Q_IFDIFF
    && global_code[quad_num].kind != Q_IFGT
    && global_code[quad_num].kind != Q_IFGE
    && global_code[quad_num].kind != Q_IFLT
    && global_code[quad_num].kind != Q_IFLE
    && global_code[quad_num].kind != Q_IFEQ_STR
    && global_code[quad_num].kind != Q_IFDIFF_STR
    && global_code[quad_num].kind != Q_IFNULL_STR
    && global_code[quad_num].kind != Q_IFNOTNULL_STR) {
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

struct entry * new_temp(char * name_) {
    char name[MAX_IDENT_SIZE]; // 32 chars, incluant le \0
    if(name_ == NULL) {
        snprintf(name, MAX_IDENT_SIZE, ".tmp_%d", nb_temp++);
    } else {
        snprintf(name, MAX_IDENT_SIZE, ".tmp_%d_%s", nb_temp++, name_);
    }
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
    } else_part_type; // utilisé pour gérer les goto dans les else

    struct {
        struct qo_list * qo_list;
        int nb_elem;
    } liste_expr;

    struct {
        struct list * next;
    } instr_type;

    // aurait été utilisé pour case, mais on a pas réussi
    struct {
        // 2 listes en correspondances
        // si ident == qo_list[i] goto list[i] 
        struct qo_list * qo_list;
        struct list * list;
    } lst_cas_type;

    int nb_decl_loc; // nombre de variables locales dans une fonction
}

%token KW_IF KW_THEN KW_FOR KW_DO KW_DONE KW_IN KW_WHILE KW_UNTIL KW_CASE
%token KW_ESAC KW_ECHO KW_READ KW_RETURN KW_EXIT KW_LOCAL KW_ELIF KW_ELSE
%token KW_FI KW_DECLARE KW_TEST KW_EXPR
%token<str> STRING_DOUBLE_QUOTE STRING_SINGLE_QUOTE MOT IDENTIFIER ACCES_LISTE_TABLEAU
%token EQUAL NOT_EQUAL
%token OP_NOT_NULL OP_NULL OP_EQ OP_NEQ OP_GT OP_GE OP_LT OP_LE
%token LOGIC_NOT LOGIC_AND LOGIC_OR
%token<op_arithm> PLUS_OU_MOINS FOIS_DIV_MOD
%token O_PAR C_PAR O_BRACKET C_BRACKET O_CURLY_BRACKET C_CURLY_BRACKET SEMICOLON PIPE
%token DOLLAR
%token<str> ACCES_VARIABLE
%token<intval> ACCES_ARG
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
%type<nb_decl_loc> decl_loc
%type<lst_cas_type> liste_cas

%left '+' '-'
%left '*' '/' '%'

%start programme

%locations

%%

programme : {
    ctx_stack = create_ctx_stack();
    liste_symbole = create_ctx_stack();
    } liste_instructions {
    free_ctx_stack(ctx_stack, 0);
}
| %empty {}
;

liste_instructions
: liste_instructions SEMICOLON M instruction {
    complete($1.next, $3);
    list_free($1.next);
    $$.next = $4.next;
}
| instruction {
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
        if( lookup(liste_symbole, $1) == NULL ) {
            newname(liste_symbole, id);
            gencode(quad_declare(ident));
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
    newname_global(ctx_stack, id);
    newname_global(liste_symbole, id); // pas forcement besoin de "global" ici
    struct quadop ident = quadop_ident(id->name);
    struct quadop taille = quadop_cst(atoi($4));
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

    gencode( quad_set_tab( quadop_ident(ident->name), $3.res, $6.res) );
    global_code[nextquad-1].data.taille = ident->taille;

    $$.next = NULL;
}
| KW_IF test_bloc KW_THEN M liste_instructions else_part KW_FI {
    complete($2.true, $4);
    list_free($2.true);
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
| KW_FOR IDENTIFIER {
    struct entry * e = lookup(ctx_stack, $2);
    if(e != NULL && e->type == E_TAB) {
        fatal("Utilisation d'une variable tableau dans une boucle for"
              " : '%s'\n",$2);
    }
    if(e == NULL) {
        e = create_entry($2, E_STR);
        newname(ctx_stack, e);
        newname(liste_symbole, e);
        gencode(quad_declare(quadop_ident($2)));
    }
    } KW_IN liste_operandes KW_DO {
    int nb_op = $5.nb_elem; // renommer pour la lisibilité

    // création d'un tableau qui contiendra les valeurs successives
    struct entry * e_tab = new_temp("for_tab");
    e_tab->taille = nb_op;
    e_tab->type = E_TAB;
    newname(ctx_stack, e_tab);
    newname(liste_symbole,e_tab);
    struct quadop ident_tab = quadop_ident(e_tab->name);
    char num[32];
    snprintf(num,32,"%i",nb_op);
    gencode(quad_declare_tab(ident_tab, quadop_cst(nb_op)));
    struct entry * tmp = NULL;
    struct quadop id_tmp;
    struct qo_list * next = $5.qo_list;
    int idx = 0;
    while(next != NULL) {
        snprintf(num, 32, "%i", idx);
        idx++;
        if(next->val.kind == QO_TAB_ELEM) { // si c'est un accès tableau,
            if(tmp == NULL) { // pour éviter de systématiquement créer un tmp
                tmp = new_temp(NULL);
                newname(ctx_stack,tmp);
                newname(liste_symbole, tmp);
                id_tmp = quadop_ident(tmp->name);
                gencode(quad_declare(id_tmp));
            }
            // on charge la valeur du tableau dans un tmp
            struct quadop id_tab = quadop_ident(next->val.tab.ident);
            snprintf(num,32,"%i", next->val.tab.idx);
            struct quadop idx_tab = quadop_cst_string(num);
            gencode(quad_get_tab(id_tmp, id_tab, idx_tab));
            struct entry * e_tmp_tab = lookup(ctx_stack, id_tab.ident);
            global_code[nextquad-1].data.taille = e_tmp_tab->taille;
            // et on enregistre ce tmp dans notre tableau temporaire
            gencode(quad_set_tab(ident_tab, quadop_cst_string(num), id_tmp));
            global_code[nextquad-1].data.taille = e_tab->taille;
        }
        else { // si c'est un quadop normal
        // remarque : s'il n'y a aucun QO_TAB_ELEM, alors aucune variable tmp
        // n'est générée
            gencode(quad_set_tab(ident_tab, quadop_cst_string(num), next->val));
            global_code[nextquad-1].data.taille = e_tab->taille;
        }
        next = next->next;
    }
    $<expr>$.res = ident_tab;
    } M {
    struct quadop ident_tab = $<expr>7.res;
    struct quadop ident = quadop_ident($2);
    char num[32];
    int nb_op = $5.nb_elem;
    struct entry * e_compteur = new_temp("for_idx");
    newname(ctx_stack, e_compteur);
    newname(liste_symbole, e_compteur);
    struct quadop ident_compteur = quadop_ident(e_compteur->name);
    gencode(quad_declare(ident_compteur));
    gencode(quad_set(ident_compteur, quadop_cst_string("0")));
    
    snprintf(num, 32, "%i", nb_op);
    struct quad iter = quad_iflt(ident_compteur, quadop_cst_string(num));
    iter.res.addr = nextquad+2; // à vérifier
    iter.res.kind = QO_ADDR;
    gencode(iter);
    $<instr_type>$.next = list_creer(nextquad);
    gencode(quad_goto_unknown());
    gencode(quad_get_tab(ident, ident_tab, ident_compteur));
    struct entry * e_tmp_tab = lookup(ctx_stack, ident_tab.ident);
    global_code[nextquad-1].data.taille = e_tmp_tab->taille;
    gencode(quad_add(ident_compteur, ident_compteur, quadop_cst_string("1")));

    } liste_instructions G KW_DONE {
    complete_single($11, $8+2); // +2 pour sauter l'initialisation du compteur de boucle
    complete($10.next, $8+2); // on force à revenir au début du for (pour vérifier si on doit en sortir)
    list_free($10.next);
    $$.next = NULL;

    complete($<instr_type>9.next, $11+1);
    list_free($<instr_type>9.next);
    qo_list_free($5.qo_list);
}
| KW_ECHO liste_operandes {
    struct entry * tmp = NULL;
    struct quadop id_tmp;
    struct qo_list * next = $2.qo_list;
    char num[32];
    while(next != NULL) {
        if(next->val.kind == QO_TAB_ELEM) { // si c'est un accès tableau,
            if(tmp == NULL) { // pour éviter de systématiquement créer un tmp
                tmp = new_temp(NULL);
                newname(ctx_stack,tmp);
                newname(liste_symbole, tmp);
                id_tmp = quadop_ident(tmp->name);
                gencode(quad_declare(id_tmp));
            }
            // on charge la valeur du tableau dans un tmp
            // puis on affiche ce tmp
            // c'est plus simple que de toute faire d'un coup
            struct quadop id_tab = quadop_ident(next->val.tab.ident);
            snprintf(num,32,"%i", next->val.tab.idx);
            struct quadop idx_tab = quadop_cst_string(num);
            gencode(quad_get_tab(id_tmp, id_tab, idx_tab));
            struct entry * e_tmp_tab = lookup(ctx_stack, id_tab.ident);
            global_code[nextquad-1].data.taille = e_tmp_tab->taille;
            gencode ( quad_echo(id_tmp) );
        }
        else { // si c'est un quadop normal, on l'echo simplement
        // remarque : s'il n'y a aucun QO_TAB_ELEM, alors aucune variable tmp
        // n'est générée
            gencode( quad_echo(next->val) );
        }
        next = next->next;
    }
    global_code[nextquad-1].data.is_last = 1;
    qo_list_free($2.qo_list);
    $$.next = NULL;
}
| declaration_de_fonction {
    $$.next = NULL;
}
| KW_READ IDENTIFIER {
    struct quadop ident = quadop_ident($2);

    if( lookup(ctx_stack, $2) == NULL ) {
        struct entry * id = create_entry($2, E_STR);
        newname(ctx_stack, id);
        if( lookup(liste_symbole, $2) == NULL ) {
            newname(liste_symbole, id);
            gencode(quad_declare(ident));
        }
    }
    gencode(quad_read(ident));
    $$.next = NULL;
}
| KW_READ IDENTIFIER O_BRACKET operande_entier C_BRACKET {
    struct quadop ident = quadop_ident($2);
    struct entry * e = lookup(ctx_stack,$2);
    if( e == NULL ) {
        fatal("Read dans un tableau qui n'existe pas : '%s'\n", $2);
    }
    if( e->type != E_TAB ) {
        fatal("Read dans un tableau mais la variable n'est pas un tableau '%s'\n", $2);
    }
    gencode(quad_read_tab(ident, $4.res));
    global_code[nextquad-1].data.taille = e->taille;
    $$.next = NULL;
}
| KW_EXIT {
    struct quad q = quad_exit(0);
    gencode(q);
    $$.next = NULL;
}
| KW_EXIT operande_entier { $$.next = NULL; }
| KW_RETURN { $$.next = NULL; }
| KW_RETURN operande_entier { $$.next = NULL; }
| appel_de_fonction { $$.next = NULL; }
| KW_CASE operande KW_IN liste_cas KW_ESAC {
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
    struct list * tmp2 = list_creer($1);
    $$.next = list_concat($$.next, tmp2);
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

/* laissé vide, car case n'est pas implémenté */
liste_cas
: liste_cas filtre C_PAR liste_instructions SEMICOLON SEMICOLON {

}
| filtre C_PAR liste_instructions SEMICOLON SEMICOLON {

}
filtre
: MOT
| IDENTIFIER
| STRING_DOUBLE_QUOTE
| STRING_SINGLE_QUOTE
| filtre PIPE MOT
| filtre PIPE IDENTIFIER
| filtre PIPE STRING_DOUBLE_QUOTE
| filtre PIPE STRING_SINGLE_QUOTE
| FOIS_DIV_MOD {
    if($1 != op_mul) {
        fatal("syntax error on case\n");
    }
}


concatenation
: concatenation operande {
    struct entry * nv_temp = new_temp(NULL);
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
    $$.false = NULL;
    $$.false = list_concat($$.false, $1.false);
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
    $$.nb_elem = $1.nb_elem+1;
}
| operande { 
    $$.qo_list = qo_list_creer($1.res);
    $$.nb_elem = 1;
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
    $$.nb_elem = tab->taille;
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
    struct entry * tmp = new_temp(NULL);
    newname(ctx_stack,tmp);
    newname(liste_symbole, tmp);
    struct quadop id_tmp = quadop_ident(tmp->name);

    gencode(quad_declare(id_tmp));
    gencode(quad_get_tab(id_tmp, quadop_ident(e->name), $5.res));
    global_code[nextquad-1].data.taille = e->taille;

    $$.res = id_tmp;
}
| MOT {
    $$.res = quadop_cst_string($1);
}
| IDENTIFIER { // copie de la règle acceptant MOT
    $$.res = quadop_cst_string($1);
}
| ACCES_ARG {
    DEBUG printf("acces arg %i\n", $1);
    struct entry * e = new_temp(NULL);
    struct quadop ident = quadop_ident(e->name);
    newname(ctx_stack, e);
    newname(liste_symbole, e);
    gencode(quad_declare(ident));
    gencode(quad_arg_glob(ident, quadop_cst($1)));
    $$.res = ident;
}
| ACCES_LISTE_ARG {
    $$.res = quadop_ident(".arg_concat");
}
| LAST_FUNC_STATUS {
    $$.res = quadop_ident(".last_func_return");
}
| STRING_DOUBLE_QUOTE {
    $$.res = quadop_cst_string($1);
}
| STRING_SINGLE_QUOTE {
    $$.res = quadop_cst_string($1);
}
| DOLLAR O_PAR KW_EXPR somme_entier C_PAR {
    $$.res = $4.res;
}
| DOLLAR O_PAR appel_de_fonction C_PAR {
    $$.res = quadop_cst_string("fonction pas implémenté");
}
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
    struct entry * res = new_temp(NULL);
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
    struct entry * res = new_temp(NULL);
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
    // la vérification de la validité de la variable se fait dans le mips
    // avec notre petite librairie (verif_entier.s, convert_entier.s, erreur.s)
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
        struct entry * inv = new_temp(NULL);
        newname(ctx_stack, inv);
        newname(liste_symbole, inv);
        struct quadop ident_inv = quadop_ident(inv->name);
        gencode(quad_declare(ident_inv));
        gencode(quad_inv_signe(ident_inv, ident));
        $$.res = ident_inv;
    }
} 
| opt_plus_ou_moins DOLLAR O_CURLY_BRACKET IDENTIFIER O_BRACKET operande_entier C_BRACKET C_CURLY_BRACKET {
    struct entry * e = lookup(ctx_stack, $4);
    if( e == NULL ) {
        fatal("Accès à un tableau non défini : '%s'\n", $4);
    }
    if( e->type != E_TAB ) {
        fatal("Cette variable n'est pas un tableau : '%s'\n", $4);
    }
    struct entry * tmp = new_temp(NULL);
    newname(ctx_stack,tmp);
    newname(liste_symbole, tmp);
    struct quadop id_tmp = quadop_ident(tmp->name);

    gencode(quad_declare(id_tmp));
    gencode(quad_get_tab(id_tmp, quadop_ident(e->name), $6.res));
    global_code[nextquad-1].data.taille = e->taille;
    
    if($1 == op_sub) { // rien, ou un '+'
        gencode(quad_inv_signe(id_tmp, id_tmp)); 
    }
    $$.res = id_tmp;
} 
| opt_plus_ou_moins ACCES_ARG {
    struct entry * e = new_temp(NULL);
    struct quadop ident = quadop_ident(e->name);
    newname(ctx_stack, e);
    newname(liste_symbole, e);
    gencode(quad_declare(ident));
    gencode(quad_arg_glob(ident, quadop_cst($2)));
    if($1 == op_sub) {
        gencode(quad_inv_signe(ident, ident));
    }
    $$.res = ident;
}
| opt_plus_ou_moins MOT { 
    if( is_numeric($2) == 0 ) {
        fatal("Erreur : valeur constante non convertissable en entier : '%s'\n", $1);
    }
    struct quadop val = quadop_cst_string($2);
    if( $1 != op_sub ) {
        $$.res = val;
    }
    else {
        struct entry * inv = new_temp(NULL);
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
;

opt_plus_ou_moins
: PLUS_OU_MOINS { $$ = $1; }
| %empty { $$ = op_none; }
;

declaration_de_fonction
: IDENTIFIER O_PAR C_PAR O_CURLY_BRACKET {
    // pushctx(ctx_stack);
} decl_loc liste_instructions C_CURLY_BRACKET {
    // DEBUG print_ctx_stack(ctx_stack);
    // popctx(ctx_stack,0);
}
;

decl_loc
: decl_loc KW_LOCAL IDENTIFIER EQUAL concatenation SEMICOLON {
    // struct entry * e = create_entry($3, E_LOC);
    // e->offset_sp = e->nb_decl_loc++;
    // struct quadop ident = quadop_ident(e->name);
    // newname(ctx_stack, e);
    // newname(liste_symbole, e);
    // gencode(quad_set(ident, $5.res));
    
    // $$ = 1 + $1;
}
| %empty {
    $$ = 0;
}
;

/*
vide pour éviter les erreurs de syntaxes
*/
appel_de_fonction
: IDENTIFIER liste_operandes {}
| IDENTIFIER {}


%%

void yyerror(const char * msg) {
    fprintf(stderr, "Erreur à la ligne %d : %s\n", yylineno, msg);
}
