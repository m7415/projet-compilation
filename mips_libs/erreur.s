# on va mettre toutes nos erreurs d'exécution là dedans

.data
    .str_err_pas_entier: .asciiz "Erreur : valeur non convertissable en entier : "
    .str_err_out_of_range_1: .asciiz "Erreur : index out of range ("
    .str_err_out_of_range_2: .asciiz ") pour le tableau : "
    .linefeed: .asciiz "\n"

.text
.globl erreur_pas_entier
.globl erreur_out_of_range

erreur_pas_entier:
    # argument : 
    # a0 : pointeur vers string
    # (pas de retour, le programme s'arrete)
    move $t0, $a0
    li $v0, 4
    la $a0, .linefeed
    syscall
    li $v0, 4
    la $a0, .str_err_pas_entier
    syscall
    li $v0, 4
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, .linefeed
    syscall

    li $v0, 17 # exit2, avec un code d'erreur
    li $a0, 1  # code d'erreur
    syscall # et paf 

erreur_out_of_range:
    # argument :
    # a0 : pointeur vers string : ident
    # a1 : entier (index fautif)
    # (pas de retour, le programme s'arrete)
    move $t0, $a0
    move $t1, $a1

    li $v0, 4
    la $a0, .linefeed
    syscall
    li $v0, 4
    la $a0, .str_err_out_of_range_1
    syscall
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, .str_err_out_of_range_2
    syscall
    li $v0, 4
    move $a0, $t0
    syscall
    li $v0, 4
    la $a0, .linefeed
    syscall
    li $v0, 17 # exit2, avec un code d'erreur
    li $a0, 1  # code d'erreur
    syscall # et paf 