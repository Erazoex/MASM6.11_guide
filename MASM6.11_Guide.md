# **MASM6.11 (Macro Assembler 6.11)**
## Basic Concepts
1. **DATA TYPES** [^1] [^2]
    Here are some examples of how to declare variables
    | DATA TYPES | EXAMPLE |
    | ---------- | ------- |
    | DB (DEFINE BYTE 8) | `x db 21` | 
    | DW (DEFINE WORD 16) | `y dw 4213` |
    | DD (DEFINE DOUBLEWORD 32) | `z dd 78984521` | 
    | DQ (DEFINE QUADWORD 64) | `w dq  7898452478984521` |
    <!-- separator -->
2. **ARRAYS**
    Here are some examples of how to declare arrays.
    | declaration type | Example |
    | ---------------- | ------- |
    | declare an array | `myArray db 1,2,3,4` |
    | access an array value | `myArray[1]` or `myArray[2]` |
    | declare an array using duplicate | `myArray db 3 dup(7)` (result: 7,7,7) or `myArray db 3 dup (7,8)` (result: 7,8,7,8,7,8) |
    | declare an empty array | `myArray db 10 dup(?)` |
    <!-- separator -->
3. **INSTRUCTIONS**
    **Mov instruction:** it copies the second operand called source to the first operand called destination.
    An example of how to use mov instruction: `mov AX, 3h`. types of operand supported by mov instruction are shown in the table below. [^3]
    | No | OPERAND | Example |
    | -- | ------- | ------- |
    | 1 | mov REG, MEMORY | `mov AX, [BX]` |
    | 2 | mov MEMORY, REG | `mov [BX], AX` |
    | 3 | mov REG, REG | `mov AX, BX` |
    | 4 | mov MEMORY, IMMEDIATE | `mov [BX+SI], 7h` | 
    | 5 | mov REG, IMMEDIATE | `mov AX, 3h` |
    <!-- separator -->
    **Arithmetic Operations:** it takes the value of the second operand called source and, depending on the type operation, uses it to join it with the first operand value called destination. Supose AX = 11h and BX = 14h. [^4]
    | No | Operation | Result |
    | -- | --------- | ------ |
    | 1 | `ADD AX, BX` | AX = 25h |
    | 2 | `SUB AX, 2h` | AX = 9h |
    <!-- separator -->
    for multiplication instruction it assumes one of the operand is in AL or AX. An Example of how the `MUL` instruction works.[^5]
    | No | Operation | Result |
    | -- | --------- | ------ |
    | 1 | `mov AL, 7h` | AL = 7h |
    | 2 | `mov BL, 7h` | BL = 7h |
    | 3 | `MUL BL` | AL = 7h*7h = 49h |
    <!-- separator -->
    Two 8 bit numbers multiplied generate a 16 bit product.
    Two 16 bit numbers multiplied generate a 32 bit product.
    `IMUL` is used for signed numbers operation.
    | No | Operation | Result |
    | -- | --------- | ------ |
    | 1 | `mov AL, -5h` | AL = -5h |
    | 2 | `mov BL, 7h` | BL = 7h |
    | 3 | `IMUL BL ` | AL = -35h |
    <!-- separator -->
    in this operation the sign flag will be set to 1 since the result is negative.
    for divisions as well as the multiplication the immediate values are not available. Interrupt are generated when an error ocurrs.[^6] An Example of how the `DIV` instruction works.
    | No | Operation | Result |
    | -- | --------- | ------ |
    | 1 | `mov AX, 0041h` | AL = 0041h |
    | 2 | `mov BL, 02h` | BL = 02h |
    | 3 | `DIV BL ` | AL = 20h and AH = 01h|
    <!-- separator -->
    the result will be stored in AX and the remainder will be in AL. the `IDIV` works the same as `DIV` but if the result is negative the sign flag will be set to 1.
    **Logical instructions:** the logical instructions that exists are `AND`, `OR`, `XOR`, `TEST` and `NOT`.
    **Conditional & Unconditional Jumps:** Unconditional jumps transfer onstrol to another point in the program.
    | Operation | Syntax |
    | --------- | ------ |
    | jmp | `jmp label1` |
    <!-- separator -->
    jumps can transfer control both forward and backward as well as it can jump anywhere in the current code segment. Conditional jumps ocurrs only when some condition is satisfied.
    | Operation | Use |
    | --------- | ---------- |
    | `JE` or `JZ` | jump when zero flag is set to 1 |
    | `JNE` or `JNZ` | jump when zero flag is set to 0 |
    <!-- separator -->
    another conditional jumps are:
    | Operation | Description | Use |
    | --------- | ----------- | ----- |
    | `ja` | jump if above | jumps if CF is set 0 and ZF is set 0 |
    | `jg` | jump if greater | jumps if SF is equal to OF and ZF is set 0 |
    | `jb` | jump if below | jumps if CF = 1 |
    | `jl` | jump if less | jumps if SF is different to OF |
    | `jc` | - | jumps if CF is set to 1 | 
    | `jcxz` | - | jumps if CX register is set to 0 |
    <!-- separator -->
    most of the jumps are used after a comparison checked by the `cmp` instruction.
    **Control flow instructions:** these operations dictate how the program flow behaves. some of them are:
    | Instruction | Use |
    | ----------- | --- |
    | `inc` | adds 1 to any register |
    | `dec` | substract 1 from any register |
    | `comp` | substract source from destination and set the flags |
    | `shl` | shifts the 16 bit register to the left |
    | `shr` | shifts the 16 bit register to the right |
    | `rol` | rotates the 16 bit register to the left |
    | `ror` | rotates the 16 bit register to the right |
    <!-- separator -->
    the shift and rotate instructions takes as source the times you want to do the operation. both uses the carry flag to save values from the MSB and LSB.
4. **MEMORY**
    Combinations between registers, pointers and indexes for accesing memory.
    `BX + SI` or `BP + DI`
5. **PROCESSOR STATUS REGISTER OR FLAGS**
    | 15 | 14 | 13 | 12 | 11 | 10 | 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
    | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | -- | 
    | X | X | X | X | OF | DF | IF | TF | SF | ZF | X | AF | X | PF | X | CF |
    <!-- separator -->
    each of these bits can be 0 or 1 only.
    - OF -> OVERFLOW FLAG.
    - DF -> DIRECTION FLAG.
    - IF -> INTERRUPT ENABLE FLAG.
    - TF -> TRAP FLAG.
    - SF -> SIGN FLAG.
    - ZF -> ZERO FLAG.
    - AF -> AUXILIARY CARRY FLAG.
    - PF -> PARITY FLAG.
    - CF -> CARRY FLAG.
6. **LABELS**
    A label is an specific set of code, for example:
    ```
    Read:
        mov AH, 01
        jmp Exit
    Exit:
        mov AH, 4ch
        int 21h
    ```
    there are two labels in here `Read` label and `Exit` label.
7. **INTERRUPTS**
    Interrupts are an input signal to the processor indication an event that needs immediate attention. you can find most of the interrupts here in the [dosints textbook](./dosints.pdf)
[^1]: Note that the scale size is in bits.
[^2]: If you are pointing to a string the datatype memory is allocated for each character ('$' is used for End of String). 
[^3]: mov MEMORY, MEMORY is not supported.
[^4]: the types of operand supported by some arithmetic operations are the same as the mov instruction.
[^5]: In 16 bit multiplication, the 32 bit product appears in DX-AX instead of AX only and the carry flag is set to 1.
[^6]: some of the errors are: (i). Divide by zero. (ii). Divide overflow ( 4000 / 2 = 2000)