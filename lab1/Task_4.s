.section .bss
.globl ram
.lcomm ram, 256     #reserve 256 B of ram

.section .text
.globl fill_ram     #make functin visible to .c program

fill_ram:
    
    #load a register
    mov $0, %rax

    #keep adding to register
    add $1, %rax
    add $2, %rax
    add $3, %rax
    add $4, %rax
    add $5, %rax
    add $6, %rax
    add $7, %rax
    add $8, %rax
    add $9, %rax
    add $10, %rax

    mov %rax, ram+0x50 # $ move value stored at register



    ret # .c program takes control

.section .note.GNU-stack,"",@progbits