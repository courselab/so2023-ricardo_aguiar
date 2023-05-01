	## Say Hello World - AT&T assembly
	## 2023, Ricardo Aguiar  ricardoaguiar@usp.br

	.code16                # Set 16-bit code
	.global begin	       # So the linker can find it.
	
begin:		               # Program beginning 
	
	mov   $0xe, %ah	       # BIOS tty mode
	mov   $msg, %bx	       # Address of the message string to be printed
loop:			      
	mov   (%bx), %al       # Load the byte pointed to by BX into the AL register
	
	cmp   $0x0, %al	       # If AL is 0 (end of the string), exit the loop (Jump to halt)
	je    halt             
	
	int   $0x10	           # Call bios
	inc   %bx	           # Increment BX to point to the next character in the string
	jmp   loop	           # Repeat the loop for the next character
	
halt:
	hlt		               # Halt
	jmp   halt	           # Safeguard

msg:			     
	.string    "Hello, World!"

	.fill 510 - (. - begin), 1, 0       # Pad with zeros
	.word 0xaa55			            # Boot signature

	
