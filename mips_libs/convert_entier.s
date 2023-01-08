.text
.globl convert_entier
.globl convert_string

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

    lb $t0, 0($s0)
    beq $t0, 45, convert_entier_ifneg
    li $s1, 0
    b convert_entier_ifneg_end
convert_entier_ifneg:
    li $s1, 1
    addi $s0, $s0, 1 # sauter le "-"
convert_entier_ifneg_end:

    move $a0, $s0
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
    beq $s1, 1, convert_entier_invsigne
    b convert_entier_invsigne_end
convert_entier_invsigne:
    mul $v0, $v0, -1
convert_entier_invsigne_end:

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


convert_string:
# arguments :
# $a0 : valeur entière à reconvertir en string
# $a1 : addresse du string résultat
# pas de retour
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

    move $s0, $a0 # entier à convertir
    move $s1, $a1 # resultat

    blt $s0, 0, convert_string_ifneg
    b convert_string_ifneg_end
convert_string_ifneg:
    li $t0, 45
    sb $t0, 0($s1)
    addi $s1, $s1, 1
    mul $s0, $s0, -1
convert_string_ifneg_end:

    move $t0, $s0
    li $s2, 0 # combien de chiffres dans le nombre ?
convert_string_loop_count:
    li $t2, 10
    div $t0, $t2
    mflo $t0 # quotient 
    mfhi $t1 # reste
    addi $s2, $s2, 1
    beq $t0, 0, convert_string_loop_count_end
    b convert_string_loop_count
convert_string_loop_count_end:
    move $t0, $s0
    add $t1, $s1, $s2
    subi $t1, $t1, 1 # pointeur dans resultat
convert_string_loop_conv:
    li $t2, 10
    div $t0, $t2
    mflo $t0 # quotient
    mfhi $t3 # reste
    addi $t3, $t3, 48 # repasser en ascii
    sb $t3, 0($t1)
    subi $t1, $t1, 1

    
    beq $t0,0, convert_string_loop_conv_end
    b convert_string_loop_conv
convert_string_loop_conv_end:
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