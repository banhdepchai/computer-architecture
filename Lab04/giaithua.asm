.data
  Nhap: .asciiz "Nhap vao so n(0-12): "
  Xuat: .asciiz "! = "
  tb: .asciiz "n khong hop le"
.text
main:
  li $v0, 4
  la $a0, Nhap
  syscall
  
  li $v0, 5
  syscall
  addi $s0, $v0, 0
  addi $t0, $v0, 0
  
  li $s3, 1
  slt $s2, $s0, $0
  beq $s3, $s2, khonghople
  li $s3, 13
  slt $s2, $s0, $s3
  beq $s2, $0, khonghople
  
  jal giaithua
  
  addi $a0, $t0, 0
  li $v0, 1
  syscall
  
  li $v0, 4
  la $a0, Xuat
  syscall
  
  addi $a0, $s1, 0
  li $v0, 1
  syscall
  
  j exit
  
giaithua:  
  bne $s0, $0, dequy
  li $s1, 1
  jr $ra
dequy:  
  addi $sp, $sp, -4
  sw $s0, 0($sp)
  addi $sp, $sp, -4
  sw $ra, 0($sp)
  
  addi $s0, $s0, -1
  jal giaithua
  
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  lw $s0, 0($sp)
  addi $sp, $sp, 4
  
  mul $s1, $s1, $s0
  jr $ra
  
khonghople:
  li $v0, 4
  la $a0, tb
  syscall
exit:
  li $v0, 10
  syscall  