ENTRY(_start)

SECTIONS {
	. = 0x40000000;
	.startup . : {build/kernel/startup.o(.text)}
	. = ALIGN(8);
	. = . + 0x1000;
	stack_top = .;
}
