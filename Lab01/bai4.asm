.text
main:
    li $v0, 5
    syscall
    move $s1, $v0
    
    li $v0, 5
    syscall
    move $s2, $v0
    
    li $v0, 1
    add $a0, $s1, $s2
    syscall
  

