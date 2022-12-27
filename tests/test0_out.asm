.data
    _s0: .asciiz "avant le if"
    _s1: .asciiz "abauzoids"
    _s2: .asciiz "unmot"
    _s3: .asciiz "abc"
    _s4: .asciiz "un truc je suppose"
    _s5: .asciiz "wow"
    _s6: .asciiz "dinguerie"
    _s7: .asciiz "double if insane le truc"
    _s8: .asciiz "quoi"
    _s9: .asciiz "feur"
    _s10: .asciiz "plus d'idées oskour"
    _s11: .asciiz "après le if"
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
   la $t0,_s2
   la $t1,_s3
   beq $t0, $t1, _l0
   b _l1
_l0:
   la $a0, _s4
   li $v0, 4
   syscall
   la $t0,_s5
   la $t1,_s6
   bne $t0, $t1, _l2
   b _l3
_l2:
   la $a0, _s7
   li $v0, 4
   syscall
_l3:
   la $t0,_s8
   la $t1,_s9
   beq $t0, $t1, _l4
   b _l1
_l4:
   la $a0, _s10
   li $v0, 4
   syscall
_l1:
   la $a0, _s11
   li $v0, 4
   syscall
   la $a0, _s12
   li $v0, 4
   syscall
    jr $ra
