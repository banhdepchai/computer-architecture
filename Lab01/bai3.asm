         .data
string1: .space 50
         .text
main:
li $v0, 8
la $a0, string1
li $a1,50
syscall
li $v0, 4
la $a0,string1
syscall