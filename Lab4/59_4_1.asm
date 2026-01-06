extern printf
extern scanf

SECTION .data
    in_fmt   db "%ld", 0
    out_fmt  db "%ld", 10, 0    ; print number with newline
    n        dq 0
    rev      dq 0

SECTION .text
    global main
main:
    push rbp

    ; read n
    mov rdi, in_fmt
    mov rsi, n
    call scanf

    ; rax = n
    mov rax, [n]
    mov rcx, 0          ; rev = 0

.rev_loop:
    cmp rax, 0
    je .done
    xor rdx, rdx
    mov rbx, 10
    div rbx             ; quotient in rax, remainder in rdx
    imul rcx, rcx, 10
    add rcx, rdx
    jmp .rev_loop

.done:
    mov [rev], rcx

    ; print reverse
    mov rdi, out_fmt
    mov rsi, [rev]
    mov rax, 0
    call printf

    pop rbp
    mov rax, 0
    ret

