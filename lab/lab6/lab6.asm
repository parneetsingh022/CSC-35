.intel_syntax noprefix
.data
label0:
	.ascii "Welcome to Hogwarts!\n\0"

label1:
	.ascii "The Sorting Hat is being placed upon your head.\n\n\n\0"

label2:
	.ascii "Do you desire to have (p)ower or to be (c)reative\n\0"

label3:
	.ascii "Do you find contentment in (k)nowledge or (f)riends & community?\n\0"

label4:
	.ascii "\n\nRavenclaw!!\n\n\0"

label5:
	.ascii "\n\nHufflepuff!!\n\n\0"

label6:
	.ascii "Do you wish to do this for (y)ourself or (o)thers\n\0"

label7:
	.ascii "\n\nSlytherin\n\n\0"

label8:
	.ascii "\n\nGryffindorr\n\n\0"

.text
.global _start
_start:

	lea rax, label0
	call PrintString

	lea rax, label1
	call PrintString

main:

	lea rax, label2
	call PrintString

	call ScanChar

	cmp al, 99

	je if_c

	cmp al, 112

	je if_p

	jmp main

if_c:

	lea rax, label3
	call PrintString

	call ScanChar

	cmp al, 107

	je if_k

	cmp al, 102

	je if_f

	jmp if_c

if_k:

	lea rax, label4
	call PrintString

	jmp break_c

if_f:

	lea rax, label5
	call PrintString

	jmp break_c

break_c:

	jmp End

if_p:

	lea rax, label6
	call PrintString

	call ScanChar

	cmp al, 121

	je if_y

	cmp al, 111

	je if_o

	jmp if_p

if_y:

	lea rax, label7
	call PrintString

	jmp break_p

if_o:

	lea rax, label8
	call PrintString

	jmp break_p

break_p:


End:
	call Exit

