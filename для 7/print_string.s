.LC0:
        .string "w"
print_string:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     QWORD PTR [rbp-24], rdi
        mov     DWORD PTR [rbp-28], esi
        mov     QWORD PTR [rbp-40], rdx
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, OFFSET FLAT:.LC0
        mov     rdi, rax
        call    fopen
        mov     QWORD PTR [rbp-16], rax
        mov     DWORD PTR [rbp-4], 0
        jmp     .L2
.L3:
        mov     eax, DWORD PTR [rbp-4]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        movsx   eax, al
        mov     rdx, QWORD PTR [rbp-16]
        mov     rsi, rdx
        mov     edi, eax
        call    fputc
        add     DWORD PTR [rbp-4], 1
.L2:
        mov     eax, DWORD PTR [rbp-4]
        cmp     eax, DWORD PTR [rbp-28]
        jl      .L3
        nop
        leave
        ret
