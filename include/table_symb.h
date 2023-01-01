#ifndef TABLE_SYMB_H
#define TABLE_SYMB_H

#include <stdlib.h>
#include <stdio.h>
#include "quads.h" // pour récupérer MAX_IDENT_SIZE, MAX_STRING_SIZE

#define MAX_SYMB_IN_CTX 256  // nombre max de symbole dans un contexte
                             // (pour faire que des tableaux statiques)


enum entry_type {
    E_INT,  // inutilisé
    E_BOOL, // inutilisé
    E_FUNC,
    E_STR,
    E_TAB
};

struct entry {
    enum entry_type type;
    char name[MAX_IDENT_SIZE];
    int taille; // pour les E_TAB
};

struct ctx_stack; 

// renvois une nouvelle entry (pas rattachée à un contexte pour l'instant)
// renvois un objet alloué dynamiquement, mais jamais besoin de le free
// à la main (c'est fait par free_ctx_stack et popctx)
struct entry * create_entry(char * name, enum entry_type type);


void print_entry(struct entry * e);

// renvois l'entry correspondant au nom demandé
struct entry * lookup(struct ctx_stack * ctx_stack, char * name);

// rajoute un contexte
void pushctx(struct ctx_stack * ctx_stack);

// supprime le dernier contexte
// libère la mémoire allouée au ctx
// si free_entries = 1, ça libère aussi la mémoire des entries
// sinon, ça ne libère pas la mémoire des entries
// (c'est pour la liste des symboles utilisée dans le main)
void popctx(struct ctx_stack * ctx_stack, int free_entries);

// ajoute une entry au contexte actuel
void newname(struct ctx_stack * ctx_stack, struct entry * new_entry);

// ajoute une entry globale (dans le ctx le plus large)
void newname_global(struct ctx_stack * ctx_stack, struct entry * new_entry);

// créé et renvois un stack de contexte
struct ctx_stack * create_ctx_stack(void);


// libère la mémoire allouée pour le stack
// si free_entries = 1, ça libère la mémoire des entries
// sinon, ça ne libère pas la mémoire des entries
// (c'est pour la liste des symboles utilisée dans le main)
void free_ctx_stack(struct ctx_stack * ctx_stack, int free_entries);

void print_ctx_stack(struct ctx_stack * ctx_stack);


#endif