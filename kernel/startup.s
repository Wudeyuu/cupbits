.extern stack_top
.extern init_mmu 
.global _start

_start:
	ldr x0, =stack_top
	mov sp, x0
	mov x0, #0

	bl init_mmu

	.loop:
		b .loop
