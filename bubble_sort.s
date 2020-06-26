#setting up len 3 array for sorting
addi x5, x0 ,3
sw x5, 0x100(x0)
addi x5, x0 ,2
sw x5, 0x104(x0)
addi x5, x0 ,10
sw x5, 0x108(x0)


addi x10, x0, 0x100 #a pointer
addi x11, x0, 3 #len

bubble: bne x10, x0, else
bne x11, x0, else
beq x0, x0, FinalExit


else: addi x18, x0, 0 #i  
Loop1: beq x18, x11, Exit1
	add x19, x0, x18 #j = i
    Loop2:
    	beq x19, x11, Exit2
		slli x5, x18, 2 #calculate offset of i
    	slli x6, x19, 2 #and j
    	add x5, x5, x10
        add x6, x6, x10
        lw x28, 0(x5) #val of a[i]
        lw x29, 0(x6) #val of a[j]
        bge x28, x29, loop2_cont #if not a[i] >= [j]
        add x30, x0, x28 #temp = a[i]
        add x28, x0, x29 #a[i] = a[j]
        add x29, x0, x30 #a[j] = temp
        sw x28, 0(x5)
        sw x29, 0(x6)
        loop2_cont: addi x19, x19, 1
        beq x0, x0, Loop2
    Exit2: addi x18, x18, 1
    beq x0, x0, Loop1

Exit1: beq x0, x0, FinalExit

FinalExit: nop