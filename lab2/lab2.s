.section .data
foo:    .ascii "0110 0110 0110 1111 0110 1111"
bar:    .ascii "0110 0010 0110 0001 0111 0010"
len1 = . - foo
len2 = . - bar
fmtString:  .string "The Hamming Value is: %d\n"


.section .text
    .global main
    .extern printf
    
main:
    movq $foo, %r12   # move foo, corresponds to len1
    movq $bar, %r13   # move bar, corresponds to len2
    movq $0, %r9      # hamming code
    mov $0, %r15      # counter

    movq $len1, %r11    # length of foo
    movq $len2, %rax    # length of bar
    cmp %rax, %r11      # assume len1 < len2
    jbe loopStart
    movq %rax, %r11     # len2 < len1 move to %rax

loopStart:
    cmp %r11, %r15      # compare counter to limit 
    jae loopEnd #exit   # jump if greater than
    
    movq %r12, %rax        # Copy base address foo to rax
    addq %r15, %rax        # rax = foo + i
    movb (%rax), %cl       # foo byte
    
    movq %r13, %rdx
    addq %r15, %rdx
    movb (%rdx), %bl    # bar byte

    cmpb %bl, %cl    # check for equality 
    je notEqual
    incq %r9   

notEqual:
    incq %r15
    jmp loopStart
    
loopEnd:
    movq %r9, %rsi
    movq $fmtString, %rdi
    movb $0, %al
    call printf

    movq $0, %rax
    ret