.model small
.radix 16
.stack 
.data
message         db 0d, 0a, 'input something to the console: ', '$'
output_message  db 0d, 0a, 'no salio ', '$'
si_funciono     db 0d, 0a, 'si salio', '$'
.code
.startup
    ; printing the variable message
    mov DX, offset message
    mov AH, 09
    int 21
    ; for getting a single character as user input you need to use int 21 with AH = 01
    ; the input character will be save in AL register.
    mov AH, 01
    int 21
    cmp AL, 41 ; we will compare if AL is equal to the character 'A' in ascii
    je si_salio
    mov DX, offset output_message
    mov AH, 09
    int 21
    
si_salio:
    mov DX, offset si_funciono
    mov AH, 09
    int 21
.exit
END


    
    