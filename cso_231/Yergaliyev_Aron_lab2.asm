.text
	li $t0, 1
	li $t1 0x10010000
	sw $t0, 0($t1)
	
	sll $t0, $t0, 1
	sw $t0, 4($t1)
	
	sll $t0, $t0, 1
	sw $t0, 8($t1)
	
	sll $t0, $t0, 1
	sw $t0, 12($t1)

	sll $t0, $t0, 1
	sw $t0, 16($t1)
	
	sll $t0, $t0, 1
	sw $t0, 20($t1)
	
	sll $t0, $t0, 1
	sw $t0, 24($t1)
	
	sll $t0, $t0, 1
	sw $t0, 28($t1)
	
	sll $t0, $t0, 1
	sw $t0, 32($t1)
	
	sll $t0, $t0, 1
	sw $t0, 36($t1)
	
	sll $t0, $t0, 1
	sw $t0, 40($t1)

	sll $t0, $t0, 1
	sw $t0, 44($t1)
	
	sll $t0, $t0, 1
	sw $t0, 48($t1)
	
	sll $t0, $t0, 1
	sw $t0, 52($t1)
	
	sll $t0, $t0, 1
	sw $t0,56($t1)
	
	sll $t0, $t0, 1
	sw $t0,60($t1)
	
	li $v0, 10
	syscall