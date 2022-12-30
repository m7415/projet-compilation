
.data
    strconcat: .asciiz "concatenation de : \n"
    res:    .asciiz "résultat : "
    taille: .asciiz "taille   : "
    linefeed: .asciiz "\n"
    str1: .asciiz "ZBOBI"
    str2: .asciiz "TRUCDEOUF"
    nullstr: .asciiz ""
    .align 2 # pour que resultat soit bien aligné, si on veut s'en servir comme d'un int
    resultat: .space 128
    str3: .asciiz "abc123"
    str4: .asciiz "123abc"
    str5: .asciiz "004090"
    est_entier: .asciiz " c'est un entier !"
    est_pas_entier: .asciiz " c'est pas un entier !"

.text
.globl main

main:
#-----------------------------------
    la $s0, str5

    move $a0, $s0 # chargement de l'argument
    jal convert_entier
    sw $v0, resultat

    li $v0, 4
    la $a0, res 
    syscall # Résultat :

    li $v0, 1
    lw $a0, resultat
    syscall # <entier>
    
    li $v0, 4
    la $a0, linefeed
    syscall # \n

    li $v0, 10
    syscall

#-----------------------------------
#     la $s0, str5

#     move $a0, $s0
#     jal verif_entier
#     move $t0, $v0

#     move $a0, $s0
#     li $v0, 4
#     syscall
    
#     beq $t0, 1, if_entier
#     beq $t0, 0, else_entier # oui on peut economiser un branch, menfou


# if_entier:
#     la $a0, est_entier
#     j endif_entier
# else_entier:
#     la $a0, est_pas_entier
# endif_entier:

#     li $v0, 4
#     syscall
#     li $v0, 4
#     la $a0, linefeed
#     syscall

#     li $v0,10
#     syscall

#-----------------------------------
    # la $a0, resultat
    # la $a1, resultat
    # la $a2, str1
    # jal concat
    # la $a0, resultat
    # la $a1, resultat
    # la $a2, str1
    # jal concat
    # la $a0, resultat
    # la $a1, resultat
    # la $a2, str2
    # jal concat
    # move $s0 $v0

    # li $v0, 4
    # la $a0, res
    # syscall

    # la $a0, resultat
    # li $v0, 4 # code for print_stirng
    # syscall 
    # li $v0, 4
    # la $a0, linefeed
    # syscall
    # li $v0, 4
    # la $a0, taille
    # syscall
    # li $v0, 1
    # move $a0, $s0
    # syscall
    # li $v0, 4
    # la $a0, linefeed
    # syscall
    # li $v0 10
    # syscall   #exit

#-----------------------------------
#     la $a0, str1
#     la $a1, str2

#     jal compare

#     move $t0, $v0

#     li $v0, 1
#     move $a0, $t0
#     syscall

#     li $v0,10
#     syscall
