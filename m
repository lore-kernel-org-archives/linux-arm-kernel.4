Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E873606A335
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wZevpxoa;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=FbIXbQaN;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TNAWguNW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zpkqKzivATdhlVa5+SWh6UdmScc70Qt50btXoZsriAY=; b=wZevpxoatE2EJ7u+6j4HpOgvbD
	PG4dUUnd4z4dlfR62DXYIoMlH3OvU1gZTu12U+WM3Fte1v/1GOq92Z1Ytjb9c9oPRC/JoKfsA9XxR
	29nx04OfgEZIUvWcj2nv3GCSh1ny/EEj41g5v4CkkytUQl6Mbf/XScF2T6gkKL2J1o+T6a+huG/PX
	InlR7YJ5A8k1Wx0vB6NAdRS1AcT/bICAZqJVPbDuSQG15yoz9Fq9xUq5ra435G8Yncnc3HepAHseF
	JIraEXrW9TBEmiy7+LZspHtuZux4Fzkcq5EOtpCvFlO1ibsHl4THBrGekQV1Z+10PgB1MbmWAcVaF
	L+IGyQCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlk-0000000A1iH-3LAM;
	Thu, 12 Nov 2026 13:23:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUl8-0000000A1BB-3gfO
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Nov 2026 13:22:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zpkqKzivATdhlVa5+SWh6UdmScc70Qt50btXoZsriAY=; b=FbIXbQaNaDYQVKF91mjrwCgRO1
	xxfgQjCMHTTWjw55LGqkLerWZVLSdyumioauCiAjefhJ+mzpa1YzM66KBgAr9DswY3qEa1xBZc6O+
	pB1Hg25J4uONb5z6+cYFsNNgcQbG6tui28jzXe0PpYmQb0ghv6aHntCQZ5q58yPyX4Uv/uOzApkHe
	7rs0mfuG8loEw6SQRFCXY2NWN6ucGQw96s9HqC/2KHM2f1aySCozslHV6L+Sbjm8epzKST8BgM0Uu
	BejkEGfier+WVJMtgpAdUIChz9MfPfn7o/UsU8/g27zSfdP0X6wCMp4RonTFeQ8V+F6qmt/rXefbe
	YASAzidw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUl6-0000000AMne-0drK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06D801A9A;
	Thu, 12 Nov 2026 05:22:28 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 66C683F632;
	Thu, 12 Nov 2026 05:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489751; bh=3JsOE7ixq6VkZFJs7m/fsOJYKDMfKDcF2vNER5ueVxU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TNAWguNW2mHDLP1t1KrvycwzxTO7s6KUL2SQbZkuIXZV8j2S5jHjEvw4oxwpJUI+S
	 T6nrU2x8qy+sPgkgiaIhJgQoTSdqBiMvN+fj1zkxMV7Qceua0OUlAPHF2BQjplA0SW
	 3eoeeltvvn4xFZsIXN57b6D41K36+QuYM9I7tnJM=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 26/39] arm64: nmi: Add handling of superpriority interrupts as NMIs
Date: Thu, 12 Nov 2026 13:20:29 +0000
Message-Id: <20261112132042.129062-27-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_132232_371109_E8345226 
X-CRM114-Status: GOOD (  20.28  )
X-Spam-Score: -2.5 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, lpieralisi@kernel.org, liaochang1@huawei.com, ashok.raj@oss.qualcomm.com, Mark Brown <broonie@kernel.org>, maz@kernel.org, will@kernel.org, ruanjinjie@huawei.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Mark Brown <broonie@kernel.org>

Our goal with superpriority interrupts is to use them as NMIs, taking
advantage of the much smaller regions where they are masked to allow
prompt handling of the most time-critical interrupts.

When an interrupt is configured with superpriority, we enter EL1 as we
do for any other interrupt. The presence of a superpriority interrupt
is indicated by a status bit in ISR_EL1. We check this bit before
unmasking interrupts in elX_interrupt(), and if a superpriority
interrupt is pending, we handle it as an NMI. Otherwise, normal
interrupts are handled as usual.

Since superpriority interrupts are always handled as NMIs, the
interrupt controller can rely on in_nmi() to distinguish them from
ordinary interrupts.

Enable IPIs to use superpriority interrupts as NMIs, matching the
existing pseudo-NMI behaviour.

Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/entry-common.h |  7 +++
 arch/arm64/kernel/entry-common.c      | 83 +++++++++++++++++++++++----
 arch/arm64/kernel/smp.c               |  2 +-
 3 files changed, 79 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
index 73d82a8d8e95..078b9a6456d0 100644
--- a/arch/arm64/include/asm/entry-common.h
+++ b/arch/arm64/include/asm/entry-common.h
@@ -37,6 +37,13 @@ static inline bool arch_irqentry_exit_need_resched(void)
 	if (system_uses_irq_prio_masking() && read_sysreg(daif))
 		return false;
 
+	/*
+	 * If AllInt is set then we must have handled an NMI, so skip
+	 * preemption
+	 */
+	if (system_uses_nmi() && (read_sysreg_s(SYS_ALLINT) & ALLINT_ALLINT))
+		return false;
+
 	/*
 	 * Preempting a task from an IRQ means we leave copies of PSTATE
 	 * on the stack. cpufeature's enable calls may modify PSTATE, but
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index ec7edb8790d5..1a2119f8ac11 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -33,6 +33,14 @@
 #include <asm/system_misc.h>
 #include <asm/vectors.h>
 
+static __always_inline bool is_nmi(void)
+{
+	if (!system_uses_nmi())
+		return false;
+
+	return !!(read_sysreg(isr_el1) & ISR_EL1_IS);
+}
+
 /*
  * Where the context being returned to had an active percpu GPR critical
  * section, ensure that the offset and address GPRs are updated to match the
@@ -564,8 +572,8 @@ asmlinkage void noinstr el1h_64_sync_handler(struct pt_regs *regs)
 	arm64_debug_exc_context(CRITICAL_CONTEXT);
 }
 
-static __always_inline void __el1_pnmi(struct pt_regs *regs,
-				       void (*handler)(struct pt_regs *))
+static __always_inline void __el1_nmi(struct pt_regs *regs,
+				      void (*handler)(struct pt_regs *))
 {
 	arm64_exc_hwstate_t hwstate;
 	irqentry_state_t state;
@@ -584,7 +592,23 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 
 	state = arm64_enter_from_kernel_mode(regs);
 
-	arm64_unmask_exc_context(NONMI_CONTEXT);
+	/*
+	 * For non-NMI systems, we can switch to NOIRQ context since
+	 * NMIs cannot occur.
+	 *
+	 * For pseudo-NMI, we must keep NONMI context until we can
+	 * determine the interrupt priority, which is done by the IRQ
+	 * handler.
+	 *
+	 * For FEAT_NMI, we already know the interrupt is an IRQ, so we
+	 * can switch to NOIRQ context immediately. NMIs do not
+	 * interfere because they follow a separate handling path and do
+	 * not share the IRQ handling state.
+	 */
+	if (system_uses_irq_prio_masking())
+		arm64_unmask_exc_context(NONMI_CONTEXT);
+	else
+		arm64_unmask_exc_context(NOIRQ_CONTEXT);
 
 	irq_enter_rcu();
 	do_interrupt_handler(regs, handler);
@@ -604,8 +628,9 @@ static __always_inline void __el1_irq(struct pt_regs *regs,
 static void noinstr el1_interrupt(struct pt_regs *regs,
 				  void (*handler)(struct pt_regs *))
 {
-	if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && regs_irqs_disabled(regs))
-		__el1_pnmi(regs, handler);
+	/* Is there a NMI to handle? */
+	if (regs_irqs_disabled(regs) || is_nmi())
+		__el1_nmi(regs, handler);
 	else
 		__el1_irq(regs, handler);
 
@@ -619,6 +644,8 @@ asmlinkage void noinstr el1h_64_irq_handler(struct pt_regs *regs)
 
 asmlinkage void noinstr el1h_64_fiq_handler(struct pt_regs *regs)
 {
+	WARN_ON_ONCE(system_uses_nmi() && (read_sysreg(isr_el1) & ISR_EL1_FS));
+
 	el1_interrupt(regs, handle_arch_fiq);
 }
 
@@ -942,20 +969,36 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 	arm64_debug_exc_context(CRITICAL_CONTEXT);
 }
 
-static void noinstr el0_interrupt(struct pt_regs *regs,
-				  void (*handler)(struct pt_regs *))
+static __always_inline void __el0_nmi(struct pt_regs *regs,
+				      void (*handler)(struct pt_regs *))
 {
-	arm64_enter_from_user_mode(regs);
+	irqentry_state_t state;
+	arm64_exc_hwstate_t hwstate;
 
-	arm64_unmask_exc_context(NONMI_CONTEXT);
+	state = irqentry_nmi_enter(regs);
+	hwstate = arm64_unmask_exc_context(NONMI_CONTEXT);
+	do_interrupt_handler(regs, handler);
+	arm64_mask_exc_context(hwstate);
+	irqentry_nmi_exit(regs, state);
+}
 
-	if (regs->pc & BIT(55))
-		arm64_apply_bp_hardening();
+static __always_inline void __el0_irq(struct pt_regs *regs,
+				      void (*handler)(struct pt_regs *))
+{
+	arm64_enter_from_user_mode(regs);
+	/*
+	 * For the same reason as in el1_irq() keep NONMI
+	 * context for pesudo-NMI, and switch to NOIRQ
+	 * otherwise
+	 */
+	if (system_uses_irq_prio_masking())
+		arm64_unmask_exc_context(NONMI_CONTEXT);
+	else
+		arm64_unmask_exc_context(NOIRQ_CONTEXT);
 
 	irq_enter_rcu();
 	do_interrupt_handler(regs, handler);
 	irq_exit_rcu();
-
 	/*
 	 * For the same reason as in el1_irq() we effectivly
 	 * have NOIRQ_CONTEXT on return from handler - keep
@@ -963,6 +1006,20 @@ static void noinstr el0_interrupt(struct pt_regs *regs,
 	 */
 	arm64_debug_exc_context(NOIRQ_CONTEXT);
 	arm64_exit_to_user_mode(regs, arm64_exc_hwstate_of_context(NOIRQ_CONTEXT));
+}
+
+static void noinstr el0_interrupt(struct pt_regs *regs,
+				  void (*handler)(struct pt_regs *))
+{
+	if (regs->pc & BIT(55))
+		arm64_apply_bp_hardening();
+
+	/* Is there a NMI to handle? */
+	if (is_nmi())
+		__el0_nmi(regs, handler);
+	else
+		__el0_irq(regs, handler);
+
 	arm64_debug_exc_context(CRITICAL_CONTEXT);
 }
 
@@ -978,6 +1035,8 @@ asmlinkage void noinstr el0t_64_irq_handler(struct pt_regs *regs)
 
 static void noinstr __el0_fiq_handler_common(struct pt_regs *regs)
 {
+	WARN_ON_ONCE(system_uses_nmi() && (read_sysreg(isr_el1) & ISR_EL1_FS));
+
 	el0_interrupt(regs, handle_arch_fiq);
 }
 
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index cb04f2c37d9a..22274d775990 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -1061,7 +1061,7 @@ static void smp_cross_call(const struct cpumask *target, unsigned int ipinr)
 
 static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
 {
-	if (!system_uses_irq_prio_masking())
+	if (!system_uses_nmi() && !system_uses_irq_prio_masking())
 		return false;
 
 	switch (ipi) {
-- 
2.34.1


