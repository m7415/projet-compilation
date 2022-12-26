.data
_s0: .asciiz "avant le if"
_s1: .asciiz "abauzoids"
_s2: .asciiz abc
_s3: .asciiz unmot
_s4: .asciiz "un truc je suppose"
_s5: .asciiz dinguerie
_s6: .asciiz wow
_s7: .asciiz "double if insane le truc"
_s8: .asciiz feur
_s9: .asciiz quoi
_s10: .asciiz "plus d'idées oskour"
_s11: .asciiz 'après le if'
_s12: .asciiz "encore après"
.text
.globl main
main:
la $a0, _s0
li $v0, 4
syscall
la $a0, _s1
li $v0, 4
syscall
la $t0,_s3
la $t1,_s2
beq $t0, $t1, ADDR
b ADDR
la $a0, _s4
li $v0, 4
syscall
la $t0,_s6
la $t1,_s5
bne $t0, $t1, ADDR
b ADDR
la $a0, _s7
li $v0, 4
syscall
la $t0,_s9
la $t1,_s8
beq $t0, $t1, ADDR
b ADDR
la $a0, _s10
li $v0, 4
syscall
la $a0, _s11
li $v0, 4
syscall
la $a0, _s12
li $v0, 4
syscall
jr $ra
