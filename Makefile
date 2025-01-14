CC := gcc
AS := as
LINKER := ld
COPIER := objcopy

KERNEL_OBJS := build/kernel/startup.o

#COMPILE

all: build/Kernel.img

qemu: build/Kernel.img
	@qemu-system-aarch64 -M virt \
		-kernel build/Kernel.img \
				 -display vnc=:1 \
				   -serial stdio

build/Kernel.img: build/Kernel.elf
	@$(COPIER) -O binary build/Kernel.elf build/Kernel.img
	
build/Kernel.elf: $(KERNEL_OBJS)
	@$(LINKER) -T kernel/linker.ld -o build/Kernel.elf $(KERNEL_OBJS)

build/kernel/startup.o: kernel/startup.s build/kernel
	@$(AS) -o build/kernel/startup.o kernel/startup.s

#MAKE DIRECTORY

build/kernel: build
	@mkdir build/kernel

build:
	@mkdir build

clean:
	@rm -rf build
