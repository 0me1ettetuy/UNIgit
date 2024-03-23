.data
	message: .asciiz "We have 8 arguments:\n"
	message2: .asciiz "The end"
	tire: .asciiz " - "
	newline: .asciiz "\n"
.text
	main:
	
		move $t0, $a0
		move $t1, $a1
		
		#top meassage
		li $v0, 4
		la $a0, message
		syscall
		
		
		
		#loop counter 0
		addi $t2, $zero, 0
		while:
			beq $t2, $t0, exit
			jal printer
			#increment
			addi $t1, $t1, 4
			addi $t2, $t2, 1
			#jumpwhile
			j while
		exit:
			#bottom message
			li $v0, 4
			la $a0, message2
			syscall
		
	#end
	li $v0, 10
	syscall
	
	printer:
		#num
		li $v0, 1
		add $a0, $t2, $zero
		syscall
		#tire
		li $v0, 4
		la $a0, tire
		syscall
		#word
		li $v0, 4
		lw $a0, 0($t1)
		syscall
		#newline
		li $v0, 4
		la $a0, newline
		syscall
		#jumploop
		jr $ra
		