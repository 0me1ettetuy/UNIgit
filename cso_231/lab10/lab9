.data
	twoD: .double 2.0
	minus: .word -1
	array1: .double 2.3	4.4	4.6	4.8	5.5
	size1: .word 5
	array_text_1: .asciiz "Array1: 2.3 4.4 4.6 4.8 5.5\n"
	array2: .double 2.3	4.4	4.7	4.8	5.5	11.0
	size2: .word 6
	array_text_2: .asciiz "Array2: 2.3 4.4 4.7 4.8 5.5 11.0\n"
	array3: .double 2.3	4.4	4.7	9.4	5.1	10.1
	size3: .word 6
	array_text_3: .asciiz "Array3: 2.3 4.4 4.7 9.4 5.1 10.1\n"
	array4: .double 2.3	4.4	4.7	7.4	5.1	10.1
	size4: .word 6
	array_text_4: .asciiz "Array4: 2.3 4.4 4.7 7.4 5.1 10.1\n"
	array5: .double 2.3
	size5: .word 1
	array_text_5: .asciiz "Array5: 2.3\n"
	res: .asciiz "Result: "
	newline: .asciiz "\n"
	space: .asciiz " "
	message: .asciiz "There are no 'x' and '2x' elements in the array."
.text
#1
la $a0, array_text_1
jal printstr
la $a0, res
jal printstr

la $a0, array1
lw $a1, size1

jal xand2x
jal printres
la $a0, newline
jal printstr
jal printstr

#2
la $a0, array_text_2
jal printstr
la $a0, res
jal printstr

la $a0, array2
lw $a1, size2

jal xand2x
jal printres
la $a0, newline
jal printstr
jal printstr

#3
la $a0, array_text_3
jal printstr
la $a0, res
jal printstr

la $a0, array3
lw $a1, size3

jal xand2x
jal printres
la $a0, newline
jal printstr
jal printstr

#4
la $a0, array_text_4
jal printstr
la $a0, res
jal printstr

la $a0, array4
lw $a1, size4

jal xand2x
jal printres
la $a0, newline
jal printstr
jal printstr


#5
la $a0, array_text_5
jal printstr
la $a0, res
jal printstr

la $a0, array5
lw $a1, size5

jal xand2x
jal printres
la $a0, newline

li $v0, 10
syscall

xand2x:
	addi $sp $sp -32
    	sw $ra, 0($sp)
    	sw $s0, 4($sp)
    	sw $s1, 8($sp)
    	sw $s2, 12($sp)
    	sw $s3, 16($sp)

    	
    	l.d $f16, twoD
    	move $s0, $a0
    	li $s1, 0

    	Loop1:
        	l.d $f10, 0($s0)          
        	mul.d $f10, $f10, $f16   

		move $s2, $a0
        	li $s3, 0	     
        	           

       		Loop2:
            		l.d $f12, 0($s2)     
            		c.eq.d $f12, $f10      
           		bc1t Found            
            		addi $s2, $s2, 8      
            		addi $s3, $s3, 1      
            		bne $s3, $a1, Loop2  

    		addi $s0, $s0, 8               
    		addi $s1, $s1, 1              
    		bne $s1, $a1, Loop1           

    		li $v0, -1                     
    		j Exit

	Found:
    		move $v0, $s1                  
    		move $v1, $s3              
		j Exit

	Exit:
    		lw $ra, 0($sp)                 
    		lw $s0, 4($sp)                
    		lw $s1, 8($sp)
    		lw $s2, 12($sp)
    		lw $s3, 16($sp)
    		addi $sp $sp 32          
    		jr $ra                        

printstr:
	li $v0, 4
	syscall
	jr $ra

printint:
	li $v0, 1
	syscall
	jr $ra
	
printres:
	lw $t0, minus
	beq $v0, $t0, nox
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	la $a0, space
	li $v0, 4
	syscall
	
	move $a0, $v1
	li $v0, 1
	syscall
	
	jr $ra
	
	nox:
		la $a0, message
		li $v0, 4
		syscall
		jr $ra
		
	