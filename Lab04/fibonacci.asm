.data
   arr: .word 1:50
   Nhap: .asciiz "\nNhap n(1-46): "
   Xuatmang: .asciiz "Chuoi Fibonacci cua n: "
   tb: .asciiz "n khong hop le"
   khoangtrang: .asciiz " "
.text
main: 
   # Nhap n
   li $v0, 4
   la $a0, Nhap
   syscall
   
   li $v0, 5
   syscall
   addi $s0, $v0, 0
   addi $t4, $v0, 0
   
   # Kiem tra n hop le
   li $s3, 1
   slt $s2, $s0, $s3
   beq $s3, $s2, khonghople  
   li $s3, 47
   slt $s2, $s0, $s3
   beq $s2, $0, khonghople
   
   # gan gia tri cho f(1) và f(2) bang 1
   la $t0, arr
   li $s1, 1  
   sw $s1, 0($t0)
   addi $t0, $t0, 4
   sw $s1, 0($t0)
   addi $t0, $t0, 4
   
   jal Fibonacci
   
   # Xuat chuoi Fibonacci
   li $v0, 4
   la $a0, Xuatmang
   syscall
   
   li $t1, 0          
   la $t2, arr 
   jal Xuat
   
   j exit
   
# Xuat mang
Xuat:
   beq $t4, $t1, KetThucMang
     
   li $v0, 1            
   lw $a0, ($t2)
   syscall
     
   li $v0, 4
   la $a0, khoangtrang
   syscall
    
   addi $t1, $t1, 1   
   addi $t2, $t2, 4
    
   j Xuat
   
KetThucMang:
   jr $ra   
   
# Tinh toan gia tri trong day Fibonacci     
Fibonacci: 
   li $s2, 2
   bne $s0, $s2, dequy
   jr $ra
dequy:
   
   addi $sp, $sp, -4
   sw $s0, 0($sp)   # Push N
   addi $sp, $sp, -4
   sw $ra, 0($sp)   # Push $ra
   
   addi $s0, $s0, -1
   jal Fibonacci
   
  
   lw $ra, 0($sp)   # Pop $ra
   addi $sp, $sp, 4
   lw $s0, 0($sp)   # Pop N
   addi $sp, $sp, 4
   
   lw $t1, -4($t0) # $t1 = f(n-1)
   lw $t2, -8($t0) # $t2 = f(n-2)
   add $s1, $t1, $t2 # f(n) = $s1 = f(n-1) + f(n-2)
   # luu f(n) vao mang
   sw $s1, 0($t0)
   addi $t0, $t0, 4
   
   jr $ra
khonghople:
  li $v0, 4
  la $a0, tb
  syscall   
exit:
  li $v0, 10
  syscall     
   
         
