.data
  a: .word 0
  b: .word 0
  c: .word 0
  d: .word 0
.text
main:
  addi $s0, $0, 6
  sw $s0, a
  
  addi $s1, $0, 5
  sw $s1, b
  
  sub $s2, $s0, $s1
  sw $s2, c
    
  add $s3, $s0, $s1
  sw $s3, d
