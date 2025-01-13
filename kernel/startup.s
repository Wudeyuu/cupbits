.extern stack_top
.global _start

_start:
	ldr x0, =stack_top
	mov sp, x0
	mov x0, #0

	.loop:
		b .loop
