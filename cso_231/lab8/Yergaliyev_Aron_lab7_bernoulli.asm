.data
	twoDouble: .double 799.0
	oneDouble: .double 1.0 
	zeroDouble: .double 0.0
	onePointFive: .double 1.5
	zeroPointFive: .double 0.5
	two: .double 2.0
	twoPointFive: .double 2.5
	five: .double 5.0
	three: .double 3.0
	sixDouble: .double 6.0
	fourtyTwo: .double 42.0
	x_1: .double 0.2
	x_2: .double 0.5
	x_3: .double 0.8
	thirty: .double 30.0
	str3_1: .asciiz "Bernoulli_3 (x=0.2) is 0.048, my answer is "
	str3_2: .asciiz "Bernoulli_3 (x=0.5) is 0.0, my answer is "
	str3_3: .asciiz "Bernoulli_3 (x=0.8) is -0.048, my answer is "
	str4_1: .asciiz "\nBernoulli_4 (x=0.2) is -0.00773333, my answer is "
	str4_2: .asciiz   "Bernoulli_4 (x=0.5) is 0.0291667, my answer is "
	str4_3: .asciiz   "Bernoulli_4 (x=0.8) is -0.00773333, my answer is "
	str5_1: .asciiz "\nBernoulli_5 (x=0.2) is -0.02368, my answer is "
	str5_2: .asciiz   "Bernoulli_5 (x=0.5) is 0.0, my answer is "
	str5_3: .asciiz   "Bernoulli_5 (x=0.8) is 0.02368, my answer is "
	str6_1: .asciiz "\nBernoulli_6 (x=0.2) is 0.00691352, my answer is "
	str6_2: .asciiz   "Bernoulli_6 (x=0.5) is -0.0230655, my answer is "
	str6_3: .asciiz   "Bernoulli_6 (x=0.8) is 0.00691352, my answer is "
.text
	.globl Bernoulli_1
	.globl Bernoulli_2
	.globl Bernoulli_3
	.globl Bernoulli_4
	.globl Bernoulli_5
	.globl Bernoulli_6
	
	#.include "Yergaliyev_Aron_lab7_power.asm"
	la $a0 str3_1
	jal printStr
	
	l.d $f12 x_1
	jal Bernoulli_3 
	mov.d $f12 $f2
	jal printFloat
	
	jal newline
	
	la $a0 str3_2
	jal printStr
	
	l.d $f12 x_2
	jal Bernoulli_3 
	mov.d $f12 $f2
	jal printFloat
	
	jal newline
	
	la $a0 str3_3
	jal printStr
	
	l.d $f12 x_3
	jal Bernoulli_3 
	mov.d $f12 $f2
	jal printFloat
	
	jal newline
	
	la $a0 str4_1
	jal printStr
	
	l.d $f12 x_1
	jal Bernoulli_4 
	mov.d $f12 $f2
	jal printFloat
	
	jal newline
	
	la $a0 str4_2
	jal printStr
	
	l.d $f12 x_2
	jal Bernoulli_4 
	mov.d $f12 $f2
	jal printFloat
	
	jal newline
	
	la $a0 str4_3
	jal printStr
	
	l.d $f12 x_3
	jal Bernoulli_4 
	mov.d $f12 $f2
	jal printFloat
	
	jal newline
	
	la $a0 str5_1
	jal printStr
	
	l.d $f12 x_1
	jal Bernoulli_5 
	mov.d $f12 $f2
	jal printFloat
	
	jal newline
	
	la $a0 str5_2
	jal printStr
	
	l.d $f12 x_2
	jal Bernoulli_5 
	mov.d $f12 $f2
	jal printFloat
	
	jal newline
	
	la $a0 str5_3
	jal printStr
	
	l.d $f12 x_3
	jal Bernoulli_5 
	mov.d $f12 $f2
	jal printFloat
	
	jal newline
	
	la $a0 str6_1
	jal printStr
	
	l.d $f12 x_1
	jal Bernoulli_6 
	mov.d $f12 $f2
	jal printFloat
	
	jal newline
	
	la $a0 str6_2
	jal printStr
	
	l.d $f12 x_2
	jal Bernoulli_6 
	mov.d $f12 $f2
	jal printFloat
	
	jal newline
	
	la $a0 str6_3
	jal printStr
	
	l.d $f12 x_3
	jal Bernoulli_6 
	mov.d $f12 $f2
	jal printFloat
	
	li $v0 10
	syscall
	# each bernoulli should be a function, with parameter 'double x',
	# calls power  
	
	# B_1(x)	=	x - 1/2	
	# B_2(x)	=	x^2 - x + 1/6	
	# B_3(x)	=	x^3 - 1.5x^2 + 0.5x	
	# B_4(x)	=	x^4 - 2x^3 + x^2 - 1/(30)	
	# B_5(x)	=	x^5 - 2.5x^4 + (5/3)x^3 - (1/6)x	
	# B_6(x)	=	x^6 - 3x^5 + 2.5x^4 - 0.5x^2 + 1/(42).	
 
 	Bernoulli_1: # parameter 'double x' in f12, return result in $f2
		andi $sp 0xfffffff8
		addi $sp $sp -32
		s.d $f20 ($sp)
		s.d $f22 8($sp)
		s.d $f24 16($sp)
		sw $ra 24($sp)
		
		mov.d $f14, $f12
		l.d $f6, x_2

		sub.d $f2, $f14, $f6
											
		l.d $f20 ($sp)
		l.d $f22 8($sp)
		l.d $f24 16($sp)
		lw $ra 24($sp)
		addi $sp $sp 32
		jr $ra
		
	Bernoulli_2: # parameter 'double x' in f12, return result in $f2
		andi $sp 0xfffffff8
		addi $sp $sp -64
		s.d $f20 ($sp)
		s.d $f22 8($sp)
		s.d $f24 16($sp)
		sw $ra 24($sp)
		s.d $f0 32($sp)
		s.d $f8 40($sp)
		

		
		
		mov.d $f14, $f12
		
		li $a1, 2
		li $a2, 0
		l.d $f0, oneDouble
		jal power
		mov.d $f20, $f0
		#mov.d $f12, $f0
		#li $v0, 3
		#syscall
		
		l.d $f6, oneDouble
		l.d $f8, sixDouble
		div.d $f6, $f6, $f8
		
		sub.d $f2, $f20, $f14
		add.d $f2, $f2, $f6
		
						
		l.d $f20 ($sp)
		l.d $f22 8($sp)
		l.d $f24 16($sp)
		lw $ra 24($sp)
		l.d $f0 32($sp)
		l.d $f8 40($sp)

		addi $sp $sp 64
		jr $ra
	
	Bernoulli_3: # parameter 'double x' in f12, return result in $f2
		andi $sp 0xfffffff8
		addi $sp $sp -64
		s.d $f20 ($sp)
		s.d $f22 8($sp)
		s.d $f24 16($sp)
		sw $ra 24($sp)
		s.d $f0 32($sp)
		s.d $f8 40($sp)
		
		mov.d $f14, $f12
		
		li $a1, 3
		li $a2, 0
		l.d $f0, oneDouble
		jal power
		mov.d $f20, $f0
		
		li $a1, 2
		li $a2, 0
		l.d $f0, oneDouble
		jal power
		mov.d $f22, $f0
		
		l.d $f6, onePointFive
		mul.d $f22, $f22, $f6
		l.d $f6, zeroPointFive
		mul.d $f24, $f12, $f6
		sub.d $f20, $f20, $f22
		add.d $f2, $f20, $f24	
											
		l.d $f20 ($sp)
		l.d $f22 8($sp)
		l.d $f24 16($sp)
		lw $ra 24($sp)
		l.d $f0 32($sp)
		l.d $f8 40($sp)

		addi $sp $sp 64
		jr $ra
	
	# B_4(x)	=	x^4 - 2x^3 + x^2 - 1/(30)
	Bernoulli_4: # parameter 'double x' in f12, return result in $f2
		andi $sp 0xfffffff8
		addi $sp $sp -64
		s.d $f20 ($sp)
		s.d $f22 8($sp)
		s.d $f24 16($sp)
		sw $ra 24($sp)
		s.d $f0 32($sp)
		s.d $f8 40($sp)
		
		mov.d $f14, $f12
 
  		li $a1, 4
  		li $a2, 0
		l.d $f0, oneDouble
  		jal power
  		mov.d $f20, $f0
  
  		li $a1, 3
  		li $a2, 0
		l.d $f0, oneDouble
  		jal power
  		mov.d $f22, $f0
  		l.d $f6, two
  		mul.d $f22, $f22, $f6
  
  		li $a1, 2
  		li $a2, 0
		l.d $f0, oneDouble
  		jal power
  		mov.d $f24, $f0
  
  		sub.d $f20, $f20, $f22
  		add.d $f20, $f20, $f24
  		l.d $f6, oneDouble
  		l.d $f8, thirty
  		div.d $f24, $f6, $f8
  		sub.d $f2, $f20, $f24



		
		l.d $f20 ($sp)
		l.d $f22 8($sp)
		l.d $f24 16($sp)
		lw $ra 24($sp)
		l.d $f0 32($sp)
		l.d $f8 40($sp)

		addi $sp $sp 64
		jr $ra
		
	# B_5(x)	=	x^5 - 2.5x^4 + (5/3)x^3 - (1/6)x
	Bernoulli_5: # parameter 'double x' in f12, return result in $f2
		andi $sp 0xfffffff8
		addi $sp $sp -64
		s.d $f20 ($sp)
		s.d $f22 8($sp)
		s.d $f24 16($sp)
		sw $ra 24($sp)
		s.d $f0 32($sp)
		s.d $f8 40($sp)
		
		mov.d $f14, $f12
  
  		li $a1, 5
    		li $a2, 0
		l.d $f0, oneDouble
  		jal power
  		mov.d $f20, $f0
  
  		li $a1, 4
    		li $a2, 0
		l.d $f0, oneDouble
  		jal power
  		mov.d $f22, $f0
  
  		li $a1, 3
    		li $a2, 0
		l.d $f0, oneDouble
  		jal power
  		mov.d $f24, $f0
  
  		l.d $f6, twoPointFive
  		mul.d $f22, $f22, $f6
  		l.d $f6, five
  		mul.d $f24, $f24, $f6
  		l.d $f6, three
  		div.d $f24, $f24, $f6
  		l.d $f6, sixDouble
  		div.d $f14, $f14, $f6
  		sub.d $f20, $f20, $f22
  		add.d $f20, $f20, $f24
  		sub.d $f2, $f20, $f14
		
		l.d $f20 ($sp)
		l.d $f22 8($sp)
		l.d $f24 16($sp)
		lw $ra 24($sp)
		l.d $f0 32($sp)
		l.d $f8 40($sp)

		addi $sp $sp 64
		jr $ra
		
	# B_6(x)	=	x^6 - 3x^5 + 2.5x^4 - 0.5x^2 + 1/(42).
	Bernoulli_6: # parameter 'double x' in f12, return result in $f2
		andi $sp 0xfffffff8
		addi $sp $sp -64
		s.d $f20 ($sp)
		s.d $f22 8($sp)
		s.d $f24 16($sp)
		sw $ra 24($sp)
		s.d $f0 32($sp)
		s.d $f8 40($sp)
		
		mov.d $f14, $f12
  
  		li $a1, 6
      		li $a2, 0
		l.d $f0, oneDouble
  		jal power
  		mov.d $f20, $f0
  
  		li $a1, 5
      		li $a2, 0
		l.d $f0, oneDouble
  		jal power
  		mov.d $f22, $f0
  		l.d $f6, three
  		mul.d $f22, $f22, $f6
  
  		li $a1, 4
      		li $a2, 0
		l.d $f0, oneDouble
  		jal power
  		mov.d $f24, $f0
  		l.d $f6, twoPointFive
  		mul.d $f24, $f24, $f6
  
  		sub.d $f20, $f20, $f22
  		add.d $f20, $f20, $f24
  
  		li $a1, 2
      		li $a2, 0
		l.d $f0, oneDouble
  		jal power
  		mov.d $f24, $f0
  		l.d $f6, zeroPointFive
  		mul.d $f24, $f24, $f6
  		sub.d $f20 , $f20, $f24
  		l.d $f6, oneDouble
  		l.d $f8, fourtyTwo
  		div.d $f24, $f6, $f8
  		add.d $f2, $f20, $f24
		
		
		l.d $f20 ($sp)
		l.d $f22 8($sp)
		l.d $f24 16($sp)
		lw $ra 24($sp)
		l.d $f0 32($sp)
		l.d $f8 40($sp)

		addi $sp $sp 64
		jr $ra
	newline:
		li $a0 10
		li $v0 11
		syscall
		jr $ra
		
	printFloat:	# prints whatever is inside $f12
		li $v0 3
		syscall
		jr $ra

	printStr:
		li $v0 4
		syscall
		jr $ra
