#3) Años bisiestos – versión avanzada
.data
year: 				.word 2020
negation: 		.string "is not a leap year"
						.word 0
affirmation: 	.string "is a leap year"
						.word 0
.text
being:



lw a1,year #load the year in thr registers


jal ra,printIn #prints the year

jal ra,printLine #prints the \n

jal ra,isLeap #calls the funciton is leap

beq a0,zero,notLeap # if isLeap == 0
#is leap year
la a1,affirmation #load the message from memmory
j endBranch

notLeap:
la a1, negation #load the message from mmemory

endBranch:

jal ra,printStr #calls the print function

#ends the program
j end


#-----------------------------------
isLeap:	# takes a year int in (a1)
			# Function: returns in (a0) 1 if the year is leap
			# or 0 if the year is not a leap year
#---------------
#save context
#---------------
addi t1,zero,4 #load 4

rem t0,a1,t1 # Year%4

beq t0,zero,leap #if reminder == 0
#not a leap year
addi a0,zero,0 #set the return value to 0
j endIsLeap		#end the program 

leap:
addi a0,zero,1 #set the return value to 1

endIsLeap:

#---------------
#restore context
#---------------
jalr zero,ra,0 #return
#-----------------------------------



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




#-------------------------------------
printStr:	# a1(adress) of the beginning
					# of the string
					# Function: Displays the strings of characters 
#-----------
#save context
addi sp,sp,-4
sw a0,0(sp)
#-----------
#prints the string
addi a0,zero,4
ecall
#-----------
#restore context
lw a0,0(sp)
addi sp,sp,4
#-----------
jalr zero,ra,0	#return
#----------------------------------



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

end:
nop