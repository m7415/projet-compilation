.data
    hello: .asciiz "Hello, world!\n"

.text
.globl main
main:
    la $a0, hello   # Charge l'adresse de la chaîne "hello" dans le registre $a0
    li $v0, 4       # Charge le code de l'appel système de sortie de chaîne de caractères dans $v0
    syscall         # Appelle l'appel système de sortie de chaîne de caractères
    jr $ra          # Retourne au point d'appel