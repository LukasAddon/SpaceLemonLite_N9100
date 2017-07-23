cmd_usr/initramfs_data.o := /home/N910C_MM/SpaceLemonLite_N9100/scripts/gcc-wrapper.py /home/N910C_MM/arm-eabi-4.8/bin/arm-eabi-gcc -Wp,-MD,usr/.initramfs_data.o.d  -nostdinc -isystem /home/N910C_MM/arm-eabi-4.8/bin/../lib/gcc/arm-eabi/4.9.4/include -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include -Iarch/arm/include/generated  -I/home/N910C_MM/SpaceLemonLite_N9100/include -Iinclude -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/home/N910C_MM/SpaceLemonLite_N9100/include/uapi -Iinclude/generated/uapi -include /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian   -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -mcpu=cortex-a15 -include asm/unified.h -msoft-float -gdwarf-2 -DINITRAMFS_IMAGE="usr/initramfs_data.cpio"   -c -o usr/initramfs_data.o /home/N910C_MM/SpaceLemonLite_N9100/usr/initramfs_data.S

source_usr/initramfs_data.o := /home/N910C_MM/SpaceLemonLite_N9100/usr/initramfs_data.S

deps_usr/initramfs_data.o := \
    $(wildcard include/config/64bit.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
    $(wildcard include/config/thumb2/kernel.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/stringify.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/vmlinux.lds.h \
    $(wildcard include/config/hotplug.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/ftrace/syscalls.h) \
    $(wildcard include/config/clksrc/of.h) \
    $(wildcard include/config/irqchip.h) \
    $(wildcard include/config/common/clk.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/pm/trace.h) \
    $(wildcard include/config/deferred/initcalls.h) \
    $(wildcard include/config/blk/dev/initrd.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \

usr/initramfs_data.o: $(deps_usr/initramfs_data.o)

$(deps_usr/initramfs_data.o):
