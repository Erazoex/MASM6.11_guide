.model small
.radix 16
.stack 
.data
message     db 0d, 0a, 'Array Element: ', '$'
array       db 2 dup(31)
arraySize   equ 02
.code
.startup
    ; printing all the items of an array
    call wait_for_enter
    mov CX, arraySize
    mov SI, 00
loop_subroutine:
    mov DX, offset message
    mov AH, 09
    int 21

    mov DL, array[SI]
    mov AH, 02
    int 21
    inc SI
    loop loop_subroutine
    call salir
; loop_subroutine2:
;     ; accessing the array by using another way
;     mov DX, offset message
;     mov AH, 09
;     int 21
;     mov DL, [array+SI]
;     mov AH, 02
;     int 21
;     inc SI
;     loop loop_subroutine2
;     call salir
wait_for_enter:
    mov AH, 08
    int 21
    cmp AL, 0d
    jne wait_for_enter
    ret
salir:
    .exit
    END