.intel_syntax noprefix

.data
Question:
	.ascii "What is the rumor?\n"
Answer:
	.space 100
MuffliatoCharm:
	.ascii "The Muffliato Charm changes it to:\n"
.text
.global _start

_start:
	mov rax, 1 #; sys_write
	mov rdi, 1 #; console
	lea rsi, Question
	mov rdx, 19
	syscall
	
	mov rax, 0
	mov rdi, 0
	lea rsi, Answer
	mov rdx, 100
	syscall
	
	
	mov r8, rax   #; Answer size!!
	
	mov rax, 1
	mov rdi, 1
	lea rsi, MuffliatoCharm
	mov rdx, 35
	syscall
	
	call LowerIt
	
	mov rax, 1
	mov rdi, 1
	lea rsi, Answer
	mov rdx, r8
	syscall
	
	jmp End

LowerIt:
	mov r9, 0
	
LowerItLoop:
	mov al, [Answer+r9]
	
	#; if rax is already lowercase 
	#; contine the loop
	cmp al, 90
	jg ContinueLowerItLoop
	cmp al, 65
	jl ContinueLowerItLoop
	
	add al, 32
	mov [Answer + r9], al
	
ContinueLowerItLoop:
	add r9, 1
	
	cmp r9, r8
	jl LowerItLoop
	ret
	
	
End:
	mov rax, 60 #; sys_exit
	mov rdi, 0  #; exit code = 0
	syscall
