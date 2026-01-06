extern  printf
extern  scanf

SECTION .data
a:      dq 0
b:      dq 0
gcd:    dq 0

promptA: db "Enter first number (a): ",0
promptB: db "Enter second number (b): ",0
inputf:  db "%d",0
outputf: db "GCD of %ld and %ld is %ld",10,0
sf:      db "%s",0

SECTION .text
global main
main:
    push    rbp

    ; ----- Input for a -----
    mov     rax,0
    mov     rdi,sf
    mov     rsi,promptA
    call    printf

    mov     rax,0
    mov     rdi,inputf
    mov     rsi,a
    call    scanf

    ; ----- Input for b -----
    mov     rax,0
    mov     rdi,sf
    mov     rsi,promptB
    call    printf

    mov     rax,0
    mov     rdi,inputf
    mov     rsi,b
    call    scanf

    ; ----- Load a and b -----
    mov     rax,[a]        ; rax = a
    mov     rbx,[b]        ; rbx = b

gcd_loop:
    cmp     rbx,0          ; while (b != 0)
    je      done           

    mov     rdx,0          ; clear remainder
    div     rbx            ; rax / rbx → quotient in rax, remainder in rdx
    mov     rax,rbx        ; a = b
    mov     rbx,rdx        ; b = remainder
    jmp     gcd_loop

done:
    mov     [gcd],rax      ; store final gcd

    ; ----- Print result -----
    mov     rdi,outputf
    mov     rsi,[a]
    mov     rdx,[b]
    mov     rcx,[gcd]
    mov     rax,0
    call    printf

    ; ----- Exit -----
    pop     rbp
    mov     rax,0
    ret
