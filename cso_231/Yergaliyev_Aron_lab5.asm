.data
	# arrays to test
	# N1
	# initial_array: .word 0
	# init_array_size: .word 1
	
	# N2
	# initial_array: .word 9
	# init_array_size: .word 1
	
	# N3
	 #initial_array: .word 9, 4, 9
	 #init_array_size: .word 3
	
	# N4
	 #initial_array: .word 9, 9, 9, 9
	 #init_array_size: .word 4
	
	# N5
	# initial_array: .word 9 3 7 9 9 9 2
	# init_array_size: .word 7
	
	# N6
	# initial_array: .word 2, 1, 4, 7, 4, 8, 3, 6, 4, 7
	# init_array_size: .word 10
	
	# N7
	 #initial_array: .word 1,2,3,4,5,6,7,8,9,1,0,1,1,1,2,1,3,1,4,1,5,1,6,1,7,1,8,1,9
	 #init_array_size: .word 29
	
	# N8
	# initial_array: .word 9 9 9 4 3 2 1 9 9 9 3 2 1 9 9 9
	 #init_array_size: .word 16
	
	# N9
	 #initial_array: .word 1,8,4,4,6,7,4,4,0,7,3,7,0,9,5,5,1,6,1,5
	 #init_array_size: .word 20
	initial_array: .word 1, 2, 3, 4
	init_array_size: .word 4
	str1: .asciiz "Initial: "
	str2: .asciiz "PlusOne: "
	
.text
	la $a1, initial_array
	lw $a2, init_array_size
	#init
	li $v0, 4
	la $a0, str1
	syscall
	jal printList
	#newline
	li $v0, 11
	li $a0, '\n'
	syscall
	#new
	li $v0, 4
	la $a0, str2
	syscall
	
	jal plusOne
	jal printList
	
	#end
	li $v0, 10
	syscall
	
	
printList:
	addi $sp $sp -24		
	sw $s1 ($sp)				
	sw $s0 4($sp)
	sw $s3 8($sp)


	#getting vars
	move $s0, $a1	#list
	move $s1, $a2	#size
	
	li $s3, 0	#loop counter 0
	while:
		#num
		li $v0, 1
		lw $a0, 0($s0)
		syscall
		#increment
		addi $s0, $s0, 4
		addi $s3, $s3, 1
		#jumpwhile
		bne $s3, $s1, while
		
		sw $s1 ($sp)				
		sw $s0 4($sp)
		sw $s3 8($sp)
		add $sp $sp 24
		jr $ra


plusOne:
	addi $sp $sp -24		
	sw $s1 ($sp)				
	sw $s2 4($sp)
	sw $s3 8($sp)
	sw $s4 12($sp)
	sw $s5 16($sp)
	sw $s7 20($sp)


	move $s1, $a1 #address
 	move $s2, $a2 #size
 
 	move $s3, $a1 #address
 	move $s4, $a2 #size
 
 	mul $s7, $s2, 4
 	sub $s7, $s7, 4
 	add $s7, $s3, $s7
 
 
 	forloop:
  		lw $s6, 0($s7)
  		sub $s4, $s4, 1
  		li $s5, 9
 		bne $s6, $s5, ifNotNine
   
  		sw $zero, 0($s7)
  		beqz $s4, newArray
  		sub $s7, $s7, 4
  		j forloop
  		newArray:
  			
   			addi $s4, $s2, 1
   			mul $s5, $s4, 4
   			li $v0, 9
   			move $a0, $s5
   			syscall
   			move $s3, $v0
   			la $s3, 0($s3)
   			li $s5, 1
   			sw $s5, 0($s3)
   			addi $s3, $s3, 4
   			sub $s4, $s4, 1
   			loop:
    				sub $s4, $s4, 1

    				sw $zero, 0($s3)

    				addi $s3, $s3, 4
    				beqz $s4, endloop
    				j loop
    
   	endloop:
    		addi $s2, $s2, 1
    		mul $s5, $s2, 4
    		sub $s3, $s3, $s5
    		j exit
  
	exit:
   		move $a1, $s3
   		move $a2, $s2
   		
   		sw $s1 ($sp)				
		sw $s2 4($sp)
		sw $s3 8($sp)
		sw $s4 12($sp)
		sw $s5 16($sp)
		sw $s7 20($sp)
   		add $sp $sp 24
   		jr $ra

  ifNotNine:
  	addi $s6, $s6, 1
  	sw $s6, 0($s7)
  	j exit

			
	
	
	
	