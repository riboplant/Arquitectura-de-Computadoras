	.file	"array6.c"
	.intel_syntax noprefix
	.text
	.globl	array6
	.type	array6, @function
array6:
	push	ebp
	mov	ebp, esp
	call	__x86.get_pc_thunk.ax
	add	eax, OFFSET FLAT:_GLOBAL_OFFSET_TABLE_
	nop
	pop	ebp
	ret
	.size	array6, .-array6
	.data
	.align 32
	.type	array.0, @object
	.size	array.0, 80
array.0:
	.long	100
	.zero	76
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
	mov	eax, DWORD PTR [esp]
	ret
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
