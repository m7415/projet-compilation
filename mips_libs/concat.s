

.text
.globl strlen
.globl concat

strlen:
    # args :
    #   $a0 : pointer to a null-terminated string
    # return value :
    #   $v0 : length of the string in $a0

    # pas besoin de sauvegarder s0-7 et ra, parce qu'on ne s'en sert pas
    li $v0, 0 # initialisation du compteur
loopstrlen: 
    lb $t0, 0($a0) # prochain caractère dans $t1
    beqz $t0 endstrlen
    addi $a0, $a0, 1 # ajouter 1 à a0, pour avancer dans le string
    addi $v0, $v0, 1 # ajouter 1 au compteur
    j loopstrlen

endstrlen:
    jr $ra # return


concat:
    # arguments :
    # a0 : adresse du string où sera stocké le résultat
    # a1 et a2 : adresses des strings à concaténer
    # retour :
    # v0 : taille du string résultant (pas forcement utile mais voilà)
    # a0 contient toujours la meme adresse qu'au début, mais maintenant
    #    c'est la concaténation de a1 et a2
   
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

    move $s0, $a0
    move $s1, $a1
    move $s2, $a2

    move $a0, $s1
    jal strlen # call strlen sur $a0 (notre premier string)
    
    li $s3, 0  # initaliser à 0 $s3, qui contiendra la somme des tailles des strings
    add $s3, $s3, $v0 # 

    move $a0, $s2 # mettre le 2e string dans $a0
    jal strlen # call strlen sur $a0 (maintenant notre 2e string)

    add $s3, $s3, $v0

    move $t0, $s1 # $t0 pointe au début du premier string
    move $t3, $s0 # $t3 pointe au début du string résultat
concat_loop1:
    lb $t1, 0($t0)
    beqz $t1, concat_loop1_end # si on est arrivé au bout, on sort
    sb $t1, 0($t3) # copier dans résultat
    addi $t0, $t0, 1 # avancer dans le string
    addi $t3, $t3, 1 # avancer dans le résultat
    j concat_loop1
concat_loop1_end:

    move $t0, $s2 # $t0 pointe maintenant au début du 2e string
concat_loop2:
    lb $t1, 0($t0)
    beqz $t1, concat_loop2_end
    sb $t1, 0($t3)
    addi $t0, $t0, 1
    addi $t3, $t3, 1
    j concat_loop2
concat_loop2_end:
    sb $zero, 0($t3) # bien terminer le résultat

    move $v0, $s3 # renvoyer $s3 = somme les longueurs des 2 strings
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
