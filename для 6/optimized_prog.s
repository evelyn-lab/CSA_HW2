.intel_syntax noprefix
.text
.section .rodata
.LC0:
        .string "%d "                    # строка "%d"
.LC1:
        .string "%c"                     # строка "%c"
fill_from_console:
        push    rbp                      # сохраняем rbp на стек
        mov     rbp, rsp                 # присваиваем rbp rsp
        push    r12                      # register int i asm ("r12");
        sub     rsp, 40                  # rsp двигаем на 40 байт
        mov     QWORD PTR -40[rbp], rdi  # 
        mov     rax, QWORD PTR -40[rbp]  #
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC0
        mov     eax, 0
        call    __isoc99_scanf            # scanf("%c", &a[i]);
        mov     rax, QWORD PTR -40[rbp]
        mov     eax, DWORD PTR [rax]
        cdqe
        mov     rdi, rax
        call    malloc                    # вызов malloc
        mov     QWORD PTR -24[rbp], rax
        mov     r12d, 0                   # r12d := 0
        jmp     .L2                       # jump -> .L3
.L3:
        mov     eax, r12d
        movsx   rdx, eax
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC1
        mov     eax, 0
        call    __isoc99_scanf
        mov     eax, r12d
        add     eax, 1
        mov     r12d, eax
.L2:
        mov     rax, QWORD PTR -40[rbp]
        mov     eax, DWORD PTR [rax]
        mov     edx, r12d
        cmp     eax, edx                    # сравниваем i с n
        jg      .L3                         # jump greater -> .L3
        mov     rax, QWORD PTR -24[rbp]     # return a;
        mov     r12, QWORD PTR -8[rbp]
        leave                               # выход из функции, очистка памяти
        ret
print_string:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     QWORD PTR -24[rbp], rdi
        mov     DWORD PTR -28[rbp], esi
        mov     DWORD PTR -4[rbp], 0
        jmp     .L6
.L7:
        mov     eax, DWORD PTR -4[rbp]
        movsx   rdx, eax
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        movsx   eax, al
        mov     edi, eax
        call    putchar
        add     DWORD PTR -4[rbp], 1
.L6:
        mov     eax, DWORD PTR -4[rbp]
        cmp     eax, DWORD PTR -28[rbp]
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
        mov     QWORD PTR -40[rbp], rdi
        mov     DWORD PTR -44[rbp], esi
        mov     QWORD PTR -56[rbp], rdx
        mov     DWORD PTR -48[rbp], ecx
        mov     eax, DWORD PTR -44[rbp]
        cdqe
        mov     rdi, rax
        call    malloc
        mov     QWORD PTR -32[rbp], rax
        mov     DWORD PTR -20[rbp], 0
        mov     r12d, 0
        jmp     .L9
.L11:
        mov     eax, r12d
        movsx   rdx, eax
        mov     rax, QWORD PTR -40[rbp]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        movsx   edx, al
        mov     rax, QWORD PTR -56[rbp]
        mov     esi, edx
        mov     rdi, rax
        call    strchr
        test    rax, rax
        jne     .L10
        mov     eax, r12d
        movsx   rdx, eax
        mov     rax, QWORD PTR -40[rbp]
        add     rax, rdx
        mov     edx, DWORD PTR -20[rbp]
        movsx   rcx, edx
        mov     rdx, QWORD PTR -32[rbp]
        add     rdx, rcx
        movzx   eax, BYTE PTR [rax]
        mov     BYTE PTR [rdx], al
        add     DWORD PTR -20[rbp], 1
.L10:
        mov     eax, r12d
        add     eax, 1
        mov     r12d, eax
.L9:
        mov     eax, r12d
        cmp     DWORD PTR -44[rbp], eax
        jg      .L11
        mov     eax, DWORD PTR -20[rbp]
        cdqe
        mov     rdi, rax
        call    malloc
        mov     r13, rax
        mov     r12d, 0
        jmp     .L12
.L13:
        mov     eax, r12d
        movsx   rdx, eax
        mov     rax, QWORD PTR -32[rbp]
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
        cmp     DWORD PTR -20[rbp], eax
        jg      .L13
        mov     rax, QWORD PTR -32[rbp]
        mov     rdi, rax
        call    free
        mov     rdx, r13
        mov     eax, DWORD PTR -20[rbp]
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
        mov     DWORD PTR -36[rbp], edi
        mov     QWORD PTR -48[rbp], rsi
        lea     rax, -20[rbp]
        mov     rdi, rax
        call    fill_from_console
        mov     r14, rax
        lea     rax, -24[rbp]
        mov     rdi, rax
        call    fill_from_console
        mov     r15, rax
        mov     edx, DWORD PTR -24[rbp]
        mov     rsi, r15
        mov     eax, DWORD PTR -20[rbp]
        mov     rdi, r14
        mov     ecx, edx
        mov     rdx, rsi
        mov     esi, eax
        call    difference
        mov     edx, DWORD PTR -20[rbp]
        mov     rsi, r14
        mov     eax, DWORD PTR -24[rbp]
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
