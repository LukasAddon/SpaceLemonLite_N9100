	.cpu cortex-a15
	.fpu softvfp
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 2	@ Tag_ABI_enum_size
	.eabi_attribute 30, 4	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 1	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"bounds.c"
@ GNU C11 (Linaro GCC 5.2-2015.11-1) version 5.2.1 20151005 (arm-eabi)
@	compiled by GNU C version 4.9.2, GMP version 6.0.0, MPFR version 3.1.3, MPC version 1.0.3
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  -nostdinc
@ -I /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include
@ -I arch/arm/include/generated
@ -I /home/N910C_MM/SpaceLemonLite_N9100/include -I include
@ -I /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/uapi
@ -I arch/arm/include/generated/uapi
@ -I /home/N910C_MM/SpaceLemonLite_N9100/include/uapi
@ -I include/generated/uapi -I /home/N910C_MM/SpaceLemonLite_N9100/. -I .
@ -I /home/N910C_MM/SpaceLemonLite_N9100/arch/arm/mach-msm/include
@ -imultilib v7ve
@ -iprefix /home/N910C_MM/arm-eabi-5.2/bin/../lib/gcc/arm-eabi/5.2.1/
@ -isysroot /home/N910C_MM/arm-eabi-5.2/bin/../arm-eabi/libc
@ -D__USES_INITFINI__ -D __KERNEL__ -D __LINUX_ARM_ARCH__=7 -U arm
@ -D CC_HAVE_ASM_GOTO -D KBUILD_STR(s)=#s
@ -D KBUILD_BASENAME=KBUILD_STR(bounds)
@ -D KBUILD_MODNAME=KBUILD_STR(bounds)
@ -isystem /home/N910C_MM/arm-eabi-5.2/bin/../lib/gcc/arm-eabi/5.2.1/include
@ -include /home/N910C_MM/SpaceLemonLite_N9100/include/linux/kconfig.h
@ -MD kernel/.bounds.s.d
@ /home/N910C_MM/SpaceLemonLite_N9100/kernel/bounds.c -mlittle-endian
@ -mabi=aapcs-linux -mno-thumb-interwork -marm -mcpu=cortex-a15
@ -mfloat-abi=soft -auxbase-strip kernel/bounds.s -g -Os -Wall -Wundef
@ -Wstrict-prototypes -Wno-trigraphs -Werror=implicit-function-declaration
@ -Wno-format-security -Wno-maybe-uninitialized -Wframe-larger-than=1024
@ -Wno-unused-but-set-variable -Wdeclaration-after-statement
@ -Wno-pointer-sign -fno-strict-aliasing -fno-common
@ -fno-delete-null-pointer-checks -fno-dwarf2-cfi-asm -fstack-protector
@ -funwind-tables -fomit-frame-pointer -fno-strict-overflow
@ -fconserve-stack -fverbose-asm
@ options enabled:  -faggressive-loop-optimizations -falign-functions
@ -falign-jumps -falign-labels -falign-loops -fauto-inc-dec
@ -fbranch-count-reg -fcaller-saves -fchkp-check-incomplete-type
@ -fchkp-check-read -fchkp-check-write -fchkp-instrument-calls
@ -fchkp-narrow-bounds -fchkp-optimize -fchkp-store-bounds
@ -fchkp-use-static-bounds -fchkp-use-static-const-bounds
@ -fchkp-use-wrappers -fcombine-stack-adjustments -fcompare-elim
@ -fcprop-registers -fcrossjumping -fcse-follow-jumps -fdefer-pop
@ -fdevirtualize -fdevirtualize-speculatively -fearly-inlining
@ -feliminate-unused-debug-types -fexpensive-optimizations
@ -fforward-propagate -ffunction-cse -fgcse -fgcse-lm -fgnu-runtime
@ -fgnu-unique -fguess-branch-probability -fhoist-adjacent-loads -fident
@ -fif-conversion -fif-conversion2 -findirect-inlining -finline
@ -finline-atomics -finline-functions -finline-functions-called-once
@ -finline-small-functions -fipa-cp -fipa-cp-alignment -fipa-icf
@ -fipa-icf-functions -fipa-icf-variables -fipa-profile -fipa-pure-const
@ -fipa-ra -fipa-reference -fipa-sra -fira-hoist-pressure
@ -fira-share-save-slots -fira-share-spill-slots
@ -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
@ -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
@ -fmath-errno -fmerge-constants -fmerge-debug-strings
@ -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
@ -fpartial-inlining -fpeephole -fpeephole2 -fprefetch-loop-arrays
@ -freg-struct-return -freorder-blocks -freorder-functions
@ -frerun-cse-after-loop -fsched-critical-path-heuristic
@ -fsched-dep-count-heuristic -fsched-group-heuristic -fsched-interblock
@ -fsched-last-insn-heuristic -fsched-pressure -fsched-rank-heuristic
@ -fsched-spec -fsched-spec-insn-heuristic -fsched-stalled-insns-dep
@ -fschedule-fusion -fschedule-insns2 -fsection-anchors
@ -fsemantic-interposition -fshow-column -fshrink-wrap -fsigned-zeros
@ -fsplit-ivs-in-unroller -fsplit-wide-types -fssa-phiopt -fstack-protector
@ -fstdarg-opt -fstrict-volatile-bitfields -fsync-libcalls -fthread-jumps
@ -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp -ftree-builtin-call-dce
@ -ftree-ccp -ftree-ch -ftree-coalesce-vars -ftree-copy-prop
@ -ftree-copyrename -ftree-cselim -ftree-dce -ftree-dominator-opts
@ -ftree-dse -ftree-forwprop -ftree-fre -ftree-loop-if-convert
@ -ftree-loop-im -ftree-loop-ivcanon -ftree-loop-optimize
@ -ftree-parallelize-loops= -ftree-phiprop -ftree-pre -ftree-pta
@ -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr -ftree-sra
@ -ftree-switch-conversion -ftree-tail-merge -ftree-ter -ftree-vrp
@ -funit-at-a-time -funwind-tables -fvar-tracking
@ -fvar-tracking-assignments -fverbose-asm -fzero-initialized-in-bss -marm
@ -mlittle-endian -mpic-data-is-text-relative -msched-prolog
@ -munaligned-access -mvectorize-with-neon-quad

	.text
.Ltext0:
	.align	2
	.global	foo
	.syntax divided
	.arm
	.type	foo, %function
foo:
	.fnstart
.LFB120:
	.file 1 "/home/N910C_MM/SpaceLemonLite_N9100/kernel/bounds.c"
	.loc 1 15 0
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	.loc 1 17 0
	.syntax divided
@ 17 "/home/N910C_MM/SpaceLemonLite_N9100/kernel/bounds.c" 1
	
->NR_PAGEFLAGS #25 __NR_PAGEFLAGS	@
@ 0 "" 2
	.loc 1 18 0
@ 18 "/home/N910C_MM/SpaceLemonLite_N9100/kernel/bounds.c" 1
	
->MAX_NR_ZONES #3 __MAX_NR_ZONES	@
@ 0 "" 2
	.loc 1 19 0
@ 19 "/home/N910C_MM/SpaceLemonLite_N9100/kernel/bounds.c" 1
	
->NR_PCG_FLAGS #3 __NR_PCG_FLAGS	@
@ 0 "" 2
	.arm
	.syntax divided
	bx	lr	@
.LFE120:
	.fnend
	.size	foo, .-foo
	.section	.debug_frame,"",%progbits
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x3
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.uleb128 0xe
	.byte	0xc
	.uleb128 0xd
	.uleb128 0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB120
	.4byte	.LFE120-.LFB120
	.align	2
.LEFDE0:
	.text
.Letext0:
	.file 2 "/home/N910C_MM/SpaceLemonLite_N9100/include/linux/page-flags.h"
	.file 3 "/home/N910C_MM/SpaceLemonLite_N9100/include/linux/mmzone.h"
	.file 4 "/home/N910C_MM/SpaceLemonLite_N9100/arch/arm/include/asm/hwcap.h"
	.file 5 "/home/N910C_MM/SpaceLemonLite_N9100/include/linux/printk.h"
	.file 6 "/home/N910C_MM/SpaceLemonLite_N9100/include/linux/kernel.h"
	.file 7 "/home/N910C_MM/SpaceLemonLite_N9100/include/linux/page_cgroup.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x1e5
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF56
	.byte	0xc
	.4byte	.LASF57
	.4byte	.LASF58
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.4byte	.LASF11
	.uleb128 0x4
	.4byte	.LASF43
	.byte	0x4
	.4byte	0x48
	.byte	0x2
	.byte	0x4a
	.4byte	0x14b
	.uleb128 0x5
	.4byte	.LASF12
	.byte	0
	.uleb128 0x5
	.4byte	.LASF13
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF14
	.byte	0x2
	.uleb128 0x5
	.4byte	.LASF15
	.byte	0x3
	.uleb128 0x5
	.4byte	.LASF16
	.byte	0x4
	.uleb128 0x5
	.4byte	.LASF17
	.byte	0x5
	.uleb128 0x5
	.4byte	.LASF18
	.byte	0x6
	.uleb128 0x5
	.4byte	.LASF19
	.byte	0x7
	.uleb128 0x5
	.4byte	.LASF20
	.byte	0x8
	.uleb128 0x5
	.4byte	.LASF21
	.byte	0x9
	.uleb128 0x5
	.4byte	.LASF22
	.byte	0xa
	.uleb128 0x5
	.4byte	.LASF23
	.byte	0xb
	.uleb128 0x5
	.4byte	.LASF24
	.byte	0xc
	.uleb128 0x5
	.4byte	.LASF25
	.byte	0xd
	.uleb128 0x5
	.4byte	.LASF26
	.byte	0xe
	.uleb128 0x5
	.4byte	.LASF27
	.byte	0xf
	.uleb128 0x5
	.4byte	.LASF28
	.byte	0x10
	.uleb128 0x5
	.4byte	.LASF29
	.byte	0x11
	.uleb128 0x5
	.4byte	.LASF30
	.byte	0x12
	.uleb128 0x5
	.4byte	.LASF31
	.byte	0x13
	.uleb128 0x5
	.4byte	.LASF32
	.byte	0x14
	.uleb128 0x5
	.4byte	.LASF33
	.byte	0x15
	.uleb128 0x5
	.4byte	.LASF34
	.byte	0x16
	.uleb128 0x5
	.4byte	.LASF35
	.byte	0x17
	.uleb128 0x5
	.4byte	.LASF36
	.byte	0x18
	.uleb128 0x5
	.4byte	.LASF37
	.byte	0x19
	.uleb128 0x5
	.4byte	.LASF38
	.byte	0x8
	.uleb128 0x5
	.4byte	.LASF39
	.byte	0xc
	.uleb128 0x5
	.4byte	.LASF40
	.byte	0x8
	.uleb128 0x5
	.4byte	.LASF41
	.byte	0x4
	.uleb128 0x5
	.4byte	.LASF42
	.byte	0xb
	.byte	0
	.uleb128 0x6
	.4byte	.LASF44
	.byte	0x4
	.4byte	0x48
	.byte	0x3
	.2byte	0x115
	.4byte	0x175
	.uleb128 0x5
	.4byte	.LASF45
	.byte	0
	.uleb128 0x5
	.4byte	.LASF46
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF47
	.byte	0x2
	.uleb128 0x5
	.4byte	.LASF48
	.byte	0x3
	.byte	0
	.uleb128 0x7
	.byte	0x4
	.4byte	0x48
	.byte	0x7
	.byte	0x4
	.4byte	0x19a
	.uleb128 0x5
	.4byte	.LASF49
	.byte	0
	.uleb128 0x5
	.4byte	.LASF50
	.byte	0x1
	.uleb128 0x5
	.4byte	.LASF51
	.byte	0x2
	.uleb128 0x5
	.4byte	.LASF52
	.byte	0x3
	.byte	0
	.uleb128 0x8
	.ascii	"foo\000"
	.byte	0x1
	.byte	0xe
	.4byte	.LFB120
	.4byte	.LFE120-.LFB120
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.4byte	.LASF53
	.byte	0x4
	.byte	0xc
	.4byte	0x48
	.uleb128 0xa
	.4byte	0x41
	.4byte	0x1c1
	.uleb128 0xb
	.byte	0
	.uleb128 0x9
	.4byte	.LASF54
	.byte	0x5
	.byte	0x24
	.4byte	0x1b6
	.uleb128 0xa
	.4byte	0x6b
	.4byte	0x1d7
	.uleb128 0xb
	.byte	0
	.uleb128 0xc
	.4byte	.LASF55
	.byte	0x6
	.2byte	0x1af
	.4byte	0x1e3
	.uleb128 0xd
	.4byte	0x1cc
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x4
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF51:
	.ascii	"PCG_MIGRATION\000"
.LASF26:
	.ascii	"PG_head\000"
.LASF34:
	.ascii	"PG_scfslower\000"
.LASF54:
	.ascii	"console_printk\000"
.LASF22:
	.ascii	"PG_reserved\000"
.LASF45:
	.ascii	"ZONE_NORMAL\000"
.LASF29:
	.ascii	"PG_mappedtodisk\000"
.LASF56:
	.ascii	"GNU C11 5.2.1 20151005 -mlittle-endian -mabi=aapcs-"
	.ascii	"linux -mno-thumb-interwork -marm -mcpu=cortex-a15 -"
	.ascii	"mfloat-abi=soft -g -Os -fno-strict-aliasing -fno-co"
	.ascii	"mmon -fno-delete-null-pointer-checks -fno-dwarf2-cf"
	.ascii	"i-asm -fstack-protector -funwind-tables -fomit-fram"
	.ascii	"e-pointer -fno-strict-overflow -fconserve-stack\000"
.LASF12:
	.ascii	"PG_locked\000"
.LASF16:
	.ascii	"PG_dirty\000"
.LASF25:
	.ascii	"PG_writeback\000"
.LASF23:
	.ascii	"PG_private\000"
.LASF37:
	.ascii	"__NR_PAGEFLAGS\000"
.LASF48:
	.ascii	"__MAX_NR_ZONES\000"
.LASF39:
	.ascii	"PG_fscache\000"
.LASF14:
	.ascii	"PG_referenced\000"
.LASF28:
	.ascii	"PG_swapcache\000"
.LASF44:
	.ascii	"zone_type\000"
.LASF57:
	.ascii	"/home/N910C_MM/SpaceLemonLite_N9100/kernel/bounds.c"
	.ascii	"\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF31:
	.ascii	"PG_swapbacked\000"
.LASF38:
	.ascii	"PG_checked\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF17:
	.ascii	"PG_lru\000"
.LASF27:
	.ascii	"PG_tail\000"
.LASF35:
	.ascii	"PG_nocache\000"
.LASF53:
	.ascii	"elf_hwcap\000"
.LASF36:
	.ascii	"PG_readahead\000"
.LASF43:
	.ascii	"pageflags\000"
.LASF49:
	.ascii	"PCG_LOCK\000"
.LASF46:
	.ascii	"ZONE_HIGHMEM\000"
.LASF4:
	.ascii	"unsigned int\000"
.LASF13:
	.ascii	"PG_error\000"
.LASF6:
	.ascii	"long long unsigned int\000"
.LASF40:
	.ascii	"PG_pinned\000"
.LASF19:
	.ascii	"PG_slab\000"
.LASF20:
	.ascii	"PG_owner_priv_1\000"
.LASF18:
	.ascii	"PG_active\000"
.LASF8:
	.ascii	"sizetype\000"
.LASF24:
	.ascii	"PG_private_2\000"
.LASF5:
	.ascii	"long long int\000"
.LASF9:
	.ascii	"char\000"
.LASF32:
	.ascii	"PG_unevictable\000"
.LASF41:
	.ascii	"PG_savepinned\000"
.LASF15:
	.ascii	"PG_uptodate\000"
.LASF2:
	.ascii	"short int\000"
.LASF55:
	.ascii	"hex_asc\000"
.LASF50:
	.ascii	"PCG_USED\000"
.LASF21:
	.ascii	"PG_arch_1\000"
.LASF10:
	.ascii	"long int\000"
.LASF47:
	.ascii	"ZONE_MOVABLE\000"
.LASF58:
	.ascii	"/home/N910C_MM/SpaceLemonLite_N9100/output\000"
.LASF52:
	.ascii	"__NR_PCG_FLAGS\000"
.LASF0:
	.ascii	"signed char\000"
.LASF30:
	.ascii	"PG_reclaim\000"
.LASF11:
	.ascii	"_Bool\000"
.LASF33:
	.ascii	"PG_mlocked\000"
.LASF42:
	.ascii	"PG_slob_free\000"
	.ident	"GCC: (Linaro GCC 5.2-2015.11-1) 5.2.1 20151005"
