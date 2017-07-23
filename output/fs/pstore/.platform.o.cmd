cmd_fs/pstore/platform.o := /home/N910C_MM/SpaceLemonLite_N9100/scripts/gcc-wrapper.py /home/N910C_MM/arm-eabi-4.8/bin/arm-eabi-gcc -Wp,-MD,fs/pstore/.platform.o.d  -nostdinc -isystem /home/N910C_MM/arm-eabi-4.8/bin/../lib/gcc/arm-eabi/4.9.4/include -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include -Iarch/arm/include/generated  -I/home/N910C_MM/SpaceLemonLite_N9100/include -Iinclude -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/home/N910C_MM/SpaceLemonLite_N9100/include/uapi -Iinclude/generated/uapi -include /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kconfig.h  -I/home/N910C_MM/SpaceLemonLite_N9100/fs/pstore -Ifs/pstore -D__KERNEL__ -mlittle-endian   -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -Wno-maybe-uninitialized -fno-dwarf2-cfi-asm -fstack-protector -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -mcpu=cortex-a15 -msoft-float -Uarm -Wframe-larger-than=1024 -Wno-unused-but-set-variable -fomit-frame-pointer -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(platform)"  -D"KBUILD_MODNAME=KBUILD_STR(pstore)" -c -o fs/pstore/.tmp_platform.o /home/N910C_MM/SpaceLemonLite_N9100/fs/pstore/platform.c

source_fs/pstore/platform.o := /home/N910C_MM/SpaceLemonLite_N9100/fs/pstore/platform.c

deps_fs/pstore/platform.o := \
    $(wildcard include/config/pstore/console.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/atomic.h \
    $(wildcard include/config/arch/has/atomic/or.h) \
    $(wildcard include/config/generic/atomic64.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/atomic.h \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/arm/lpae.h) \
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
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi/asm/posix_types.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/posix_types.h \
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
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/barrier.h \
    $(wildcard include/config/cpu/32v6k.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arch/has/barriers.h) \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/outercache.h \
    $(wildcard include/config/outer/cache/sync.h) \
    $(wildcard include/config/outer/cache.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/cmpxchg.h \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/v6.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/cmpxchg-local.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/atomic-long.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/errno.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/errno.h \
  arch/arm/include/generated/asm/errno.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/errno.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/errno-base.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/init.h \
    $(wildcard include/config/broken/rodata.h) \
    $(wildcard include/config/deferred/initcalls.h) \
    $(wildcard include/config/modules.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kmsg_dump.h \
    $(wildcard include/config/printk.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/const.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/console.h \
    $(wildcard include/config/hw/console.h) \
    $(wildcard include/config/tty.h) \
    $(wildcard include/config/vga/console.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/module.h \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/unused/symbols.h) \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/debug/set/module/ronx.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/stat.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi/asm/stat.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/stat.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/ring/buffer.h) \
  /home/N910C_MM/arm-eabi-4.8/lib/gcc/arm-eabi/4.9.4/include/stdarg.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/linkage.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/stringify.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modversions.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/linkage.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/bitops.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/bitops.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitops/non-atomic.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitops/fls64.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitops/sched.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitops/hweight.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitops/arch_hweight.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitops/const_hweight.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitops/lock.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitops/le.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi/asm/byteorder.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/byteorder/little_endian.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/byteorder/little_endian.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/swab.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/swab.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/swab.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi/asm/swab.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/byteorder/generic.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bitops/ext2-atomic-setbit.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/log2.h \
    $(wildcard include/config/arch/has/ilog2/u32.h) \
    $(wildcard include/config/arch/has/ilog2/u64.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/printk.h \
    $(wildcard include/config/early/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kern_levels.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/dynamic_debug.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/kernel.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/sysinfo.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/div64.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/compiler.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/thumb2/kernel.h) \
    $(wildcard include/config/debug/bugverbose.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bug.h \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/seqlock.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/preempt.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/context/tracking.h) \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
    $(wildcard include/config/debug/stack/usage.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/bug.h \
    $(wildcard include/config/panic/on/data/corruption.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/thread_info.h \
    $(wildcard include/config/crunch.h) \
    $(wildcard include/config/arm/thumbee.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/fpstate.h \
    $(wildcard include/config/vfpv3.h) \
    $(wildcard include/config/iwmmxt.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/domain.h \
    $(wildcard include/config/verify/permission/fault.h) \
    $(wildcard include/config/io/36.h) \
    $(wildcard include/config/cpu/use/domains.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/bottom_half.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/spinlock_types.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/spinlock_types.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/lockdep.h \
    $(wildcard include/config/lockdep.h) \
    $(wildcard include/config/lock/stat.h) \
    $(wildcard include/config/prove/rcu.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/rwlock_types.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/spinlock.h \
    $(wildcard include/config/msm/krait/wfe/fixup.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/processor.h \
    $(wildcard include/config/have/hw/breakpoint.h) \
    $(wildcard include/config/mmu.h) \
    $(wildcard include/config/arm/errata/754327.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/hw_breakpoint.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/rwlock.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/spinlock_api_smp.h \
    $(wildcard include/config/inline/spin/lock.h) \
    $(wildcard include/config/inline/spin/lock/bh.h) \
    $(wildcard include/config/inline/spin/lock/irq.h) \
    $(wildcard include/config/inline/spin/lock/irqsave.h) \
    $(wildcard include/config/inline/spin/trylock.h) \
    $(wildcard include/config/inline/spin/trylock/bh.h) \
    $(wildcard include/config/uninline/spin/unlock.h) \
    $(wildcard include/config/inline/spin/unlock/bh.h) \
    $(wildcard include/config/inline/spin/unlock/irq.h) \
    $(wildcard include/config/inline/spin/unlock/irqrestore.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/rwlock_api_smp.h \
    $(wildcard include/config/inline/read/lock.h) \
    $(wildcard include/config/inline/write/lock.h) \
    $(wildcard include/config/inline/read/lock/bh.h) \
    $(wildcard include/config/inline/write/lock/bh.h) \
    $(wildcard include/config/inline/read/lock/irq.h) \
    $(wildcard include/config/inline/write/lock/irq.h) \
    $(wildcard include/config/inline/read/lock/irqsave.h) \
    $(wildcard include/config/inline/write/lock/irqsave.h) \
    $(wildcard include/config/inline/read/trylock.h) \
    $(wildcard include/config/inline/write/trylock.h) \
    $(wildcard include/config/inline/read/unlock.h) \
    $(wildcard include/config/inline/write/unlock.h) \
    $(wildcard include/config/inline/read/unlock/bh.h) \
    $(wildcard include/config/inline/write/unlock/bh.h) \
    $(wildcard include/config/inline/read/unlock/irq.h) \
    $(wildcard include/config/inline/write/unlock/irq.h) \
    $(wildcard include/config/inline/read/unlock/irqrestore.h) \
    $(wildcard include/config/inline/write/unlock/irqrestore.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/math64.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/time.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/uidgid.h \
    $(wildcard include/config/uidgid/strict/type/checks.h) \
    $(wildcard include/config/user/ns.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/highuid.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kmod.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/gfp.h \
    $(wildcard include/config/numa.h) \
    $(wildcard include/config/cma.h) \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/zone/dma.h) \
    $(wildcard include/config/zone/dma32.h) \
    $(wildcard include/config/pm/sleep.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/mmzone.h \
    $(wildcard include/config/force/max/zoneorder.h) \
    $(wildcard include/config/memory/isolation.h) \
    $(wildcard include/config/cma/page/counting.h) \
    $(wildcard include/config/memcg.h) \
    $(wildcard include/config/compaction.h) \
    $(wildcard include/config/memory/hotplug.h) \
    $(wildcard include/config/sparsemem.h) \
    $(wildcard include/config/have/memblock/node/map.h) \
    $(wildcard include/config/discontigmem.h) \
    $(wildcard include/config/flat/node/mem/map.h) \
    $(wildcard include/config/no/bootmem.h) \
    $(wildcard include/config/numa/balancing.h) \
    $(wildcard include/config/have/memory/present.h) \
    $(wildcard include/config/have/memoryless/nodes.h) \
    $(wildcard include/config/need/node/memmap/size.h) \
    $(wildcard include/config/need/multiple/nodes.h) \
    $(wildcard include/config/have/arch/early/pfn/to/nid.h) \
    $(wildcard include/config/flatmem.h) \
    $(wildcard include/config/sparsemem/extreme.h) \
    $(wildcard include/config/have/arch/pfn/valid.h) \
    $(wildcard include/config/nodes/span/other/nodes.h) \
    $(wildcard include/config/holes/in/zone.h) \
    $(wildcard include/config/arch/has/holes/memorymodel.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/wait.h \
  arch/arm/include/generated/asm/current.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/current.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/wait.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/nodemask.h \
    $(wildcard include/config/movable/node.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/bitmap.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/string.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/string.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/pageblock-flags.h \
    $(wildcard include/config/hugetlb/page.h) \
    $(wildcard include/config/hugetlb/page/size/variable.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/page-flags-layout.h \
    $(wildcard include/config/sparsemem/vmemmap.h) \
  include/generated/bounds.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/page.h \
    $(wildcard include/config/cpu/copy/v4wt.h) \
    $(wildcard include/config/cpu/copy/v4wb.h) \
    $(wildcard include/config/cpu/copy/feroceon.h) \
    $(wildcard include/config/cpu/copy/fa.h) \
    $(wildcard include/config/cpu/xscale.h) \
    $(wildcard include/config/cpu/copy/v6.h) \
    $(wildcard include/config/kuser/helpers.h) \
    $(wildcard include/config/memory/hotplug/sparse.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/glue.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/pgtable-2level-types.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/memory.h \
    $(wildcard include/config/need/mach/memory/h.h) \
    $(wildcard include/config/page/offset.h) \
    $(wildcard include/config/dram/size.h) \
    $(wildcard include/config/dram/base.h) \
    $(wildcard include/config/have/tcm.h) \
    $(wildcard include/config/arm/patch/phys/virt.h) \
    $(wildcard include/config/phys/offset.h) \
    $(wildcard include/config/virt/to/bus.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/sizes.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/include/mach/memory.h \
    $(wildcard include/config/cache/l2x0.h) \
    $(wildcard include/config/arch/msm/scorpion.h) \
    $(wildcard include/config/arch/msm/krait.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/memory_model.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/getorder.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/memory_hotplug.h \
    $(wildcard include/config/memory/hotremove.h) \
    $(wildcard include/config/have/arch/nodedata/extension.h) \
    $(wildcard include/config/have/bootmem/info/node.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/notifier.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/mutex/spin/on/owner.h) \
    $(wildcard include/config/have/arch/mutex/cpu/relax.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/rwsem-spinlock.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/srcu.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/rcupdate.h \
    $(wildcard include/config/rcu/torture/test.h) \
    $(wildcard include/config/tree/rcu.h) \
    $(wildcard include/config/tree/preempt/rcu.h) \
    $(wildcard include/config/rcu/trace.h) \
    $(wildcard include/config/preempt/rcu.h) \
    $(wildcard include/config/rcu/user/qs.h) \
    $(wildcard include/config/tiny/rcu.h) \
    $(wildcard include/config/tiny/preempt/rcu.h) \
    $(wildcard include/config/debug/objects/rcu/head.h) \
    $(wildcard include/config/hotplug/cpu.h) \
    $(wildcard include/config/rcu/nocb/cpu.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
    $(wildcard include/config/disable/obsolete/cpumask/functions.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/completion.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/rcutree.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/workqueue.h \
    $(wildcard include/config/debug/objects/work.h) \
    $(wildcard include/config/workqueue/front.h) \
    $(wildcard include/config/freezer.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/timer.h \
    $(wildcard include/config/timer/stats.h) \
    $(wildcard include/config/debug/objects/timers.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/ktime.h \
    $(wildcard include/config/ktime/scalar.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/jiffies.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/timex.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/timex.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/param.h \
  arch/arm/include/generated/asm/param.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/param.h \
    $(wildcard include/config/hz.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/param.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/timex.h \
    $(wildcard include/config/arch/multiplatform.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/include/mach/timex.h \
    $(wildcard include/config/have/arch/has/current/timer.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/topology.h \
    $(wildcard include/config/sched/smt.h) \
    $(wildcard include/config/sched/mc.h) \
    $(wildcard include/config/sched/book.h) \
    $(wildcard include/config/use/percpu/numa/node/id.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/smp.h \
    $(wildcard include/config/use/generic/smp/helpers.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/smp.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/pfn.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/percpu.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/percpu.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/topology.h \
    $(wildcard include/config/arm/cpu/topology.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/topology.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/virtual.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/sysctl.h \
    $(wildcard include/config/sysctl.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/rbtree.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/sysctl.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/elf.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/elf.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/user.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/elf.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/elf-em.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kobject.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/sysfs.h \
    $(wildcard include/config/mmc/bkops/node/uid.h) \
    $(wildcard include/config/mmc/bkops/node/gid.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kobject_ns.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kref.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/moduleparam.h \
    $(wildcard include/config/alpha.h) \
    $(wildcard include/config/ia64.h) \
    $(wildcard include/config/ppc64.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/tracepoint.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/static_key.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/jump_label.h \
    $(wildcard include/config/jump/label.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/module.h \
    $(wildcard include/config/arm/unwind.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/module.h \
    $(wildcard include/config/have/mod/arch/specific.h) \
    $(wildcard include/config/modules/use/elf/rel.h) \
    $(wildcard include/config/modules/use/elf/rela.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/pstore.h \
    $(wildcard include/config/pstore.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/slab.h \
    $(wildcard include/config/slab/debug.h) \
    $(wildcard include/config/kmemcheck.h) \
    $(wildcard include/config/failslab.h) \
    $(wildcard include/config/slob.h) \
    $(wildcard include/config/slab.h) \
    $(wildcard include/config/slub.h) \
    $(wildcard include/config/debug/slab.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/slub_def.h \
    $(wildcard include/config/slub/stats.h) \
    $(wildcard include/config/memcg/kmem.h) \
    $(wildcard include/config/slub/debug.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kmemleak.h \
    $(wildcard include/config/debug/kmemleak.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/uaccess.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/uaccess.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/hardirq.h \
    $(wildcard include/config/generic/hardirqs.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/ftrace_irq.h \
    $(wildcard include/config/ftrace/nmi/enter.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/vtime.h \
    $(wildcard include/config/virt/cpu/accounting.h) \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/virt/cpu/accounting/gen.h) \
    $(wildcard include/config/irq/time/accounting.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/hardirq.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/irq.h \
    $(wildcard include/config/sparse/irq.h) \
    $(wildcard include/config/multi/irq/handler.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/irq_cpustat.h \
  /home/N910C_MM/SpaceLemonLite_N9100/fs/pstore/internal.h \
    $(wildcard include/config/arm.h) \
    $(wildcard include/config/pstore/ftrace.h) \

fs/pstore/platform.o: $(deps_fs/pstore/platform.o)

$(deps_fs/pstore/platform.o):
