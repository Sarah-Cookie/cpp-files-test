; X86 32
; input: Integer, output: Integer of same length
; Part of introduction to X86 ASM

section .data
		promptMsg db 'Please enter a number: ' 	;input prompt message
		lenPromptMsg equ $ - promptMsg						;Len of input msg
		dispmsg db 'You have entered: '		;Return msg
		lenDispMsg equ $ - dispmsg			;len of return msg

section .bss								;uninitialized data
		num resb 5

section .text					
		global _start

_start:
		;User input prompt
		mov eax, 4	;sys_write
		mov ebx, 1	;output
		mov ecx, promptMsg
		mov edx, lenPromptMsg
		int 0x80							;Kernel call

		;Read and store user input

		mov eax, 3	;sys_read
		mov ebx, 2	;source
		mov ecx, num	
		mov edx, 5	; 5 bytes (numeric, 1 for sign)
		int 0x80

		;Write the message to terminal

		mov eax, 4	;sys_write
		mov ebx, 1
		mov ecx, dispmsg
		mov edx, lenDispMsg
		int 0x80	

		;Write user input to terminal

		mov eax, 4
		mov ebx, 1
		mov ecx, num
		mov edx, 5
		int 0x80

		; Exit code

		mov eax, 1
		mov ebx, 0
		int 0x80



