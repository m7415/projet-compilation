#ifndef LL_LIST_H
#define LL_LIST_H
#include <sys/types.h>
#include <stdio.h>
#include <quads.h>

struct list {
    size_t addr;
    struct list * next;
};


struct list * list_creer(size_t addr);
void list_free(struct list * l);
struct list * list_concat(struct list * l1, struct list * l2);
void list_print(struct list * l);

// --------
// en dessous, c'est un peu un doublon de struct list
// mais spécifiquement pour <liste-opérandes>
// en réalité le plus "propre" serait de faire une unique structure ll-list
// ayant pour valeur un "void*" (ie on peut stocker n'importe quel pointeur)
// mais c'est moins pratique à utiliser
struct qo_list {
    struct quadop val;
    struct qo_list * next;
};
struct qo_list * qo_list_creer(struct quadop qo);
void qo_list_free(struct qo_list * l);
void qo_list_append(struct qo_list * l, struct quadop qo);
void qo_list_print(struct qo_list * l);

#endif