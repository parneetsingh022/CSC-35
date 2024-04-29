.intel_syntax noprefix

.data
Description:
	.ascii "Gringotts Bank Currency Exchange Form\n\n\0"

EnterName:
	.ascii "Enter the name of the customer.\n\0"

Name:
	.space 100

EnterGalleons:
	.ascii "Enter the number of galleons.\n\0"
Galleons:
	.quad 0

EnterSickles:
	.ascii "Enter the number of sickles.\n\0"
Sickles:
	.quad 0

EnterKnuts:
	.ascii "Enter the number of knuts.\n\0"
Knuts:
	.quad 0



# Last display line
BeforeName:
	.ascii "The customer, \0"
BeforeGalleons:
	.ascii ", recieved \0"
BeforeSickles:
	.ascii " galleons, \0"
BeforeKnuts:
	.ascii " sickles, and, \0"
AfterKnuts:
	.ascii " knuts.\n\0"

.text
.global _start
_start:
	lea rax, Description
	call PrintString
	
	# Getting the name
	lea rax, EnterName
	call PrintString
	
	lea rax, Name
	mov rbx, 100
	call ScanString

	#Getting the number of galleons.
	lea rax, EnterGalleons
	call PrintString

	call ScanInteger
	mov Galleons, rax
	
	#Getting the number of Sickles.
	lea rax, EnterSickles
	call PrintString

	call ScanInteger
	mov Sickles, rax	
	
	#Getting the number of knuts.
	lea rax, EnterKnuts
	call PrintString

	call ScanInteger
	mov Knuts, rax	
			
	# Last line display
	lea rax, BeforeName
	call PrintString

	lea rax, Name
	call PrintString
	
	lea rax, BeforeGalleons
	call PrintString

	mov rax, Galleons
	call PrintInteger

	lea rax, BeforeSickles
	call PrintString

	mov rax, Sickles
	call PrintInteger

	lea rax, BeforeKnuts
	call PrintString

	mov rax, Knuts
	call PrintInteger

	lea rax, AfterKnuts
	call PrintString


	
	call Exit
