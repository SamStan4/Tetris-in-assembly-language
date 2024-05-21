global _start

section .text

_start:
    mov rax, 0x00000001 ; move 1 into the rax register for a print syscall
    mov rdi, 0x00000001 ; move 1 into the rdi register to set the file descriptor to be stdout
    mov rsi, hello_msg ; move the pointer to the message to the rsi register
    mov rdx, hello_msg_len ; move the length of the message to the rdx register
    syscall

    mov rax, 0x0000003C ; end the program
    mov rdi, 0x00000000
    syscall

section .data
    hello_msg: DB "Hello World", 0xA
    hello_msg_len: EQU $ - hello_msg
