#1) Impresión por pantalla
.data
#loads the strig in to memory
stri: 	.string "39 steps"
		.word 0

.text
begin:

#sets up the print function
la a1,stri
addi a0,zero,4
ecall

end:
nop
-----------------------------------
#1) Impresión por pantalla
.data
#loads the strig in to memory
stri: .string "39\nsteps"
		.word 0

.text
begin:

#sets up the print function
la a1,stri
addi a0,zero,4
ecall

end:
nop




-----------------------------------
#1.B)
.data
#loads the strig in to memory

str: 	.string "39"
			.string "steps"
			.word 0
.text
begin:

la t0,str	#get str position
addi t0,t0,2 # get the third position of the string

li t1,32 #space in ascii
sb t1,0(t0) #add the space to the string

addi t0,t0,1 #get next position

li t1, 10 #retturn line ascii
sb t1,0(t0)# add the return to the string

#sets up the print function

la a1,str
addi a0,zero,4
ecall
end:
nop
-------------------------------------------
#1.B.2)
.data
#loads the strig in to memory

str: 	.word 1930049843
			.word 1936745844

.text
begin:

#sets up the print function

la a1,str
addi a0,zero,4
ecall
end:
nop

---------------------------------------
#2) Operaciones aritméticas simples
.data
A: .word 5
B: .word 3
C: .word 2
D: .word 2
F: .word 0

.text
#load numbers
lw t0,A
lw t1,B
lw t2,C
lw t3,D

add  t4,t0,t1 #(A+B)
add	t5,t2,t3 #(C+D)
sub	s0,t0,t2 #(A+B)-(C+D)

#print
addi a0,zero,1
add a1,zero,s0
ecall

#save
la t0,F
sw s0,0(t0)
-------------------------------------
#3) Resto de la división
.data
A: .word 7
B: .word 2
R: .word 0 # R=A%B
.text

lw t0,A
lw t1,B
rem s0,t0,t1 #A%B

#print
addi a0,zero,1
add a1,zero,s0
ecall

#save
la t2,R
sw s0,0(t2)
-----------------------------
#3.b)
.data
A: .word 7
B: .word 2
R: .word 0 # R=A%B
.text

lw t0,A
lw t1,B

div t2,t0,t1 # A/B
mul t3,t2,t1 # (A/B)*B
sub s0,t0,t3 # A-((A/B)*B)

#print
addi a0,zero,1
add a1,zero,s0
ecall

#save
la t4,R
sw s0,0(t4)

