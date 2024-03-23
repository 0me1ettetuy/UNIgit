.data
	randArray100: .space 800
	randArray300: .space 2400
	randSeed: .word 12345
	twohundred: .double 200.0
	twoD: .double 2.0
	myArray1:    .space 2400
	arraysize: .asciiz "Array size: "
	res: .asciiz "Result: "
	newline: .asciiz "\n"
	space: .asciiz " "
	sp_d_sp:  .asciiz " - "
	dash: .asciiz "-"
	jak: .asciiz "("
	kvad: .asciiz "["
	kvadcom: .asciiz "],"
	kvadjak: .asciiz "])"
.text

lw $a0, randSeed
la $t0, randArray100
li $t1, 100
jal generator
la $a0, arraysize
jal printstr
move $a0, $t1
jal printint
la $a0, newline
jal printstr

jal printarray
la $a0, randArray100
move $a1, $t1
jal xand2x
la $a0, res
jal printstr
move $a0, $a1
jal printint
la $a0, newline
jal printstr
jal printres



la $a0, newline
jal printstr


lw $a0, randSeed
la $t0, randArray300
li $t1, 300
jal generator
la $a0, arraysize
jal printstr
move $a0, $t1
jal printint
la $a0, newline
jal printstr

jal printarray

la $a0, randArray300
move $a1, $t1
jal xand2x
la $a0, res
jal printstr
move $a0, $a1
jal printint
la $a0, newline
jal printstr
jal printres
        	



li $v0, 10
syscall


	printarray:
		addi $sp $sp -16
    		sw $ra, 0($sp)
    		sw $s0, 4($sp)
    		sw $s1, 8($sp)
    		sw $s2, 12($sp)
    		sw $s3, 16($sp)

    		move $s0, $t0
    		move $s1, $t1
    		li $s2, 1
    		
    		
		while:
			move $a0, $s2
			jal printint
			la $a0, sp_d_sp
			jal printstr
			li $s3, 9
			inwhile:
				l.d $f12, 0($s0)
 				addi $s0, $s0, 8
 				jal printdouble
 				la $a0, dash
 				jal printstr
 				subi $s1, $s1, 1
 				subi $s3, $s3, 1
 				bnez $s3, inwhile
 			l.d $f12, 0($s0)
 			addi $s0, $s0, 8
 			jal printdouble
 			subi $s1, $s1, 1
 			la $a0, newline
 			jal printstr
 			addi $s2, $s2, 1
 			bnez $s1, while

		lw $ra, 0($sp)                 
    		lw $s0, 4($sp)                
    		lw $s1, 8($sp)
		lw $s2, 12($sp)
    		lw $s3, 16($sp)
    		addi $sp $sp 16
		jr $ra


	generator:
		addi $sp $sp -16
    		sw $ra, 0($sp)
    		sw $s0, 4($sp)
    		sw $s1, 8($sp)

    		move $s0, $t0
    		move $s1, $t1
		l.d $f2, twohundred
		
		genloop:
			li $v0, 44
			syscall
			mul.d $f0, $f0, $f2
			round.w.d $f0, $f0
			cvt.d.w $f0, $f0
			s.d $f0, 0($s0)
			addi $s0, $s0, 8
			addi $s1, $s1, -1
        		bnez $s1, genloop
		
		lw $ra, 0($sp)                 
    		lw $s0, 4($sp)                
    		lw $s1, 8($sp)

    		addi $sp $sp 16 
		jr $ra






xand2x:
	addi $sp $sp -32
    	sw $ra, 0($sp)
    	sw $s0, 4($sp)
    	sw $s1, 8($sp)
    	sw $s2, 12($sp)
    	sw $s3, 16($sp)

    	li $t2, 0
        
    	l.d $f16, twoD
    	li $s4, 8
    	move $s0, $a0
    	li $s1, 0

    	Loop1:
        	l.d $f10, 0($s0)          
        	mul.d $f10, $f10, $f16   

		move $s2, $a0
        	li $s3, 0	     
        	           

       		Loop2:
            		l.d $f12, 0($s2)     
            		c.eq.d $f12, $f10      
           		bc1t Found
           		continue:    
            		addi $s2, $s2, 8      
            		addi $s3, $s3, 1      
            		bne $s3, $a1, Loop2  

    		addi $s0, $s0, 8               
    		addi $s1, $s1, 1              
    		bne $s1, $a1, Loop1           
		                 
    		j twoxandx
		
	twoxandx:
    		move $s0, $a0
    		li $s1, 0

    		twoLoop1:
        		l.d $f10, 0($s0)         
        		div.d $f10, $f10, $f16   

			move $s2, $a0
			li $s3, 0	     
        	           

       			twoLoop2:
            			l.d $f12, 0($s2)   
            			c.eq.d $f12, $f10      
           			bc1t twoFound
           			twocontinue:    
            			addi $s2, $s2, 8      
            			addi $s3, $s3, 1      
            			bne $s3, $a1, twoLoop2  

    			addi $s0, $s0, 8               
    			addi $s1, $s1, 1              
    			bne $s1, $a1, twoLoop1
		
			j Exit
		

	Found:

		blt $s3, $s1, continue
		sw $s1, myArray1($t2)
		addi $t2, $t2, 4
		sw $s3, myArray1($t2)
		addi $t2, $t2, 4       
		j continue
		
	twoFound:
		blt $s3, $s1, twocontinue
		sw $s1, myArray1($t2)
		addi $t2, $t2, 4
		sw $s3, myArray1($t2)
		addi $t2, $t2, 4       
		j twocontinue
	
	Exit:
		move $a1, $t2
		div $a1, $a1, $s4
    		lw $ra, 0($sp)                 
    		lw $s0, 4($sp)                
    		lw $s1, 8($sp)
    		lw $s2, 12($sp)
    		lw $s3, 16($sp)
    		addi $sp $sp 32          
    		jr $ra                        

printstr:
	li $v0, 4
	syscall
	jr $ra

printint:
	li $v0, 1
	syscall
	jr $ra

printdouble:
	li $v0, 3
	syscall
	jr $ra	

	
	printres:
		addi $sp $sp -16
    		sw $ra, 0($sp)
    		sw $s0, 4($sp)
    		sw $s1, 8($sp)
    		sw $s2, 12($sp)
    		sw $s3, 16($sp)
		
		move $s0, $t0 #spisok
		move $s1, $a1 #sizeof myarray1
    		la $s2, myArray1

    		
    		
		whileres:
			li $s3, 4
			inwhileres:
				la $a0, jak
				jal printstr
				lw $a0, 0($s2)
				mul $a0, $a0, 8
				add $s0, $s0, $a0
				l.d $f12, 0($s0)
 				sub $s0, $s0, $a0
 				jal printdouble
 				la $a0, kvad
 				jal printstr
 				lw $a0, 0($s2)
 				addi $s2, $s2, 4
 				jal printint
 				la $a0, kvadcom
 				jal printstr
 				lw $a0, 0($s2)
 				mul $a0, $a0, 8
 				add $s0, $s0, $a0
 				l.d $f12, 0($s0)
 				sub $s0, $s0, $a0
 				jal printdouble
 				la $a0, kvad
 				jal printstr
 				lw $a0, 0($s2)
 				addi $s2, $s2, 4
 				jal printint
 				la $a0, kvadjak
 				jal printstr

 				subi $s1, $s1, 1
 				beqz $s1, continueres
 				la $a0, dash
 				jal printstr
 				subi $s3, $s3, 1
 				bnez $s3, inwhileres
			la $a0, jak
			jal printstr
			lw $a0, 0($s2)
			mul $a0, $a0, 8
			add $s0, $s0, $a0
			l.d $f12, 0($s0)
 			sub $s0, $s0, $a0
 			jal printdouble
 			la $a0, kvad
 			jal printstr
 			lw $a0, 0($s2)
 			addi $s2, $s2, 4
 			jal printint
 			la $a0, kvadcom
 			jal printstr
 			lw $a0, 0($s2)
 			mul $a0, $a0, 8
 			add $s0, $s0, $a0
 			l.d $f12, 0($s0)
 			sub $s0, $s0, $a0
 			jal printdouble
 			la $a0, kvad
 			jal printstr
 			lw $a0, 0($s2)
 			addi $s2, $s2, 4
 			jal printint
 			la $a0, kvadjak
 			jal printstr
			subi $s1, $s1, 1
			
			continueres:
 			la $a0, newline
 			jal printstr

 			bnez $s1, whileres

		lw $ra, 0($sp)                 
    		lw $s0, 4($sp)                
    		lw $s1, 8($sp)
		lw $s2, 12($sp)
    		lw $s3, 16($sp)
    		addi $sp $sp 16
		jr $ra
		
	
