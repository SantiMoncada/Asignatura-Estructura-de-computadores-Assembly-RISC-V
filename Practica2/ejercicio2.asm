#2) Conversión de minúsculas en mayúsculas – versión avanzada

.data
str: .string "hello World."
 
.text
begin:
la t0,str #load string address
li t2,46 #load dot in t2
li t3,97 #load the 'a'
li t4,122 #load the 'z'

Loop:
lb t1,0(t0) #load the byte

beq t1,t2,exit # if byte == '.'

blt t1,t3,skip # if byte < 'a'
blt t4,t1,skip # if byte > 'z'

addi t1,t1,-32 #change to cap
sb t1,0(t0)	#save cahnges

skip:

addi t0,t0,1 #next position of sting
j Loop

exit:


#print
la t0,str #load string address
addi a0,zero,4
add a1,zero,t0
ecall
end:
nop
