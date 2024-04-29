.intel_syntax noprefix

.data

Introduction:
	.ascii "Hello Human Kitten, Let's talk while we wait\n\n\0"

Que1:
	.ascii "How do you feel about the sorting ceremony? (1) excited or (5) terrified?\n\0"

Res1:
	.ascii "\nEvery student is worried! The Sorting Hat always puts students where they'll be happy.\n\n\0"


Que2:
	.ascii "Are you worried about friends? (1) No, I'm popular or (5) I'll be an outcast?\n\0"

Res2:
	.ascii "Don't worry!! I know you will find plenty of friends.\n\n\0"



Que3:
	.ascii "How about potions? (1) I will be good or (5) I'll blow up the classroom?\n\0"
Res3:
	.ascii "A good explosion is always fun. It happens several times each year.\n\n\0"


Que4:
	.ascii "You're muggleborn. Does that worry you? (1) Nah or (5) Oh my gawd?\n\0"
Res4:
	.ascii "Muggleborns are just as good as purebloods. Minister Granger is muggle-born!\n\n\0"

StrLvl:
	.ascii "Your total stress level is at \0"

HotCocoa:
	.ascii "\n\n\nOh dear! You are so stressed! Here! Have some magical calming hot cocoa!\n\0"
NewLine:
	.ascii "\n\0"
.text
.global _start
_start:
	mov rcx, 0

	lea rax, Introduction
	call PrintString

ShowQue1:

	lea rax, Que1
	call PrintString
	
	call ScanInteger

	add rcx, rax # adding total stress level in rcx
	
	cmp rax, 4
	jge ShowRes1

	jmp ShowQue2

ShowRes1:
	lea rax, Res1
	call PrintString

ShowQue2:
	lea rax, Que2
	call PrintString
	
	call ScanInteger
	
	add rcx, rax
	
	cmp rax, 4
	jge ShowRes2
	jmp ShowQue3

ShowRes2:
	lea rax, Res2
	call PrintString


ShowQue3:
	lea rax, Que3
	call PrintString
	
	call ScanInteger
	
	add rcx, rax
	
	cmp rax, 4
	jge ShowRes3
	jmp ShowQue4

ShowRes3:
	lea rax, Res3
	call PrintString

ShowQue4:
	lea rax, Que4
	call PrintString
	
	call ScanInteger
	
	add rcx, rax
	
	cmp rax, 4
	jge ShowRes4
	jmp StressLevel

ShowRes4:
	lea rax, Res4
	call PrintString


StressLevel:
	lea rax, StrLvl
	call PrintString
	
	mov rax, rcx
	call PrintInteger
	
	lea rax, NewLine
	call PrintString	

	cmp rcx, 16
	jge GiveCocoa
	jmp End

GiveCocoa:
	lea rax, HotCocoa
	call PrintString

End:

	call Exit
		
	


