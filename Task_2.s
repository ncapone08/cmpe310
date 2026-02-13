.section .bss
.globl ram
.lcomm ram, 256     #reserve 256 B of ram

.section .text
.globl fill_ram     #make function visible to .c program

fill_ram:
    #load with constant addr $ram+0x50
    mov $ram+0x50, %rax

    #store val FFh into %rax with indirect addressing
    movb $0xFF, (%rax) 
    movb $0xFF, 1(%rax)
    movb $0xFF, 2(%rax)
    movb $0xFF, 3(%rax)
    movb $0xFF, 4(%rax)
    movb $0xFF, 5(%rax)
    movb $0xFF, 6(%rax)
    movb $0xFF, 7(%rax)
    movb $0xFF, 8(%rax)

    ret # .c program takes control

.section .note.GNU-stack,"",@progbits