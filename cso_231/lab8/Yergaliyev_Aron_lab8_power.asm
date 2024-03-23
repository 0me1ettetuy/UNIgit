.data
	DISPLAY: .space 524288
	DISPLAYWIDTH: .word 512
	DISPLAYHEIGHT: .word 256
	RED: .word 0xFF0000			# Bernoulli_1
	GREEN: .word 0x00FF00		# Bernoulli_2
	BLUE: .word  0x6495ED 		# Bernoulli_3
	DEEPSKYBLUE: .word 0x00BFFF # Bernoulli_4
	BROWN: .word 0x793627		# Bernoulli_5
	LIGHTCORAL: .word 0xF08080	# Bernoulli_6
	CYAN: .word 0x33ffec
	
	zeroPointThirtyFive: .double 0.3	# for Bernoulli_1
	zeroPointSeventyFive: .double 0.7
	
	zero_point_zero_one: .double 0.001	# x should increase by this much
	
	x_stretch: .double 512.0	# need to stretch x,y values coz we have 512 pixels by 256 pixels plane
	y_stretch: .double 768.0
	center: .double 128.0
	centerWord: .word 128
	
	
	
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

.text
	


l.d $f0, zeroPointThirtyFive
l.d $f24, zeroPointSeventyFive
l.d $f18, zero_point_zero_one
l.d $f16, oneDouble
l.d $f20, x_stretch
l.d $f22, y_stretch
l.d $f8, center
lw $t1, centerWord


Loop_111:
	mov.d $f12, $f0
	jal Bernoulli_1
	
	
	mul.d $f4, $f20, $f0	#strech x
	cvt.w.d $f4, $f4
	mfc1 $a0, $f4		#int part div
	
    	mul.d $f2, $f22, $f2	#strech y
    	sub.d $f2, $f8, $f2	#make center 128
    	cvt.w.d $f2, $f2
    	mfc1 $a1, $f2   	
	

	lw $a2, RED
	jal set_pixel_color
	
	add.d $f0, $f0, $f18	#increment X
	c.le.d $f0, $f24   # Compare if f0 < f2
    	bc1t Loop_111

l.d $f0, zeroDouble
l.d $f24, oneDouble

Loop_2:
	mov.d $f12, $f0
	jal Bernoulli_2
	mov.d $f12, $f2

	
	mul.d $f4, $f20, $f0	#strech x
	cvt.w.d $f4, $f4
	mfc1 $a0, $f4		#int part div
	
    	mul.d $f2, $f22, $f2	#strech y
    	sub.d $f2, $f8, $f2	#make center 128
    	cvt.w.d $f2, $f2
    	mfc1 $a1, $f2	

	lw $a2, GREEN
	jal set_pixel_color 
	
	add.d $f0, $f0, $f18	#increment X
	c.le.d $f0, $f24   # Compare if f0 < f2
    	bc1t Loop_2

l.d $f0, zeroDouble
l.d $f24, oneDouble

Loop_3:
	mov.d $f12, $f0
	jal Bernoulli_3
	mov.d $f12, $f2

	mul.d $f4, $f20, $f0	#strech x
	cvt.w.d $f4, $f4
	mfc1 $a0, $f4		#int part div

    	mul.d $f2, $f22, $f2	#strech y
    	sub.d $f2, $f8, $f2	#make center 128
    	cvt.w.d $f2, $f2
    	mfc1 $a1, $f2


	lw $a2, BLUE
	jal set_pixel_color 
	
	
	add.d $f0, $f0, $f18	#increment X
	c.le.d $f0, $f24   # Compare if f0 < f2
    	bc1t Loop_3

	
l.d $f0, zeroDouble
l.d $f24, oneDouble
Loop_4:
	mov.d $f12, $f0
	jal Bernoulli_4
	mov.d $f12, $f2

	
	mul.d $f4, $f20, $f0	#strech x
	cvt.w.d $f4, $f4
	mfc1 $a0, $f4		#int part div

    	mul.d $f2, $f22, $f2	#strech y
    	sub.d $f2, $f8, $f2	#make center 128
    	cvt.w.d $f2, $f2
    	mfc1 $a1, $f2

	lw $a2, DEEPSKYBLUE
	jal set_pixel_color 
	
	add.d $f0, $f0, $f18	#increment X
	c.le.d $f0, $f24   # Compare if f0 < f2
    	bc1t Loop_4

l.d $f0, zeroDouble
l.d $f24, oneDouble
Loop_5:
	mov.d $f12, $f0
	jal Bernoulli_5
	mov.d $f12, $f2

	
	mul.d $f4, $f20, $f0	#strech x
	cvt.w.d $f4, $f4
	mfc1 $a0, $f4		#int part div

    	mul.d $f2, $f22, $f2	#strech y
    	sub.d $f2, $f8, $f2	#make center 128
    	cvt.w.d $f2, $f2
    	mfc1 $a1, $f2

	lw $a2, BROWN
	jal set_pixel_color 
	
	add.d $f0, $f0, $f18	#increment X
	c.le.d $f0, $f24   # Compare if f0 < f2
    	bc1t Loop_5
	

l.d $f0, zeroDouble
l.d $f24, oneDouble
Loop_6:
	mov.d $f12, $f0
	jal Bernoulli_6
	mov.d $f12, $f2

	
	mul.d $f4, $f20, $f0	#strech x
	cvt.w.d $f4, $f4
	mfc1 $a0, $f4		#int part div
	
    	mul.d $f2, $f22, $f2	#strech y
    	sub.d $f2, $f8, $f2	#make center 128
    	cvt.w.d $f2, $f2
    	mfc1 $a1, $f2

	lw $a2, LIGHTCORAL
	jal set_pixel_color 
	
	add.d $f0, $f0, $f18	#increment X
	c.le.d $f0, $f24   # Compare if f0 < f2
    	bc1t Loop_6
	
	
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
 	
#takes x in $a0 and draws a dot of color $a2
	set_pixel_color:
		lw $t2, DISPLAYWIDTH
		mul $t2, $t2, $a1 # y*DISPLAYWIDTH
		add $t2, $t2, $a0 # +x
		sll $t2, $t2, 2   # *4
		la $t1, DISPLAY   # get address of DISPLAY
		add $t1, $t1, $t2 # add the calculated address of the pixel
		sw $a2, ($t1)     # write color to that pixel
		jr $ra            # return
		
		
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
