# Projet Compilation

Ce compilateur a été développé dans le cadre d'un projet du master SDSC, et vise à compiler un langage de programmation simplifié en code exécutable.

## Fonctionnalités

- Analyse lexicale et syntaxique du code source
- Génération de code exécutable pour la plateforme cible
- Support de différentes instructions de base, telles que les affectations, les boucles et les conditions
- Support de fonctions et de paramètres

## Prérequis

Pour utiliser ce compilateur, vous aurez besoin de :

- Un ordinateur exécutant un système d'exploitation compatible (Linux, macOS, Windows)
- Un compilateur C (gcc ou clang)
- Les outils Flex et Bison pour générer les analyseurs lexical et syntaxique

## Installation

Pour utiliser ce compilateur, suivez les étapes suivantes : 

1. Clonez ce repository sur votre ordinateur en utilisant la commande `git clone https://github.com/mon_utilisateur/mon_compilateur.git`
2. Accédez au répertoire du compilateur en utilisant la commande `cd mon_compilateur`
3. Exécutez la commande `make` pour compiler le compilateur
4. Vous pouvez maintenant utiliser le compilateur en exécutant la commande `./mon_programme <fichier_source>`

## Tests

Pour vérifier le bon fonctionnement du compilateur, vous pouvez exécuter les tests en utilisant la commande `make tests`. Cela exécutera une série de tests qui vérifieront les différentes fonctionnalités du compilateur.
