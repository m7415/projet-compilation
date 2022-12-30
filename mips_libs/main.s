
.data
    strconcat: .asciiz "concatenation de : \n"
    res:    .asciiz "résultat : "
    taille: .asciiz "taille   : "
    linefeed: .asciiz "\n"
    str1: .asciiz "ZBOBI"
    str2: .asciiz "TRUCDEOUF"
    nullstr: .asciiz ""
    resultat: .space 128

.text
.globl main

main:
    la $a0, resultat
    la $a1, resultat
    la $a2, str1
    jal concat
    la $a0, resultat
    la $a1, resultat
    la $a2, str1
    jal concat
    la $a0, resultat
    la $a1, resultat
    la $a2, str2
    jal concat
    move $s0 $v0

    li $v0, 4
    la $a0, res
    syscall
    la $a0, resultat
    li $v0, 4 # code for print_stirng
    syscall 
    li $v0, 4
    la $a0, linefeed
    syscall
    li $v0, 4
    la $a0, taille
    syscall
    li $v0, 1
    move $a0, $s0
    syscall
    li $v0, 4
    la $a0, linefeed
    syscall
    li $v0 10
    syscall   #exit

# main:
#     la $a0, str1
#     la $a1, str2

#     jal compare

#     move $t0, $v0

#     li $v0, 1
#     move $a0, $t0
#     syscall

#     li $v0,10
#     syscall
