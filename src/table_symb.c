#include "table_symb.h"

struct ctx {
    struct entry * entries[MAX_SYMB_IN_CTX]; 
    int nb_entry; // nombre de symboles
};

// struct entry {
//     enum entry_type type;
//     char name[MAX_IDENT_SIZE];
// };

struct stack_interne {
    struct ctx * current;
    struct stack_interne * next;
};


struct ctx_stack {
    struct stack_interne * head;
};

struct entry * create_entry(char * name, enum entry_type type) {
    struct entry * new_entry = malloc( sizeof(struct entry) );
    new_entry->type = type;
    strncpy(new_entry->name, name, MAX_IDENT_SIZE);
    return new_entry;
}


void pushctx(struct ctx_stack * ctx_stack) {
    struct ctx * new_ctx = malloc( sizeof(struct ctx) );
    new_ctx->nb_entry = 0;

    struct stack_interne * next = malloc( sizeof(struct stack_interne) );

    next->current = new_ctx;
    next->next = ctx_stack->head;
    ctx_stack->head = next;
}

void popctx(struct ctx_stack * ctx_stack, int free_entries) {
    if(ctx_stack->head == NULL) {
        printf("/!\\popctx mais pas de ctx existant (ne devrait pas arriver si on pop pas trop hihi)\n");
        return;
    }
    struct ctx * current_ctx = ctx_stack->head->current;

    if(free_entries == 1) {
        for(int i=0; i<current_ctx->nb_entry; i++) {
            free(current_ctx->entries[i]);
        }
    }
    free(current_ctx);
    struct stack_interne * to_free = ctx_stack->head;
    ctx_stack->head = ctx_stack->head->next;
    free(to_free);
}

void newname(struct ctx_stack * ctx_stack, struct entry * new_entry) {
    if(ctx_stack->head == NULL) {
        printf("pbme ctx_stack\n");
        return;
    }
    struct ctx * ctx = ctx_stack->head->current;
    ctx->entries[ctx->nb_entry] = new_entry;
    ctx->nb_entry++;
}

void newname_global(struct ctx_stack * ctx_stack, struct entry * new_entry) {
    if(ctx_stack->head == NULL) {
        printf("pbme ctx_stack\n");
        return;
    }
    struct stack_interne * cs = ctx_stack->head;
    while(cs->next != NULL) {
        cs = cs->next;
    }
    struct ctx * ctx = cs->current;
    ctx->entries[ctx->nb_entry] = new_entry;
    ctx->nb_entry++;
}

struct ctx_stack * create_ctx_stack(void) {
    struct ctx_stack * ctx_stack = malloc( sizeof(struct ctx_stack) );
    ctx_stack->head = NULL; // pour éviter que valgrind soit pas content, mais
                            // ne sert à rien, j'en suis presque sur
    pushctx(ctx_stack); // on initialise avec un premier stack, vide

    return ctx_stack;
}

void free_ctx_stack(struct ctx_stack * ctx_stack, int free_entries) {
    if(ctx_stack == NULL) {
        return;
    }
    while( ctx_stack->head != NULL ) {
        popctx(ctx_stack, free_entries);
    }
    free(ctx_stack);
}

void print_entry(struct entry * e) {
    if(e == NULL) {
        printf("faut pas demander de print_entry(NULL) >:(\n");
        return;
    }
    switch(e->type) {
        case E_BOOL:
            printf("bool  ");
            break;
        case E_INT:
            printf("int   ");
            break;
        case E_FUNC:
            printf("func  ");
            break;
        case E_STR:
            printf("str   ");
            break;
        case E_TAB:
            printf("tab   ");
            break;
        case E_LOC:
            printf("str   ");
            break;
        default:
            printf("/!\\ unknown type/!\\");
    }
    printf("'%s'", e->name);
    if(e->type == E_TAB) {
        printf(" [%i]", e->taille);
    }
    else if(e->type == E_LOC) {
        printf("  (local : %i)", e->offset_sp);
    }
    else if(e->type == E_FUNC) {
        printf("  (%i params, %i locals)", e->nb_param, e->nb_decl_loc);
    }
}

void print_ctx(struct ctx * c) {
    if(c->nb_entry == 0) {
        printf("(empty ctx)\n");
    }
    for(int i=0; i < c->nb_entry; i++) {
        print_entry(c->entries[i]);
        printf("\n");
    }
}

void print_ctx_stack(struct ctx_stack * ctx_stack) {
    printf("-----current context stack :-----\n");
    if( ctx_stack == NULL ) {
        printf("stack completement vide (ne devrait jamais arriver hihi)\n");
        printf("---------------------------------\n");
        return;
    }
    if(ctx_stack->head == NULL) {
        printf("stack completement vide (ne devrait pas arriver sauf si on a pop tout les ctx)\n");
        printf("---------------------------------\n");   
        return;
    }


    struct stack_interne * st_i = ctx_stack->head;

    while(st_i != NULL) {
        struct ctx * ctx = st_i->current;
        printf("---début ctx---\n");
        print_ctx(ctx);
        printf("---fin ctx---\n");
        st_i = st_i->next;
    }
    printf("---------------------------------\n");

}


struct entry * lookup(struct ctx_stack * ctx_stack, char * name) {
    if(ctx_stack->head == NULL) {
        return NULL;
    }
    struct stack_interne * next = ctx_stack->head;

    while(next != NULL && next->current != NULL) {
        for(int i=0; i<next->current->nb_entry; i++) {
            if( strncmp(name, next->current->entries[i]->name, MAX_IDENT_SIZE) == 0 ) {
                return next->current->entries[i];
            }
        }
        next = next->next;
    }
    return NULL;

}

