Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE894606A331
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sDerh5+W;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jFUWVzkJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h9vMzC9w/zbba7TVcLvYw55opz1E82hkHSTc+Cplx0Y=; b=sDerh5+W8bK7Afm3Z5lPzHnq5T
	P4XdKDO+I68YLFh7/EPvuZaopuLiKIh2sTi9RyUqwFgZ65el772QBKJ5RPEvREj2faNA1fLkKfJqa
	Fnps1i1yf9naDRbkUq3jYFwliNPcqrvFaMm9cgCeBrS2CUdOoGA8j/Ac9N7sWR0dFCZU5M3vpfe32
	/afKHjozmudjCIRkS3Nv0jmkjVepe4viVNYfddHc2Lmp24QKCjOAiKGiyto3MNfMzzYi+l/Uwe84H
	14x7pWHLlegOc1CC5xlFnneR6P3bEmvZUjzktVjd1YPT7ZMf1j7GQJuO3tK41BpIV8ti8RPQYX9XV
	j4kNG+0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkd-0000000A0iD-1jkU;
	Thu, 12 Nov 2026 13:22:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkQ-0000000A0Xg-2UgQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:21:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6CE9A175A;
	Thu, 12 Nov 2026 05:21:46 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B66EA3F632;
	Thu, 12 Nov 2026 05:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489709; bh=oymps+UBnAKbCPteDPQ+3TPIQvKDBdtpV2T3pS6kgbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jFUWVzkJF0pS2I4Gd4CvjiI3ReTw/wDrPUX7kyKmcTTtIr9enriErkdQy6PbBZg4l
	 dqQc5Vl73in1b72Aq+430WbPHsAkTjdcC0V+O8xnlNx5y2hqqatpifyUIkHvnJyXSN
	 ymg4XFxCLYkkev/W9BsBXegKVn2EKJ7D2yc3yydE=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 05/39] arm64: entry: Introduce entry specific exception masking helpers
Date: Thu, 12 Nov 2026 13:20:08 +0000
Message-Id: <20261112132042.129062-6-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052151_524777_522C4E4A 
X-CRM114-Status: GOOD (  14.96  )
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

The entry code handles interrupt masking differently from the rest of
the kernel. Exception handlers enter and exit with all exceptions
masked, but they must temporarily unmask the appropriate set of
exceptions so that the rest of the handler executes with the expected
exception state.

For EL0 handlers, this means dropping to masking context appropriate
for the work to be performed. For EL1 handlers, this means restoring
the masking context of the interrupted task. In both cases, all
exceptions must be masked again before returning from the exception
handler.

The rest of the kernel typically follows the opposite pattern: it
raises the masking context to protect a critical section and later
restores the previous context.

Given these different usage patterns, introduce a dedicated set of
exception masking helpers for the entry code. Keeping these helpers
separate from the generic interrupt masking APIs makes the intended
usage explicit and helps avoid mixing the two masking models.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 .../include/asm/interrupts/common_flags.h     |  11 ++
 arch/arm64/include/asm/interrupts/entry.h     | 100 ++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 arch/arm64/include/asm/interrupts/entry.h

diff --git a/arch/arm64/include/asm/interrupts/common_flags.h b/arch/arm64/include/asm/interrupts/common_flags.h
index 8f79e8179601..b5cf3b6d0774 100644
--- a/arch/arm64/include/asm/interrupts/common_flags.h
+++ b/arch/arm64/include/asm/interrupts/common_flags.h
@@ -107,6 +107,17 @@ arm64_exc_hwstate_t arm64_exc_hwstate_of_context(arm64_exc_context_t context) {
 	}
 }
 
+static __always_inline
+arm64_exc_hwstate_t arm64_exc_hwstate_of_regs(struct pt_regs *regs)
+{
+	arm64_exc_hwstate_t state = {.daif=regs->pstate & DAIF_MASK};
+
+	if (system_uses_irq_prio_masking())
+		state.pmr = regs->pmr;
+
+	return state;
+}
+
 static __always_inline
 void arm64_debug_exc_hwstate(arm64_exc_hwstate_t expected)
 {
diff --git a/arch/arm64/include/asm/interrupts/entry.h b/arch/arm64/include/asm/interrupts/entry.h
new file mode 100644
index 000000000000..e34c198f4ac1
--- /dev/null
+++ b/arch/arm64/include/asm/interrupts/entry.h
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Arm Ltd.
+ */
+#ifndef __ASM_INTERRUPTS_ENTRY_H
+#define __ASM_INTERRUPTS_ENTRY_H
+
+#include <asm/arch_gicv3.h>
+#include <asm/bug.h>
+#include <asm/cpufeature.h>
+#include <asm/interrupts/common_flags.h>
+
+
+static __always_inline
+arm64_exc_hwstate_t __arm64_switch_exc_hwstate_to(arm64_exc_hwstate_t prev,
+						  arm64_exc_hwstate_t next)
+{
+	bool irqs_disabled = arch_irqs_disabled_flags(next.flags);
+	bool force;
+
+	arm64_debug_exc_hwstate(prev);
+
+	if (prev.flags == next.flags)
+		return next;
+
+	if (!irqs_disabled)
+		trace_hardirqs_on();
+
+	force = system_uses_irq_prio_masking() && prev.pmr != next.pmr;
+
+	__arm64_update_exc_hwstate(next, force);
+
+	if (irqs_disabled)
+		trace_hardirqs_off();
+
+	return next;
+}
+
+static __always_inline
+arm64_exc_hwstate_t arm64_inherit_exc_context(struct pt_regs *regs)
+{
+	arm64_exc_hwstate_t prev = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
+	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_regs(regs);
+
+	return __arm64_switch_exc_hwstate_to(prev, next);
+}
+
+static __always_inline
+arm64_exc_hwstate_t arm64_drop_exc_context(arm64_exc_hwstate_t prev, arm64_exc_context_t context)
+{
+	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_context(context);
+
+	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
+		WARN_ON_ONCE(prev.daif < next.daif);
+
+		if (prev.daif == next.daif) {
+			/*
+			 * GIC_PRIO_IRQON is larger that GIC_PRIO_IRQOFF so larger PMR value is weaker
+			 */
+			WARN_ON_ONCE(system_uses_irq_prio_masking() && prev.pmr > next.pmr);
+		}
+	}
+
+	return __arm64_switch_exc_hwstate_to(prev, next);
+}
+
+static __always_inline
+arm64_exc_hwstate_t arm64_lift_exc_context(arm64_exc_hwstate_t prev, arm64_exc_context_t context)
+{
+	arm64_exc_hwstate_t next = arm64_exc_hwstate_of_context(context);
+
+	if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS)) {
+		WARN_ON_ONCE(prev.daif > next.daif);
+
+		if (prev.daif == next.daif) {
+			/*
+			 * GIC_PRIO_IRQON is larger that GIC_PRIO_IRQOFF so smaller PMR value is stronger
+			 */
+			WARN_ON_ONCE(system_uses_irq_prio_masking() && prev.pmr < next.pmr);
+		}
+	}
+
+	return __arm64_switch_exc_hwstate_to(prev, next);
+}
+
+static __always_inline
+arm64_exc_hwstate_t arm64_unmask_exc_context(arm64_exc_context_t context)
+{
+	arm64_exc_hwstate_t prev = arm64_exc_hwstate_of_context(CRITICAL_CONTEXT);
+
+	return arm64_drop_exc_context(prev, context);
+}
+
+static __always_inline
+arm64_exc_hwstate_t arm64_mask_exc_context(arm64_exc_hwstate_t prev)
+{
+	return arm64_lift_exc_context(prev, CRITICAL_CONTEXT);
+}
+
+#endif /* __ASM_INTERRUPTS_ENTRY_H */
-- 
2.34.1


