.model small
.radix 16
.stack 
.data
message         db 'input something to the console: ', '$'
output_message  db 0d, 0a, 'you entered: ', '$'
buffer          db 21 dup('$')    ; buffer to store keyboard input
.code
.startup
    ; printing the variable message
    call esperar_enter
    mov DX, offset message
    mov AH, 09
    int 21
    
    ; for getting the user input you need to use the interrupt 21 with AH = 0a
    ; and you need to use the register DX to position where the buffer address starts
    mov DX, offset buffer ; moving DX register to message address position 
    mov AH, 0a ; moving AH register to 0a
    int 21 ; calling the interrupt

    mov DX, offset output_message
    mov AH, 09
    int 21

    mov DX, offset buffer + 2 ; offsetting 2 positions, the first byte(maximum length) and the second byte(actual length)
    mov AH, 09
    int 21 
    call salir
esperar_enter:
    mov AH, 08
    int 21
    cmp AL, 0d
    jne esperar_enter
    ret
salir:
    .exit
    END