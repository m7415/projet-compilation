.data
    .empty_string_copy : .asciiz ""
.text
.globl copy_string


copy_string:
# arguments :
# $a0 le string à copier
# retour :
# $v0 l'adresse d'un nouveau string identique à $a0


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

    move $s0, $a0 # string à copier

    jal strlen
    move $s1, $v0

    li $v0, 9 # sbrk
    addi $a0, $s1, 1 # +1

    syscall
    move $s2, $v0 # adresse du nveau string

    move $a0, $s2
    move $a1, $s0
    la $a2, .empty_string_copy
    jal concat
    
    move $v0, $s2
    
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