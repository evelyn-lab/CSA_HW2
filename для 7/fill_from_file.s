.LC0:
        .string "r"
.LC1:
        .string "%d"
.LC2:
        .string "%c"
fill_from_file:
        push    rbp
        mov     rbp, rsp
        push    r15
        push    r14
        push    r12
        sub     rsp, 56
        mov     QWORD PTR [rbp-72], rdi
        mov     QWORD PTR [rbp-80], rsi
        mov     rax, QWORD PTR [rbp-72]
        mov     esi, OFFSET FLAT:.LC0
        mov     rdi, rax
        call    fopen
        mov     QWORD PTR [rbp-40], rax
        lea     rdx, [rbp-44]
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, OFFSET FLAT:.LC1
        mov     rdi, rax
        mov     eax, 0
        call    __isoc99_fscanf
        lea     rdx, [rbp-49]
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, OFFSET FLAT:.LC2
        mov     rdi, rax
        mov     eax, 0
        call    __isoc99_fscanf
        mov     eax, DWORD PTR [rbp-44]
        cdqe
        mov     rdi, rax
        call    malloc
        mov     r14, rax
        mov     r12d, 0
        jmp     .L2
.L3:
        mov     rdx, r14
        mov     eax, r12d
        cdqe
        add     rdx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, OFFSET FLAT:.LC2
        mov     rdi, rax
        mov     eax, 0
        call    __isoc99_fscanf
        mov     eax, r12d
        add     eax, 1
        mov     r12d, eax
.L2:
        mov     edx, r12d
        mov     eax, DWORD PTR [rbp-44]
        cmp     edx, eax
        jl      .L3
        lea     rdx, [rbp-48]
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, OFFSET FLAT:.LC1
        mov     rdi, rax
        mov     eax, 0
        call    __isoc99_fscanf
        lea     rdx, [rbp-49]
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, OFFSET FLAT:.LC2
        mov     rdi, rax
        mov     eax, 0
        call    __isoc99_fscanf
        mov     eax, DWORD PTR [rbp-48]
        cdqe
        mov     rdi, rax
        call    malloc
        mov     r15, rax
        mov     r12d, 0
        jmp     .L4
.L5:
        mov     rdx, r15
        mov     eax, r12d
        cdqe
        add     rdx, rax
        mov     rax, QWORD PTR [rbp-40]
        mov     esi, OFFSET FLAT:.LC2
        mov     rdi, rax
        mov     eax, 0
        call    __isoc99_fscanf
        mov     eax, r12d
        add     eax, 1
        mov     r12d, eax
.L4:
        mov     edx, r12d
        mov     eax, DWORD PTR [rbp-48]
        cmp     edx, eax
        jl      .L5
        mov     edx, DWORD PTR [rbp-48]
        mov     rsi, r15
        mov     eax, DWORD PTR [rbp-44]
        mov     rdi, r14
        mov     rcx, QWORD PTR [rbp-80]
        mov     r8, rcx
        mov     ecx, edx
        mov     rdx, rsi
        mov     esi, eax
        call    difference
        mov     rax, r14
        mov     rdi, rax
        call    free
        mov     rax, r15
        mov     rdi, rax
        call    free
        nop
        add     rsp, 56
        pop     r12
        pop     r14
        pop     r15
        pop     rbp
        ret
