.global init_mmu

init_mmu:
	mov x0, #1
	msr sctlr_el1, x0
	isb
	ret
