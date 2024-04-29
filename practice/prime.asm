.intel_syntax noprefix

.data

Prompt:
	.ascii "Enter a number: \0"

#; this is a lable
Number:
	.quad 0
	
	
NotPrimePrompt:
	.ascii "Given number is not prime!!!\n\0"
	
PrimePrompt:
	.ascii "Given number is prime!!!\n\0"

.text
.global _start

_start:
	#; prompting the user
	lea rax, Prompt
	call PrintString
	
	#; storing the number in Number label
	call ScanInteger
	movq Number, rax
	
	cmp rax, 1
	jle NotPrime
	
	cmp rax, 2
	je Prime
	
	mov rsi, 2
    jmp IsPrimeLoop
	

IsPrimeLoop:
	#; we will divide the number by current value of rsi
	mov rax, [Number]
	xor rdx, rdx
	div rsi #; now rdx contain the remainder
	
	
	
	cmp rdx, 0
	je NotPrime
	
	add rsi, 1
	
	cmp rsi, Number
	jl IsPrimeLoop
	
	jmp Prime #; if we didn't find 0 as remainder
	
	
	
NotPrime:
	lea rax, NotPrimePrompt
	call PrintString
	jmp End
	
Prime:
	lea rax, PrimePrompt
	call PrintString
	jmp End

End:
	call Exit
