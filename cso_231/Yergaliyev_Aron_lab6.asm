.data # you are not allowed to change .data section

	#array: .byte 'a' 'b' 'c' 'd' 'e' 'f'
	#size: .word 6
	#half: .word 3
	
	#array: .byte 'a' 'b'
	#size: .word 2
	#half: .word 1
	
	#array: .byte 'a' 'b' 'c' 'd'
	#size: .word 4
	#half: .word 2
	
	#array: .byte 'a' 'a' 'a' 'd' 'e' 'f'
	#size: .word 6
	#half: .word 3
	
	#array: .byte 't' 't' 't' 't' 'b' 'c' 'f' 'g'
	#size: .word 8
	#half: .word 4
	
	#array: .byte 'b' 'c' 'f' 'g' 't' 't' 't' 't' 
	#size: .word 8
	#half: .word 4
	
	init_str: .asciiz "initial: "
	shuffle_str: .asciiz "\nshuffle: "

.text # starting from here you can change whatever you want
	la $a1 array
	lw $a2 size
	lw $a3 half
	
	la $a0 init_str
	jal printStr	# initial: 
	jal printArray
	
	jal ShuffleArray
	move $a1 $v1	# coz address in $v1
	
	la $a0 shuffle_str
	jal printStr	# shuffle:
	jal printArray
	
	li $v0 10
	syscall
	
ShuffleArray:
	add $sp $sp -36
	sw $ra ($sp)
	sw $s0 4($sp)
	sw $s1 8($sp)
	sw $s2 12($sp)
	sw $s3 16($sp)
	sw $s4 20($sp)
	sw $s5 24($sp)
	sw $s6 28($sp)
	sw $s7 32($sp)
	
	
	move $s0, $a1	#address
	move $s1, $a1	#address
	move $s2, $a2	#size
	move $s3, $a3	#half size

	li $v0, 9	#memory allocation
    	move $a0, $s2
    	syscall
    	
    	move $s4, $v0	#new array address
    	move $s5, $v0
	
	li $s6, 1	#loop counter
	li $s7, 0	#loop counter 0
	
	array_half:	#half address
		add $s1, $s1, 1
		addi $s7, $s7, 1
		bne $s7, $s3, array_half

	first_half:	#first half loop
		lb $s7, ($s0)
		sb $s7, ($s4)
		beq $s6, $s3, reset
		addi $s6, $s6, 1
		addi $s0, $s0, 1
		addi $s4, $s4, 2
		j first_half
	
	reset:	#reset vars
		move $s4, $s5
		addi $s4, $s4, 1
		li $s6, 1
		j second_half
	
	second_half:	#second half loop
		lb $s7, ($s1)		
		sb $s7, ($s4)
		beq $s6, $s3, exit
		addi $s6, $s6, 1
		addi $s1, $s1, 1
		addi $s4, $s4, 2
		j second_half
	
	exit:
		move $v1, $s5
	
	lw $ra ($sp)
	lw $s0 4($sp)
	lw $s1 8($sp)
	lw $s2 12($sp)
	lw $s3 16($sp)
	lw $s4 20($sp)
	lw $s5 24($sp)
	lw $s6 28($sp)
	lw $s7 32($sp)
	add $sp $sp 36
	jr $ra
	
printArray:
	add $sp $sp -36
	sw $ra ($sp)
	sw $s0 4($sp)	# trying to help students
	sw $s1 8($sp)	# so they don't lose points
	sw $s2 12($sp)	# coz of $s registers
	sw $s3 16($sp)	# inside procedures
	sw $s4 20($sp)
	sw $s5 24($sp)
	sw $s6 28($sp)
	sw $s7 32($sp)
	# use $s registers inside procedures
	
	#getting vars
	move $s0, $a1	#list
	move $s1, $a2	#size
	
	li $s3, 0	#loop counter
	loop:
		#num
		li $v0, 11
		lb $a0, 0($s0)
		syscall
		#increment
		addi $s0, $s0, 1
		addi $s3, $s3, 1
		#jumpwhile
		bne $s3, $s1, loop
	
	lw $ra ($sp)
	lw $s0 4($sp)
	lw $s1 8($sp)
	lw $s2 12($sp)
	lw $s3 16($sp)
	lw $s4 20($sp)
	lw $s5 24($sp)
	lw $s6 28($sp)
	lw $s7 32($sp)
	add $sp $sp 36
	jr $ra
	
printStr:
	li $v0 4
	syscall
	jr $ra
