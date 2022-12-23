#ifndef LL_LIST_H
#define LL_LIST_H
#include <sys/types.h>
#include <stdio.h>

struct list {
    size_t addr;
    struct list * next;
};

struct list * list_creer();
void list_free(struct list * l);
struct list * list_concat(struct list * l1, struct list * l2);

// struct list * list_copy(struct list * l);

void list_print(struct list * l);

#endif