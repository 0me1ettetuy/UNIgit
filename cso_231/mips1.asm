.data
	str1: .asciiz "The width of the diamond: "
	str2: .asciiz "No diamond for you! Give an odd number in [3, 21]"
	newline: .asciiz "\n"
    	star:    .asciiz "*"
    	space: .asciiz " "
.text
	#la $s6, 0x10010000
	#lw $s6, $a0
	#move $s6, $a0	#num
	#move $s7, $a1	#val
	
	#li $v0, 4
	#lw $a0, 0($s7)
	#syscall
	
	li $s0, 0
	li $s1, 10
	jal converter

	
	li $a1 4
	#do something like a1 = v1
	drawDiamond:
    		move $s0, $a1	#a1 has the input value
    		
    		blt $s0, 3, no	#checking if n in [3, 21] and odd
    		bgt $s0, 21, no
    		andi $s5, $s0, 1
    		beqz $s5, no
    		#addi $s5, $s0, 0
    		#div $s5, $s5, 2
    		#mul $s5, $s5, 2
    		#bne $s0, $s5, no
    		
    		li $v0, 4
		la $a0, str1
		syscall
		
    		jal printNewline
    		li $s1, 1
    		sub $s3, $s0, 1
    		div $s3, $s0, 2
    		addi $s4, $s3, 0
		up:
			li $s2, 0
			beqz $s4, StarUp
			SpaceUp:
				jal printSpace
				sub $s4, $s4, 1
				bgt $s4, 0, SpaceUp
			sub $s3, $s3, 1
			addi $s4, $s3, 0
			StarUp:
				jal printStar
			
				addi $s2, $s2, 1
				bne $s2, $s1, StarUp
				
			jal printNewline
			addi $s1, $s1, 2
			bgt $s1, $s0, upend
			j up
		
		upend:
			sub $s1, $s0, 2
		
		li $s4, 1
		li $s3, 1
		
		bottom:
			li $s2, 0
			SpaceDown:
				jal printSpace
				sub $s4, $s4, 1
				bgt $s4, 0, SpaceDown
			addi $s3, $s3, 1
			addi $s4, $s3, 0
			bottom2:
				jal printStar
			
				addi $s2, $s2, 1
				bne $s2, $s1, bottom2		

			beq $s1, 1, exit
			jal printNewline
		
			sub $s1, $s1, 2
			j bottom
	
	exit:
       		li $v0, 10
       		syscall

   		
converter:
    lb $s2, ($a1)
    beqz $s2, back
    subi $s2, $s2, '0'
    mul $s0, $s0, $s1
    add $s0, $s0, $s2
    addi $a0, $a0, 1
    j converter
    back:
    	jr $ra
       		
no:
	li $v0, 4
	la $a0, str2
	syscall
	j exit
	
printNewline:	#newline_print
	li $v0, 4
	la $a0, newline
	syscall
	jr $ra
	
printSpace:	#space_print
	li $v0, 4
	la $a0, space
	syscall
	jr $ra
printStar:	#star_print
	li $v0, 4
	la $a0, star
	syscall
	jr $ra
