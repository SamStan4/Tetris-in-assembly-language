global _start

section .text

_start:
    
    push _return_here
    jmp _print_tetris_title

_return_here:

    mov rax, 0x3C ; end the program
    mov rdi, 0x00
    syscall

;============================================================================================================================================================================================|
;   function name     : _print_tetris_title
;   function purpose  : prints out the text "~TETRIS~" to the terminal
;   function inputs   : none
;   call stack        : -->[return address]-->?
;   programmer        : sam stanley
;   help              : text from https://patorjk.com/software/taag/#p=display&f=Graffiti&t=~TETRIS~
;   date created      : 5/21/24
;   last edited       : 5/22/24

_print_tetris_title:

    mov rax, 0x01 ; move 1 into the rax register for a print syscall
    mov rdi, 0x01 ; move 1 into the rdi register to set the file descriptor to be stdout
    mov rsi, msg_tetris_title ; move the pointer to the message to the rsi register
    mov rdx, len_msg_tetris_title ; move the length of the message to the rdx register
    syscall

    ; assume that the caller pushed the return address to the call stack
    ret ; return to the address

;============================================================================================================================================================================================|



section .data

;============================================================================================================================================================================================|
;   for printing "~TETRIS~"    
    msg_tetris_title: DB "  ___     ___________________________________________.___  _________  ___     ", 0xA, " / _ \_/\ \__    ___/\_   _____/\__    ___/\______   \   |/   _____/ / _ \_/\ ", 0xA, " \/ \___/   |    |    |    __)_   |    |    |       _/   |\_____  \  \/ \___/ ", 0xA, "            |    |    |        \  |    |    |    |   \   |/        \          ", 0xA, "            |____|   /_______  /  |____|    |____|_  /___/_______  /          ", 0xA, "                             \/                    \/            \/           ", 0xA
    len_msg_tetris_title: EQU $ - msg_tetris_title
;============================================================================================================================================================================================|
