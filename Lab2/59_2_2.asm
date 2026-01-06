extern printf
extern scanf

SECTION .data
a:	dq	5
b:	dq	2
c:	dq	1
d:	dq	0
O:	db	"2*%ld + 3*%ld + %ld = %ld",10,0
EA	db	"Enter a: ",0
EB	db	"Enter b: ",0
EC	db	"Enter c: ",0
SF:	db	"%s",10,0
IF:	db	"%d",0



SECTION .text
global main
main:
	push 	rbp
	
	mov	rax,0
	mov	rdi,SF
	mov	rsi,EA
	call 	printf

	mov	rax,0
	mov	rdi,IF
	mov	rsi,a
	call 	scanf

	mov	rax,0
	mov	rdi,SF
	mov	rsi,EB
	call 	printf

	mov	rax,0
	mov	rdi,IF
	mov	rsi,b
	call 	scanf

	mov	rax,0
	mov	rdi,SF
	mov	rsi,EC
	call 	printf

	mov	rax,0
	mov	rdi,IF
	mov	rsi,c
	call 	scanf

	mov	rax,[a]
	imul	rax,2
	mov	rbx,[b]
	imul	rbx,3
	add 	rax,rbx
	mov	rbx,[c]
	add 	rax,rbx

	mov	[d],rax

	mov 	rdi,O
	mov	rsi,[a]
	mov	rdx,[b]
	mov	rcx,[c]
	mov	r8,[d]
	mov	rax,0
	call printf


	pop	rbp
	mov 	rax,0	
	ret