.model small
.radix 16
.stack
.data
myvar db 0d, 0a, 'hello from helper!', '$'
.code
INCLUDE common.inc ; include .inc file

; print message - prints a message
; params: DX -> position in memory of the message you want to print
; returns: none
print_message proc
    mov AH, 09
    int 21
    mov DX, offset myvar
    myMacro
    ret
print_message endp

.exit
END