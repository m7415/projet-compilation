

.text
.globl verif_entier


verif_entier:
    # arguments :
    # a0 : adresse d'un string

    # retour :
    # v0 : 1 si a0 ne contient que des chiffres 0-9
    #      0 sinon

    move $t0 $a0 
verif_entier_loop:
    lb $t1, 0($t0) # $t1 <- a0[t0]
    beq $t1, 0, verif_entier_fin_loop
    blt $t1, 48, verif_entier_false
    bgt $t1, 57, verif_entier_false
    addi $t0, $t0, 1
    j verif_entier_loop

verif_entier_fin_loop:
    li $v0, 1 # vrai
    j verif_entier_fin

verif_entier_false:
    li $v0, 0 # faux
verif_entier_fin:
    jr $ra # return
