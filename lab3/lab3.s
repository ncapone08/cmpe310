.section .text

    .global findSum

findSum:
    # %rdi has the array, %rsi has the array length

    test %rsi, %rsi   # check array size
    jz loopEnd
    xor %rcx, %rcx    # this will be our counter
    movl $0, %eax     # this will be the sum

loopStart:
    # compare %rcx to %rsi
    cmp %rsi, %rcx
    jae loopEnd

    addl (%rdi, %rcx, 4), %eax      # (base, index * 4) == arr[i]

    incq %rcx;
    jmp loopStart   # Return to the loop

loopEnd:
    # sum is in %eax
    ret

