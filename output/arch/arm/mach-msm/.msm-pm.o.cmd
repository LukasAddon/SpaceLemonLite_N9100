cmd_arch/arm/mach-msm/msm-pm.o := /home/N910C_MM/SpaceLemonLite_N9100/scripts/gcc-wrapper.py /home/N910C_MM/arm-eabi-4.8/bin/arm-eabi-gcc -Wp,-MD,arch/arm/mach-msm/.msm-pm.o.d  -nostdinc -isystem /home/N910C_MM/arm-eabi-4.8/bin/../lib/gcc/arm-eabi/4.9.4/include -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include -Iarch/arm/include/generated  -I/home/N910C_MM/SpaceLemonLite_N9100/include -Iinclude -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi -Iarch/arm/include/generated/uapi -I/home/N910C_MM/SpaceLemonLite_N9100/include/uapi -Iinclude/generated/uapi -include /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kconfig.h  -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm -Iarch/arm/mach-msm -D__KERNEL__ -mlittle-endian   -I/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/include -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit-function-declaration -Wno-format-security -fno-delete-null-pointer-checks -Os -Wno-maybe-uninitialized -fno-dwarf2-cfi-asm -fstack-protector -mabi=aapcs-linux -mno-thumb-interwork -funwind-tables -marm -D__LINUX_ARM_ARCH__=7 -mcpu=cortex-a15 -msoft-float -Uarm -Wframe-larger-than=1024 -Wno-unused-but-set-variable -fomit-frame-pointer -g -Wdeclaration-after-statement -Wno-pointer-sign -fno-strict-overflow -fconserve-stack -DCC_HAVE_ASM_GOTO    -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(msm_pm)"  -D"KBUILD_MODNAME=KBUILD_STR(msm_pm)" -c -o arch/arm/mach-msm/.tmp_msm-pm.o /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/msm-pm.c

source_arch/arm/mach-msm/msm-pm.o := /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/msm-pm.c

deps_arch/arm/mach-msm/msm-pm.o := \
    $(wildcard include/config/vfp.h) \
    $(wildcard include/config/sec/debug.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/debugfs.h \
    $(wildcard include/config/debug/fs.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/fs.h \
    $(wildcard include/config/sdp.h) \
    $(wildcard include/config/sysfs.h) \
    $(wildcard include/config/smp.h) \
    $(wildcard include/config/fs/posix/acl.h) \
    $(wildcard include/config/security.h) \
    $(wildcard include/config/quota.h) \
    $(wildcard include/config/fsnotify.h) \
    $(wildcard include/config/ima.h) \
    $(wildcard include/config/preempt.h) \
    $(wildcard include/config/epoll.h) \
    $(wildcard include/config/debug/writecount.h) \
    $(wildcard include/config/file/locking.h) \
    $(wildcard include/config/debug/lock/alloc.h) \
    $(wildcard include/config/auditsyscall.h) \
    $(wildcard include/config/block.h) \
    $(wildcard include/config/fs/xip.h) \
    $(wildcard include/config/migration.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/linkage.h \
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
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/stringify.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/export.h \
    $(wildcard include/config/have/underscore/symbol/prefix.h) \
    $(wildcard include/config/modules.h) \
    $(wildcard include/config/modversions.h) \
    $(wildcard include/config/unused/symbols.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/linkage.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/wait.h \
    $(wildcard include/config/lockdep.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/list.h \
    $(wildcard include/config/debug/list.h) \
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
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/poison.h \
    $(wildcard include/config/illegal/pointer/value.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/const.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/spinlock.h \
    $(wildcard include/config/debug/spinlock.h) \
    $(wildcard include/config/generic/lockbreak.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/typecheck.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/preempt.h \
    $(wildcard include/config/debug/preempt.h) \
    $(wildcard include/config/preempt/tracer.h) \
    $(wildcard include/config/context/tracking.h) \
    $(wildcard include/config/preempt/count.h) \
    $(wildcard include/config/preempt/notifiers.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/thread_info.h \
    $(wildcard include/config/compat.h) \
    $(wildcard include/config/debug/stack/usage.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/bug.h \
    $(wildcard include/config/generic/bug.h) \
    $(wildcard include/config/panic/on/data/corruption.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/bug.h \
    $(wildcard include/config/bug.h) \
    $(wildcard include/config/thumb2/kernel.h) \
    $(wildcard include/config/debug/bugverbose.h) \
    $(wildcard include/config/arm/lpae.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/bug.h \
    $(wildcard include/config/generic/bug/relative/pointers.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kernel.h \
    $(wildcard include/config/preempt/voluntary.h) \
    $(wildcard include/config/debug/atomic/sleep.h) \
    $(wildcard include/config/prove/locking.h) \
    $(wildcard include/config/ring/buffer.h) \
    $(wildcard include/config/tracing.h) \
    $(wildcard include/config/ftrace/mcount/record.h) \
  /home/N910C_MM/arm-eabi-4.8/lib/gcc/arm-eabi/4.9.4/include/stdarg.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/bitops.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/bitops.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/irqflags.h \
    $(wildcard include/config/trace/irqflags.h) \
    $(wildcard include/config/irqsoff/tracer.h) \
    $(wildcard include/config/trace/irqflags/support.h) \
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
    $(wildcard include/config/printk.h) \
    $(wildcard include/config/dynamic/debug.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/init.h \
    $(wildcard include/config/broken/rodata.h) \
    $(wildcard include/config/deferred/initcalls.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kern_levels.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/dynamic_debug.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/kernel.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/sysinfo.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/div64.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/compiler.h \
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
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/barrier.h \
    $(wildcard include/config/cpu/32v6k.h) \
    $(wildcard include/config/cpu/xsc3.h) \
    $(wildcard include/config/cpu/fa526.h) \
    $(wildcard include/config/arch/has/barriers.h) \
    $(wildcard include/config/arm/dma/mem/bufferable.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/outercache.h \
    $(wildcard include/config/outer/cache/sync.h) \
    $(wildcard include/config/outer/cache.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/bottom_half.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/spinlock_types.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/spinlock_types.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/lockdep.h \
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
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/atomic.h \
    $(wildcard include/config/arch/has/atomic/or.h) \
    $(wildcard include/config/generic/atomic64.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/atomic.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/cmpxchg.h \
    $(wildcard include/config/cpu/sa1100.h) \
    $(wildcard include/config/cpu/sa110.h) \
    $(wildcard include/config/cpu/v6.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/cmpxchg-local.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/atomic-long.h \
  arch/arm/include/generated/asm/current.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/current.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/wait.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kdev_t.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/kdev_t.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/dcache.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/rculist.h \
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
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/cache.h \
    $(wildcard include/config/arch/has/cache/line/size.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/cache.h \
    $(wildcard include/config/arm/l1/cache/shift.h) \
    $(wildcard include/config/aeabi.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/threads.h \
    $(wildcard include/config/nr/cpus.h) \
    $(wildcard include/config/base/small.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/cpumask.h \
    $(wildcard include/config/cpumask/offstack.h) \
    $(wildcard include/config/debug/per/cpu/maps.h) \
    $(wildcard include/config/disable/obsolete/cpumask/functions.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/bitmap.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/string.h \
    $(wildcard include/config/binary/printf.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/string.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/string.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/seqlock.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/completion.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/debugobjects.h \
    $(wildcard include/config/debug/objects.h) \
    $(wildcard include/config/debug/objects/free.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/rcutree.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/rculist_bl.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/list_bl.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/bit_spinlock.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/path.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/stat.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi/asm/stat.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/stat.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/time.h \
    $(wildcard include/config/arch/uses/gettimeoffset.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/math64.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/time.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/uidgid.h \
    $(wildcard include/config/uidgid/strict/type/checks.h) \
    $(wildcard include/config/user/ns.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/highuid.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/radix-tree.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/rbtree.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/pid.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/mutex.h \
    $(wildcard include/config/debug/mutexes.h) \
    $(wildcard include/config/mutex/spin/on/owner.h) \
    $(wildcard include/config/have/arch/mutex/cpu/relax.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/capability.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/capability.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/semaphore.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/fiemap.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/shrinker.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/migrate_mode.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/percpu-rwsem.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/rwsem.h \
    $(wildcard include/config/rwsem/generic/spinlock.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/rwsem-spinlock.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/percpu.h \
    $(wildcard include/config/need/per/cpu/embed/first/chunk.h) \
    $(wildcard include/config/need/per/cpu/page/first/chunk.h) \
    $(wildcard include/config/have/setup/per/cpu/area.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/smp.h \
    $(wildcard include/config/use/generic/smp/helpers.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/errno.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/errno.h \
  arch/arm/include/generated/asm/errno.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/errno.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/errno-base.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/smp.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/pfn.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/percpu.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/percpu.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/percpu-defs.h \
    $(wildcard include/config/debug/force/weak/per/cpu.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/blk_types.h \
    $(wildcard include/config/blk/cgroup.h) \
    $(wildcard include/config/blk/dev/integrity.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/fs.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/limits.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/ioctl.h \
  arch/arm/include/generated/asm/ioctl.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/ioctl.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/ioctl.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/quota.h \
    $(wildcard include/config/quota/netlink/interface.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/percpu_counter.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/dqblk_xfs.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/dqblk_v1.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/dqblk_v2.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/dqblk_qtree.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/projid.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/quota.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/nfs_fs_i.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/fcntl.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/fcntl.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi/asm/fcntl.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/fcntl.h \
    $(wildcard include/config/scfs/lower/pagecache/invalidation.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/err.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/seq_file.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/nodemask.h \
    $(wildcard include/config/highmem.h) \
    $(wildcard include/config/movable/node.h) \
    $(wildcard include/config/numa.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/numa.h \
    $(wildcard include/config/nodes/shift.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/module.h \
    $(wildcard include/config/module/sig.h) \
    $(wildcard include/config/kallsyms.h) \
    $(wildcard include/config/tracepoints.h) \
    $(wildcard include/config/event/tracing.h) \
    $(wildcard include/config/module/unload.h) \
    $(wildcard include/config/constructors.h) \
    $(wildcard include/config/debug/set/module/ronx.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kmod.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/gfp.h \
    $(wildcard include/config/cma.h) \
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
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/srcu.h \
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
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/topology.h \
    $(wildcard include/config/arm/cpu/topology.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/topology.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/mmdebug.h \
    $(wildcard include/config/debug/vm.h) \
    $(wildcard include/config/debug/virtual.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/sysctl.h \
    $(wildcard include/config/sysctl.h) \
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
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/clk.h \
    $(wildcard include/config/common/clk.h) \
    $(wildcard include/config/have/clk/prepare.h) \
    $(wildcard include/config/have/clk.h) \
    $(wildcard include/config/of.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/clkdev.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/clkdev.h \
    $(wildcard include/config/have/mach/clkdev.h) \
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
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/io.h \
    $(wildcard include/config/has/ioport.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/io.h \
    $(wildcard include/config/need/mach/io/h.h) \
    $(wildcard include/config/pci.h) \
    $(wildcard include/config/pcmcia/soc/common.h) \
    $(wildcard include/config/isa.h) \
    $(wildcard include/config/pccard.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/pci_iomap.h \
    $(wildcard include/config/no/generic/pci/ioport/map.h) \
    $(wildcard include/config/generic/pci/iomap.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/msm_rtb.h \
    $(wildcard include/config/msm/rtb.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/include/mach/io.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/tick.h \
    $(wildcard include/config/generic/clockevents.h) \
    $(wildcard include/config/high/res/timers.h) \
    $(wildcard include/config/no/hz/common.h) \
    $(wildcard include/config/generic/clockevents/broadcast.h) \
    $(wildcard include/config/tick/oneshot.h) \
    $(wildcard include/config/no/hz/full.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/clockchips.h \
    $(wildcard include/config/generic/clockevents/build.h) \
    $(wildcard include/config/arch/has/tick/broadcast.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/clocksource.h \
    $(wildcard include/config/arch/clocksource/data.h) \
    $(wildcard include/config/clocksource/watchdog.h) \
    $(wildcard include/config/clksrc/of.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/hrtimer.h \
    $(wildcard include/config/timerfd.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/timerqueue.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/delay.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/delay.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/platform_device.h \
    $(wildcard include/config/suspend.h) \
    $(wildcard include/config/hibernate/callbacks.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/device.h \
    $(wildcard include/config/debug/devres.h) \
    $(wildcard include/config/acpi.h) \
    $(wildcard include/config/pinctrl.h) \
    $(wildcard include/config/devtmpfs.h) \
    $(wildcard include/config/sysfs/deprecated.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/ioport.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/klist.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/pinctrl/devinfo.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/pinctrl/consumer.h \
    $(wildcard include/config/pinconf.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/pinctrl/pinctrl-state.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/pm.h \
    $(wildcard include/config/vt/console/sleep.h) \
    $(wildcard include/config/pm.h) \
    $(wildcard include/config/pm/runtime.h) \
    $(wildcard include/config/pm/clk.h) \
    $(wildcard include/config/pm/generic/domains.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/ratelimit.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/device.h \
    $(wildcard include/config/dmabounce.h) \
    $(wildcard include/config/iommu/api.h) \
    $(wildcard include/config/arm/dma/use/iommu.h) \
    $(wildcard include/config/arch/omap.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/pm_wakeup.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/mod_devicetable.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/uuid.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/uuid.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/of_platform.h \
    $(wildcard include/config/of/device.h) \
    $(wildcard include/config/of/address.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/of_device.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/of.h \
    $(wildcard include/config/sparc.h) \
    $(wildcard include/config/of/dynamic.h) \
    $(wildcard include/config/of/subcmdline/parse.h) \
    $(wildcard include/config/attach/node.h) \
    $(wildcard include/config/detach/node.h) \
    $(wildcard include/config/add/property.h) \
    $(wildcard include/config/remove/property.h) \
    $(wildcard include/config/update/property.h) \
    $(wildcard include/config/proc/fs.h) \
    $(wildcard include/config/proc/devicetree.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/prom.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/cpu_pm.h \
    $(wildcard include/config/cpu/pm.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/remote_spinlock.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/msm_remote_spinlock.h \
    $(wildcard include/config/remote/spinlock/msm.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/soc/qcom/avs.h \
    $(wildcard include/config/msm/avs/hw.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/soc/qcom/spm.h \
    $(wildcard include/config/msm/spm/v2.h) \
    $(wildcard include/config/msm/l2/spm.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/soc/qcom/pm.h \
    $(wildcard include/config/msm/pm.h) \
    $(wildcard include/config/msm/idle/stats.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/cpuidle.h \
    $(wildcard include/config/arch/needs/cpu/idle/coupled.h) \
    $(wildcard include/config/cpu/idle.h) \
    $(wildcard include/config/arch/has/cpu/relax.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/soc/qcom/scm.h \
    $(wildcard include/config/msm/scm.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/soc/qcom/scm-boot.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/suspend.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/cacheflush.h \
    $(wildcard include/config/cpu/v7.h) \
    $(wildcard include/config/cpu/v6k.h) \
    $(wildcard include/config/smp/on/up.h) \
    $(wildcard include/config/arm/errata/411920.h) \
    $(wildcard include/config/cpu/cache/vipt.h) \
    $(wildcard include/config/free/pages/rdonly.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/mm.h \
    $(wildcard include/config/fix/movable/zone.h) \
    $(wildcard include/config/x86.h) \
    $(wildcard include/config/ppc.h) \
    $(wildcard include/config/parisc.h) \
    $(wildcard include/config/metag.h) \
    $(wildcard include/config/stack/growsup.h) \
    $(wildcard include/config/transparent/hugepage.h) \
    $(wildcard include/config/ksm.h) \
    $(wildcard include/config/debug/vm/rb.h) \
    $(wildcard include/config/arch/uses/numa/prot/none.h) \
    $(wildcard include/config/debug/pagealloc.h) \
    $(wildcard include/config/hibernation.h) \
    $(wildcard include/config/use/user/accessible/timers.h) \
    $(wildcard include/config/hugetlbfs.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/debug_locks.h \
    $(wildcard include/config/debug/locking/api/selftests.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/mm_types.h \
    $(wildcard include/config/split/ptlock/cpus.h) \
    $(wildcard include/config/have/cmpxchg/double.h) \
    $(wildcard include/config/have/aligned/struct/page.h) \
    $(wildcard include/config/want/page/debug/flags.h) \
    $(wildcard include/config/page/owner.h) \
    $(wildcard include/config/aio.h) \
    $(wildcard include/config/mm/owner.h) \
    $(wildcard include/config/mmu/notifier.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/auxvec.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/auxvec.h \
  arch/arm/include/generated/asm/auxvec.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/auxvec.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/stacktrace.h \
    $(wildcard include/config/stacktrace.h) \
    $(wildcard include/config/user/stacktrace/support.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/page-debug-flags.h \
    $(wildcard include/config/page/poisoning.h) \
    $(wildcard include/config/page/guard.h) \
    $(wildcard include/config/page/debug/something/else.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/uprobes.h \
    $(wildcard include/config/arch/supports/uprobes.h) \
    $(wildcard include/config/uprobes.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/mmu.h \
    $(wildcard include/config/cpu/has/asid.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/range.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/pgtable.h \
    $(wildcard include/config/highpte.h) \
    $(wildcard include/config/tima/rkp/l2/group.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/proc-fns.h \
    $(wildcard include/config/tima/rkp/l2/tables.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/glue-proc.h \
    $(wildcard include/config/cpu/arm7tdmi.h) \
    $(wildcard include/config/cpu/arm720t.h) \
    $(wildcard include/config/cpu/arm740t.h) \
    $(wildcard include/config/cpu/arm9tdmi.h) \
    $(wildcard include/config/cpu/arm920t.h) \
    $(wildcard include/config/cpu/arm922t.h) \
    $(wildcard include/config/cpu/arm925t.h) \
    $(wildcard include/config/cpu/arm926t.h) \
    $(wildcard include/config/cpu/arm940t.h) \
    $(wildcard include/config/cpu/arm946e.h) \
    $(wildcard include/config/cpu/arm1020.h) \
    $(wildcard include/config/cpu/arm1020e.h) \
    $(wildcard include/config/cpu/arm1022.h) \
    $(wildcard include/config/cpu/arm1026.h) \
    $(wildcard include/config/cpu/mohawk.h) \
    $(wildcard include/config/cpu/feroceon.h) \
    $(wildcard include/config/cpu/pj4b.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/pgtable-nopud.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/pgtable-hwdef.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/pgtable-2level-hwdef.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/pgtable-2level.h \
    $(wildcard include/config/tima/rkp.h) \
    $(wildcard include/config/tima/rkp/l1/tables.h) \
    $(wildcard include/config/tima/rkp/lazy/mmu.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/pgtable.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/page-flags.h \
    $(wildcard include/config/pageflags/extended.h) \
    $(wildcard include/config/arch/uses/pg/uncached.h) \
    $(wildcard include/config/memory/failure.h) \
    $(wildcard include/config/swap.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/huge_mm.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/vmstat.h \
    $(wildcard include/config/vm/event/counters.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/vm_event_item.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/glue-cache.h \
    $(wildcard include/config/cpu/cache/v4.h) \
    $(wildcard include/config/cpu/cache/v4wb.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/shmparam.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/cachetype.h \
    $(wildcard include/config/cpu/cache/vivt.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/vfp.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/include/mach/msm_bus.h \
    $(wildcard include/config/msm/bus/scaling.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/input.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/input.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/include/mach/jtag.h \
    $(wildcard include/config/msm/jtag.h) \
    $(wildcard include/config/msm/jtag/mm.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/idle.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/clock.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/pm-boot.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/include/mach/sec_debug.h \
    $(wildcard include/config/sec/peripheral/secure/chk.h) \
    $(wildcard include/config/sec/debug/sched/log.h) \
    $(wildcard include/config/sec/debug/irq/exit/log.h) \
    $(wildcard include/config/sec/debug/semaphore/log.h) \
    $(wildcard include/config/sec/debug/msg/log.h) \
    $(wildcard include/config/sec/debug/avc/log.h) \
    $(wildcard include/config/sec/debug/dcvs/log.h) \
    $(wildcard include/config/sec/debug/fuelgauge/log.h) \
    $(wildcard include/config/sec/monitor/battery/removal.h) \
    $(wildcard include/config/print/extra/info.h) \
    $(wildcard include/config/sec/debug/subsys.h) \
    $(wildcard include/config/sec/debug/mdm/file/info.h) \
    $(wildcard include/config/sec/debug/double/free.h) \
    $(wildcard include/config/user/reset/debug.h) \
    $(wildcard include/config/sec/debug/verbose/summary/html.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/sched.h \
    $(wildcard include/config/sched/debug.h) \
    $(wildcard include/config/lockup/detector.h) \
    $(wildcard include/config/core/dump/default/elf/headers.h) \
    $(wildcard include/config/sched/autogroup.h) \
    $(wildcard include/config/virt/cpu/accounting/native.h) \
    $(wildcard include/config/bsd/process/acct.h) \
    $(wildcard include/config/taskstats.h) \
    $(wildcard include/config/audit.h) \
    $(wildcard include/config/cgroups.h) \
    $(wildcard include/config/samp/hotness.h) \
    $(wildcard include/config/inotify/user.h) \
    $(wildcard include/config/fanotify.h) \
    $(wildcard include/config/posix/mqueue.h) \
    $(wildcard include/config/keys.h) \
    $(wildcard include/config/perf/events.h) \
    $(wildcard include/config/schedstats.h) \
    $(wildcard include/config/task/delay/acct.h) \
    $(wildcard include/config/fair/group/sched.h) \
    $(wildcard include/config/rt/group/sched.h) \
    $(wildcard include/config/cgroup/sched.h) \
    $(wildcard include/config/blk/dev/io/trace.h) \
    $(wildcard include/config/rcu/boost.h) \
    $(wildcard include/config/compat/brk.h) \
    $(wildcard include/config/cc/stackprotector.h) \
    $(wildcard include/config/virt/cpu/accounting/gen.h) \
    $(wildcard include/config/sysvipc.h) \
    $(wildcard include/config/detect/hung/task.h) \
    $(wildcard include/config/rt/mutexes.h) \
    $(wildcard include/config/task/xacct.h) \
    $(wildcard include/config/cpusets.h) \
    $(wildcard include/config/futex.h) \
    $(wildcard include/config/fault/injection.h) \
    $(wildcard include/config/latencytop.h) \
    $(wildcard include/config/function/graph/tracer.h) \
    $(wildcard include/config/bcache.h) \
    $(wildcard include/config/have/unstable/sched/clock.h) \
    $(wildcard include/config/irq/time/accounting.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/sched.h \
  arch/arm/include/generated/asm/cputime.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/cputime.h \
    $(wildcard include/config/virt/cpu/accounting.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/cputime_jiffies.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/sem.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/sem.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/ipc.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/ipc.h \
  arch/arm/include/generated/asm/ipcbuf.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/ipcbuf.h \
  arch/arm/include/generated/asm/sembuf.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/sembuf.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/signal.h \
    $(wildcard include/config/old/sigaction.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/signal.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/signal.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi/asm/signal.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/signal-defs.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi/asm/sigcontext.h \
  arch/arm/include/generated/asm/siginfo.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/siginfo.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/siginfo.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/proportions.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/seccomp.h \
    $(wildcard include/config/seccomp.h) \
    $(wildcard include/config/seccomp/filter.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/seccomp.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/seccomp.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/unistd.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/unistd.h \
    $(wildcard include/config/oabi/compat.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi/asm/unistd.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/rtmutex.h \
    $(wildcard include/config/debug/rt/mutexes.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/plist.h \
    $(wildcard include/config/debug/pi/list.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/resource.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/resource.h \
  arch/arm/include/generated/asm/resource.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/resource.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/resource.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/task_io_accounting.h \
    $(wildcard include/config/task/io/accounting.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/latencytop.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/cred.h \
    $(wildcard include/config/debug/credentials.h) \
    $(wildcard include/config/tima/rkp/ro/cred.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/key.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/selinux.h \
    $(wildcard include/config/security/selinux.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/llist.h \
    $(wildcard include/config/arch/have/nmi/safe/cmpxchg.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/trace/events/trace_msm_low_power.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/trace/define_trace.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/trace/ftrace.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/ftrace_event.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/ring_buffer.h \
    $(wildcard include/config/ring/buffer/allow/swap.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kmemcheck.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/poll.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/uaccess.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/unified.h \
    $(wildcard include/config/arm/asm/unified.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/poll.h \
  arch/arm/include/generated/asm/poll.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/asm-generic/poll.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/trace_seq.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/hardirq.h \
    $(wildcard include/config/generic/hardirqs.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/ftrace_irq.h \
    $(wildcard include/config/ftrace/nmi/enter.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/vtime.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/hardirq.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/irq.h \
    $(wildcard include/config/sparse/irq.h) \
    $(wildcard include/config/multi/irq/handler.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/irq_cpustat.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/perf_event.h \
    $(wildcard include/config/function/tracer.h) \
    $(wildcard include/config/cgroup/perf.h) \
    $(wildcard include/config/cpu/sup/intel.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/perf_event.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/perf_event.h \
    $(wildcard include/config/hw/perf/events.h) \
  arch/arm/include/generated/asm/local64.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/local64.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/pid_namespace.h \
    $(wildcard include/config/pid/ns.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/nsproxy.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/ftrace.h \
    $(wildcard include/config/have/function/trace/mcount/test.h) \
    $(wildcard include/config/dynamic/ftrace/with/regs.h) \
    $(wildcard include/config/dynamic/ftrace.h) \
    $(wildcard include/config/stack/tracer.h) \
    $(wildcard include/config/frame/pointer.h) \
    $(wildcard include/config/ftrace/syscalls.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/trace_clock.h \
  arch/arm/include/generated/asm/trace_clock.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/trace_clock.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kallsyms.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/ptrace.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/ptrace.h \
  /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/ftrace.h \
    $(wildcard include/config/old/mcount.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/cpu.h \
    $(wildcard include/config/arch/has/cpu/autoprobe.h) \
    $(wildcard include/config/arch/cpu/probe/release.h) \
    $(wildcard include/config/pm/sleep/smp.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/node.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/irq_work.h \
    $(wildcard include/config/irq/work.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/perf_regs.h \
    $(wildcard include/config/have/perf/regs.h) \
  arch/arm/include/generated/asm/local.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/asm-generic/local.h \
  /home/N910C_MM/SpaceLemonLite_N9100/include/linux/coresight-stm.h \
    $(wildcard include/config/coresight/stm.h) \
  /home/N910C_MM/SpaceLemonLite_N9100/include/uapi/linux/coresight-stm.h \

arch/arm/mach-msm/msm-pm.o: $(deps_arch/arm/mach-msm/msm-pm.o)

$(deps_arch/arm/mach-msm/msm-pm.o):
