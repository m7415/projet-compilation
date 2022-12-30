.text
.globl convert_entier

convert_entier:
    # arguments :
    # $a0 : adresse du string à convertir
    # retour :
    # $v0 : valeur convertie
    # si le string passé en argument n'est pas uniquement composé de chiffres,
    # le programme s'arrete (j erreur_pas_entier)

    sub $sp, $sp, 36 # faire de l'espace dans le stack pour sauvegarder les registres
    sw $ra, 0($sp) # sauvegarder $ra, $s0-7
    sw $s0, 4($sp) 
    sw $s1, 8($sp) 
    sw $s2, 12($sp) 
    sw $s3, 16($sp) 
    sw $s4, 20($sp) 
    sw $s5, 24($sp) 
    sw $s6, 28($sp) 
    sw $s7, 32($sp) 

    move $s0, $a0 # ($s0 <- str)

    jal verif_entier # est-ce que le string passé est bien numérique ?
    beq $v0, 0, erreur_pas_entier # si pas entier, exit(1)

    li $t0, 0 # entier à renvoyer
convert_entier_loop:
    lb $t1, 0($s0)
    beqz $t1, convert_entier_loop_end

    mul $t0, $t0, 10 
    subi $t0,$t0,48  # 48 est le code ascii de '0'
    add $t0, $t0, $t1

    addi $s0, $s0, 1
    j convert_entier_loop
convert_entier_loop_end:

    move $v0, $t0

    lw $ra, 0($sp) # restaurer
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    lw $s2, 12($sp) 
    lw $s3, 16($sp) 
    lw $s4, 20($sp) 
    lw $s5, 24($sp) 
    lw $s6, 28($sp) 
    lw $s7, 32($sp) 
    addi $sp, $sp, 36 # réduire le stack

    jr $ra # return