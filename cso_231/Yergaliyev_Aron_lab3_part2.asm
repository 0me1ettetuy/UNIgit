.data
	str1: .asciiz "The width of the diamond: "
	newline: .asciiz "\n"
    	star:    .asciiz "*"
    	space: .asciiz " "
.text
	

	li $v0, 4
	la $a0, str1
	syscall
	
	jal convertStrToInt				# converts the program argument string
	move $a0 $v1					# into integer, the result is in $v1
	li $v0 1					# works only with numbers
	syscall
	

	
	
	main:
    		move $t0, $v1
    		
    		li $v0, 4
		la $a0, newline
		syscall
    		
    		li $t1, 1
    		sub $t3, $t0, 1
    		div $t3, $t0, 2
    		addi $t4, $t3, 0

	
		while:
			li $t2, 0
			beqz $t4, while2
			spaceup:
				li $v0, 4
				la $a0, space
				syscall
				sub $t4, $t4, 1
				bgt $t4, 0, spaceup
			sub $t3, $t3, 1
			addi $t4, $t3, 0
			while2:
			
				li $v0, 4
				la $a0, star
				syscall
			
				addi $t2, $t2, 1
				beq $t2, $t1, newliner
				j while2
		
			newliner:
				li $v0, 4
				la $a0, newline
				syscall
		
			addi $t1, $t1, 2
			bgt $t1, $t0, end
			j while
		
		end:
			sub $t1, $t0, 2
		li $t4, 1
		li $t3, 1
		
		bottom:
			li $t2, 0
			spacedown:
				li $v0, 4
				la $a0, space
				syscall
				sub $t4, $t4, 1
				bgt $t4, 0, spacedown
			addi $t3, $t3, 1
			addi $t4, $t3, 0
			bottom2:
			
				li $v0, 4
				la $a0, star
				syscall
			
				addi $t2, $t2, 1
				beq $t2, $t1, newliner2
				j bottom2
		
			newliner2:
				beq $t1, 1, exit
				li $v0, 4
				la $a0, newline
				syscall
		
			sub $t1, $t1, 2
			#beqz $t1, exit
			#bltz $t1, exit
			j bottom
	
	exit:
       		li $v0, 10
       		syscall
	
	
	
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
