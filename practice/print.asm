.intel_syntax noprefix

.data
Name:
	.ascii "Parneet\n"
	
	
.text
.global _start
_start:
	mov rax, 1
	mov rdi, 1
	lea rsi, Name
	mov rdx, 8
	syscall
	
End:
	mov rax, 60
	mov rdi, 0
	syscall
