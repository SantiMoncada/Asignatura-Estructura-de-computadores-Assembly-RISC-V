#1) Conversión de minúsculas en mayúsculas – versión simple
.data
str: .string "hellou"
 
.text
begin:
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
end:
nop