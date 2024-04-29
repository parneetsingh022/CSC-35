.intel_syntax noprefix
.data
NewLine:
	.ascii "\n\0"

Prompt:
	.ascii "Enter a number: \0"

Number:
	.quad 0

.text
.global _start

_start:
	lea rax, Prompt
	call PrintString
	
	call ScanInteger
	mov rcx, rax
	mov rbx, 2
	call PrintNPrimes
	
	
	call Exit
	
PrintNPrimes:
	mov rax, rbx
	call PrintPrime
	add rbx, 1

	cmp rbx, rcx
	jle PrintNPrimes
	ret
	
	
PrintPrime:
	mov r8, rax
	mov r9, 2
	call PrintIfPrime
	ret
	
PrintIfPrime:
	xor rdx, rdx
	mov rax, r8
	div r9
	
	cmp rdx, 0
	je NotPrime
	
	add r9, 1
	
	cmp r9, r8
	jl PrintIfPrime
	mov rax, r8
	call PrintIntegerLn
	ret

NotPrime:
	#; checking if the number is 2 itself
	cmp r8, 2 #; 2 is a prime number
	jne Back
	
	mov rax, r8
	call PrintIntegerLn
Back:
	ret
	
PrintIntegerLn:
	mov r15, rax
	call PrintInteger
	
	
	lea rax, NewLine
	call PrintString
	
	mov rax, r15
	ret
	
