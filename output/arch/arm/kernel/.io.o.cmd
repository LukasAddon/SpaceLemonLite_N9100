cmd_arch/arm/kernel/io.o := /home/N910C_MM/SpaceLemonLite_N9100/scripts/gcc-wrapper.py /home/N910C_MM/arm-eabi-4.8/bin/arm-eabi-gcc -Wp,-MD,arch/arm/kernel/.io.o.d  -nostdinc -isystem /home/N910C_MM/arm-eabi-4.8/bin/../lib/gcc/arm-eabi/4.9.4/include -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include -Iarch/arm/include/generated  -I/home/N910C_MM/SpaceLemonLite_N9100/include -Iinclude -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/home/N910C_MM/SpaceLemonLite_N9100/include/uapi -Iinclude/generated/uapi -include /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kconfig.h  -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/kernel -Iarch/arm/kernel -D__KERNEL__ -mlittle-endian   -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -Wno-maybe-uninitialized -fno-dwarf2-cfi-asm -fstack-protector -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -mcpu=cortex-a15 -msoft-float -Uarm -Wframe-larger-than=1024 -Wno-unused-but-set-variable -fomit-frame-pointer -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(io)"  -D"KBUILD_MODNAME=KBUILD_STR(io)" -c -o arch/arm/kernel/.tmp_io.o /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/kernel/io.c

source_arch/arm/kernel/io.o := /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/kernel/io.c

deps_arch/arm/kernel/io.o := \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
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
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/posix_types.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/stddef.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/stddef.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/compiler.h \
    $(wildcard include/config/sparse/rcu/pointer.h) \
    $(wildcard include/config/trace/branch/profiling.h) \
    $(wildcard include/config/profile/all/branches.h) \
    $(wildcard include/config/enable/must/check.h) \
    $(wildcard include/config/enable/warn/deprecated.h) \
    $(wildcard include/config/kprobes.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/compiler-gcc.h \
    $(wildcard include/config/arch/supports/optimized/inlining.h) \
    $(wildcard include/config/optimize/inlining.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/compiler-gcc4.h \
    $(wildcard include/config/arch/use/builtin/bswap.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi/asm/posix_types.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/posix_types.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/io.h \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/has/ioport.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/io.h \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
    $(wildcard include/config/need/mach/io/h.h) \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/pcmcia/soc/common.h) \
    $(wildcard include/config/isa.h) \
    $(wildcard include/config/pccard.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi/asm/byteorder.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/byteorder/little_endian.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/byteorder/little_endian.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/swab.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/swab.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/swab.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi/asm/swab.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/byteorder/generic.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/memory.h \
    $(wildcard include/config/need/mach/memory/h.h) \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/thumb2/kernel.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/have/tcm.h) \
    $(wildcard include/config/arm/patch/phys/virt.h) \
    $(wildcard include/config/phys/offset.h) \
    $(wildcard include/config/virt/to/bus.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/const.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/sizes.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/include/mach/memory.h \
    $(wildcard include/config/cache/l2x0.h) \
    $(wildcard include/config/arch/msm/scorpion.h) \
    $(wildcard include/config/arch/msm/krait.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/memory_model.h \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/sparsemem/vmemmap.h) \
    $(wildcard include/config/sparsemem.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/pci_iomap.h \
    $(wildcard include/config/no/generic/pci/ioport/map.h) \
    $(wildcard include/config/generic/pci/iomap.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/msm_rtb.h \
    $(wildcard include/config/msm/rtb.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/barrier.h \
    $(wildcard include/config/cpu/32v6k.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arch/has/barriers.h) \
    $(wildcard include/config/smp.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/outercache.h \
    $(wildcard include/config/outer/cache/sync.h) \
    $(wildcard include/config/outer/cache.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/include/mach/io.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/kuser/helpers.h) \
    $(wildcard include/config/arm/lpae.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
    $(wildcard include/config/memory/hotplug/sparse.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/glue.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/pgtable-2level-types.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/getorder.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/bitops.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/bitops.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/typecheck.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/irqflags.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/ptrace.h \
    $(wildcard include/config/arm/thumb.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi/asm/ptrace.h \
    $(wildcard include/config/cpu/endian/be8.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/hwcap.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi/asm/hwcap.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitops/non-atomic.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitops/fls64.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitops/sched.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitops/hweight.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitops/arch_hweight.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitops/const_hweight.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitops/lock.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitops/le.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitops/ext2-atomic-setbit.h \

arch/arm/kernel/io.o: $(deps_arch/arm/kernel/io.o)

$(deps_arch/arm/kernel/io.o):
