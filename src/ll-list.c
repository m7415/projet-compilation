#include "ll-list.h"
#include <sys/types.h>
#include <stdlib.h>

struct list * list_concat(struct list * l1, struct list * l2) {
    if(l1 == NULL) return l2;
    if(l2 == NULL) return l1;
    l1->next = list_concat(l1->next,l2);
    return l1;
}


struct list * list_creer(size_t addr) {
    struct list * newl = malloc(sizeof(struct list));
    newl->next = NULL;
    newl->addr = addr;
    return newl;
}

void list_free(struct list * l) {
    free(l);
}