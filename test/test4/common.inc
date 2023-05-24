; defining a macro for using it in other .asm files
myMacro macro
    mov AH, 09
    int 21
endm