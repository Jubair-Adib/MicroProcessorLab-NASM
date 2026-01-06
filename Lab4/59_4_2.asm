extern printf
extern scanf

SECTION .data
in_fmt:  db "%ld", 0
out_fmt: db "%ld x %ld = %ld", 10, 0

SECTION .bss
n: resq 1
i: resq 1

SECTION .text
global main

main:
    push rbp
    
    mov rdi, in_fmt
    mov rsi, n
    call scanf
    
    mov qword [i], 1
    
table_loop:
    mov rcx, [i]
    cmp rcx, 10
    jg end
    
    mov rax, [n]
    imul rax, rcx
    
    mov rdi, out_fmt
    mov rsi, [n]
    mov rdx, rcx
    mov rcx, rax
    call printf
    
    inc qword [i]
    jmp table_loop

end:
    pop rbp
    mov rax, 0
    ret