Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C34606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fbZzSSC6;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=o0ITA9qB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tf+OjZO0dLc11/FV+MpROZz8wcvyV16a4SGjylljndk=; b=fbZzSSC6/5Q5IG8GYIabjE6Id1
	Vn0OMy8SLfk+BuTidrXxfH5FQjBTclDeaKUKoXwygAPreg8om8KUzBGUL1TBT7S0NezPv3T3MUXzo
	pnY3TQ4tGdiLEx9eEIeeyHLmw+1PasaM4taCAVTVs73U5ytICmYW2WlJvUFAhJSkA6uSlcUbFgaMk
	WBQWPoRaPWpwHTnBPIm2/3aJ702hWtxaybvTHGSLXspkIafF+WXUY9DK+65CerovP4JVixf0tDsr3
	QLUP63wiCkx2qEE0FBhb+8sYclnjS1+DJHbDS1w50ACLsURKsrmeTO/zwavUpa+qWAnnfhlhdyX3N
	LbfMjTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUmB-0000000A2Hx-0DrK;
	Thu, 12 Nov 2026 13:23:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUl1-0000000A18i-3KB0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BB6F1576;
	Thu, 12 Nov 2026 05:22:24 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A0BFF3F632;
	Thu, 12 Nov 2026 05:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489747; bh=Qudt0s3fXTfFTLoi6s2Aiem8yEbfyJ1rt4ZhJUiZ+h8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o0ITA9qBt05opLvte3Ck6XKOKIEUGHsK3yCBYABiAjbp+zNM9z5iPCe3OI06dP6Fa
	 BWbLG2aCpCgYmCs4cuhU72ndjMTop4/7aEtS7t1REYu3DDoLKbisWtINutUXqVcLk9
	 ulxbBWfdQ3rlQ85n1c2s2G8+/CQWuF6Ckm0nvotA=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 24/39] arm64: nmi: Manage masking for superpriority interrupts
Date: Thu, 12 Nov 2026 13:20:27 +0000
Message-Id: <20261112132042.129062-25-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052232_381000_73B9DAE7 
X-CRM114-Status: GOOD (  19.13  )
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
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, lpieralisi@kernel.org, liaochang1@huawei.com, ashok.raj@oss.qualcomm.com, Mark Brown <broonie@kernel.org>, maz@kernel.org, will@kernel.org, ruanjinjie@huawei.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ada Couprie Diaz <ada.coupriediaz@arm.com>

Extend logic to handle and debug exception context/state with knowlage
of FEAT_NMI.

Take care to order writes to ALLINT relative to DAIF, as clearing
ALLINT before DAIF could result in taking an NMI while DAIF is fully
masked, as could setting it after DAIF.

Since superpriority interrupts are not masked through DAIF like pseduo
NMIs are, we also need to modify the assembler macros for managing
DAIF to ensure that the masking is done in the assembly code.

Note that save_and_disable_irq/restore_irq and
save_and_disable_daif/restore_irq pairs are used in distinct
contextes:

- former is used in context of SW PAN to quickly disable/enable
  preemption

- latter is used to completely mask all exceptions.

For that reason split save_and_disable_daif/restore_irq into more
generic exception save restore pair and plumb with FEAT_NMI logic.

Co-developed-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/assembler.h            | 20 +++++++++--
 .../include/asm/interrupts/common_flags.h     | 35 +++++++++++++++++++
 arch/arm64/include/asm/interrupts/entry.h     |  6 ++--
 arch/arm64/include/asm/interrupts/masking.h   |  3 +-
 arch/arm64/include/asm/irqflags.h             |  3 +-
 arch/arm64/kernel/entry.S                     | 12 +++----
 6 files changed, 67 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index 020670814bda..68f700014304 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -37,11 +37,27 @@
 /*
  * Save/restore interrupts.
  */
-	.macro save_and_disable_daif, flags
-	mrs	\flags, daif
+	.macro save_and_disable_exceptions, flags, tmp
+	mrs     \flags, daif		// updates flags[9:6] with DAIF
+#ifdef CONFIG_ARM64_NMI
+alternative_if ARM64_NMI
+	mrs_s	\tmp, SYS_ALLINT	// updates tmp[13] with AllInt
+	msr_s	SYS_ALLINT_SET, xzr
+	orr	\flags, \flags, \tmp	// now flags[13,9:6] carry pair of AllInt,DAIF
+alternative_else_nop_endif
+#endif
 	msr	daifset, #0xf
 	.endm
 
+	.macro  restore_exceptions, flags
+	msr     daif, \flags		// bits other than flags[9:6] are ignored
+#ifdef CONFIG_ARM64_NMI
+alternative_if ARM64_NMI
+	msr_s	SYS_ALLINT, \flags	// bits other than flags[13] are ignored
+alternative_else_nop_endif
+#endif
+	.endm
+
 	.macro	save_and_disable_irq, flags
 	mrs	\flags, daif
 	msr	daifset, #3
diff --git a/arch/arm64/include/asm/interrupts/common_flags.h b/arch/arm64/include/asm/interrupts/common_flags.h
index a4e53c51dfe8..1055cfc8a2c4 100644
--- a/arch/arm64/include/asm/interrupts/common_flags.h
+++ b/arch/arm64/include/asm/interrupts/common_flags.h
@@ -20,6 +20,14 @@
 /*
  * Exception context mapping
  *
+ * FEAT_NMI
+ *
+ * CRITICAL -> DAIF + AllInt (corresponds to the state on exception entry)
+ * ERROR    ->  AIF + AllInt
+ * NONMI    ->   IF + AllInt
+ * NOIRQ    ->   IF
+ * PROCESS  ->    0
+ *
  * pseudo-NMI
  *
  * CRITICAL -> DAIF + IRQON  (corresponds to the state on exception entry)
@@ -84,6 +92,9 @@ arm64_exc_hwstate_t __arm64_exc_hwstate_of_nonmi_context(void)
 	if (system_uses_irq_prio_masking())
 		return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ, .pmr=GIC_PRIO_IRQON};
 
+	if (system_uses_nmi())
+               return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ, .allint=ALLINT_ALLINT};
+
 	return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ};
 }
 
@@ -93,6 +104,9 @@ arm64_exc_hwstate_t __arm64_exc_hwstate_of_error_context(void)
 	if (system_uses_irq_prio_masking())
 		return (arm64_exc_hwstate_t){.daif=DAIF_ERRCTX, .pmr=GIC_PRIO_IRQON};
 
+	if (system_uses_nmi())
+		return (arm64_exc_hwstate_t){.daif=DAIF_ERRCTX, .allint=ALLINT_ALLINT};
+
 	return (arm64_exc_hwstate_t){.daif=DAIF_ERRCTX};
 }
 
@@ -102,6 +116,9 @@ arm64_exc_hwstate_t __arm64_exc_hwstate_of_critical_context(void)
 	if (system_uses_irq_prio_masking())
 		return (arm64_exc_hwstate_t){.daif=DAIF_MASK, .pmr=GIC_PRIO_IRQON};
 
+	if (system_uses_nmi())
+		return (arm64_exc_hwstate_t){.daif=DAIF_MASK, .allint=ALLINT_ALLINT};
+
 	return (arm64_exc_hwstate_t){.daif=DAIF_MASK};
 }
 
@@ -131,6 +148,9 @@ arm64_exc_hwstate_t arm64_exc_hwstate_of_regs(struct pt_regs *regs)
 	if (system_uses_irq_prio_masking())
 		state.pmr = regs->pmr;
 
+	if (system_uses_nmi())
+		state.allint = regs->pstate & PSR_ALLINT_BIT;
+
 	return state;
 }
 
@@ -150,6 +170,9 @@ void arm64_debug_exc_hwstate(arm64_exc_hwstate_t expected)
 	if (system_uses_irq_prio_masking()) {
 		WARN_ONCE(1, "Unexpected DAIF+PMR: 0x%x + 0x%x (expected 0x%x + 0x%x)\n",
 			  actual.daif, actual.pmr, expected.daif, expected.pmr);
+	} else if (system_uses_nmi()) {
+		WARN_ONCE(1, "Unexpected DAIF+ALLINT: 0x%x + 0x%x (expected 0x%x + 0x%x)\n",
+			  actual.daif, actual.allint, expected.daif, expected.allint);
 	} else {
 		WARN_ONCE(1, "Unexpected DAIF: 0x%x (expected 0x%x)\n",
 			  actual.daif, expected.daif);
@@ -168,6 +191,7 @@ static __always_inline
 void __arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool force)
 {
 	bool pseudo_nmi = system_uses_irq_prio_masking();
+	bool nmi = system_uses_nmi();
 
 	barrier();
 
@@ -194,8 +218,19 @@ void __arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool force)
 		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
 	}
 
+	/*
+	 * Try to order ALLINT writes to be consistent with the DAIF state :
+	 * we don't want to take an NMI with DAIF masked or when it should
+	 * be masked but isn't yet.
+	 */
+	if (nmi && (hwstate.allint & ALLINT_ALLINT) && force)
+		_allint_set();
+
 	write_sysreg(hwstate.daif, daif);
 
+	if (nmi && !(hwstate.allint & ALLINT_ALLINT) && force)
+		_allint_clear();
+
 	if (pseudo_nmi && hwstate.pmr == GIC_PRIO_IRQON && force) {
 		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
 		pmr_sync();
diff --git a/arch/arm64/include/asm/interrupts/entry.h b/arch/arm64/include/asm/interrupts/entry.h
index e34c198f4ac1..d30a14925af8 100644
--- a/arch/arm64/include/asm/interrupts/entry.h
+++ b/arch/arm64/include/asm/interrupts/entry.h
@@ -10,7 +10,6 @@
 #include <asm/cpufeature.h>
 #include <asm/interrupts/common_flags.h>
 
-
 static __always_inline
 arm64_exc_hwstate_t __arm64_switch_exc_hwstate_to(arm64_exc_hwstate_t prev,
 						  arm64_exc_hwstate_t next)
@@ -26,7 +25,8 @@ arm64_exc_hwstate_t __arm64_switch_exc_hwstate_to(arm64_exc_hwstate_t prev,
 	if (!irqs_disabled)
 		trace_hardirqs_on();
 
-	force = system_uses_irq_prio_masking() && prev.pmr != next.pmr;
+	force = (system_uses_irq_prio_masking() && prev.pmr != next.pmr) ||
+		(system_uses_nmi() && prev.allint != next.allint);
 
 	__arm64_update_exc_hwstate(next, force);
 
@@ -58,6 +58,7 @@ arm64_exc_hwstate_t arm64_drop_exc_context(arm64_exc_hwstate_t prev, arm64_exc_c
 			 * GIC_PRIO_IRQON is larger that GIC_PRIO_IRQOFF so larger PMR value is weaker
 			 */
 			WARN_ON_ONCE(system_uses_irq_prio_masking() && prev.pmr > next.pmr);
+			WARN_ON_ONCE(system_uses_nmi() && prev.allint < next.allint);
 		}
 	}
 
@@ -77,6 +78,7 @@ arm64_exc_hwstate_t arm64_lift_exc_context(arm64_exc_hwstate_t prev, arm64_exc_c
 			 * GIC_PRIO_IRQON is larger that GIC_PRIO_IRQOFF so smaller PMR value is stronger
 			 */
 			WARN_ON_ONCE(system_uses_irq_prio_masking() && prev.pmr < next.pmr);
+			WARN_ON_ONCE(system_uses_nmi() && prev.allint > next.allint);
 		}
 	}
 
diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
index 8729922974b0..6c5ca5befbc1 100644
--- a/arch/arm64/include/asm/interrupts/masking.h
+++ b/arch/arm64/include/asm/interrupts/masking.h
@@ -30,7 +30,8 @@ arm64_exc_hwstates_t local_exceptions_save_mask(arm64_exc_context_t new)
 	 * We've just got actual HW state so we can rely on that to
 	 * optimize some unnecessary updates.
 	 */
-	force = system_uses_irq_prio_masking() && actual.pmr != state.pmr;
+	force = (system_uses_irq_prio_masking() && actual.pmr != state.pmr) ||
+		(system_uses_nmi() && actual.allint != state.allint);
 
 	if (!irqs_disabled)
 		trace_hardirqs_on();
diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index eedbdf7358e6..31b8f4e99532 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -31,9 +31,10 @@
 typedef union arm64_exc_hwstate {
 	struct {
 		u16 daif;
+		u16 allint;
 		u8 pmr;
 		u8 __pad0;
-		u32 __pad1;
+		u16 __pad1;
 	};
 	unsigned long flags;
 } arm64_exc_hwstate_t;
diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
index 024b740512b0..405ef84d14c7 100644
--- a/arch/arm64/kernel/entry.S
+++ b/arch/arm64/kernel/entry.S
@@ -831,7 +831,7 @@ SYM_CODE_END(__bp_harden_el1_vectors)
  *
  */
 SYM_FUNC_START(cpu_switch_to)
-	save_and_disable_daif x11
+	save_and_disable_exceptions x11, x12
 	mov	x10, #THREAD_CPU_CONTEXT
 	add	x8, x0, x10
 	mov	x9, sp
@@ -855,7 +855,7 @@ SYM_FUNC_START(cpu_switch_to)
 	ptrauth_keys_install_kernel x1, x8, x9, x10
 	scs_save x0
 	scs_load_current
-	restore_irq x11
+	restore_exceptions x11
 	ret
 SYM_FUNC_END(cpu_switch_to)
 NOKPROBE(cpu_switch_to)
@@ -882,7 +882,7 @@ NOKPROBE(ret_from_fork)
  * Calls func(regs) using this CPU's irq stack and shadow irq stack.
  */
 SYM_FUNC_START(call_on_irq_stack)
-	save_and_disable_daif x9
+	save_and_disable_exceptions x9, x10
 #ifdef CONFIG_SHADOW_CALL_STACK
 	get_current_task x16
 	scs_save x16
@@ -897,10 +897,10 @@ SYM_FUNC_START(call_on_irq_stack)
 
 	/* Move to the new stack and call the function there */
 	add	sp, x16, #IRQ_STACK_SIZE
-	restore_irq x9
+	restore_exceptions x9
 	blr	x1
 
-	save_and_disable_daif x9
+	save_and_disable_exceptions x9, x10
 	/*
 	 * Restore the SP from the FP, and restore the FP and LR from the frame
 	 * record.
@@ -908,7 +908,7 @@ SYM_FUNC_START(call_on_irq_stack)
 	mov	sp, x29
 	ldp	x29, x30, [sp], #16
 	scs_load_current
-	restore_irq x9
+	restore_exceptions x9
 	ret
 SYM_FUNC_END(call_on_irq_stack)
 NOKPROBE(call_on_irq_stack)
-- 
2.34.1


