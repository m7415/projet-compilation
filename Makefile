# nom de l'exécutable du compilateur
# rq : le main doit etre dans $(exec).c
exec=main

# nom de l'exécutable des tests
# rq : le main doit etre dans $(exec_tests).c
exec_tests=main_test

# fichier bison
bisonfile=compil

# fichier lex
flexfile=compil

# dossier pour les tests
TESTDIR=./tests

# dossier pour mettre les exécutables
BINDIR=.

# dossier où aller chercher les .h
INCLUDEDIR=.

# dossier où aller chercher les sources du compilateur
SRCDIR=.

# dossier où on met les .o
OBJDIR=./obj

# arguments de gcc
ARGS=-g -Wall -Wextra

# librairies à linker dans gcc
LDLIBS=-lfl


#--------------------------------------------------------------------
# début de la magie

SRC:=$(wildcard $(SRCDIR)/*.c)
SRC_WO_TEST:=$(filter-out $(exec_tests).c, $(SRC))
# SRC_TEST := $(wildcard $(TESTDIR)/*.c)

INCLUDES:=$(wildcard $(INCLUDEDIR)/*.h) $(bisonfile).tab.h
# INCLUDES_TEST := $(wildcar $(TESTDIR)/*.h)

INCLUDEARG:=$(foreach arg,$(INCLUDEDIR),-I$(arg)) -I$(INCLUDEDIR)
# INCLUDEARG_TEST := -I$(TESTDIR)

OBJECTS_WO_TEST:=$(SRC_WO_TEST:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
OBJECTS_WO_TEST:=$(filter-out $(OBJDIR)/$(bisonfile).tab.o, $(OBJECTS_WO_TEST))
OBJECTS_WO_TEST:=$(filter-out $(OBJDIR)/$(flexfile).yy.o, $(OBJECTS_WO_TEST))
# OBJECTS_TEST := $(SRC_TEST:$(TESTDIR)/%.c=$(OBJDIR)/%.o)

OBJECT_BISON:=$(OBJDIR)/$(bisonfile).tab.o
OBJECT_FLEX:=$(OBJDIR)/$(flexfile).yy.o

HEADER_BISON:=$(bisonfile).tab.h

main: $(OBJECT_BISON) $(OBJECT_FLEX) $(OBJECTS) $(exec).c
	gcc $(ARGS) $^ $(LDLIBS) -o $@


$(OBJECT_BISON): $(bisonfile).y
	bison -d $(bisonfile).y
	gcc -o $@ -c $(bisonfile).tab.c $(ARGS)


$(OBJECT_FLEX): $(flexfile).lex $(HEADER_BISON)
	flex -o $(flexfile).yy.c $<
	gcc -o $@ -c $(flexfile).yy.c $(ARGS)


$(OBJECTS_WO_TEST): $(OBJDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(OBJDIR)
	gcc -o $@ -c $< $(CFLAGS) $(INCLUDEARG) $(LDLIBS)


.PHONY: clean
clean:
	rm -f $(OBJDIR)/* *.yy.* *.tab.* $(exec) $(exec_tests)



.PHONY: test
test: 
	@echo "INCLUDES (local): $(INCLUDES)"
	@echo "INCLUDEARG      : $(INCLUDEARG)"
	@echo "LIBARG          : $(LIBARG)"
	@echo "SOURCES         : $(SRC)"
	@echo "SOURCES_WO_MAIN : $(SRC_WO_MAIN)"
	@echo "OBJECTS         : $(OBJECTS)"
	@echo "OBJECTS_WO_MAIN : $(OBJECTS_WO_MAIN)"