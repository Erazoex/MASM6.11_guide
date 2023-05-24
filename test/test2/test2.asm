.model small
.radix 16
.stack 
.data
message         db 0d, 0a, 'input something to the console: ', '$'
output_message  db 0d, 0a, 'the char is different from A', '$'
it_worked     db 0d, 0a, 'it worked', '$'
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
    je if_worked
    mov DX, offset output_message
    mov AH, 09
    int 21
    
if_worked:
    mov DX, offset it_worked
    mov AH, 09
    int 21
.exit
END


    
    