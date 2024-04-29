.intel_syntax noprefix

.data
Bertie:
	.ascii "1. Bertie Bott's Every Flavour Sliders (37 Knuts)\n\0"
Cakes:	
	.ascii "2. Cauldron Cakes (9 knuts)\n\0"
Pasties:
	.ascii "3. Pumpkin Pasties (15 knuts)\n\0"
Frogs:
	.ascii "4. Chocolate Frogs (24 knuts)\n\0"
Gum:
	.ascii "5. Droble's Best Blowing Gum (11 Knuts)\n\0"


Names:
	.quad Bertie
	.quad Cakes
	.quad Pasties
	.quad Frogs
	.quad Gum

Selection:
	.ascii "\n\nEnter your selection:\n\0"
	
YouSelected:
	.ascii "\nYou Selected:\n\0"

Price:
	.quad 37
	.quad 9
	.quad 15
	.quad 24
	.quad 11

PleaseEnter:
	.ascii "\nPlease Enter \0"

Knuts:
	.ascii " Knuts\n\0"

.text
.global _start
_start:
	lea rax, Bertie
	call PrintString

	lea rax, Cakes
	call PrintString

	lea rax, Pasties 
	call PrintString

	lea rax, Frogs
	call PrintString
	
	lea rax, Gum
	call PrintString
	
	lea rax, Selection
	call PrintString
	
	call ScanInteger
	sub rax, 1
	mov rbx, rax	

	lea rax, YouSelected
	call PrintString

	mov rax, [Names + rbx * 8]
	call PrintString

	lea rax, PleaseEnter
	call PrintString

	mov rax, [Price + rbx *  8]
	call PrintInteger

	lea rax, Knuts
	call PrintString	

	call Exit

