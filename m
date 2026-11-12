Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800AE606A323
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NRXDxkkR;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nznMH5uZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5KNC9xbBKkv7J0PFlvOKPiSOBMI6XfSbXSwklQGpAao=; b=NRXDxkkR34TI3sBpURpfEo/e6Y
	3Qbnq1xNLlMdwayVq6jsoPPEFBKjvqfeGz+MNpGcKRWyuvlGcyEvIA78SSo3TkdURH1TvfRafK3jF
	m3QMMpk0w1VVrnWs+maQJlSQT4W1Bxby7jq6UiNaYe+lHrJAJxgq8xbqjMc2a1Uf6nsWxT7wGOYHO
	GXdO88+n2BrNERxUCRV8U5tgtf6C55MGwTRVYSqnluZqFZImTXckgpq50eg/kXzPLQDtLCGfkui2j
	UFJS6DjDgyJiDk0EGjb8TQxfHR1Zdp4Z6Vt80eyboUxNq0Oa4nwl+ymVnIywZggcDs7VctGUnPsyR
	se23MApw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkO-0000000A0Us-1UKU;
	Thu, 12 Nov 2026 13:21:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkK-0000000A0T9-1mlW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:21:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D8831576;
	Thu, 12 Nov 2026 05:21:40 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A6C0A3F632;
	Thu, 12 Nov 2026 05:21:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489703; bh=2p9tf5z6XCXtNImJ7LxnBNs5BFI+yv348SmTa6UhySw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nznMH5uZcXU9JtyclRwCDRLuhkq1wlS8iMSHv0lVUKS5s3UU71J0CJDMm267YtzUI
	 ic6ypNFXQtjgi0RaH26H0G/79v7MtDlo2VJUbuusMgjXqYEavinAmKhSNU0zA+1gPA
	 z8ZPcakGv5OJqr+E/DeiJLjzIaycftm/bxceDheA=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 02/39] arm64: irqflags: save and use both DAIF and PMR
Date: Thu, 12 Nov 2026 13:20:05 +0000
Message-Id: <20261112132042.129062-3-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052144_562325_7955ECB4 
X-CRM114-Status: GOOD (  18.16  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, lpieralisi@kernel.org, liaochang1@huawei.com, ashok.raj@oss.qualcomm.com, maz@kernel.org, will@kernel.org, ruanjinjie@huawei.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ada Couprie Diaz <ada.coupriediaz@arm.com>

With pseudo-NMIs enabled, both DAIF and the PMR affect interrupt masking.
Now that we have a type which can track both of them at the same time,
update our irqflags implementation to use it.

Save DAIF flags in all cases, as they can be manipulated directly by other
code, and the PMR if it is in use.

When checking if IRQs are disabled, now that we always save DAIF we
can check that the I flag is set and bypass checking the PMR if it is.
We can also properly check if PMR masks interrupts, now that we don't
need to rely on the GIC_PRIO_PSR_I_SET bit being set in the PMR to
know if DAIF is already masking interrupts.  Update
`irqs_priority_unmasked()` to align with this change.

This allows us to remove the `__daif_...` and `__pmr_...` versions
of the save and check functions, as they are now unified.

We can reasonably merge the two `__{daif,pmr}_irq_restore()` functions
in the main one, as the DAIF and PMR values are properly split now.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/irqflags.h | 118 +++++++-----------------------
 arch/arm64/include/asm/ptrace.h   |  18 +++--
 2 files changed, 38 insertions(+), 98 deletions(-)

diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index 5c17e26727f9..9f5c774cbe68 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -97,135 +97,69 @@ static __always_inline void arch_local_irq_disable(void)
 	}
 }
 
-static __always_inline unsigned long __daif_local_save_flags(void)
-{
-	arm64_exc_hwstate_t hwstate = { .daif = read_sysreg(daif) };
-
-	return hwstate.flags;
-}
-
-static __always_inline unsigned long __pmr_local_save_flags(void)
-{
-	arm64_exc_hwstate_t hwstate = { .pmr = read_sysreg_s(SYS_ICC_PMR_EL1) };
-
-	return hwstate.flags;
-}
-
 /*
  * Save the current interrupt enable state.
  */
 static __always_inline unsigned long arch_local_save_flags(void)
 {
-	if (system_uses_irq_prio_masking()) {
-		return __pmr_local_save_flags();
-	} else {
-		return __daif_local_save_flags();
-	}
-}
+	arm64_exc_hwstate_t hwstate = { .daif = read_sysreg(daif) };
 
-static __always_inline bool __daif_irqs_disabled_flags(unsigned long flags)
-{
-	arm64_exc_hwstate_t hwstate = { .flags = flags };
+	if (system_uses_irq_prio_masking())
+		hwstate.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
 
-	return hwstate.daif & PSR_I_BIT;
+	return hwstate.flags;
 }
 
-static __always_inline bool __pmr_irqs_disabled_flags(unsigned long flags)
+static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
 {
 	arm64_exc_hwstate_t hwstate = { .flags = flags };
 
-	return hwstate.pmr != GIC_PRIO_IRQON;
-}
+	if (hwstate.daif & PSR_I_BIT)
+		return true;
 
-static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
-{
 	if (system_uses_irq_prio_masking()) {
-		return __pmr_irqs_disabled_flags(flags);
-	} else {
-		return __daif_irqs_disabled_flags(flags);
-	}
-}
+		WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_IRQFLAGS) &&
+			     hwstate.pmr != GIC_PRIO_IRQOFF &&
+			     hwstate.pmr != GIC_PRIO_IRQON);
 
-static __always_inline bool __daif_irqs_disabled(void)
-{
-	return __daif_irqs_disabled_flags(__daif_local_save_flags());
-}
+		return hwstate.pmr != GIC_PRIO_IRQON;
+	}
 
-static __always_inline bool __pmr_irqs_disabled(void)
-{
-	return __pmr_irqs_disabled_flags(__pmr_local_save_flags());
+	return false;
 }
 
 static __always_inline bool arch_irqs_disabled(void)
 {
-	if (system_uses_irq_prio_masking()) {
-		return __pmr_irqs_disabled();
-	} else {
-		return __daif_irqs_disabled();
-	}
+	return arch_irqs_disabled_flags(arch_local_save_flags());
 }
 
-static __always_inline unsigned long __daif_local_irq_save(void)
-{
-	unsigned long flags = __daif_local_save_flags();
-
-	__daif_local_irq_disable();
-
-	return flags;
-}
-
-static __always_inline unsigned long __pmr_local_irq_save(void)
+static __always_inline unsigned long arch_local_irq_save(void)
 {
-	unsigned long flags = __pmr_local_save_flags();
+	unsigned long flags = arch_local_save_flags();
 
-	/*
-	 * There are too many states with IRQs disabled, just keep the current
-	 * state if interrupts are already disabled/masked.
-	 */
-	if (!__pmr_irqs_disabled_flags(flags))
+	if (system_uses_irq_prio_masking())
 		__pmr_local_irq_disable();
+	else
+		__daif_local_irq_disable();
 
 	return flags;
 }
 
-static __always_inline unsigned long arch_local_irq_save(void)
-{
-	if (system_uses_irq_prio_masking()) {
-		return __pmr_local_irq_save();
-	} else {
-		return __daif_local_irq_save();
-	}
-}
-
-static __always_inline void __daif_local_irq_restore(unsigned long flags)
-{
-	arm64_exc_hwstate_t hwstate = { .flags = flags };
-
-	barrier();
-	write_sysreg(hwstate.daif, daif);
-	barrier();
-}
-
-static __always_inline void __pmr_local_irq_restore(unsigned long flags)
-{
-	arm64_exc_hwstate_t hwstate = { .flags = flags };
-
-	barrier();
-	write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
-	pmr_sync();
-	barrier();
-}
-
 /*
  * restore saved IRQ state
  */
 static __always_inline void arch_local_irq_restore(unsigned long flags)
 {
+	arm64_exc_hwstate_t hwstate = { .flags = flags };
+
+	barrier();
 	if (system_uses_irq_prio_masking()) {
-		__pmr_local_irq_restore(flags);
+		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
+		pmr_sync();
 	} else {
-		__daif_local_irq_restore(flags);
+		write_sysreg(hwstate.daif, daif);
 	}
+	barrier();
 }
 
 #endif /* __ASM_IRQFLAGS_H */
diff --git a/arch/arm64/include/asm/ptrace.h b/arch/arm64/include/asm/ptrace.h
index ad0ad30b36cd..7d7b54308b90 100644
--- a/arch/arm64/include/asm/ptrace.h
+++ b/arch/arm64/include/asm/ptrace.h
@@ -228,14 +228,20 @@ static inline void forget_syscall(struct pt_regs *regs)
 #define processor_mode(regs) \
 	((regs)->pstate & PSR_MODE_MASK)
 
-#define irqs_priority_unmasked(regs)					\
-	(system_uses_irq_prio_masking() ?				\
-		(regs)->pmr == GIC_PRIO_IRQON :				\
-		true)
-
 static __always_inline bool regs_irqs_disabled(const struct pt_regs *regs)
 {
-	return (regs->pstate & PSR_I_BIT) || !irqs_priority_unmasked(regs);
+	if (regs->pstate & PSR_I_BIT)
+		return true;
+
+	if (system_uses_irq_prio_masking()) {
+		WARN_ON_ONCE(IS_ENABLED(CONFIG_DEBUG_IRQFLAGS) &&
+			     regs->pmr != GIC_PRIO_IRQOFF &&
+			     regs->pmr != GIC_PRIO_IRQON);
+
+		return regs->pmr != GIC_PRIO_IRQON;
+	}
+
+	return false;
 }
 
 #define interrupts_enabled(regs)	(!regs_irqs_disabled(regs))
-- 
2.34.1


