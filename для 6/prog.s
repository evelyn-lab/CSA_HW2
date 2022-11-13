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
        sub     rsp, 32
        mov     QWORD PTR [rbp-24], rdi
        mov     rax, QWORD PTR [rbp-24]
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    __isoc99_scanf
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax]
        cdqe
        mov     rdi, rax
        call    malloc
        mov     QWORD PTR [rbp-16], rax
        mov     DWORD PTR [rbp-4], 0
        jmp     .L2
.L3:
        mov     eax, DWORD PTR [rbp-4]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-16]
        add     rax, rdx
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC1
        mov     eax, 0
        call    __isoc99_scanf
        add     DWORD PTR [rbp-4], 1
.L2:
        mov     rax, QWORD PTR [rbp-24]
        mov     eax, DWORD PTR [rax]
        cmp     DWORD PTR [rbp-4], eax
        jl      .L3
        mov     rax, QWORD PTR [rbp-16]
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
        sub     rsp, 64
        mov     QWORD PTR [rbp-40], rdi
        mov     DWORD PTR [rbp-44], esi
        mov     QWORD PTR [rbp-56], rdx
        mov     DWORD PTR [rbp-48], ecx
        mov     eax, DWORD PTR [rbp-44]
        cdqe
        mov     rdi, rax
        call    malloc
        mov     QWORD PTR [rbp-16], rax
        mov     DWORD PTR [rbp-4], 0
        mov     DWORD PTR [rbp-8], 0
        jmp     .L9
.L11:
        mov     eax, DWORD PTR [rbp-8]
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
        mov     eax, DWORD PTR [rbp-8]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        mov     edx, DWORD PTR [rbp-4]
        movsx   rcx, edx
        mov     rdx, QWORD PTR [rbp-16]
        add     rdx, rcx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR [rdx], al
        add     DWORD PTR [rbp-4], 1
.L10:
        add     DWORD PTR [rbp-8], 1
.L9:
        mov     eax, DWORD PTR [rbp-8]
        cmp     eax, DWORD PTR [rbp-44]
        jl      .L11
        mov     eax, DWORD PTR [rbp-4]
        cdqe
        mov     rdi, rax
        call    malloc
        mov     QWORD PTR [rbp-24], rax
        mov     DWORD PTR [rbp-8], 0
        jmp     .L12
.L13:
        mov     eax, DWORD PTR [rbp-8]
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-16]
        add     rax, rdx
        mov     edx, DWORD PTR [rbp-8]
        movsx   rcx, edx
        mov     rdx, QWORD PTR [rbp-24]
        add     rdx, rcx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR [rdx], al
        add     DWORD PTR [rbp-8], 1
.L12:
        mov     eax, DWORD PTR [rbp-8]
        cmp     eax, DWORD PTR [rbp-4]
        jl      .L13
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    free
        mov     edx, DWORD PTR [rbp-4]
        mov     rax, QWORD PTR [rbp-24]
        mov     esi, edx
        mov     rdi, rax
        call    print_string
        nop
        leave
        ret
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 48
        mov     DWORD PTR [rbp-36], edi
        mov     QWORD PTR [rbp-48], rsi
        lea     rax, [rbp-20]
        mov     rdi, rax
        call    fill_from_console
        mov     QWORD PTR [rbp-8], rax
        lea     rax, [rbp-24]
        mov     rdi, rax
        call    fill_from_console
        mov     QWORD PTR [rbp-16], rax
        mov     ecx, DWORD PTR [rbp-24]
        mov     esi, DWORD PTR [rbp-20]
        mov     rdx, QWORD PTR [rbp-16]
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    difference
        mov     ecx, DWORD PTR [rbp-20]
        mov     esi, DWORD PTR [rbp-24]
        mov     rdx, QWORD PTR [rbp-8]
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    difference
        mov     rax, QWORD PTR [rbp-8]
        mov     rdi, rax
        call    free
        mov     rax, QWORD PTR [rbp-16]
        mov     rdi, rax
        call    free
        mov     eax, 0
        leave
        ret
