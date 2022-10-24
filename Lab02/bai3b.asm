.data
    nhap1: .asciiz"\nNhap vao so thu nhat: "
    nhap2: .asciiz"Nhap vao so thu hai: "
    tong: .asciiz"\nTong cua 2 so: "
    hieu: .asciiz"\nHieu cua 2 so: " 
    tich: .asciiz"\nTich cua 2 so: "
    thuong: .asciiz"\nThuong cua 2 so: "
    du: .asciiz" du "
    max: .asciiz"\nSo lon hon la: "
    bang: .asciiz"\nHai so bang nhau"
.text
    la $a0, nhap1
    jal Xuat
    li $v0, 5
    syscall
    addiu $t0, $v0, 0
    
    la $a0, nhap2
    jal Xuat
    li $v0, 5
    syscall 
    addiu $t1, $v0, 0
    
    
    la $a0, tong
    jal Xuat
    add $t2, $t0, $t1
    li $v0, 1
    addi $a0, $t2, 0  
    syscall
    
    la $a0, hieu
    jal Xuat
    sub $t3, $t0, $t1
    li $v0, 1
    addi $a0, $t3, 0
    syscall
    
    la $a0, tich
    jal Xuat
    mult $t0, $t1
    mflo $t4
    addi $a0, $t4, 0
    li $v0, 1
    syscall
    
    la $a0, thuong
    jal Xuat
    div $t0, $t1
    mflo $t5
    addi $a0, $t5, 0
    li $v0, 1
    syscall
    la $a0, du
    jal Xuat
    mfhi $t5
    addi $a0, $t5, 0
    li $v0, 1
    syscall
    
    slt $t6, $t0, $t1
    beq $t6, 1, label1
    beq $t0, $t1, label2
    beq $t6, 0, label3
    
label1:
    la $a0,max
    jal Xuat
    li $v0, 1
    addi $a0, $t1, 0
    syscall
    j end_program
    
label2:
    la $a0, bang
    jal Xuat
    j end_program
label3:
    la $a0,max
    jal Xuat
    li $v0, 1
    addi $a0, $t0, 0
    syscall
    j end_program
    
end_program:
    li $v0, 10
    syscall  
    
Xuat:
    li $v0, 4
    syscall
    jr $ra
