.data
    string1: .asciiz "avant le if"
    string2: .asciiz "abauzoids"
    string3: .asciiz "un truc je suppose"
    string4: .asciiz "double if insane le truc"
    string5: .asciiz "plus d'idées oskour"
    string6: .asciiz "après le if"
    string7: .asciiz "encore après"
    unmot: .asciiz "unmot"
    wow: .asciiz "wow"
    quoi: .asciiz "quoi"
    abc: .asciiz "abc"
    dinguerie: .asciiz "dinguerie"
    feur: .asciiz "feur"

.text
.globl main
main:
    la $a0, string1
    li $v0, 4
    syscall
    la $a0, string2
    li $v0, 4
    syscall
    la $t0, unmot
    la $t1, abc
    beq $t0, $t1, label_4
    b label_11
label_4:
    la $a0, string3
    li $v0, 4
    syscall
    la $t0, wow
    la $t1, dinguerie
    bne $t0, $t1, label_7
    b label_8
label_7:
    la $a0, string4
    li $v0, 4
    syscall
    b label_8
label_8:
    la $t0, quoi
    la $t1, feur
    beq $t0, $t1, label_10
    b label_11
label_10:
    la $a0, string5
    li $v0, 4
    syscall
    b label_11
label_11:
    la $a0, string6
    li $v0, 4
    syscall
    la $a0, string7
    li $v0, 4
    syscall
    jr $ra