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


// struct list * list_copy(struct list * l) {
//     // if( l == NULL) {
//     //     return NULL;
//     // }
//     // struct list * newl = list_creer(l->addr);
//     // return concat()
//     return NULL; //TODO ?
// }


void list_print(struct list * l) {
    if( l == NULL ) {
        printf("empty list");
        return;
    }
    printf("%lu ", l->addr);
    struct list * next = l->next;
    while(next != NULL) {
        printf("%lu ", l->addr);
        next = next->next;
    }
}


void list_free(struct list * l) {
    if(l == NULL) {
        return;
    } 
    free(l->next);
    free(l);
}

