cmd_arch/arm/mm/tlb-v7.o := /home/N910C_MM/SpaceLemonLite_N9100/scripts/gcc-wrapper.py /home/N910C_MM/arm-eabi-4.8/bin/arm-eabi-gcc -Wp,-MD,arch/arm/mm/.tlb-v7.o.d  -nostdinc -isystem /home/N910C_MM/arm-eabi-4.8/bin/../lib/gcc/arm-eabi/4.9.4/include -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include -Iarch/arm/include/generated  -I/home/N910C_MM/SpaceLemonLite_N9100/include -Iinclude -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/home/N910C_MM/SpaceLemonLite_N9100/include/uapi -Iinclude/generated/uapi -include /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kconfig.h -D__KERNEL__ -mlittle-endian   -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/include -D__ASSEMBLY__ -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -mcpu=cortex-a15 -include asm/unified.h -msoft-float -gdwarf-2 -Wa,-march=armv7-a   -c -o arch/arm/mm/tlb-v7.o /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mm/tlb-v7.S

source_arch/arm/mm/tlb-v7.o := /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mm/tlb-v7.S

deps_arch/arm/mm/tlb-v7.o := \
    $(wildcard include/config/arch/msm8x60.h) \
    $(wildcard include/config/arm/errata/720789.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
    $(wildcard include/config/thumb2/kernel.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/init.h \
    $(wildcard include/config/broken/rodata.h) \
    $(wildcard include/config/deferred/initcalls.h) \
    $(wildcard include/config/modules.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/types.h \
    $(wildcard include/config/uid16.h) \
    $(wildcard include/config/lbdaf.h) \
    $(wildcard include/config/arch/dma/addr/t/64bit.h) \
    $(wildcard include/config/phys/addr/t/64bit.h) \
    $(wildcard include/config/64bit.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/types.h \
  arch/arm/include/generated/asm/types.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/types.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/int-ll64.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/int-ll64.h \
  arch/arm/include/generated/asm/bitsperlong.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitsperlong.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/bitsperlong.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/linkage.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/stringify.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/linkage.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/assembler.h \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/smp.h) \
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
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/asm-offsets.h \
  include/generated/asm-offsets.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/page.h \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/kuser/helpers.h) \
    $(wildcard include/config/arm/lpae.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
    $(wildcard include/config/memory/hotplug/sparse.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/getorder.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/tlbflush.h \
    $(wildcard include/config/smp/on/up.h) \
    $(wildcard include/config/cpu/tlb/v4wt.h) \
    $(wildcard include/config/cpu/tlb/fa.h) \
    $(wildcard include/config/cpu/tlb/v4wbi.h) \
    $(wildcard include/config/cpu/tlb/feroceon.h) \
    $(wildcard include/config/cpu/tlb/v4wb.h) \
    $(wildcard include/config/cpu/tlb/v6.h) \
    $(wildcard include/config/cpu/tlb/v7.h) \
    $(wildcard include/config/tima/rkp/lazy/mmu.h) \
    $(wildcard include/config/arm/errata/798181.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/glue.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mm/proc-macros.S \
    $(wildcard include/config/cpu/dcache/writethrough.h) \
    $(wildcard include/config/pm/sleep.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/crunch.h) \
    $(wildcard include/config/arm/thumbee.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \

arch/arm/mm/tlb-v7.o: $(deps_arch/arm/mm/tlb-v7.o)

$(deps_arch/arm/mm/tlb-v7.o):
