Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18884606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Nov 2026 23:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y7292WoL;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jC5qf/F6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JhtZj19Hf/kVs5poRldVSmWSw73AB7AaG7wXj+qOSN4=; b=y7292WoLfmraVr
	alRzsMBO9yxmzenS4K5RAMxFsXv5Vb9ZiU4lNUAQozx0AvecRapwxApMk6usUEUbCYx0jw6k4ekGU
	n7qYQ0JR6kQy5DrexVM0bqg3/cJMaBYpXNANQzM6PsQVhB+9qJfWih0rqjxRkCicuuN4KlbEGf8Fv
	XL/mWN194IN7N60wQKqAIvFAytrGZipBdZFLKnIPMpGKO+OJeNryvOENNW2tK6FSJjstWZuFy+l24
	XFlmmIACYuZ62HxQTodxwiEkdRnM0xVS0276xCdHycNi5MUIrBdfOp6bw2SG16e5Xhu/YedMnfzPv
	zP/r3a0Y5jWREcFa1GEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGy9-00000001tWd-0uKC;
	Sun, 22 Nov 2026 23:27:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGxy-00000001tUB-2KWY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Nov 2026 23:27:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 074F96123E;
	Sun, 22 Nov 2026 23:27:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E331F000C6;
	Sun, 22 Nov 2026 23:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795390045;
	bh=JhtZj19Hf/kVs5poRldVSmWSw73AB7AaG7wXj+qOSN4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=jC5qf/F65VGxdazx7eGh2JtTYPnlLvqz/KxnQi0U2jF4dBL8xwI8g2Igj3540iFhr
	 /TVfhkpy+iZX947IOrx2hRH5LPBg5D3GocLc5E+WgoCiFCuvamStpT95LIbhwVaH7r
	 MM+b+ZtA0nBcZBVWYWIpEZ5eYCzhSfu3msZ1p/fsFvu1ITAmCKtGHA34wk86zRvWFo
	 1FEwNJ7cSmrTEmsH0M3PpY1BRGKOVng9aGwOHWRZZS/vpFFTbRFnk7aDFsEqG9zUsd
	 yJP7EQ06K0vcKHXOHpZj/+bRp2s1ZQZsFsULSkCrGjiCb6wo7eGmveMbEz8s32rww9
	 glB5suQaKPMiA==
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 00:27:16 +0100
Subject: [PATCH v4 2/2] ARM: v7m: entry: Convert IRQ handling to generic
 IRQ entry
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-arm-generic-irq-entry-v7-1-v4-2-49d245498f72@kernel.org>
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

From: Yoshifumi SHU <envzhu@gmail.com>

The recent patch converting ARM to generic IRQ entry [1] leaves the V7M
path using architecture-specific entry due to its distinct exception
model. This RFC attempts to complete that conversion for V7M.

On the V7M architecture, the execution priority cannot be lowered
without an exception return. Therefore, an IRQ handler cannot directly
perform a context switch. irqentry_exit() may schedule, so it cannot run
entirely in the IRQ handler. This is uncommon in other architectures.

The existing V7M code defers exit work to a PendSV (Pendable Service
Call) handler, which runs at the lowest priority (matching the kernel's
priority). Furthermore, kernel preemption on exit to kernel mode is
unsupported; PendSV runs at the kernel's priority and does not preempt
the kernel.

Convert the V7M IRQ path to use generic IRQ entry while deferring exit
work to PendSV:

- IRQ from user mode: if exit work is pending, defer the exit to user
  mode to the PendSV handler. Otherwise, exit directly in the IRQ
  handler to avoid an unnecessary PendSV exception.

- IRQ from kernel mode: perform generic exit handling directly in the
  IRQ handler, with rescheduling suppressed by
  arch_irqentry_exit_need_resched().

- IRQ taken while exit to user mode is deferred: handle it as a nested
  IRQ, i.e., as an IRQ from kernel mode.

Use the separate irqentry_{enter_from,exit_to}_user_mode() and
irqentry_{enter_from,exit_to}_kernel_mode() for these paths.

This keeps the existing V7M scheduling behavior while using generic IRQ
entry.

Tested on MPS3-AN547 (Cortex-M55) and EK-RA8P1 (Cortex-M85) hardware.
RSEQ selftests pass.

Link: https://lore.kernel.org/linux-arm-kernel/20260910-arm-generic-irq-entry-v7-1-v3-1-5fd90f6859e1@kernel.org/ # [1]
Signed-off-by: Yoshifumi SHU <envzhu@gmail.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/include/asm/entry-common.h |  9 +++++
 arch/arm/include/asm/entry.h        |  4 +++
 arch/arm/kernel/entry-v7m.S         | 53 +++++----------------------
 arch/arm/kernel/entry.c             | 72 +++++++++++++++++++++++++++++++++++++
 4 files changed, 94 insertions(+), 44 deletions(-)

diff --git a/arch/arm/include/asm/entry-common.h b/arch/arm/include/asm/entry-common.h
index c017df5f39d5..35a4905e7aca 100644
--- a/arch/arm/include/asm/entry-common.h
+++ b/arch/arm/include/asm/entry-common.h
@@ -4,4 +4,13 @@
 
 #include <asm/stacktrace.h>
 
+#ifdef CONFIG_CPU_V7M
+/* V7M never reschedules on exit to kernel mode */
+static inline bool arch_irqentry_exit_need_resched(void)
+{
+	return false;
+}
+#define arch_irqentry_exit_need_resched arch_irqentry_exit_need_resched
+#endif
+
 #endif
diff --git a/arch/arm/include/asm/entry.h b/arch/arm/include/asm/entry.h
index 4a28e54b5bf3..a4a44bda7e99 100644
--- a/arch/arm/include/asm/entry.h
+++ b/arch/arm/include/asm/entry.h
@@ -8,5 +8,9 @@ void arm_rseq_user_enter(void);
 void arm_rseq_user_exit(void);
 void arm_irq_handler(struct pt_regs *regs, int mode);
 void arm_fiq_handler(struct pt_regs *regs);
+#ifdef CONFIG_CPU_V7M
+void v7m_irq_handler(struct pt_regs *regs);
+void v7m_pendsv_handler(struct pt_regs *regs);
+#endif
 
 #endif /* __ASM_ENTRY_H__ */
diff --git a/arch/arm/kernel/entry-v7m.S b/arch/arm/kernel/entry-v7m.S
index e8102413461f..0d6f2eb99ca7 100644
--- a/arch/arm/kernel/entry-v7m.S
+++ b/arch/arm/kernel/entry-v7m.S
@@ -39,41 +39,11 @@ __irq_entry:
 	@
 	@ Invoke the IRQ handler
 	@
-	mov	r0, sp
-	ldr_this_cpu sp, irq_stack_ptr, r1, r2
-
-	@
-	@ If we took the interrupt while running in the kernel, we may already
-	@ be using the IRQ stack, so revert to the original value in that case.
-	@
-	subs	r2, sp, r0		@ SP above bottom of IRQ stack?
-	rsbscs	r2, r2, #THREAD_SIZE	@ ... and below the top?
-	movcs	sp, r0
-
-	push	{r0, lr}		@ preserve LR and original SP
-
-	@ routine called with r0 = struct pt_regs *
-	bl	generic_handle_arch_irq
-
+	mov	r0, sp			@ regs
+	push	{r0, lr}		@ preserve LR with 8-byte stack alignment
+	bl	v7m_irq_handler
 	pop	{r0, lr}
-	mov	sp, r0
 
-	@
-	@ Check for any pending work if returning to user
-	@
-	ldr	r1, =BASEADDR_V7M_SCB
-	ldr	r0, [r1, V7M_SCB_ICSR]
-	tst	r0, V7M_SCB_ICSR_RETTOBASE
-	beq	2f
-
-	get_thread_info tsk
-	ldr	r2, [tsk, #TI_FLAGS]
-	movs	r2, r2, lsl #16
-	beq	2f			@ no work pending
-	mov	r0, #V7M_SCB_ICSR_PENDSVSET
-	str	r0, [r1, V7M_SCB_ICSR]	@ raise PendSV
-
-2:
 	@ registers r0-r3 and r12 are automatically restored on exception
 	@ return. r4-r7 were not clobbered in v7m_exception_entry so for
 	@ correctness they don't need to be restored. So only r8-r11 must be
@@ -87,18 +57,13 @@ ENDPROC(__irq_entry)
 __pendsv_entry:
 	v7m_exception_entry
 
-#ifdef CONFIG_RSEQ
-	bl	arm_rseq_user_enter
-#endif
-
-	ldr	r1, =BASEADDR_V7M_SCB
-	mov	r0, #V7M_SCB_ICSR_PENDSVCLR
-	str	r0, [r1, V7M_SCB_ICSR]	@ clear PendSV
+	mov	r0, sp			@ regs
+	bl	v7m_pendsv_handler
 
-	@ execute the pending work, including reschedule
-	get_thread_info tsk
-	mov	why, #0
-	b	v7m_ret_to_user_from_irq
+#ifdef CONFIG_KSTACK_ERASE
+	bl	stackleak_erase_on_task_stack
+#endif
+	restore_user_regs fast = 0, offset = 0
 ENDPROC(__pendsv_entry)
 
 /*
diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 42d9301bdf37..988555eaaf07 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -6,6 +6,9 @@
 #include <asm/entry.h>
 #include <asm/stacktrace.h>
 #include <asm/traps.h>
+#ifdef CONFIG_CPU_V7M
+#include <asm/v7m.h>
+#endif
 
 #include "irq.h"
 
@@ -59,3 +62,72 @@ noinstr void arm_fiq_handler(struct pt_regs *regs)
 
 	irqentry_nmi_exit(regs, state);
 }
+
+#ifdef CONFIG_CPU_V7M
+/*
+ * On V7M architecture, the execution priority cannot be lowered without an
+ * exception return. Therefore, an IRQ handler cannot directly perform a
+ * context switch. To fit generic IRQ entry into this hardware constraint:
+ *
+ * - IRQ from user mode: if exit work is pending, defer the exit to the PendSV
+ *   handler. PendSV has the kernel's priority (that of SVCall), below all
+ *   IRQs, so the PendSV handler runs after all pending IRQs. Otherwise exit to
+ *   user mode directly.
+ * - IRQ from kernel mode: exit directly with rescheduling suppressed using
+ *   arch_irqentry_exit_need_resched(). PendSV cannot preempt the kernel, so a
+ *   reschedule cannot be deferred to the PendSV handler.
+ * - IRQ taken while an exit to user mode is deferred (i.e., while PendSV is
+ *   pending): handle it as an IRQ from kernel mode. This IRQ is logically
+ *   nested from an irqentry_{enter,exit}() perspective (see
+ *   Documentation/core-api/entry.rst), even if its stacked frame is the user
+ *   frame (tail-chaining, or late arrival).
+ */
+noinstr void v7m_irq_handler(struct pt_regs *regs)
+{
+	if (!user_mode(regs) || (readl_relaxed(BASEADDR_V7M_SCB + V7M_SCB_ICSR) &
+				V7M_SCB_ICSR_PENDSVSET)) {
+		/* IRQ from kernel mode, or IRQ taken while PendSV is pending */
+		irqentry_state_t state = irqentry_enter_from_kernel_mode(regs);
+
+		if (on_thread_stack())
+			call_on_irq_stack(handle_arm_irq, regs);
+		else
+			handle_arm_irq(regs);
+
+		/* arch_irqentry_exit_need_resched() prevents rescheduling here */
+		irqentry_exit_to_kernel_mode(regs, state);
+	} else {
+		irqentry_enter_from_user_mode(regs);
+
+		call_on_irq_stack(handle_arm_irq, regs);
+
+		/*
+		 * Check TIF bits in 0..15 to judge whether exit work will be
+		 * triggered, as tested in ret_fast_syscall.
+		 */
+		if (read_thread_flags() & GENMASK(15, 0)) {
+			/*
+			 * Raise PendSV exception to defer the exit to user
+			 * mode to the PendSV handler.
+			 */
+			writel_relaxed(V7M_SCB_ICSR_PENDSVSET, BASEADDR_V7M_SCB +
+					V7M_SCB_ICSR);
+		} else {
+			/*
+			 * Fast path: Directly perform exit in the IRQ handler.
+			 * Safe because work won't be triggered.
+			 */
+			irqentry_exit_to_user_mode(regs);
+		}
+	}
+}
+
+noinstr void v7m_pendsv_handler(struct pt_regs *regs)
+{
+	/* Clear PendSV pending state */
+	writel_relaxed(V7M_SCB_ICSR_PENDSVCLR, BASEADDR_V7M_SCB + V7M_SCB_ICSR);
+
+	/* Call exit and perform the deferred exit work */
+	irqentry_exit_to_user_mode(regs);
+}
+#endif

-- 
2.56.1


