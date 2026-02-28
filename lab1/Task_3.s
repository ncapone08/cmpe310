.section .bss
.globl ram
.lcomm ram, 256     #reserve 256 B of ram

.section .text
.globl fill_ram     #make function visible to .c program

fill_ram:
    #load with constant ram+0x50 into address
    mov $ram+0x50, %rax

    #store val FFh into ram locations 50h to 58h (indirect addressing by incrementing)
    movb $0x00, (%rax) 
    movb $0x00, 1(%rax)
    movb $0x00, 2(%rax)
    movb $0x00, 3(%rax)
    movb $0x00, 4(%rax)
    movb $0x00, 5(%rax)
    movb $0x00, 6(%rax)
    movb $0x00, 7(%rax)
    movb $0x00, 8(%rax)

    ret # .c program takes control

.section .note.GNU-stack,"",@progbits