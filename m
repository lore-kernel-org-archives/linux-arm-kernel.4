Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190E7606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 23:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ydvzY2KY;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M0LBjqh9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GpJLhSWijE06ovHUd/Xpys2nULzrY8TwvRQu8x7LyGo=; b=ydvzY2KYlyKuwV
	XZgox6HA/Ns+8wOQYZvGiFVReYfoPqWoZQTTb+7TQjae6qwagdmImRNyMNs7KGAkwb6RiDSYbq7CW
	68D6y7FOme9NN7pfA13YOBnCzIH9N1Dnh7/6ttvosFJVKT6G4s4KnYiBfSGWh6G1LhPmbINjeFtxN
	lrxka9aBuQozL6u1xEq4madq0W6IjEsNrbGExNd8NYGRnMSdErzRU4eTmgZM8ODI159lTlGd2m8Sd
	uhHQsc2FfmEDCj/R32kXb2TZBRgz15TnftJspUIABxdchGw3clRJTYB35eG5wsPbO5nK9tlAsa9de
	BEhv4vkwinHlo9ol2uvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGy8-00000001tWT-3BpR;
	Sun, 22 Nov 2026 23:27:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGxw-00000001tTq-1ozA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 23:27:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D980D43D2F;
	Sun, 22 Nov 2026 23:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2D41F000C6;
	Sun, 22 Nov 2026 23:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795390042;
	bh=GpJLhSWijE06ovHUd/Xpys2nULzrY8TwvRQu8x7LyGo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=M0LBjqh9lxl6YG1FADxcp0C8/dleNeWDDsS3bX076Kaa5tKkDi1rQekkw32yVheMD
	 +VyiwL0t3yN2yEZe6PmBNyEQXYBVKIvHUopomn1SbaQ7bRWrl3ZMRWVqHu2HdiLn6b
	 6ktoT0ZCN1J0ZIih2afyndChSXet935bXylzcHzapjqyG3vTw45wzZt6ObfkXeKivr
	 9hv74wCxYXuL0JbsmNWJXxuhsvhyUQP02Gt4bmNnNaPnUvchRMglEinyOL6mYW+b9x
	 CgRPkSkWBJe35HwOO7iLrfcnWlI7JkyCddQAw2B5L3T/UbLPVrEcp2RvoL1YNCRdIf
	 up3A+QNdqhimQ==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 00:27:15 +0100
Subject: [PATCH v4 1/2] ARM: entry: Convert IRQ handling to generic IRQ
 entry
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-arm-generic-irq-entry-v7-1-v4-1-49d245498f72@kernel.org>
References: <20261123-arm-generic-irq-entry-v7-1-v4-0-49d245498f72@kernel.org>
In-Reply-To: <20261123-arm-generic-irq-entry-v7-1-v4-0-49d245498f72@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>, Arnd Bergmann <arnd@arndb.de>, 
 Russell King <linux@armlinux.org.uk>, Oleg Nesterov <oleg@redhat.com>, 
 Yoshifumi SHU <envzhu@gmail.com>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Bring ARM to the same level of generic-ness as ARM64 by enabling
GENERIC_IRQ_ENTRY.

Route ARM IRQ entry through C wrappers that use the generic IRQ entry
helpers. Conversely put the FIQ entry under the generic NMI-style entry
helpers.

Select GENERIC_IRQ_ENTRY, add the ARM entry prototypes, and provide
regs_irqs_disabled() for the generic IRQ entry return path.

The kernel-mode IRQ return path relies on the generic IRQ entry
preemption handling, matching the arm64 structure and avoiding the old
assembly reschedule check.

The reschedule check is now done in raw_irqentry_exit_cond_resched()
in kernel/entry/common.c.

User-mode IRQs __irq_usr is neither calling ct_user_exit/enter
or asm_trace_hardirqs_off/on anymore. The corresponding calls happen on
irqentry_enter/exit() call paths, e.g the irq-disabled C variants
__ct_user_exit/enter() are called instead.

As __irq_usr no longer returns by jumping to ret_to_user_from_irq,
the corresponding code has been inlined, except the slow_work_pending
part, which is now also handled by generic entry.

arch_do_signal_or_restart() is required, but we only need a very small
stub, since we keep the existing syscall restart code around in
assembly.

Selecting GENERIC_IRQ_ENTRY also enables optimized handling for extended
rseq registrations. Record non-syscall user entry for data aborts,
prefetch aborts and undefined instructions with
rseq_note_user_irq_entry() so signal delivery aborts an interrupted
rseq critical section. Clear the rseq events on the legacy return path
after pending work completes, before returning to userspace, so
user_irq cannot leak into a later syscall. Keep the existing assembly
context-tracking calls on these paths.

Add a small V7M rseq handling snippet. Most V7M IRQ handling changes
are in a separate patch.

Tested with a multi_v7_defconfig-based configuration on QEMU
vexpress-a15 using vexpress-v2p-ca15-tc1.dtb. Extended-rseq signal-frame
tests pass for data aborts, prefetch aborts and undefined instructions
(100 cases each). Legacy rseq and ARM/Thumb userspace entry tests also
pass, as does a Debian boot and clean poweroff.

This is a reduced patch based on the earlier generic entry series
avoiding all the syscall handling changes.

Link: https://lore.kernel.org/linux-arm-kernel/20250420-arm-generic-entry-v6-0-95f1fcdfeeb2@linaro.org/
Suggested-by: Yoshifumi SHU <envzhu@gmail.com>
Link: https://lore.kernel.org/linux-arm-kernel/ac3e3fce-b27a-4d17-9616-48a70ddaf28b@gmail.com/
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/Kconfig                    |  1 +
 arch/arm/include/asm/entry-common.h |  7 ++++
 arch/arm/include/asm/entry.h        | 12 ++++++
 arch/arm/include/asm/ptrace.h       |  7 +++-
 arch/arm/kernel/Makefile            |  2 +-
 arch/arm/kernel/entry-armv.S        | 78 +++++++++----------------------------
 arch/arm/kernel/entry-common.S      |  8 +++-
 arch/arm/kernel/entry-header.S      |  7 +++-
 arch/arm/kernel/entry-v7m.S         |  6 ++-
 arch/arm/kernel/entry.c             | 61 +++++++++++++++++++++++++++++
 arch/arm/kernel/irq.c               |  6 +++
 arch/arm/kernel/irq.h               |  2 +
 arch/arm/kernel/signal.c            |  6 +++
 13 files changed, 138 insertions(+), 65 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0cc289a7184a..9f1c53365687 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -71,6 +71,7 @@ config ARM
 	select GENERIC_CPU_AUTOPROBE
 	select GENERIC_CPU_DEVICES
 	select GENERIC_EARLY_IOREMAP
+	select GENERIC_IRQ_ENTRY
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IRQ_MULTI_HANDLER
 	select GENERIC_IRQ_PROBE
diff --git a/arch/arm/include/asm/entry-common.h b/arch/arm/include/asm/entry-common.h
new file mode 100644
index 000000000000..c017df5f39d5
--- /dev/null
+++ b/arch/arm/include/asm/entry-common.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_ARM_ENTRY_COMMON_H
+#define __ASM_ARM_ENTRY_COMMON_H
+
+#include <asm/stacktrace.h>
+
+#endif
diff --git a/arch/arm/include/asm/entry.h b/arch/arm/include/asm/entry.h
new file mode 100644
index 000000000000..4a28e54b5bf3
--- /dev/null
+++ b/arch/arm/include/asm/entry.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_ENTRY_H__
+#define __ASM_ENTRY_H__
+
+struct pt_regs;
+
+void arm_rseq_user_enter(void);
+void arm_rseq_user_exit(void);
+void arm_irq_handler(struct pt_regs *regs, int mode);
+void arm_fiq_handler(struct pt_regs *regs);
+
+#endif /* __ASM_ENTRY_H__ */
diff --git a/arch/arm/include/asm/ptrace.h b/arch/arm/include/asm/ptrace.h
index 6eb311fb2da0..88ddb9371a02 100644
--- a/arch/arm/include/asm/ptrace.h
+++ b/arch/arm/include/asm/ptrace.h
@@ -46,8 +46,13 @@ struct svc_pt_regs {
 #define processor_mode(regs) \
 	((regs)->ARM_cpsr & MODE_MASK)
 
+static inline bool regs_irqs_disabled(const struct pt_regs *regs)
+{
+	return regs->ARM_cpsr & PSR_I_BIT;
+}
+
 #define interrupts_enabled(regs) \
-	(!((regs)->ARM_cpsr & PSR_I_BIT))
+	(!regs_irqs_disabled(regs))
 
 #define fast_interrupts_enabled(regs) \
 	(!((regs)->ARM_cpsr & PSR_F_BIT))
diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
index b36cf0cfd4a7..3b8a62f6f54d 100644
--- a/arch/arm/kernel/Makefile
+++ b/arch/arm/kernel/Makefile
@@ -17,7 +17,7 @@ CFLAGS_REMOVE_return_address.o = -pg
 
 # Object file lists.
 
-obj-y		:= elf.o entry-common.o irq.o opcodes.o \
+obj-y		:= elf.o entry.o entry-common.o irq.o opcodes.o \
 		   process.o ptrace.o reboot.o io.o \
 		   setup.o signal.o sigreturn_codes.o \
 		   stacktrace.o sys_arm.o time.o traps.o
diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
index 2d2ea3ca880c..36422f3ee018 100644
--- a/arch/arm/kernel/entry-armv.S
+++ b/arch/arm/kernel/entry-armv.S
@@ -36,35 +36,6 @@
 #define RELOC_TEXT_NONE
 #endif
 
-/*
- * Interrupt handling.
- */
-	.macro	irq_handler, from_user:req
-	mov	r1, sp
-	ldr_this_cpu r2, irq_stack_ptr, r2, r3
-	.if	\from_user == 0
-	@
-	@ If we took the interrupt while running in the kernel, we may already
-	@ be using the IRQ stack, so revert to the original value in that case.
-	@
-	subs	r3, r2, r1		@ SP above bottom of IRQ stack?
-	rsbscs	r3, r3, #THREAD_SIZE	@ ... and below the top?
-#ifdef CONFIG_VMAP_STACK
-	ldr_va	r3, high_memory, cc	@ End of the linear region
-	cmpcc	r3, r1			@ Stack pointer was below it?
-#endif
-	bcc	0f			@ If not, switch to the IRQ stack
-	mov	r0, r1
-	bl	generic_handle_arch_irq
-	b	1f
-0:
-	.endif
-
-	mov_l	r0, generic_handle_arch_irq
-	bl	call_with_stack
-1:
-	.endm
-
 	.macro	pabt_helper
 	@ PABORT handler takes pt_regs in r2, fault address in r4 and psr in r5
 #ifdef MULTI_PABORT
@@ -224,34 +195,17 @@ ENDPROC(__dabt_svc)
 
 	.align	5
 __irq_svc:
-	svc_entry
-	irq_handler from_user=0
-
-#ifdef CONFIG_PREEMPTION
-	ldr	r8, [tsk, #TI_PREEMPT]		@ get preempt count
-	ldr	r0, [tsk, #TI_FLAGS]		@ get flags
-	teq	r8, #0				@ if preempt count != 0
-	movne	r0, #0				@ force flags to 0
-	tst	r0, #_TIF_NEED_RESCHED
-	blne	svc_preempt
-#endif
+	svc_entry trace=0
+	mov	r0, sp				@ regs
+	mov	r1, #0				@ from kernel mode
+	bl	arm_irq_handler
 
-	svc_exit r5, irq = 1			@ return from exception
+	svc_exit r5, irqentry = 1		@ return from exception
  UNWIND(.fnend		)
 ENDPROC(__irq_svc)
 
 	.ltorg
 
-#ifdef CONFIG_PREEMPTION
-svc_preempt:
-	mov	r8, lr
-1:	bl	preempt_schedule_irq		@ irq en/disable is done inside
-	ldr	r0, [tsk, #TI_FLAGS]		@ get new tasks TI_FLAGS
-	tst	r0, #_TIF_NEED_RESCHED
-	reteq	r8				@ go again
-	b	1b
-#endif
-
 __und_fault:
 	@ Correct the PC such that it is pointing at the instruction
 	@ which caused the fault.  If the faulting instruction was ARM
@@ -302,7 +256,7 @@ ENDPROC(__pabt_svc)
 __fiq_svc:
 	svc_entry trace=0
 	mov	r0, sp				@ struct pt_regs *regs
-	bl	handle_fiq_as_nmi
+	bl	arm_fiq_handler
 	svc_exit_via_fiq
  UNWIND(.fnend		)
 ENDPROC(__fiq_svc)
@@ -331,7 +285,7 @@ __fiq_abt:
 	stmfd	sp!, {r1 - r2}
 
 	add	r0, sp, #8			@ struct pt_regs *regs
-	bl	handle_fiq_as_nmi
+	bl	arm_fiq_handler
 
 	ldmfd	sp!, {r1 - r2}
  ARM(	msr	cpsr_c, #ABT_MODE | PSR_I_BIT | PSR_F_BIT )
@@ -407,6 +361,9 @@ ENDPROC(__fiq_abt)
 	bl	trace_hardirqs_off
 #endif
 	ct_user_exit save = 0
+#ifdef CONFIG_RSEQ
+	bl	arm_rseq_user_enter
+#endif
 	.endif
 	.endm
 
@@ -438,12 +395,15 @@ ENDPROC(__dabt_usr)
 
 	.align	5
 __irq_usr:
-	usr_entry
+	usr_entry trace=0
 	kuser_cmpxchg_check
-	irq_handler from_user=1
-	get_thread_info tsk
-	mov	why, #0
-	b	ret_to_user_from_irq
+	mov	r0, sp				@ regs
+	mov	r1, #1				@ from user mode
+	bl	arm_irq_handler
+#ifdef CONFIG_KSTACK_ERASE
+	bl	stackleak_erase_on_task_stack
+#endif
+	restore_user_regs fast = 0, offset = 0
  UNWIND(.fnend		)
 ENDPROC(__irq_usr)
 
@@ -498,7 +458,7 @@ __fiq_usr:
 	usr_entry trace=0
 	kuser_cmpxchg_check
 	mov	r0, sp				@ struct pt_regs *regs
-	bl	handle_fiq_as_nmi
+	bl	arm_fiq_handler
 	get_thread_info tsk
 	restore_user_regs fast = 0, offset = 0
  UNWIND(.fnend		)
diff --git a/arch/arm/kernel/entry-common.S b/arch/arm/kernel/entry-common.S
index 88336a1292bb..2b518dd217c9 100644
--- a/arch/arm/kernel/entry-common.S
+++ b/arch/arm/kernel/entry-common.S
@@ -110,11 +110,15 @@ ret_slow_syscall:
 	bl	do_rseq_syscall
 #endif
 	disable_irq_notrace			@ disable interrupts
-ENTRY(ret_to_user_from_irq)
+ENTRY(v7m_ret_to_user_from_irq)
+	/* Only the v7m jumps directly to v7m_ret_to_user_from_irq */
 	ldr	r1, [tsk, #TI_FLAGS]
 	movs	r1, r1, lsl #16
 	bne	slow_work_pending
 no_work_pending:
+#ifdef CONFIG_RSEQ
+	bl	arm_rseq_user_exit
+#endif
 	asm_trace_hardirqs_on save = 0
 
 	ct_user_enter save = 0
@@ -123,7 +127,7 @@ no_work_pending:
 	bl	stackleak_erase_on_task_stack
 #endif
 	restore_user_regs fast = 0, offset = 0
-ENDPROC(ret_to_user_from_irq)
+ENDPROC(v7m_ret_to_user_from_irq)
 ENDPROC(ret_to_user)
 
 /*
diff --git a/arch/arm/kernel/entry-header.S b/arch/arm/kernel/entry-header.S
index 99411fa91350..e83f2fb8a592 100644
--- a/arch/arm/kernel/entry-header.S
+++ b/arch/arm/kernel/entry-header.S
@@ -199,7 +199,11 @@
 	.endm
 
 
-	.macro	svc_exit, rpsr, irq = 0
+	.macro	svc_exit, rpsr, irq = 0, irqentry = 0
+	.if	\irqentry != 0
+	@ Generic IRQ entry already handled tracing and lockdep state.
+	disable_irq_notrace
+	.else
 	.if	\irq != 0
 	@ IRQs already off
 #ifdef CONFIG_TRACE_IRQFLAGS
@@ -216,6 +220,7 @@
 	tst	\rpsr, #PSR_I_BIT
 	blne	trace_hardirqs_off
 #endif
+	.endif
 	.endif
 	uaccess_exit tsk, r0, r1
 
diff --git a/arch/arm/kernel/entry-v7m.S b/arch/arm/kernel/entry-v7m.S
index 52bacf07ba16..e8102413461f 100644
--- a/arch/arm/kernel/entry-v7m.S
+++ b/arch/arm/kernel/entry-v7m.S
@@ -87,6 +87,10 @@ ENDPROC(__irq_entry)
 __pendsv_entry:
 	v7m_exception_entry
 
+#ifdef CONFIG_RSEQ
+	bl	arm_rseq_user_enter
+#endif
+
 	ldr	r1, =BASEADDR_V7M_SCB
 	mov	r0, #V7M_SCB_ICSR_PENDSVCLR
 	str	r0, [r1, V7M_SCB_ICSR]	@ clear PendSV
@@ -94,7 +98,7 @@ __pendsv_entry:
 	@ execute the pending work, including reschedule
 	get_thread_info tsk
 	mov	why, #0
-	b	ret_to_user_from_irq
+	b	v7m_ret_to_user_from_irq
 ENDPROC(__pendsv_entry)
 
 /*
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
new file mode 100644
index 000000000000..42d9301bdf37
--- /dev/null
+++ b/arch/arm/kernel/entry.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/hardirq.h>
+#include <linux/irq-entry-common.h>
+#include <linux/irq.h>
+
+#include <asm/entry.h>
+#include <asm/stacktrace.h>
+#include <asm/traps.h>
+
+#include "irq.h"
+
+noinstr void arm_rseq_user_enter(void)
+{
+	rseq_note_user_irq_entry();
+}
+
+noinstr void arm_rseq_user_exit(void)
+{
+	rseq_irqentry_exit_to_user_mode();
+}
+
+static void noinstr handle_arm_irq(void *data)
+{
+	struct pt_regs *regs = data;
+	struct pt_regs *old_regs;
+
+	irq_enter_rcu();
+	old_regs = set_irq_regs(regs);
+
+	handle_arch_irq(regs);
+
+	set_irq_regs(old_regs);
+	irq_exit_rcu();
+}
+
+noinstr void arm_irq_handler(struct pt_regs *regs, int mode)
+{
+	irqentry_state_t state = irqentry_enter(regs);
+
+	/*
+	 * mode == 1 means we came from userspace, and then we
+	 * should just immediately switch to the irq stack.
+	 * Then we check of we are on the thread stack. If we are
+	 * not, then by definition we are already using the irq stack.
+	 */
+	if (mode == 1 || on_thread_stack())
+		call_on_irq_stack(handle_arm_irq, regs);
+	else
+		handle_arm_irq(regs);
+
+	irqentry_exit(regs, state);
+}
+
+noinstr void arm_fiq_handler(struct pt_regs *regs)
+{
+	irqentry_state_t state = irqentry_nmi_enter(regs);
+
+	handle_fiq_as_nmi(regs);
+
+	irqentry_nmi_exit(regs, state);
+}
diff --git a/arch/arm/kernel/irq.c b/arch/arm/kernel/irq.c
index e1993e28a9ec..f99d6b24d8ff 100644
--- a/arch/arm/kernel/irq.c
+++ b/arch/arm/kernel/irq.c
@@ -43,6 +43,7 @@
 #include <asm/mach/irq.h>
 #include <asm/mach/time.h>
 
+#include "irq.h"
 #include "reboot.h"
 
 unsigned long irq_err_count;
@@ -71,6 +72,11 @@ static void __init init_irq_stacks(void)
 	}
 }
 
+void call_on_irq_stack(void (*fn)(void *), void *arg)
+{
+	call_with_stack(fn, arg, __this_cpu_read(irq_stack_ptr));
+}
+
 #ifdef CONFIG_SOFTIRQ_ON_OWN_STACK
 static void ____do_softirq(void *arg)
 {
diff --git a/arch/arm/kernel/irq.h b/arch/arm/kernel/irq.h
new file mode 100644
index 000000000000..80dd5bfe6403
--- /dev/null
+++ b/arch/arm/kernel/irq.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+void call_on_irq_stack(void (*fn)(void *), void *arg);
diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index 763e1930a1ea..e6ef0a1aa5ee 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -12,6 +12,7 @@
 #include <linux/resume_user_mode.h>
 #include <linux/uprobes.h>
 #include <linux/syscalls.h>
+#include <linux/irq-entry-common.h>
 
 #include <asm/elf.h>
 #include <asm/cacheflush.h>
@@ -609,6 +610,11 @@ static int do_signal(struct pt_regs *regs, int syscall)
 	return 0;
 }
 
+void arch_do_signal_or_restart(struct pt_regs *regs)
+{
+	do_signal(regs, 0);
+}
+
 asmlinkage int
 do_work_pending(struct pt_regs *regs, unsigned int thread_flags, int syscall)
 {

-- 
2.56.1


