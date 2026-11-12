Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB05B606A327
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zYY3o/Kn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=sy9SVbQp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YY6AdVyYEHUrRZbQkcabiSKlcYykhSDKhhT9FhOqLHs=; b=zYY3o/Knn7D1ZefnTfwliI3uHS
	2pYVY82sTDMCLG4PI0GT1LQb7Fd9MeSVSQ8SljR+5zo4vc3jdvoHqJ4BzKVdBOvZlo0Nf1xqahH8c
	MKhDJMMay029+8sphzo8K2NyMEUYU924ILcDQ9VGvzk8c4z4dC0PDVUUKGcl5Pi+6gjmuuc5sNoqz
	YPnKPBbTgP7QrZan3pcR95ct1EYQEaHYNfVUTP+3vvR6xxMSmpfT03/S1OkuxXoZuKr38LnTJuWU3
	/wyFq6BkaZmG0Fx+B16CCvx8XaKBDd7MMSDhTgK7FNkjamDGUKCNu53Di+kaMP4ouB+uNyje3tpTQ
	ZLFmft5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkO-0000000A0Vf-29G7;
	Thu, 12 Nov 2026 13:21:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkM-0000000A0Tq-1mbP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:21:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 812D81477;
	Thu, 12 Nov 2026 05:21:42 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CD2573F632;
	Thu, 12 Nov 2026 05:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489705; bh=SuKweHIVlUUVtypHV02jlcIsQlxpoYzpxhDEer9o6Ug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sy9SVbQpblROqjvy3O0J4IVDY/O1RIhnFTSRuU+IYUBX08yr/6nnPnw1Yy7napuvJ
	 FqND3cEaf0C2ip2ggUTl+OvlJCpSki8V8Cotgzvjvs134Q4Sp8Qdj5Nw3UVqINvTAN
	 U6fnQ+N3ruc/aXLyGeqTaKybIAmjmg2ZNcOIHpSg=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 03/39] arm64: interrupts: Add common exception state helpers
Date: Thu, 12 Nov 2026 13:20:06 +0000
Message-Id: <20261112132042.129062-4-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052146_548692_C7DFBE1A 
X-CRM114-Status: GOOD (  17.75  )
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

The entry code and the rest of the kernel require different interrupt
masking APIs, but all need a common representation of the hardware
exception state.

Introduce exception contexts that map DAIF and PMR state to the
corresponding masking context. Provide helpers to translate between
exception contexts and hardware state and update the hardware state.

Updating PMR is unnecessary when a caller knows that its value has not
changed. Allow such callers to avoid the update, while providing a
force option for callers that cannot rely on the previous PMR state.

Entry specific and general purpose masking APIs will be built on these
helpers in subsequent patches.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Ashok Raj <ashok.raj@oss.qualcomm.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 .../include/asm/interrupts/common_flags.h     | 163 ++++++++++++++++++
 1 file changed, 163 insertions(+)
 create mode 100644 arch/arm64/include/asm/interrupts/common_flags.h

diff --git a/arch/arm64/include/asm/interrupts/common_flags.h b/arch/arm64/include/asm/interrupts/common_flags.h
new file mode 100644
index 000000000000..41364a4e9726
--- /dev/null
+++ b/arch/arm64/include/asm/interrupts/common_flags.h
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Arm Ltd.
+ */
+#ifndef __ASM_INTERRUPTS_COMMON_FLAGS_H
+#define __ASM_INTERRUPTS_COMMON_FLAGS_H
+
+#include <asm/arch_gicv3.h>
+#include <asm/bug.h>
+#include <asm/cpufeature.h>
+#include <asm/ptrace.h>
+#include <asm/sysreg.h>
+#include <asm/irqflags.h>
+
+#define DAIF_PROCCTX		0
+#define DAIF_PROCCTX_NOIRQ	(PSR_I_BIT | PSR_F_BIT)
+#define DAIF_ERRCTX		(PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
+#define DAIF_MASK		(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
+
+/*
+ * Exception context mapping
+ *
+ * pseudo-NMI
+ *
+ * CRITICAL -> DAIF + IRQON  (corresponds to the state on exception entry)
+ * ERROR    ->  AIF + IRQON
+ * NONMI    ->   IF + IRQON
+ * NOIRQ    ->    0 + IRQOFF
+ * PROCESS  ->    0 + IRQON
+ *
+ * Otherwise
+ *
+ * CRITICAL -> DAIF           (corresponds to the state on exception entry)
+ * ERROR    ->  AIF
+ * NONMI    ->   IF
+ * NOIRQ    ->   IF
+ * PROCESS  ->    0
+ */
+typedef enum arm64_exc_context {
+	PROCESS_CONTEXT,
+	NOIRQ_CONTEXT,
+	NONMI_CONTEXT,
+	ERROR_CONTEXT,
+	CRITICAL_CONTEXT,
+} arm64_exc_context_t;
+
+static __always_inline
+arm64_exc_hwstate_t __arm64_exc_hwstate_of_process_context(void)
+{
+	if (system_uses_irq_prio_masking())
+		return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX, .pmr=GIC_PRIO_IRQON};
+
+	return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX};
+}
+
+static __always_inline
+arm64_exc_hwstate_t __arm64_exc_hwstate_of_noirq_context(void)
+{
+	if (system_uses_irq_prio_masking())
+		return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX, .pmr=GIC_PRIO_IRQOFF};
+
+	return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ};
+}
+
+static __always_inline
+arm64_exc_hwstate_t __arm64_exc_hwstate_of_nonmi_context(void)
+{
+	if (system_uses_irq_prio_masking())
+		return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ, .pmr=GIC_PRIO_IRQON};
+
+	return (arm64_exc_hwstate_t){.daif=DAIF_PROCCTX_NOIRQ};
+}
+
+static __always_inline
+arm64_exc_hwstate_t __arm64_exc_hwstate_of_error_context(void)
+{
+	if (system_uses_irq_prio_masking())
+		return (arm64_exc_hwstate_t){.daif=DAIF_ERRCTX, .pmr=GIC_PRIO_IRQON};
+
+	return (arm64_exc_hwstate_t){.daif=DAIF_ERRCTX};
+}
+
+static __always_inline
+arm64_exc_hwstate_t __arm64_exc_hwstate_of_critical_context(void)
+{
+	if (system_uses_irq_prio_masking())
+		return (arm64_exc_hwstate_t){.daif=DAIF_MASK, .pmr=GIC_PRIO_IRQON};
+
+	return (arm64_exc_hwstate_t){.daif=DAIF_MASK};
+}
+
+static __always_inline
+arm64_exc_hwstate_t arm64_exc_hwstate_of_context(arm64_exc_context_t context) {
+	switch (context) {
+	case PROCESS_CONTEXT:
+		return __arm64_exc_hwstate_of_process_context();
+	case NOIRQ_CONTEXT:
+		return __arm64_exc_hwstate_of_noirq_context();
+	case NONMI_CONTEXT:
+		return __arm64_exc_hwstate_of_nonmi_context();
+	case ERROR_CONTEXT:
+		return __arm64_exc_hwstate_of_error_context();
+	case CRITICAL_CONTEXT:
+		return __arm64_exc_hwstate_of_critical_context();
+	default:
+		BUG();
+	}
+}
+
+static __always_inline
+void __arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate, bool force)
+{
+	bool pseudo_nmi = system_uses_irq_prio_masking();
+
+	barrier();
+
+	if (pseudo_nmi && hwstate.pmr == GIC_PRIO_IRQOFF && force) {
+		/*
+		 * There has been concern that the write to daif
+		 * might be reordered before this write to PMR.
+		 * From the ARM ARM DDI 0487D.a, section D1.7.1
+		 * "Accessing PSTATE fields":
+		 *   Writes to the PSTATE fields have side-effects on
+		 *   various aspects of the PE operation. All of these
+		 *   side-effects are guaranteed:
+		 *     - Not to be visible to earlier instructions in
+		 *       the execution stream.
+		 *     - To be visible to later instructions in the
+		 *       execution stream
+		 *
+		 * Also, writes to PMR are self-synchronizing, so no
+		 * interrupts with a lower priority than PMR is signaled
+		 * to the PE after the write.
+		 *
+		 * So we don't need additional synchronization here.
+		 */
+		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
+	}
+
+	write_sysreg(hwstate.daif, daif);
+
+	if (pseudo_nmi && hwstate.pmr == GIC_PRIO_IRQON && force) {
+		write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
+		pmr_sync();
+	}
+
+	barrier();
+}
+
+static __always_inline
+void arm64_update_exc_hwstate(arm64_exc_hwstate_t hwstate)
+{
+	__arm64_update_exc_hwstate(hwstate, true);
+}
+
+static __always_inline
+void arm64_update_exc_context(arm64_exc_context_t context)
+{
+	arm64_exc_hwstate_t hwstate = arm64_exc_hwstate_of_context(context);
+
+	arm64_update_exc_hwstate(hwstate);
+}
+#endif /* __ASM_INTERRUPTS_COMMON_FLAGS_H */
-- 
2.34.1


