#1) Procedimiento de impresión de un array 
.data
len:			.word 7

list:		.word 7
					.word 5
					.word -4
					.word 100
					.word -250
					.word 73
					.word -50
.text

begin:

la a1,list
lw,a0,len

jal ra,printIntArray

j end #end program

#----------------------------------------------
printIntArray:	# a1,a0 (in) beguinnig of the array and the len of the array
									# console(out): prints the result on screen
									# Function:Prins every elemt of the int array on screen
#--------------------
#save context
addi sp,sp,-12
sw a0,0(sp)
sw a1,4(sp)
sw ra,8(sp)
#--------------------
addi t2,a0,0		#saves the value of a0 to be used later

addi t0,zero,0 #counter = 0

la t1,list			# load the addres of the first element


loopIntArray:

lw a1,0(t1)			# load the value of the current addres
jal ra,printIn #	prints the number

jal ra,printLine # prints new line

addi t1,t1,4		# next elemt of array
addi t0,t0,1		# counter ++

bne t2,t0,loopIntArray # if (len != counter) loop


#--------------------
#restore context
lw a0,0(sp)
lw a1,4(sp)
lw ra,8(sp)
addi sp,sp,12
#--------------------
jalr zero,ra,0 #return
#----------------------------------------------


#----------------------------------
printLine:	# Function: Displays a new line on screen 
#-----------
#save context
addi sp,sp,-8
sw a0,4(sp)
sw a1,0(sp)
#-----------
#Save the /n in a register
addi a1,zero,10

#set a0 to 2 for ecall to print a character
addi a0,zero,2
ecall

#-----------
#restore context
lw a0,4(sp)
lw a1,0(sp)
addi sp,sp,8
#-----------
jalr zero,ra,0	#return
#----------------------------------

#-------------------------------
printIn:	# a1 (in) Values to print
				#	Function: Gets and interger and 
				# displays it on the screen 

#-------------
#save context
addi sp,sp,-4
sw a0,0(sp)
#-------------
#prints
addi a0,zero,1 
ecall

#-------------
#restore context
lw a0,0(sp)
addi sp,sp,4
#-------------
jalr zero,ra,0	#return
#-------------------------------------


end:
nop