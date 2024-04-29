.intel_syntax noprefix

.data
NEW_LINE:
	.ascii "\n\0"
Menu_ITM_1:
	.ascii "1. Pumpkin Pasty Pie\t\t:520 grams of sugar\n\0"
Menu_ITM_2:
	.ascii "2. Flagon of Butterbeer\t\t:650 grams of sugar\n\0"
Menu_ITM_3:
	.ascii "3. Tower of Ice Cream\t\t:1605 grams of sugar\n\0"
Menu_ITM_4:
	.ascii "4. Treacle Tart\t\t\t:1004 grams of sugar\n\0"
Menu_ITM_5:
	.ascii "5. Leave the table\n\0"
	
SugarQuantityTable:
	.quad 520
	.quad 650
	.quad 1605
	.quad 1004


Question_title_part1:
	.ascii "You have \0"

Question_title_part2:
	.ascii " grams of sugar left.\n\n\0"
	
Question_1:
	.ascii "What did you all eat?\n\0"
	
Question_2:
	.ascii "How many shared eating it?\n\0"
	
Cost_label_1:
	.ascii "That's \0"
	
Cost_label_2:
	.ascii " grams!\n\n\0"
	
Left_label_1:
	.ascii "You have \0"
	
Left_label_2:
	.ascii " grams of sugar left.\n\n\0"
	
LeaveTheTableText:
	.ascii "\nYou left the feast happy to know that the Ministry official will not see you today.\n\0"
	
DetentionText:
	.ascii "\nYou have eaten too much sugar!\n\n You now have detention with an official from the Enthuastic Promotion of\nStudent Health & the Ridiculously Overzealous Regulation of Sugary Intake!\n\0"
.text
.global _start

_start:
	mov r8, 500
	
DisplayMenu:
	lea rax, Menu_ITM_1
	call PrintString
	
	lea rax, Menu_ITM_2
	call PrintString
	
	lea rax, Menu_ITM_3
	call PrintString
	
	lea rax, Menu_ITM_4
	call PrintString
	
	lea rax, Menu_ITM_5
	call PrintString
	
	lea rax, NEW_LINE
	call PrintString
	lea rax, NEW_LINE
	call PrintString
	
	lea rax, Question_title_part1
	call PrintString
	
	mov rax, r8
	call PrintInteger
	
	lea rax, Question_title_part2
	call PrintString
	
DisplayQuestions:
	
	
	
	lea rax, Question_1
	call PrintString
	
	call ScanInteger
	mov r9, rax
	
	cmp r9, 5
	je LeaveTheTable
	
	lea rax, Question_2
	call PrintString
	
	call ScanInteger
	mov r10, rax
	
CalculateSugarLeft:
	lea rax, Cost_label_1
	call PrintString
	
	sub r9, 1
	mov rax, [SugarQuantityTable + 8 * r9]
	idiv r10
	call PrintInteger
	
	sub r8, rax
	lea rax, Cost_label_2
	call PrintString
	
	cmp r8, 0
	jl Detention
	
	lea rax, Left_label_1
	call PrintString
	
	
	mov rax, r8
	call PrintInteger
	
	lea rax, Left_label_2
	call PrintString
	
	jmp DisplayQuestions
	

LeaveTheTable:
	lea rax, LeaveTheTableText
	call PrintString
	jmp End
	
Detention:
	lea rax, DetentionText
	call PrintString

End:
	call Exit
