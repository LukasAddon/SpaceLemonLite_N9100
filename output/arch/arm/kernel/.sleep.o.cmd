cmd_arch/arm/kernel/sleep.o := /home/N910C_MM/SpaceLemonLite_N9100/scripts/gcc-wrapper.py /home/N910C_MM/arm-eabi-4.8/bin/arm-eabi-gcc -Wp,-MD,arch/arm/kernel/.sleep.o.d  -nostdinc -isystem /home/N910C_MM/arm-eabi-4.8/bin/../lib/gcc/arm-eabi/4.9.4/include -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include -Iarch/arm/include/generated  -I/home/N910C_MM/SpaceLemonLite_N9100/include -Iinclude -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/home/N910C_MM/SpaceLemonLite_N9100/include/uapi -Iinclude/generated/uapi -include /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian   -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -mcpu=cortex-a15 -include asm/unified.h -msoft-float -gdwarf-2   -c -o arch/arm/kernel/sleep.o /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/kernel/sleep.S

source_arch/arm/kernel/sleep.o := /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/kernel/sleep.S

deps_arch/arm/kernel/sleep.o := \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/nr/cpus.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
    $(wildcard include/config/thumb2/kernel.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/linkage.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/stringify.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/linkage.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/threads.h \
    $(wildcard include/config/base/small.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/asm-offsets.h \
  include/generated/asm-offsets.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/assembler.h \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/cpu/use/domains.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/hwcap.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi/asm/hwcap.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/domain.h \
    $(wildcard include/config/verify/permission/fault.h) \
    $(wildcard include/config/io/36.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/opcodes-virt.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/opcodes.h \
    $(wildcard include/config/cpu/endian/be32.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/glue-cache.h \
    $(wildcard include/config/cpu/cache/v4.h) \
    $(wildcard include/config/cpu/arm920t.h) \
    $(wildcard include/config/cpu/arm922t.h) \
    $(wildcard include/config/cpu/arm925t.h) \
    $(wildcard include/config/cpu/arm1020.h) \
    $(wildcard include/config/cpu/arm1026.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/cpu/arm926t.h) \
    $(wildcard include/config/cpu/arm940t.h) \
    $(wildcard include/config/cpu/arm946e.h) \
    $(wildcard include/config/cpu/cache/v4wb.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/mohawk.h) \
    $(wildcard include/config/cpu/v6.h) \
    $(wildcard include/config/cpu/v6k.h) \
    $(wildcard include/config/cpu/v7.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/glue.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/glue-proc.h \
    $(wildcard include/config/cpu/arm7tdmi.h) \
    $(wildcard include/config/cpu/arm720t.h) \
    $(wildcard include/config/cpu/arm740t.h) \
    $(wildcard include/config/cpu/arm9tdmi.h) \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/arm1020e.h) \
    $(wildcard include/config/cpu/arm1022.h) \
    $(wildcard include/config/cpu/pj4b.h) \
    $(wildcard include/config/tima/rkp/l2/tables.h) \

arch/arm/kernel/sleep.o: $(deps_arch/arm/kernel/sleep.o)

$(deps_arch/arm/kernel/sleep.o):
