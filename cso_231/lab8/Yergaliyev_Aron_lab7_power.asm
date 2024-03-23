.data
	double_array: .double 2.0    2.0    -3.0    -3.0    -4.2    5.0    -2    0.0    0.0
	power_array: 	.word 5		 -4		2    	1    	0    	-2	   -3	 0		10
	N_OF_CASES: .word 9
	str_case: .asciiz "case_"
	str_colon: .asciiz ": "
	str_equal: .asciiz " = "
	one: .double 1.0
	zeroDouble: .double 0.0
	str_pow: .byte '^'

.text
.globl power
	li $t0, 0
	lw $t1, N_OF_CASES
	la $t2, double_array
	la $t3, power_array
	Loop:
		jal prntcs
		move $a0, $t0
		li $v0, 1
		syscall
		jal prntcln
		
		#prnt doub
		sll $t5, $t0, 3
		l.d $f12, double_array($t5)
		#l.d $f12, 0($t2)
		mov.d $f14, $f12
		li $v0, 3
		syscall
		jal prntpow
		#prnt int
		sll $t5, $t0, 2
		lw $a0, power_array($t5)
		move $a1, $a0
		li $v0, 1
		syscall

		jal prnteql

		li $a2, 0
		la $t4, one
		l.d $f0, 0($t4)
		jal power
		
		jal prntdoub
		

		addi $t0, $t0, 1
		beq $t0, $t1, end
		jal prntnew
		j Loop

	end:
		li $v0, 10
		syscall

	# you must implement power using recursion
	# double x (in $f14), int n (in $a1)
	power:
		l.d $f28, zeroDouble
		c.eq.d $f14, $f28
		bc1t exitZero
		bnez $a2 skipadsave
		andi $sp 0xfffffff8	# need it to write doubles into $sp
		addi $sp $sp -32
		s.d $f20 ($sp)	# example how to use floating saved register
		sw $ra 8($sp)
		#s.d $f0 16($sp)
		s.d $f14 24($sp)


		skipadsave:
			#Print a0
			#Print f0

			bgez $a1, skipneg
			neg $a1, $a1
			div.d  $f14, $f0, $f14
			skipneg:
			beqz $a1 exit
			mul.d $f0 $f0 $f14
			sub $a1 $a1 1
			add $a2 $a2 1
			jal power

		
	exit:
		lw $ra 8($sp)
		l.d $f20 ($sp)
		#l.d $f0 16($sp)
		l.d $f14 24($sp)
		addi $sp $sp 32
		jr $ra
	
	exitZero:
		l.d $f0, zeroDouble
		jr $ra
		
prntcs:
	la $a0, str_case
	li $v0, 4
	syscall
	jr $ra

prntcln:
	la $a0, str_colon
	li $v0, 4
	syscall
	jr $ra
	
prnteql:
	la $a0, str_equal
	li $v0, 4
	syscall
	jr $ra
	
prntpow:
	lb $a0, str_pow
	li $v0, 11
	syscall
	jr $ra
	
prntnew:
	la $a0, 10
	li $v0, 11
	syscall
	jr $ra
	
prntdoub:
	mov.d $f12, $f0
	li $v0, 3
	syscall
	jr $ra
	
	# f0 - $f2 Floating point procedure results
	# $f4 - $f10 Temporary registers. Not preserved across procedure calls
	# $f12 - $f14 Floating point procedure parameters. Not preserved across procedure calls
	# $f16 - $f18 Temporary floating point registers. Not preserved across procedure calls
	# $f20 - $f30 Saved floating point values. Preserved across procedure calls
