.text
.globl compare


compare:
    # arguments :
    # $a0 : str1
    # $a1 : str2
    # 
    # return values:
    # $v0 : 0   if str1 == str2
    #       1   else

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

    move $s0, $a0 # str1
    move $s1, $a1 # str2

    move $a0, $s0
    jal strlen
    move $s2, $v0 # length of str1
    move $a0, $s1
    jal strlen
    move $s3, $v0 # length of str2

    bne $s2, $s3, compare_diff # si tailles différentes, différent

    move $t0, $s0
    move $t1, $s1
compare_loop:
    lb $t2, 0($t0) # caractère dans str1
    lb $t3, 0($t1) # caractère dans str2
    beqz $t2, compare_equal # si on est arrivé au bout, ok
    bne $t2, $t3, compare_diff # dès qu'on trouve une différence, on sort
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    j compare_loop

compare_equal:
    li $v0, 0
    j compare_exit
compare_diff:
    li $v0, 1
    # j compare_exit
compare_exit:
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

