.intel_syntax noprefix
.text
.section .rodata
.LC0:
        .string "%d "
.LC1:
        .string "%c"
fill_from_console:
        push    rbp
        mov     rbp, rsp
        push    r12
        sub     rsp, 40
        mov     QWORD PTR [rbp-40], rdi
        mov     rax, QWORD PTR [rbp-40]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    __isoc99_scanf
        mov     rax, QWORD PTR [rbp-40]
        mov     eax, DWORD PTR [rax]
        cdqe
        mov     rdi, rax
        call    malloc
        mov     QWORD PTR [rbp-24], rax
        mov     r12d, 0
        jmp     .L2
.L3:
        mov     eax, r12d
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC1
        mov     eax, 0
        call    __isoc99_scanf
        mov     eax, r12d
        add     eax, 1
        mov     r12d, eax
.L2:
        mov     rax, QWORD PTR [rbp-40]
        mov     eax, DWORD PTR [rax]
        mov     edx, r12d
        cmp     eax, edx
        jg      .L3
        mov     rax, QWORD PTR [rbp-24]
        mov     r12, QWORD PTR [rbp-8]
        leave
        ret
print_string:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     DWORD PTR [rbp-28], esi
        mov     DWORD PTR [rbp-4], 0
        jmp     .L6
.L7:
        mov     eax, DWORD PTR [rbp-4]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        movsx   eax, al
        mov     edi, eax
        call    putchar
        add     DWORD PTR [rbp-4], 1
.L6:
        mov     eax, DWORD PTR [rbp-4]
        cmp     eax, DWORD PTR [rbp-28]
        jl      .L7
        mov     edi, 10
        call    putchar
        nop
        leave
        ret
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
        mov     eax, DWORD PTR [rbp-44]
        cdqe
        mov     rdi, rax
        call    malloc
        mov     QWORD PTR [rbp-32], rax
        mov     DWORD PTR [rbp-20], 0
        mov     r12d, 0
        jmp     .L9
.L11:
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
        jne     .L10
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
.L10:
        mov     eax, r12d
        add     eax, 1
        mov     r12d, eax
.L9:
        mov     eax, r12d
        cmp     DWORD PTR [rbp-44], eax
        jg      .L11
        mov     eax, DWORD PTR [rbp-20]
        cdqe
        mov     rdi, rax
        call    malloc
        mov     r13, rax
        mov     r12d, 0
        jmp     .L12
.L13:
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
.L12:
        mov     eax, r12d
        cmp     DWORD PTR [rbp-20], eax
        jg      .L13
        mov     rax, QWORD PTR [rbp-32]
        mov     rdi, rax
        call    free
        mov     rdx, r13
        mov     eax, DWORD PTR [rbp-20]
        mov     esi, eax
        mov     rdi, rdx
        call    print_string
        mov     rax, r13
        mov     rdi, rax
        call    free
        nop
        add     rsp, 48
        pop     r12
        pop     r13
        pop     rbp
        ret
main:
        push    rbp
        mov     rbp, rsp
        push    r15
        push    r14
        sub     rsp, 32
        mov     DWORD PTR [rbp-36], edi
        mov     QWORD PTR [rbp-48], rsi
        lea     rax, [rbp-20]
        mov     rdi, rax
        call    fill_from_console
        mov     r14, rax
        lea     rax, [rbp-24]
        mov     rdi, rax
        call    fill_from_console
        mov     r15, rax
        mov     edx, DWORD PTR [rbp-24]
        mov     rsi, r15
        mov     eax, DWORD PTR [rbp-20]
        mov     rdi, r14
        mov     ecx, edx
        mov     rdx, rsi
        mov     esi, eax
        call    difference
        mov     edx, DWORD PTR [rbp-20]
        mov     rsi, r14
        mov     eax, DWORD PTR [rbp-24]
        mov     rdi, r15
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
        mov     eax, 0
        add     rsp, 32
        pop     r14
        pop     r15
        pop     rbp
        ret
