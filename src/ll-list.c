#include "ll-list.h"
#include <sys/types.h>
#include <stdlib.h>

struct list * list_concat(struct list * l1, struct list * l2) {
    if(l1 == NULL) return l2;
    // if(l2 == NULL) return l1;
    // l1->next = list_concat(l1->next,l2);
    // l1->next = l2;
    struct list * next = l1;
    while(next->next != NULL) {
        next = next->next;
    }
    next->next = l2;
    return l1;
}


struct list * list_creer(size_t addr) {
    struct list * newl = malloc(sizeof(struct list));
    newl->next = NULL;
    newl->addr = addr;
    return newl;
}

// struct list * list_add(struct list * liste, size_t addr) {
//     struct list * newl = list_creer(addr);
//     return list_concat(liste, newl);
// }


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
        printf("%lu ", next->addr);
        next = next->next;
    }
}


void list_free(struct list * l) {
    if(l == NULL) {
        return;
    } 
    list_free(l->next);
    free(l);
}

struct qo_list * qo_list_creer(struct quadop qo) {
    struct qo_list * newl = malloc(sizeof(struct qo_list));
    newl->next = NULL;
    newl->val = qo;
    return newl;
}
void qo_list_free(struct qo_list * l) {
    if(l == NULL) return;
    qo_list_free(l->next);
    free(l);
}
void qo_list_append(struct qo_list * l, struct quadop qo) {
    if(l == NULL) {
        fprintf(stderr, "erreur append sur qo_list vide\n");
        exit(1);
    }
    struct qo_list * newl = malloc(sizeof(struct qo_list));
    newl->next = NULL;
    newl->val = qo;
    struct qo_list * next = l;
    while(next->next != NULL) {
        next = next->next;
    }
    next->next = newl;
}
void qo_list_print(struct qo_list * l) {
    if(l == NULL) {
        printf("(empy list)");
        return;
    }
    struct qo_list * next = l;
    while(next != NULL) {
        print_quadop(next->val, NULL);
        next = next->next;
    }
}