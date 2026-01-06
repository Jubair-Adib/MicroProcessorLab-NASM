extern printf
extern scanf

SECTION .data
a:      dq 0
b:      dq 0
c:      dq 0
max:    dq 0

prompt:     db "Enter three integers (a b c): ",0
inputf:     db "%d %d %d",0
outf:       db "The maximum value is: %ld",10,0
sf:         db "%s",0

SECTION .text
global main
main:
    push rbp

    ; ---------- Prompt user ----------
    mov rax,0
    mov rdi,sf
    mov rsi,prompt
    call printf

    ; ---------- Scan three integers ----------
    mov rax,0
    mov rdi,inputf
    mov rsi,a
    mov rdx,b
    mov rcx,c
    call scanf

    ; ---------- Assume a is max ----------
    mov rax,[a]
    mov [max],rax

    ; ---------- Compare with b ----------
    mov rbx,[b]
    cmp rbx,[max]
    jle skip_b
    mov [max],rbx
skip_b:

    ; ---------- Compare with c ----------
    mov rbx,[c]
    cmp rbx,[max]
    jle skip_c
    mov [max],rbx
skip_c:

    ; ---------- Print result ----------
    mov rdi,outf
    mov rsi,[max]
    mov rax,0
    call printf

    ; ---------- Exit ----------
    pop rbp
    mov rax,0
    ret
