#setting up len 3 array for sorting
addi x5, x0 ,3
sd x5, 4(x0)
addi x5, x0 ,2
sd x5, 12(x0)
addi x5, x0 ,10
sd x5, 20(x0)


addi x10, x0, 4 #a pointer
addi x11, x0, 3 #len

bubble: bne x10, x0, else
bne x11, x0, else
beq x0, x0, FinalExit


else: addi x18, x0, 0 #i  
Loop1: beq x18, x11, Exit1
	add x19, x0, x18 #j = i
    Loop2:
    	beq x19, x11, Exit2
		slli x5, x18, 3 #calculate offset of i
    	slli x6, x19, 3 #and j
    	add x5, x5, x10
        add x6, x6, x10
        ld x28, 0(x5) #val of a[i]
        ld x29, 0(x6) #val of a[j]
        bge x28, x29, loop2_cont #if not a[i] >= [j]
        add x30, x0, x28 #temp = a[i]
        add x28, x0, x29 #a[i] = a[j]
        add x29, x0, x30 #a[j] = temp
        sd x28, 0(x5)
        sd x29, 0(x6)
        loop2_cont: addi x19, x19, 1
        beq x0, x0, Loop2
    Exit2: addi x18, x18, 1
    beq x0, x0, Loop1

Exit1: beq x0, x0, FinalExit

FinalExit: nop