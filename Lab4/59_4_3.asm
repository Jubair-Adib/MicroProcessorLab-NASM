extern printf
extern scanf

SECTION .data
in_fmt:  db "%ld", 0
out_fmt: db "%ld ", 0
newline: db 10, 0

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
    
divisor_loop:
    mov rax, [n]
    mov rdx, 0
    mov rcx, [i]
    div rcx
    
    cmp rdx, 0
    jne skip
    
    mov rdi, out_fmt
    mov rsi, [i]
    call printf

skip:
    inc qword [i]
    mov rcx, [i]
    cmp rcx, [n]
    jle divisor_loop
    
    mov rdi, newline
    call printf
    
    pop rbp
    mov rax, 0
    ret