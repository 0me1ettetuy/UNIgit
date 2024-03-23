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
	
	oneDouble: .double 1.0
	zeroDouble: .double 0.0

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
