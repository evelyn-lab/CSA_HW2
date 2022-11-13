main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     DWORD PTR [rbp-4], edi
        mov     QWORD PTR [rbp-16], rsi
        mov     rax, QWORD PTR [rbp-16]
        add     rax, 16
        mov     rdx, QWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-16]
        add     rax, 8
        mov     rax, QWORD PTR [rax]
        mov     rsi, rdx
        mov     rdi, rax
        call    fill_from_file
        mov     eax, 0
        leave
        ret
