.model small
.radix 16
.stack
.data
; Here goes all the variables you want to declare for your program
message db 'Hello, world!', '$'
.code
.startup
    ; for printing a string to the console you need interrupt 21 with AH = 09.
    ; parameter use for print a string you need to use the register DX
    ; and then give AH register the value of 09
    mov DX, offset message ; moving DX register to message address position 
    mov AH, 09 ; moving AH register to 09
    int 21 ; calling the interrupt
.exit
END


