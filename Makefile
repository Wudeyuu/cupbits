CC := gcc
AS := as
LINKER := ld
COPIER := objcopy

KERNEL_OBJS := build/kernel/startup.o

KERNEL_OBJS += build/kernel/init/mmu.o

#COMPILE

all: build/Kernel.img

build/Kernel.img: build/Kernel.elf
	@$(COPIER) -O binary build/Kernel.elf build/Kernel.img
	
build/Kernel.elf: $(KERNEL_OBJS)
	@$(LINKER) -T kernel/linker.ld -o build/Kernel.elf $(KERNEL_OBJS)

build/kernel/startup.o: kernel/startup.s build/kernel
	@$(AS) -o build/kernel/startup.o kernel/startup.s

build/kernel/init/mmu.o: kernel/init/mmu.s build/kernel/init
	@$(AS) -o build/kernel/init/mmu.o kernel/init/mmu.s

#MAKE DIRECTORY

build/kernel/init: build/kernel
	@mkdir build/kernel/init

build/kernel: build
	@mkdir build/kernel

build:
	@mkdir build

clean:
	@rm -rf build
