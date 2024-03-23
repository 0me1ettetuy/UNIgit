.data
    newline: .asciiz "\n"
    star: .asciiz "*"
    space: .asciiz " "
    
.text

main:
	li $t0, 3
	li $t1, 1

	
	while:
		li $t2, 0
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
		addi $t1, $t0, 1
		div $t1, $t1, 2
		#sub $t2, $t0, 2
		#j bottom
		
	bottom:
		li $t2, 0
		bottom2:
			
			li $v0, 4
			la $a0, star
			syscall
			
			addi $t2, $t2, 1
			beq $t2, $t1, newliner2
			j bottom2
		
		newliner2:
			li $v0, 4
			la $a0, newline
			syscall
		
		subi $t1, $t1, 2
		bltz $t1, exit
		j bottom
	
exit:
	# Exit
       	li $v0, 10
       	syscall

        
