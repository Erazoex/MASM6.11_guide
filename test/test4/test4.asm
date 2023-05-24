.model small
.radix 16
.stack 
.data
message         db 'the program is starting...', '$'
output_message  db 0d, 0a, 'program finished!', '$'
new_message     db 0d, 0a, 'hi from myMacro!', '$'
another_message db 0d, 0a, 'another one from main file!', '$'
buffer          db 21 dup('$')    ; buffer to store keyboard input
.code
EXTERN print_message:PROC ; Declare the external subroutine
INCLUDE common.inc ; include the .inc file


.startup
    ; printing the variable message
    call wait_for_enter
    mov DX, offset message
    mov AH, 09
    int 21

    mov DX, offset new_message
    myMacro

    mov DX, offset another_message
    call print_message

    mov DX, offset output_message
    mov AH, 09
    int 21

    call end_of_program
    
wait_for_enter:
    mov AH, 08
    int 21
    cmp AL, 0d
    jne wait_for_enter
    ret
end_of_program:
    .exit
    END