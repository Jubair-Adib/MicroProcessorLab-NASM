extern  printf
extern  scanf

SECTION .data
x:      dq 0
sum:    dq 0

prompt: db "Enter a positive integer: ",0
inputf: db "%d",0
outputf: db "Sum from 1 to %ld is %ld",10,0
sf:     db "%s",0

SECTION .text
global main
main:
    push    rbp

    ; ----- Print prompt -----
    mov     rax,0
    mov     rdi,sf
    mov     rsi,prompt
    call    printf

    ; ----- Read input x -----
    mov     rax,0
    mov     rdi,inputf
    mov     rsi,x
    call    scanf

    ; ----- Initialize -----
    mov     rcx,1           ; counter i = 1
    mov     rbx,[x]         ; load x
    mov     rax,0           ; sum = 0

sum_loop:
    cmp     rcx,rbx         ; compare i and x
    jg      done_loop       ; if i > x, exit loop
    add     rax,rcx         ; sum += i
	inc     rcx             ; i++
    jmp     sum_loop

done_loop:
    mov     [sum],rax       ; store final sum

    ; ----- Print result -----
    mov     rdi,outputf
    mov     rsi,[x]
    mov     rdx,[sum]
    mov     rax,0
    call    printf

    ; ----- Exit -----
    pop     rbp
    mov     rax,0
    ret
