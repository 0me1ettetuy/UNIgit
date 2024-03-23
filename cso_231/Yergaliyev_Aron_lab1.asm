.data
	a: .word 20
	c: .word 11
	x: .word 25
	y: .word 3
	g: .word -34
	k: .word 77
	z: .word 5
.text
	lw $s0, a($zero)
	lw $s1, c($zero)
	lw $s2, x($zero)
	lw $s3, y($zero)
	lw $s4, g($zero)
	lw $s5, k($zero)
	lw $s6, z($zero)
	
	add $t1, $s0, $s1
	sub $t2, $s2, $s3
	sub $t3, $s0, $s4
	div $t4, $t3, $s6
	sub $t5, $t1, $t2
	sub $t6, $t5, $t4
	mul $t7, $t6, $s5
	
	li $v0, 1
	add $a0, $zero, $t7
	syscall