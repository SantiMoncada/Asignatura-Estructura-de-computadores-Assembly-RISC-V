#1) Conversión de minúsculas en mayúsculas – versión simple
.data
str: .string "hellou"
 
.text

la t0 str #t0 adress

lb t1,str #t1 value
addi t1,t1,-32
sb t1,0(t0)


lb t1,1(t0)
addi t1,t1,-32
sb t1,1(t0)

lb t1,2(t0)
addi t1,t1,-32
sb t1,2(t0)

lb t1,3(t0)
addi t1,t1,-32
sb t1,3(t0)


lb t1,4(t0)
addi t1,t1,-32
sb t1,4(t0)

lb t1,5(t0)
addi t1,t1,-32
sb t1,5(t0)

#print
addi a0,zero,4
add a1,zero,t0
ecall
----------------------------------------
#2) Conversión de minúsculas en mayúsculas – versión avanzada

.data
str: .string "hello World."
 
.text

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
