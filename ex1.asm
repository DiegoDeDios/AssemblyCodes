global _start

section .data
	nam: db "Dime tu nombre: ", 0xA
	NAMSIZE: equ $ - nam
	sal: db "Hola", 0x20
	SALSIZE: equ $ - sal
	STDIN: equ 0
	STDOUT: equ 1

section .bss
	buf: resb 64
	BUF_SIZE: equ 64

section .text
_start:
	mov rax, 1  ; write syscall 
	mov rdi, STDOUT   ;fd
	mov rsi, nam   ; *buf
	mov rdx, NAMSIZE   ;size_t count 
	; recibe 3 parametros  ssize_t write(int fd, const void *buf, size_t count)
	syscall

	xor rax, rax 
	mov rdi, STDIN
	mov rsi, buf
	mov rdx, BUF_SIZE
	syscall

	mov rbx, rax
	
	mov rax, 1
	mov rdi, STDOUT
	mov rsi, sal
	mov rdx, SALSIZE
	syscall

	mov rax, 1
	mov rdi, STDOUT
	mov rsi, buf
	mov rdx, rbx
	syscall

	mov rax, 60
	xor rdi, rdi
	syscall

