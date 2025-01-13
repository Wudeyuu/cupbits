CC := gcc
AS := as
LINKER := ld

KERNEL_OBJS = build/kernel/startup.o

all: build/Kernel.elf

build/Kernel.elf: $(KERNEL_OBJS)
	@$(LINKER) -T kernel/linker.ld -o build/Kernel.elf $(KERNEL_OBJS)

build/kernel/startup.o: kernel/startup.s build/kernel
	@$(AS) -o build/kernel/startup.o kernel/startup.s

build/kernel: build
	@mkdir build/kernel

build:
	@mkdir build

clean:
	@rm -rf build
