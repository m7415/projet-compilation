
.data
    strconcat: .asciiz "concatenation de : \n"
    res:    .asciiz "résultat : "
    taille: .asciiz "taille   : "
    linefeed: .asciiz "\n"
    str1: .asciiz "HELLO THERE !"
    str2: .asciiz "ZBOUBI"
    nullstr: .asciiz ""

.text
.globl strlen
.globl concat

main:
    # la $a0, str1
    # jal strlen

    # move $a0 $v0
    # li $v0, 1 # code for print_int
    # syscall
    # li $v0, 4
    # la $a0, linefeed
    # syscall

    # la $a0, str2
    # jal strlen

    # move $a0 $v0
    # li $v0, 1 # code for print_int
    # syscall
    # li $v0, 4
    # la $a0, linefeed
    # syscall

    la $a0, str1
    la $a1, str2
    jal concat
    move $s0 $v0
    move $s1 $v1

    li $v0, 4
    la $a0, res
    syscall
    move $a0, $s0
    li $v0, 4 # code for print_stirng
    syscall 
    li $v0, 4
    la $a0, linefeed
    syscall
    li $v0, 4
    la $a0, taille
    syscall
    li $v0, 1
    move $a0, $s1
    syscall
    li $v0, 4
    la $a0, linefeed
    syscall
    li $v0 10
    syscall   #exit



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
    # a0 and a1 are adresses to 2 strings
    # after the call, v0 will contain

    move $s0, $a0
    move $s1, $a1

    li $v0, 4
    la $a0, strconcat
    syscall # concaténaion de :
    li $v0, 4
    move $a0, $s0
    syscall # <arg 1>
    li $v0, 4
    la $a0, linefeed
    syscall # \n
    li $v0, 4
    move $a0, $s1
    syscall # <arg 2>
    li $v0, 4
    la $a0, linefeed
    syscall # \n
    

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

    # sub $sp, $sp, 8 # faire de l'espace dans le stack pour sauvegarder ce qui
    # # risque de partir avec jal, et dont on se sert
    # sw $a0, 0($sp)
    # sw $a1, 4($sp)
    move $a0, $s0
    jal strlen # call strlen sur $a0 (notre premier string)
    # lw $a0, 0($sp)
    # lw $a1, 4($sp)
    # addi $sp, $sp, 8
    # > sauvegarde pas utile puisqu'on a chargé nos arguments sans $s0 et $s1

    li $s2, 0  # initaliser à 0 $s2, qui contiendra la somme des tailles des strings
    add $s2, $s2, $v0 # 

    move $a0, $s1 # mettre le 2e string dans $a0
    jal strlen # call strlen sur $a0 (maintenant notre 2e string)

    add $s2, $s2, $v0

    li $v0, 9 # code pour sbrk (allouer $a0 bytes de mémoire)
    move $a0, $s2
    addi $a0, $a0, 1 # +1 pour le \0 final
    syscall
    move $s3, $v0 # $s3 est notre pointeur qui a la bonne taille
    move $t0, $s0 # $t0 pointe au début du premier string
    move $t3, $s3 # $t3 pointe au début du string résultat
concat_loop1:
    lb $t1, 0($t0)
    beqz $t1, concat_loop1_end # si on est arrivé au bout, on sort
    sb $t1, 0($t3) # copier dans résultat
    addi $t0, $t0, 1 # avancer dans le string
    addi $t3, $t3, 1 # avancer dans le résultat
    j concat_loop1
concat_loop1_end:

    move $t0, $s1 # $t0 pointe maintenant au début du 2e string
concat_loop2:
    lb $t1, 0($t0)
    beqz $t1, concat_loop2_end
    sb $t1, 0($t3)
    addi $t0, $t0, 1
    addi $t3, $t3, 1
    j concat_loop2
concat_loop2_end:

    # la $t0, str1
    sb $zero, 0($t3) # bien terminer le résultat


    # li $v0, 1
    # move $a0, $s3
    # syscall
    # li $v0, 4
    # la $a0, linefeed
    # syscall
    # li $v0, 1
    # move $a0, $t3
    # syscall

    move $v0, $s3 # renvoyer $s3 = le string concaténé
    move $v1, $s2 # renvoyer $s2 = somme les longueurs des 2 strings
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
