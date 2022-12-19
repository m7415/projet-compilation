# nom de l'exécutable du compilateur
# rq : le main doit etre dans SRCDIR/$(exec).c
exec=main

# nom de l'exécutable des tests
# rq : le main doit etre dans SRCDIR/$(exec_tests).c
exec_tests=main_tests

# fichier bison (sans l'extension .y)
bisonfile=compil

# fichier lex (sans l'extension .lex)
flexfile=compil

# dossier pour les tests
TESTDIR=./tests

# dossier pour mettre les exécutables
BINDIR=./bin

# dossier où aller chercher les .h
INCLUDEDIR=./include

# dossier où aller chercher les sources du compilateur
SRCDIR=./src

# dossier où les sources générées par flex et bison vont
GENERATEDSRCDIR=./generated-src

# dossier où on met les .o
OBJDIR=./obj

# arguments de gcc
ARGS=-g -Wall -Wextra

# librairies à linker dans gcc
LDLIBS=-lfl


#--------------------------------------------------------------------
# début de la magie

MAIN_COMPIL_C:=$(SRCDIR)/$(exec).c
MAIN_TESTS_C:=$(SRCDIR)/$(exec_tests).c


SRC:=$(wildcard $(SRCDIR)/*.c)
SRC_WO_TEST:=$(filter-out $(MAIN_TESTS_C), $(SRC))
SRC_TEST := $(wildcard $(TESTDIR)/*.c)

INCLUDES:=$(wildcard $(INCLUDEDIR)/*.h) $(bisonfile).tab.h
INCLUDES_TEST := $(wildcard $(TESTDIR)/*.h)

# INCLUDEARG:=$(foreach arg,$(INCLUDEDIR),-I$(arg)) -I$(INCLUDEDIR)
# INCLUDEARG_TEST := -I$(TESTDIR)

OBJECTS_WO_TEST:=$(SRC_WO_TEST:$(SRCDIR)/%.c=$(OBJDIR)/%.o)
OBJECTS_WO_TEST:=$(filter-out $(OBJDIR)/$(bisonfile).tab.o, $(OBJECTS_WO_TEST))
OBJECTS_WO_TEST:=$(filter-out $(OBJDIR)/$(flexfile).yy.o, $(OBJECTS_WO_TEST))
OBJECTS_WO_TEST:=$(filter-out $(OBJDIR)/$(exec).o, $(OBJECTS_WO_TEST))
OBJECTS_TEST := $(SRC_TEST:$(TESTDIR)/%.c=$(OBJDIR)/%.o)

OBJECT_BISON:=$(OBJDIR)/$(bisonfile).tab.o
OBJECT_FLEX:=$(OBJDIR)/$(flexfile).yy.o

HEADER_BISON:=$(GENERATEDSRCDIR)/$(bisonfile).tab.h
SOURCE_BISON:=$(GENERATEDSRCDIR)/$(bisonfile).tab.c
HEADER_FLEX:=$(GENERATEDSRCDIR)/$(flexfile).yy.h
SOURCE_FLEX:=$(GENERATEDSRCDIR)/$(flexfile).yy.c

GENERATED_SOURCE:=$(HEADER_BISON) $(SOURCE_BISON) $(SOURCE_FLEX)

#-----------------------------------------------------
# règles à utiliser

$(BINDIR)/$(exec): $(OBJECT_BISON) $(OBJECT_FLEX) $(OBJECTS_WO_TEST) $(MAIN_COMPIL_C)
	@mkdir -p $(BINDIR)
	gcc -o $@  $^ $(ARGS) $(LDLIBS) 


# on demande juste les .o du compilateur
.PHONY: tests
tests: $(OBJECT_BISON) $(OBJECT_FLEX) $(OBJECTS_WO_TEST) $(OBJECTS_TEST) $(MAIN_TESTS_C)
	@mkdir -p $(BINDIR)
	gcc -o $(BINDIR)/$(exec_tests) $^ $(ARGS) $(LDLIBS) -I.


.PHONY: clean
clean:
	rm -f $(OBJDIR)/* $(GENERATEDSRCDIR)/* $(BINDIR)/*

#-----------------------------
# règles internes, a priori pas à utiliser à la main

$(OBJECT_BISON): $(SRCDIR)/$(bisonfile).y
	@mkdir -p $(OBJDIR)
	@mkdir -p $(GENERATEDSRCDIR)
	bison -o $(SOURCE_BISON) -H$(HEADER_BISON) -d $<
	gcc -o $@ -c $(SOURCE_BISON) $(ARGS)


$(OBJECT_FLEX): $(SRCDIR)/$(flexfile).lex $(HEADER_BISON)
	@mkdir -p $(OBJDIR)
	@mkdir -p $(GENERATEDSRCDIR)
	flex -o $(SOURCE_FLEX) --header-file=$(HEADER_FLEX) $<
	gcc -o $@ -c $(SOURCE_FLEX) $(ARGS)

$(HEADER_BISON): $(OBJECT_BISON)
$(SOURCE_BISON): $(OBJECT_BISON)
$(HEADER_FLEX): $(OBJECT_FLEX)
$(SOURCE_FLEX): $(OBJECT_FLEX)

$(OBJECTS_WO_TEST): $(OBJDIR)/%.o: $(SRCDIR)/%.c $(GENERATED_SOURCE)
	@mkdir -p $(OBJDIR)
	gcc -o $@ -c $< $(ARGS) $(LDLIBS)


$(OBJECTS_TEST): $(OBJDIR)/%.o: $(TESTDIR)/%.c $(GENERATED_SOURCE)
	@mkdir -p $(OBJDIR)
	gcc -o $@ -c $< $(ARGS) $(LDLIBS) -I$(GENERATEDSRCDIR)




.PHONY: test_makefile
test_makefile: 
	@echo "INCLUDES (local): $(INCLUDES)"
	@echo "INCLUDE_TEST    : $(INCLUDES_TEST)"
	@echo "SRC_WO_TEST     : $(SRC_WO_TEST)"
	@echo "GENERATED_SOURCE: $(GENERATED_SOURCE)"
	@echo "OBJECTS_WO_TEST : $(OBJECTS_WO_TEST)"
	@echo "OBJECTS_TEST    : $(OBJECTS_TEST)"
	@echo "OBJECT_FLEX     : $(OBJECT_FLEX)"
	@echo "OBJECT_BISON    : $(OBJECT_BISON)"
