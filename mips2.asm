    .data
prompt_str:     .asciiz "Enter num >= 25: "
illegal_str:    .asciiz "Illegal number!\n"

    .text
    .globl main

main:
    # Print prompt
    li $v0, 4          # system call for print_str
    la $a0, prompt_str # load address of prompt_str into $a0
    syscall

    # Read integer from user
    li $v0, 5          # system call for read_int
    syscall
    move $s0, $v0      # store user input in $s0

check_input:
    # Compare the entered number with 25
    li $t0, 25
    blt $s0, $t0, input_invalid

    # Print a message indicating valid input
    li $v0, 4          # system call for print_str
    la $a0, prompt_str # load address of prompt_str into $a0
    syscall
    j exit_program

input_invalid:
    # Print an error message
    li $v0, 4           # system call for print_str
    la $a0, illegal_str # load address of illegal_str into $a0
    syscall

    # Prompt the user again
    li $v0, 4          # system call for print_str
    la $a0, prompt_str # load address of prompt_str into $a0
    syscall

    # Read integer from user again
    li $v0, 5          # system call for read_int
    syscall
    move $s0, $v0      # store user input in $s0
    j check_input

exit_program:
    # Exit program
    li $v0, 10         # system call for exit
    syscall
