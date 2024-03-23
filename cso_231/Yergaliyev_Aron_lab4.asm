.data
	str1: .asciiz "The width of the diamond: "
	str2: .asciiz "No diamond for you! Give an odd number in [3, 21]"
	newline: .asciiz "\n"
    	star:    .asciiz "*"
    	space: .asciiz " "
.text
	


	jal convertStrToInt		# converts the program argument string
					# into integer, the result is in $v1
					# works only with numbers
	jal drawDiamond
	li $v0, 10
       	syscall
	
	drawDiamond:
		addi $sp $sp -24			# saving values of "saved" registers, which they had before the procedure call
		sw $s0 ($sp)
		sw $s1 4($sp)
		sw $s2 8($sp)
		sw $s3 12($sp)
		sw $s4 16($sp)
		sw $s5 20($sp)
	
	
		move $s7, $ra
    		move $s0, $v1	#a1 has the input value
    		
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
			StarDown:
				jal printStar
			
				addi $s2, $s2, 1
				bne $s2, $s1, StarDown		

			beq $s1, 1, exit
			jal printNewline
			sub $s1, $s1, 2
			j bottom
	
	exit:
		sw $s0 ($sp)
		sw $s1 4($sp)
		sw $s2 8($sp)
		sw $s3 12($sp)
		sw $s4 16($sp)
		sw $s5 20($sp)
		add $sp $sp 24
       		jr $s7
       		#li $v0, 10
       		#syscall
       		
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

	
	
	
	convertStrToInt:
		addi $sp $sp -24			# saving values of "saved" registers, which they had
		sw $s0 ($sp)				# before the procedure call
		sw $s7 4($sp)
		sw $s3 8($sp)
		sw $s4 12($sp)
		sw $s5 16($sp)
		
		li $s3 10				# for converting 5 to 50
		lw $s4 ($a1)				# get the address of the number (it's of type string actually)	
		loop:
			lb $s0 ($s4)			# get the char from the string
			beq $s0 $zero loopEnd		# if meet \0, string is finished
		
			mul $s7 $s7 $s3			# t7 = old value * 10
			andi $s5 $s0 0x0F		# t5 = convert char to int
			add $s7 $s7 $s5			# t7 += t5
		
			addi $s4 $s4 1			# move to the next char
			j loop
		loopEnd:
		move $v1 $s7				# saving the result int in $v1, coz it's a return register
		
		lw $s0 ($sp)				# restoring values of $s registers, which they had
		lw $s7 4($sp)				# before the procedure call,
		lw $s3 8($sp)				# coz they are "saved" registers.
		lw $s4 12($sp)				# And for all the local variables inside the procedures
		lw $s5 16($sp)				# you must use $s registers
		add $sp $sp 24
	jr $ra
