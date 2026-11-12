Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70022606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kn/5pfd5;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=tFZbgBHZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r17cFNkuqTudynt7KIyxaO9lFQFSRp9DFe3XtZA+guQ=; b=Kn/5pfd5SpJMo1t/Gi8WNihIkf
	7XnUxfHKC3/shbp9e+rMK0Vb2pPVq5GBviyt/Bn1YdGFvK8GPf0YErRiEkmZKbyJgrgXPjDZ+74Rv
	7mj9sa4hAU7ARIsxAurKDntfue/lHtDA22W5bI2sfDuRATJ1msJNsFde4cV3BV3tMvIxC6jgQmjqC
	qbNIqhG6zmoR9hiRoFZdvITzh0kPgvcDBAA70Cad2+MtLB3IXros17ZSWBtAxXKJEyr3PLlKIZsqY
	0VhYBARUfICGX2RssR75bTKxnSxSqWXTC6GsAi/rE+KYQjV2xqUk6uf4FbkycMTmElLHzq0nzfXBb
	zPeoOSPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUke-0000000A0ja-0cSw;
	Thu, 12 Nov 2026 13:22:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkU-0000000A0bh-2IxI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:21:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4A131576;
	Thu, 12 Nov 2026 05:21:50 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E63C43F632;
	Thu, 12 Nov 2026 05:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489713; bh=zOyr0Gx+ReMC+4Dz6IDYwfdfCrUOKzL5YzDrrf5D7BU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tFZbgBHZjb0cP4V4S6XAs/EaF1aAwG2WknxvmOyD4dgB/ortqszXhIXEDKTTYIzJf
	 wBlV/AILaML433ikBLcmEWnV/3yOI6C9E9uT7sRpp++DxQSEus20QdAqU+lerSCcP5
	 u622XK2EdY+OU7zhqsDmgW3yF6T+EP5qyElUGLks=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 07/39] arm64: interrupts: Introduce exception masking save/restore helpers
Date: Thu, 12 Nov 2026 13:20:10 +0000
Message-Id: <20261112132042.129062-8-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052154_681058_F994E9BA 
X-CRM114-Status: GOOD (  17.64  )
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

Outside the entry code, the local_daif_... helpers need to be replaced
so that both DAIF and PMR are handled correctly and their use can be
controlled more strongly.

Introduce local_exceptions_save_mask() and local_exceptions_restore(),
which must be used as a pair. Save both the original and requested
exception state so that inconsistent changes between the save and
restore can be detected.

There are two cases where paired save and restore operations do not
make sense:

- when initializing a CPU, and
- when preparing to turn it off.

Handle those cases with local_exceptions_cpu_init_mask() and
local_exceptions_final_mask(). When CONFIG_DEBUG_IRQFLAGS is enabled,
enforce that these helpers are not used outside their intended
contexts.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/interrupts/masking.h | 92 +++++++++++++++++++++
 arch/arm64/kernel/irq.c                     | 31 +++++++
 2 files changed, 123 insertions(+)
 create mode 100644 arch/arm64/include/asm/interrupts/masking.h

diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
new file mode 100644
index 000000000000..db3439853b64
--- /dev/null
+++ b/arch/arm64/include/asm/interrupts/masking.h
@@ -0,0 +1,92 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Arm Ltd.
+ */
+#ifndef __ASM_INTERRUPTS_MASKING_H
+#define __ASM_INTERRUPTS_MASKING_H
+
+#include <asm/arch_gicv3.h>
+#include <asm/bug.h>
+#include <asm/cpufeature.h>
+#include <asm/interrupts/common_flags.h>
+#include <asm/ptrace.h>
+
+typedef struct arm64_exc_hwstates {
+	arm64_exc_hwstate_t saved;
+	arm64_exc_hwstate_t expected;
+} arm64_exc_hwstates_t;
+
+static inline
+arm64_exc_hwstates_t local_exceptions_save_mask(arm64_exc_context_t new)
+{
+	arm64_exc_hwstate_t actual = {.flags = arch_local_save_flags()};
+	arm64_exc_hwstate_t state = arm64_exc_hwstate_of_context(new);
+	bool irqs_disabled = arch_irqs_disabled_flags(state.flags);
+	bool force;
+
+	/*
+	 * We've just got actual HW state so we can rely on that to
+	 * optimize some unnecessary updates.
+	 */
+	force = system_uses_irq_prio_masking() && actual.pmr != state.pmr;
+
+	if (!irqs_disabled)
+		trace_hardirqs_on();
+
+	__arm64_update_exc_hwstate(state, force);
+
+	if (irqs_disabled)
+		trace_hardirqs_off();
+
+	return (arm64_exc_hwstates_t){.saved = actual, .expected = state};
+}
+
+static inline void local_exceptions_restore(arm64_exc_hwstates_t states)
+{
+	bool irqs_disabled = arch_irqs_disabled_flags(states.saved.flags);
+
+	arm64_debug_exc_hwstate(states.expected);
+
+	if (!irqs_disabled)
+		trace_hardirqs_on();
+
+	arm64_update_exc_hwstate(states.saved);
+
+	if (irqs_disabled)
+		trace_hardirqs_off();
+}
+
+static __always_inline
+void __local_exceptions_cpu_init_mask(arm64_exc_context_t context)
+{
+	if (context == PROCESS_CONTEXT)
+		trace_hardirqs_on();
+
+	arm64_update_exc_context(context);
+
+	if (context != PROCESS_CONTEXT)
+		trace_hardirqs_off();
+}
+
+static __always_inline void __local_exceptions_final_mask(void)
+{
+	arm64_update_exc_context(CRITICAL_CONTEXT);
+	trace_hardirqs_off();
+}
+
+#ifdef CONFIG_DEBUG_IRQFLAGS
+void local_exceptions_cpu_init_mask(arm64_exc_context_t context);
+void local_exceptions_final_mask(void);
+#else
+static inline
+void local_exceptions_cpu_init_mask(arm64_exc_context_t context)
+{
+	__local_exceptions_cpu_init_mask(context);
+}
+
+static inline void local_exceptions_final_mask(void)
+{
+	__local_exceptions_final_mask();
+}
+#endif /* CONFIG_DEBUG_IRQFLAGS */
+#endif /* __ASM_INTERRUPTS_MASKING_H */
diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
index 9fafd826002b..58b778083576 100644
--- a/arch/arm64/kernel/irq.c
+++ b/arch/arm64/kernel/irq.c
@@ -22,6 +22,7 @@
 #include <linux/smp.h>
 #include <linux/vmalloc.h>
 #include <asm/daifflags.h>
+#include <asm/interrupts/masking.h>
 #include <asm/exception.h>
 #include <asm/numa.h>
 #include <asm/softirq_stack.h>
@@ -39,6 +40,12 @@ DECLARE_PER_CPU(unsigned long *, irq_shadow_call_stack_ptr);
 DEFINE_PER_CPU(unsigned long *, irq_shadow_call_stack_ptr);
 #endif
 
+#ifdef CONFIG_DEBUG_IRQFLAGS
+/* Make sure the CPU init/tear down masking functions are only used once. */
+static cpumask_t irqs_masks_init_done;
+static cpumask_t irqs_masks_final_done;
+#endif
+
 static int __init init_irq_scs(void)
 {
 	int cpu;
@@ -133,3 +140,27 @@ void __init init_IRQ(void)
 		local_daif_restore(DAIF_PROCCTX_NOIRQ);
 	}
 }
+
+#ifdef CONFIG_DEBUG_IRQFLAGS
+void local_exceptions_cpu_init_mask(arm64_exc_context_t context)
+{
+	int cpu = smp_processor_id();
+
+	WARN_ON(cpumask_test_cpu(cpu, &irqs_masks_init_done));
+
+	__local_exceptions_cpu_init_mask(context);
+	cpumask_set_cpu(cpu, &irqs_masks_init_done);
+	cpumask_clear_cpu(cpu, &irqs_masks_final_done);
+}
+
+void local_exceptions_final_mask(void)
+{
+	int cpu = smp_processor_id();
+
+	WARN_ON(cpumask_test_cpu(cpu, &irqs_masks_final_done));
+
+	__local_exceptions_final_mask();
+	cpumask_set_cpu(cpu, &irqs_masks_final_done);
+	cpumask_clear_cpu(cpu, &irqs_masks_init_done);
+}
+#endif
-- 
2.34.1


