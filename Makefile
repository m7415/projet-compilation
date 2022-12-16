# Définir les cibles
EXE = mon_programme
TEST_EXE = mon_programme_tests

# Définir les fichiers sources
SRCS = $(wildcard *.c)
LEX_SRCS = $(wildcard *.lex)
YACC_SRCS = $(wildcard *.y)
OBJS = $(SRCS:.c=.o)
LEX_OBJS = $(LEX_SRCS:.lex=.lex.o)
YACC_OBJS = $(YACC_SRCS:.y=.y.o)

# Définir les options de compilation
CC = gcc
CFLAGS = -Wall -Wextra -Werror
LDFLAGS =

# Définir les cibles de compilation
all: $(EXE)

tests: $(TEST_EXE)

# Définir la cible de nettoyage
clean:
	rm -f $(EXE) $(TEST_EXE) $(OBJS) $(LEX_OBJS) $(YACC_OBJS)

# Définir les règles de compilation
$(EXE): $(OBJS) $(LEX_OBJS) $(YACC_OBJS)
	$(CC) $(LDFLAGS) $^ -o $@

$(TEST_EXE): $(OBJS) $(LEX_OBJS) $(YACC_OBJS)
	$(CC) $(LDFLAGS) $^ -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.lex.o: %.lex.c
	$(CC) $(CFLAGS) -c $< -o $@

%.y.o: %.y.c
	$(CC) $(CFLAGS) -c $< -o $@

%.lex.c: %.lex
	flex -o $@ $<

%.y.c: %.y
	bison -d -o $@ $<
