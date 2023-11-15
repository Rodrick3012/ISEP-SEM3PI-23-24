.section .data
.section .text

.global mediana


.section .text
.global mediana


mediana:
		
	movq ptrvec(%rip),%rsi						# Endereço em '%RSI'
	movslq num(%rip),%rax						# Size em '%RCX'
	cmp $0, %rax
	je end
	cltd
	movq $2, %r9
	idivq %r9
	movq %rax, %rcx
	cmp $0, %rdx
	je valorDoisMediana
	jmp valorUmaMediana
	
valorUmaMediana:	
	movl (%rsi, %rcx, 4), %eax
	jmp end
	
valorDoisMediana:
	movl (%rsi, %rcx, 4), %r11d
	incq %rcx
	movl (%rsi, %rcx, 4 ), %eax
	addl %r11d, %eax
	movl $2, %r9d
	idivl %r9d
	jmp end	
	
	
	
	
end:	
ret
