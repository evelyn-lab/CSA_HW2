.intel_syntax noprefix
.text
.section .rodata
.LC0:
        .string "%d "                    # строка "%d"
.LC1:
        .string "%c"                     # строка "%c"
fill_from_console:
        push    rbp                       # сохраняем rbp на стек
        mov     rbp, rsp                  # присваиваем rbp rsp
        push    r12                       # register int i asm ("r12");
        sub     rsp, 40                   # rsp двигаем на 40 байт
        mov     QWORD PTR -40[rbp], rdi   # сохраняем int* n на стек
        mov     rax, QWORD PTR -40[rbp]   # rax := rbp[-40]
        mov     rsi, rax                  # rsi := rax
        mov     edi, OFFSET FLAT:.LC0.    
        mov     eax, 0                    # eax := 0
        call    __isoc99_scanf            # scanf("%d ", n);
        mov     rax, QWORD PTR -40[rbp]   
        mov     eax, DWORD PTR [rax]
        cdqe
        mov     rdi, rax  
        call    malloc                    # вызов malloc
        mov     QWORD PTR -24[rbp], rax
        mov     r12d, 0                   # r12d := 0
        jmp     .L2                       # jump -> .L2
.L3:
        mov     eax, r12d                 # eax := r12d
        movsx   rdx, eax
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        mov     rsi, rax
        mov     edi, OFFSET FLAT:.LC1
        mov     eax, 0
        call    __isoc99_scanf             # scanf("%c", &a[i]);
        mov     eax, r12d                  # -----
        add     eax, 1                     # i ++
        mov     r12d, eax                  # -----
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
        push    r12                      # register int i asm ("r12");
        sub     rsp, 24
        mov     QWORD PTR [rbp-24], rdi  # сохраняем char *a на стек
        mov     DWORD PTR [rbp-28], esi  # сохраняем int n на стек
        mov     r12d, 0
        jmp     .L6
.L7:
        mov     eax, r12d
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-24]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        movsx   eax, al
        mov     edi, eax
        call    putchar                   # printf("%c", a[i]);
        mov     eax, r12d
        add     eax, 1
        mov     r12d, eax
.L6:
        mov     eax, r12d
        cmp     DWORD PTR [rbp-28], eax
        jg      .L7
        mov     edi, 10
        call    putchar                   # printf("\n");
        nop
        mov     r12, QWORD PTR [rbp-8]
        leave
        ret
difference:
        push    rbp
        mov     rbp, rsp
        push    r13                      # register char *result asm("r13");
        push    r12                      # register int i asm ("r12");
        sub     rsp, 48
        mov     QWORD PTR -40[rbp], rdi  # сохраняем char *a на стек
        mov     DWORD PTR -44[rbp], esi  # сохраняем int n1 на стек
        mov     QWORD PTR -56[rbp], rdx  # сохраняем char *b на стек
        mov     DWORD PTR -48[rbp], ecx  # сохраняем int n2 на стек
        mov     eax, DWORD PTR -44[rbp]
        cdqe
        mov     rdi, rax
        call    malloc                   # char *buffer = (char*)malloc((n1) * sizeof(char)); 
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
        call    strchr                    # strchr(b, a[i])
        test    rax, rax
        jne     .L10                      # jump not equal -> .L10
        mov     eax, r12d
        movsx   rdx, eax
        mov     rax, QWORD PTR [rbp-40]
        add     rax, rdx
        movzx   eax, BYTE PTR [rax]
        movsx   edx, al
        mov     rax, QWORD PTR [rbp-32]
        mov     esi, edx
        mov     rdi, rax
        call    strchr                    # strchr(buffer, a[i])
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
        jg      .L11                        # jump greater -> .L11
        mov     eax, DWORD PTR -20[rbp]
        cdqe
        mov     rdi, rax
        call    malloc                      # char *result(char*)malloc((current_size) * sizeof(char)); 
        mov     r13, rax
        mov     r12d, 0
        jmp     .L12                        # jump -> .L12
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
        call    free                     # free(buffer);
        nop
        add     rsp, 48
        pop     r12
        pop     r13
        pop     rbp
        ret
main:
        push    rbp                      # сохраняем rbp на стек
        mov     rbp, rsp                 # присваиваем rbp rsp
        push    r15                      # register char *str2 asm("r15");
        push    r14                      # register char *str1 asm("r14");
        sub     rsp, 32                  # rsp двигаем на 32 байта
        mov     DWORD PTR -36[rbp], edi  # argc
        mov     QWORD PTR -48[rbp], rsi  # argv
        lea     rax, -20[rbp]            # кладём в rax указатель на n1
        mov     rdi, rax
        call    fill_from_console        # char *str1 = fill_from_console(&n1);
        mov     r14, rax
        lea     rax, -24[rbp]            # кладём в rax указатель на n2
        mov     rdi, rax
        call    fill_from_console        # char *str2 = fill_from_console(&n2);
        mov     r15, rax
        mov     edx, DWORD PTR -24[rbp]
        mov     rsi, r15
        mov     eax, DWORD PTR -20[rbp]
        mov     rdi, r14
        mov     ecx, edx
        mov     rdx, rsi
        mov     esi, eax
        call    difference                # difference(str1, n1, str2, n2);
        mov     edx, DWORD PTR -20[rbp]
        mov     rsi, r14
        mov     eax, DWORD PTR -24[rbp]
        mov     rdi, r15
        mov     ecx, edx
        mov     rdx, rsi
        mov     esi, eax
        call    difference                # difference(str2, n2, str1, n1);
        mov     rax, r14
        mov     rdi, rax
        call    free                      # free(str1);
        mov     rax, r15
        mov     rdi, rax
        call    free                      # free(str2);                      
        mov     eax, 0
        add     rsp, 32
        pop     r14
        pop     r15
        pop     rbp
        ret
