.data
     nhapmang: .asciiz"Nhap n: "
     xuatmang: .asciiz"\nMang da nhap: " 
     khoangtrang: .asciiz" "
     tb1: .asciiz"Nhap a["
     tb2:  .asciiz"]: "
     min: .asciiz"\nmin: "
     max: .asciiz"\nmax: "
     tong: .asciiz"\nTong cac phan tu cua mang = "
     tb3: .asciiz"\nNhap chi so cua phan tu can xuat gia tri trong mang: "
     tb4: .asciiz"a["
     tb5: .asciiz"] = "
     arr: .word 1:50  #Mang gom 50 phan tu
.text
     li $v0, 4
     la $a0, nhapmang
     syscall
     
     li $v0, 5            #Nhap n
     syscall
     addi $t0, $v0, 0
     
     li $s1, 1            #kiem tra n hop le
     slt $s0, $t0, $0
     beq $s0, $s1, end_program
             
     li $t1, 0           # i = 0
     la $t2, arr         # $t2 = arr[0]
     li $t3, 0           #tong = 0
     li $t4, 999999      #min
     li $t5, -999999      #max
     
     jal Nhap
     
     li $v0, 4
     la $a0, xuatmang
     syscall
     
     li $t1, 0          # i = 0
     la $t2, arr        # $t2 = arr[0]
     
     jal Xuat
         
     li $v0, 4          #Xuat Tong
     la $a0, tong
     syscall
     
     li $v0, 1
     addi $a0, $t3, 0
     syscall
     
     la $a0, min       #Xuat Min
     li $v0,4
     syscall
     
     li $v0, 1
     addi $a0, $t4, 0
     syscall
     
     la $a0, max      #Xuat Max
     li $v0,4
     syscall
     
     li $v0, 1
     addi $a0, $t5, 0
     syscall
     
     li $v0,4 
     la $a0, tb3
     syscall
     
     li $v0, 5                 #Nhap chi so i
     syscall
     addi $t3, $v0, 0
     
     li $s1, 1                #kiem tra chi so i nhap vao hop le
     addi $s2, $t0, -1
     slt $s0, $t3, $0
     beq $s0, $s1, end_program
     slt $s0, $t3, $s2
     beq $s0, $s0, end_program
     
     li $v0,4
     la $a0, tb4
     syscall
     
     li $v0,1               
     addi $a0, $t3, 0
     syscall
     
     li $v0, 4
     la $a0, tb5
     syscall
     
     la $t2, arr             #Xuat gia tri cua cua phan tu tuong ung voi chi so i trong mang   
     sll $t4, $t3, 2            
     add $t2, $t2, $t4
     li $v0, 1
     lw $a0, ($t2)
     syscall
     
     
end_program:
    addi $v0, $0, 10
    syscall
     
Nhap: 
     beq $t0, $t1, KetThucMang
     
     li $v0, 4
     la $a0, tb1
     syscall
     
     li $v0,1
     addi $a0, $t1,0
     syscall
     
     li $v0, 4
     la $a0, tb2
     syscall
     
     li $v0, 5              #Nhap gia tri vao mang
     syscall
     sw $v0, ($t2)
     
     addi $t1, $t1, 1       #i = i + 1
     addi $t2, $t2, 4
     
     add $t3, $t3, $v0     #Tinh Tong
     slt $s1, $t4, $v0     #Tim Min
     bne $s1, $0, skip
     addi $t4, $v0, 0
     
     skip:
     slt $s1, $t5, $v0     #Tim Max
     bne $s1, $v0, maxx
     j Nhap
     
     maxx: addi $t5, $v0, 0

     j Nhap

     
Xuat:
    beq $t0, $t1, KetThucMang
     
    li $v0, 1            #Xuat gia tri cac phan tu trong mang
    lw $a0, ($t2)
    syscall
     
    li $v0, 4
    la $a0, khoangtrang
    syscall
     
    addi $t1, $t1, 1    #i = i + 1
    addi $t2, $t2, 4
    
    j Xuat

   
KetThucMang:
     jr $ra
       
