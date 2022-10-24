.data
    strNhap: .asciiz"\nNhap ky tu (chi 1 ky tu): "
    strTruoc: .asciiz"\nKy tu dung truoc: "
    strSau: .asciiz"\nKy tu dung sau: "
    strNone: .asciiz"None"
    strInvalid:	.asciiz "\nInvalid type"
    strNumber: .asciiz"\nNumber!"
    strUpperCharacter: .asciiz"\nUpper Character!"
    strLowerCharacter: .asciiz"\nLower Character"
.text
main:
    la $a0,strNhap
    jal Xuat
    
    li $v0, 12
    syscall
    addiu $t0, $v0, 0
    
   
li $t1, '0'
li $t2, '9'
jal f_InRangeChecker
beq $t3, 1, valid_case 

li $t1, 'a'
li $t2, 'z'
jal f_InRangeChecker
beq $t3, 1, valid_case 

li $t1, 'A'
li $t2, 'Z'
jal f_InRangeChecker
beq $t3, 1, valid_case 

j invalid_case

valid_case:
la $a0, strTruoc
li $v0, 4
syscall

addiu $a0, $t0, -1 
li $v0, 11 

li $t1, 'a'
li $t2, 'A'
li $t3, '0'
jal f_EqualChecker
beq $t4, 0, print_prev_character
la $a0, strNone
li $v0, 4

print_prev_character:
syscall

la $a0, strSau
li $v0, 4
syscall

addiu $a0, $t0, 1
li $v0, 11

li $t1, 'z'
li $t2, 'Z'
li $t3, '9'
jal f_EqualChecker
beq $t4, 0, print_next_character
la $a0, strNone
li $v0, 4

print_next_character:
syscall

slti $t4, $t0, 0
beq $t4, 1, invalid_case

slti $t4, $t0, ':'
beq $t4, 1, number_case

slti $t4, $t0, 'A'
beq $t4, 1, invalid_case

slti $t4, $t0, '['
beq $t4, 1, upper_character_case

slti $t4, $t0, 'a'
beq $t4, 1, invalid_case

slti $t4, $t0, '{'
beq $t4, 1, lower_character_case

invalid_case:
la $a0, strInvalid
li $v0, 4
syscall
j end_program

number_case:
la $a0, strNumber
li $v0, 4
syscall
j end_program

upper_character_case:
la $a0, strUpperCharacter
li $v0, 4
syscall
j end_program

lower_character_case:
la $a0, strLowerCharacter
li $v0, 4
syscall
j end_program


f_InRangeChecker:
addiu $t1, $t1, -1
addiu $t2, $t2, 1

slt $t3, $t1, $t0 
slt $t4, $t0, $t2
and $t3, $t3, $t4 
jr $ra 

f_EqualChecker:

beq $t0, $t1, f_EqualChecker_TrueCase
beq $t0, $t2, f_EqualChecker_TrueCase
beq $t0, $t3, f_EqualChecker_TrueCase

li $t4, 0 
jr $ra 

f_EqualChecker_TrueCase: 
li $t4, 1
jr $ra 

end_program:
    li $v0, 10
    syscall
   
Xuat: 
    li $v0, 4
    syscall
    jr $ra
    
    
