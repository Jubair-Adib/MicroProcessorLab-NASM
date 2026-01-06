extern printf
extern scanf

SECTION .data
x:        dq 0
i:        dq 0
flag:     dq 0

prompt:   db "Enter a positive integer: ",0
inputf:   db "%d",0
out_prime:    db "%ld is a prime number.",10,0
out_notprime: db "%ld is not a prime number.",10,0
sf:       db "%s",0

SECTION .text
global main
main:
    push rbp

    ; ---------- Prompt for input ----------
    mov rax,0
    mov rdi,sf
    mov rsi,prompt
    call printf

    ; ---------- Read x ----------
    mov rax,0
    mov rdi,inputf
    mov rsi,x
    call scanf

    ; ---------- Initialize ----------
    mov rax,[x]
    cmp rax,2
    jl not_prime          ; if x < 2 → not prime
    cmp rax,2
    je prime              ; if x == 2 → prime

    mov rcx,2             ; i = 2
    mov rbx,[x]
    mov qword [flag],0

check_loop:
    mov rax,[x]
    mov rdx,0
    div rcx               ; divide x by i → remainder in rdx
    cmp rdx,0
    je not_prime          ; divisible → not prime

    inc rcx
    mov rax,rcx
    imul rax,rax          ; i*i
    cmp rax,[x]
    jle check_loop        ; loop while i*i <= x

prime:
    mov rdi,out_prime
    mov rsi,[x]
    mov rax,0
    call printf
    jmp end_prog

not_prime:
    mov rdi,out_notprime
    mov rsi,[x]
    mov rax,0
    call printf

end_prog:
    pop rbp
    mov rax,0
    ret
