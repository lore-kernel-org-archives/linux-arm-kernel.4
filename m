Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6AE606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=njntZoeg;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ch3Pz62k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CLrIsZRtTjzHSEsp/GDAErbzyTMjAVQHOI1TU1puuA4=; b=njntZoegO2M5e2EDELBxY2V4J1
	S5MdE8H305icGy9t696qd2g1zhMNBFVHbcSegizejOfJohKRCAjJsBw1k6QNw2vhbDabMAQYOBurU
	Da+GkyBsYkgghPVltFdscVMkRDZQB/BGirco9inMoDA8syankXE95ijmifu7OUVRTz32NnfQvhrWQ
	GJmElkr0nMpP1LId/+RwSmMVWyhvMmvyEWhPHn2B2ewHS5IDBiG7p/Sj8ShXZ7N3Lui22a7FJLIJO
	0UDaP5RoVMNxscDDXj2GZgLlnuffO1OZsH+PtxpY9n+ry4oJIgg8MjVTlmi6yI1QcNoAbb3/prL43
	yshozMJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlN-0000000A1JX-1Xxj;
	Thu, 12 Nov 2026 13:22:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkZ-0000000A0fs-3J9X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2879C1576;
	Thu, 12 Nov 2026 05:21:56 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B97393FA7A;
	Thu, 12 Nov 2026 05:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489719; bh=cxHJnt2G7P92DGuwkQePmvNvonOfW1CGf1IgKqiRQ2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ch3Pz62kDgkFdt0e4cRTj5gSwJKuexFbpwTKeO4apvkJXn0FdTBxcUYwPMoe9XTma
	 pgs1XS0kLm4hr/h/3W5Hi3xBozodscJyee52lpQ8+8pUu9C+XO+yiGZRZZxqUXEL6/
	 ericGxiSmAv7/yQZmmjcMlmoHWEof3Phfhj/EuN4=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 10/39] arm64: cpuidle: use new helpers to bypass interrupt priority masking
Date: Thu, 12 Nov 2026 13:20:13 +0000
Message-Id: <20261112132042.129062-11-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052159_949567_2C661D40 
X-CRM114-Status: GOOD (  17.33  )
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

When the CPU goes into WFI and pseudo-NMIs are in use, we need to make
sure that interrupts are not masked by the PMR otherwise they would not
reach the CPU and wake it up.

Now that we have a proper API that handles both DAIF and PMR, extend it
to provide helpers allowing to temporarily switch to masking interrupts
via DAIF only when interrupt priorities are in use.
This could allow other parts of the code to make use of it and makes it
easier to check for proper use.

Replace the custom cpuidle helper with those new helpers.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/cpuidle.h            | 18 ++-----
 arch/arm64/include/asm/interrupts/masking.h | 54 +++++++++++++++++++++
 2 files changed, 58 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/cpuidle.h b/arch/arm64/include/asm/cpuidle.h
index 2047713e097d..b70ef5fd5e57 100644
--- a/arch/arm64/include/asm/cpuidle.h
+++ b/arch/arm64/include/asm/cpuidle.h
@@ -5,32 +5,22 @@
 #include <asm/proc-fns.h>
 
 #ifdef CONFIG_ARM64_PSEUDO_NMI
-#include <asm/arch_gicv3.h>
+#include <asm/interrupts/masking.h>
 
 struct arm_cpuidle_irq_context {
-	unsigned long pmr;
-	unsigned long daif_bits;
+	arm64_exc_hwstates_t arm64_context;
 };
 
 #define arm_cpuidle_save_irq_context(__c)				\
 	do {								\
 		struct arm_cpuidle_irq_context *c = __c;		\
-		if (system_uses_irq_prio_masking()) {			\
-			c->daif_bits = read_sysreg(daif);		\
-			write_sysreg(c->daif_bits | PSR_I_BIT | PSR_F_BIT, \
-				     daif);				\
-			c->pmr = gic_read_pmr();			\
-			gic_write_pmr(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET); \
-		}							\
+		c->arm64_context = local_exceptions_force_daif_save(); 	\
 	} while (0)
 
 #define arm_cpuidle_restore_irq_context(__c)				\
 	do {								\
 		struct arm_cpuidle_irq_context *c = __c;		\
-		if (system_uses_irq_prio_masking()) {			\
-			gic_write_pmr(c->pmr);				\
-			write_sysreg(c->daif_bits, daif);		\
-		}							\
+		local_exceptions_force_daif_restore(c->arm64_context);	\
 	} while (0)
 #else
 struct arm_cpuidle_irq_context { };
diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
index 9e589bf11ec8..8729922974b0 100644
--- a/arch/arm64/include/asm/interrupts/masking.h
+++ b/arch/arm64/include/asm/interrupts/masking.h
@@ -92,6 +92,60 @@ static inline void local_exceptions_final_mask(void)
 }
 #endif /* CONFIG_DEBUG_IRQFLAGS */
 
+/*
+ * In some cases, WFI or guest entry for example, we always want interrupts
+ * to reach the CPU even if masked. Masking via the PMR prevents them from
+ * reaching the CPU and waking it up.
+ * Force IRQ masking using DAIF by raising the priority mask
+ * and setting the IF flags.
+ *
+ * Should only be called when IRQs are already masked.
+ */
+static inline arm64_exc_hwstates_t local_exceptions_force_daif_save(void)
+{
+	arm64_exc_hwstates_t states = {};
+
+	if (!system_uses_irq_prio_masking())
+		return states;
+
+	/*
+	 * Cannot use lockdep_assert here as idle entry enables hardirqs
+	 * while keeping interrupts masked.
+	 */
+	WARN_ON_ONCE(!irqs_disabled());
+
+	states.saved.daif = read_sysreg(daif);
+	states.saved.pmr = read_sysreg_s(SYS_ICC_PMR_EL1);
+	states.expected.daif = states.saved.daif | DAIF_PROCCTX_NOIRQ;
+	states.expected.pmr = GIC_PRIO_IRQON;
+
+	arm64_update_exc_hwstate(states.expected);
+
+	return states;
+}
+
+/*
+ * Return to masking with the PMR, restoring previously saved DAIF and PMR.
+ *
+ * IRQs or interrupt priority masking should not have been re-enabled in between
+ * the save and restore.
+ */
+static inline
+void local_exceptions_force_daif_restore(arm64_exc_hwstates_t states)
+{
+	if (!system_uses_irq_prio_masking())
+		return;
+
+	/*
+	 * Cannot use lockdep_assert here as idle entry enables hardirqs
+	 * while keeping interrupts masked.
+	 */
+	WARN_ON_ONCE(!irqs_disabled());
+
+	arm64_debug_exc_hwstate(states.expected);
+	arm64_update_exc_hwstate(states.saved);
+}
+
 /*
  * During early boot, we unmask PSR.DA before the GIC has been set up.
  * If we use IRQ priority masking, the PMR and PSR will be out of sync
-- 
2.34.1


