.intel_syntax noprefix

.data
myName:
	.ascii "My name is Parneet Sidhu!\n"
	
concentrate:
	.ascii "You've gotta concentrate, spells don't work like that, say the magic word twice:\n"

leviosa:
	.ascii "Wingardium Leviosa\n"


summerBreak:
	.ascii "Well!!! that was hard to even pronunce. In summer breaks I'll just sleep and do nothing:)\n"

.text
.global _start

_start:
	mov rax, 1 #; sys_write
	mov rdi, 1 #; console
	lea rsi, myName
	mov rdx, 26
	syscall
	
	
	mov rax, 1
	mov rdi, 1
	lea rsi, concentrate
	mov rdx, 81
	syscall
	
	call say_leviosa
	call say_leviosa
	
	mov rax, 1
	mov rdi, 1
	lea rsi, summerBreak
	mov rdx, 90
	syscall
	
	jmp Exit
	

say_leviosa:
	mov rax, 1
	mov rdi, 1
	lea rsi, leviosa
	mov rdx, 19
	syscall
	
	ret
	
Exit:
	mov rax, 60 #; sys_exit
	mov rdi, 0  #; exit code = 0
	syscall
