global _start

section .text

;============================================================================================================================================================================================|
;   function name        : _print_tetris_title
;   function purpose     : prints out the text "~TETRIS~" to the terminal
;   function input %rdi  : none
;   function input %rsi  : none
;   function input %rdx  : none
;   function input %r8   : none
;   function input %r9   : none
;   call stack           : -->[return address]-->?
;   function output %rax : none
;   programmer           : sam stanley
;   help                 : text from https://patorjk.com/software/taag/#p=display&f=Graffiti&t=~TETRIS~
;   date created         : 5/21/24
;   last edited          : 5/22/24

_print_tetris_title:

    mov rax, 0x01                 ; move 1 into the rax register for a print syscall
    mov rdi, 0x01                 ; move 1 into the rdi register to set the file descriptor to be stdout
    mov rsi, msg_tetris_title     ; move the pointer to the message to the rsi register
    mov rdx, len_msg_tetris_title ; move the length of the message to the rdx register
    syscall

    ; assume that the caller pushed the return address to the call stack
    ret ; return to the address

;============================================================================================================================================================================================|
;   function name        : _display_game_board
;   function purpose     : prints out the contents of the game board to the terminal
;   function input %rdi  : none
;   function input %rsi  : none
;   function input %rdx  : none
;   function input %r8   : none
;   function input %r9   : none
;   call stack           : -->[return address]-->?
;   function output %rax : none
;   programmer           : sam stanley
;   help                 : none
;   date created         : 5/22/24
;   last edited          : 5/22/24

_display_game_board:

    mov r8, len_game_board ; length of the game board going into a temp register
    mov r9, game_board     ; pointer to the start of the game board going to a temp register

_display_game_board_loop:

    ; check to see how many iterations we are at -->

    cmp r8, 0
    je _end_display_game_board

    mov rax, r8     ; check if we need to print a new line
    xor rdx, rdx
    mov rcx, 10
    div rcx
    cmp rdx, 0
    jne _display_game_board_after_new_line

    ; print the new line

    mov rax, 0x01                 ; move 1 into the rax register for a print syscall
    mov rdi, 0x01                 ; move 1 into the rdi register to set the file descriptor to be stdout
    mov rsi, msg_new_line     ; move the pointer to the message to the rsi register
    mov rdx, len_msg_new_line ; move the length of the message to the rdx register
    syscall

_display_game_board_after_new_line:


    mov rax, 0x01                 ; move 1 into the rax register for a print syscall
    mov rdi, 0x01                 ; move 1 into the rdi register to set the file descriptor to be stdout
    mov rsi, msg_TEST     ; move the pointer to the message to the rsi register
    mov rdx, len_msg_TEST ; move the length of the message to the rdx register
    syscall

    sub r8, 1

    jmp _display_game_board_loop

_end_display_game_board:

    ret


;============================================================================================================================================================================================|



_start:
    
    push _return_here
    jmp _display_game_board

_return_here:

    mov rax, 0x3C ; end the program
    mov rdi, 0x00
    syscall



section .data

;============================================================================================================================================================================================|
;   for printing "~TETRIS~"    
    msg_tetris_title: db "  ___     ___________________________________________.___  _________  ___     ", 0xA, " / _ \_/\ \__    ___/\_   _____/\__    ___/\______   \   |/   _____/ / _ \_/\ ", 0xA, " \/ \___/   |    |    |    __)_   |    |    |       _/   |\_____  \  \/ \___/ ", 0xA, "            |    |    |        \  |    |    |    |   \   |/        \          ", 0xA, "            |____|   /_______  /  |____|    |____|_  /___/_______  /          ", 0xA, "                             \/                    \/            \/           ", 0xA
    len_msg_tetris_title: equ $ - msg_tetris_title
;============================================================================================================================================================================================|
;   the game board
    game_board times 200 db 'A'
    len_game_board: equ $ - game_board
;============================================================================================================================================================================================|
;   for testing
    msg_TEST: db "TEST"
    len_msg_TEST: equ $ - msg_TEST
;============================================================================================================================================================================================|
;   new line character
    msg_new_line: db 0xA
    len_msg_new_line: equ $ - msg_new_line
;============================================================================================================================================================================================|

