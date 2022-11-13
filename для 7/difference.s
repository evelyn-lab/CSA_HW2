difference:
        push    rbp
        mov     rbp, rsp
        push    r13
        push    r12
        sub     rsp, 48
        mov     QWORD PTR [rbp-40], rdi
        mov     DWORD PTR [rbp-44], esi
        mov     QWORD PTR [rbp-56], rdx
        mov     DWORD PTR [rbp-48], ecx
        mov     QWORD PTR [rbp-64], r8
        mov     edx, DWORD PTR [rbp-44]
        mov     eax, DWORD PTR [rbp-48]
        add     eax, edx
        cdqe
        mov     rdi, rax
        call    malloc
        mov     QWORD PTR [rbp-32], rax
        mov     DWORD PTR [rbp-20], 0
        mov     r12d, 0
        jmp     .L2
.L4:
        mov     eax, r12d
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        movsx   edx, al
        mov     rax, QWORD PTR [rbp-56]
        mov     esi, edx
        mov     rdi, rax
        call    strchr
        test    rax, rax
        jne     .L3
        mov     eax, r12d
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        movsx   edx, al
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, edx
        mov     rdi, rax
        call    strchr
        test    rax, rax
        jne     .L3
        mov     eax, r12d
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     edx, DWORD PTR [rbp-20]
        movsx   rcx, edx
        mov     rdx, QWORD PTR [rbp-32]
        add     rdx, rcx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR [rdx], al
        add     DWORD PTR [rbp-20], 1
.L3:
        mov     eax, r12d
        add     eax, 1
        mov     r12d, eax
.L2:
        mov     eax, r12d
        cmp     DWORD PTR [rbp-44], eax
        jg      .L4
        mov     eax, DWORD PTR [rbp-20]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-32]
        add     rax, rdx
        mov     BYTE PTR [rax], 10
        add     DWORD PTR [rbp-20], 1
        mov     r12d, 0
        jmp     .L5
.L7:
        mov     eax, r12d
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-56]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        movsx   edx, al
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, edx
        mov     rdi, rax
        call    strchr
        test    rax, rax
        jne     .L6
        mov     eax, r12d
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-56]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        movsx   edx, al
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, edx
        mov     rdi, rax
        call    strchr
        test    rax, rax
        jne     .L6
        mov     eax, r12d
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-56]
        add     rax, rdx
        mov     edx, DWORD PTR [rbp-20]
        movsx   rcx, edx
        mov     rdx, QWORD PTR [rbp-32]
        add     rdx, rcx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR [rdx], al
        add     DWORD PTR [rbp-20], 1
.L6:
        mov     eax, r12d
        add     eax, 1
        mov     r12d, eax
.L5:
        mov     eax, r12d
        cmp     DWORD PTR [rbp-48], eax
        jg      .L7
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        mov     rdi, rax
        call    malloc
        mov     r13, rax
        mov     r12d, 0
        jmp     .L8
.L9:
        mov     eax, r12d
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-32]
        add     rax, rdx
        mov     rcx, r13
        mov     edx, r12d
        movsx   rdx, edx
        add     rdx, rcx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR [rdx], al
        mov     eax, r12d
        add     eax, 1
        mov     r12d, eax
.L8:
        mov     eax, r12d
        cmp     DWORD PTR [rbp-20], eax
        jg      .L9
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    free
        mov     rcx, r13
        mov     rdx, QWORD PTR [rbp-64]
        mov     eax, DWORD PTR [rbp-20]
        mov     esi, eax
        mov     rdi, rcx
        call    print_string
        nop
        add     rsp, 48
        pop     r12
        pop     r13
        pop     rbp
        ret
