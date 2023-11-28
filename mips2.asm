.data
prompt_str:     .asciiz "Enter num >= 25: "
illegal_str:    .asciiz "Illegal number!\n"
Break:          .asciiz "\n"

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

    # Initialize Fibonacci sequence elements
    li $t0, 0
    li $t1, 1

    # Loop to generate and print the Fibonacci sequence
    addi $t2, $s0, 1
fibonacci_loop:
    # Print the current Fibonacci element
    move $a0, $t0
    li $v0, 1
    syscall

    # Print a line break
    li $v0, 4
    la $a0, Break
    syscall

    # Calculate the next Fibonacci element
    add $t3, $t0, $t1
    move $t0, $t1
    move $t1, $t3

    # Decrement the counter
    sub $t2, $t2, 1

    # Check if we've printed the desired number of elements
    bgtz $t2, fibonacci_loop

    # Exit program
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