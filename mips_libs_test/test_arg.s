.data
    .argc: .word 0
    .argv: .space 1024
    linefeed: .asciiz "\n" 
.text
.globl main
main: 
    move $s0, $a0
    mul $s0, $s0, 4
    move $s1, $a1

    add $s0, $s0, $s1

loop_print_arg:
    beq $s1, $s0, loop_print_arg_end
    lw $a0, ($s1)
    li $v0, 4
    syscall
    addi $s1, $s1, 4

    la $a0, linefeed
    li $v0, 4
    syscall

    b loop_print_arg
loop_print_arg_end:

    li $v0, 10
    syscall