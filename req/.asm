;Prologue
.import print
.import init
.import new
.import delete
lis $4
.word 4
lis $10
.word print
lis $11
.word 1
sub $29, $30, $4
;end Prologue, begin Body

sw $1, -4($30) ;push $1
sub $30, $30, $4
sw $2, -4($30) ;push $2
sub $30, $30, $4
add $2, $0, $0
sw $31, -4($30) ;push $31
sub $30, $30, $4
lis $5
.word init
jalr $5
add $30, $30, $4 ;pop $31
lw $31, -4($30)
add $3, $0, $0 ;Factor NUM optimization
sw $3, -4($30) ;push $3
sub $30, $30, $4 ;stored dcl product
sw $3, -4($30) ;push $3
sub $30, $30, $4 ;stored dcl counter
lis $3
.word -1 ;All CONST optimization
sw $3, -8($29) ;save $3 to lvalue
lw $3, 0($29) ;load factor $3 <- a
sw $3, -4($30) ;push $3
sub $30, $30, $4
add $3, $0, $0 ;All CONST 0 optimization
add $30, $30, $4 ;pop $5
lw $5, -4($30)
slt $3, $5, $3
sub $3, $11, $3
beq $3, $0, else0
lw $3, -4($29) ;load factor $3 <- b
sw $3, -4($30) ;push $3
sub $30, $30, $4
add $3, $0, $0 ;All CONST 0 optimization
add $30, $30, $4 ;pop $5
lw $5, -4($30)
slt $3, $5, $3
sub $3, $11, $3
beq $3, $0, else1
lw $3, 0($29) ;load factor $3 <- a
sw $3, -4($30) ;push $3
sub $30, $30, $4
lis $3
.word 10 ;All CONST optimization
add $30, $30, $4 ;pop $5
lw $5, -4($30)
slt $3, $5, $3
beq $3, $0, else2
lw $3, -4($29) ;load factor $3 <- b
sw $3, -4($30) ;push $3
sub $30, $30, $4
lis $3
.word 10 ;All CONST optimization
add $30, $30, $4 ;pop $5
lw $5, -4($30)
slt $3, $5, $3
beq $3, $0, else3
add $3, $11, $0 ;All CONST 1 optimization
sw $3, -8($29) ;save $3 to lvalue
add $3, $0, $0 ;All CONST 0 optimization
sw $3, -12($29) ;save $3 to lvalue
loop0: 
lw $3, -12($29) ;load factor $3 <- counter
sw $3, -4($30) ;push $3
sub $30, $30, $4
lw $3, -4($29) ;load factor $3 <- b
add $30, $30, $4 ;pop $5
lw $5, -4($30)
slt $3, $5, $3
beq $3, $0, endWhile0
lw $3, -8($29) ;load factor $3 <- product
sw $3, -4($30) ;push $3
sub $30, $30, $4
lw $3, 0($29) ;load factor $3 <- a
add $30, $30, $4 ;pop $5
lw $5, -4($30)
mult $5, $3
mflo $3
sw $3, -8($29) ;save $3 to lvalue
lw $3, -12($29) ;load factor $3 <- counter
add $5, $11, $0 ;PLUS RS const 1 optimization
add $3, $3, $5 ;PLUS RS const optimization
sw $3, -12($29) ;save $3 to lvalue
beq $0, $0, loop0
endWhile0: 
beq $0, $0, endif3
else3: 
endif3: 
beq $0, $0, endif2
else2: 
endif2: 
beq $0, $0, endif1
else1: 
endif1: 
beq $0, $0, endif0
else0: 
endif0: 
lw $3, -8($29) ;load factor $3 <- product

;Epilogue
add $30, $29, $4
jr $31
