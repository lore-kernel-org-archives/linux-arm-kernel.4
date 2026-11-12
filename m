Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0875606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZZsHtosT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uiQrGuxn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vYhBMdOiwuIcQ8GRLfzOrjZw//I+QzikBynueMIxMp8=; b=ZZsHtosTtNllwR1FSkCp/tlA6M
	N5kwXy9wzF9ER82Ed0IxzSfWdPERVTLJ4JtrDLHtht+SYZWqFhqmFX9mkAf7YiTh+B//ej/KJaauz
	pEBMeFASV1xSxxCbFa9V+R/Mma3jfex/+RgTOQP7iKIvwhtycUTaFmC46rI6PqyKSviZEdh2FM4gA
	Kf8rSmx7vOCELXjdahdvtDMZ9ChyIrdLGxuKKgnuVaB2MxMI/8nmNIgDzYUYpXPYMbhFi/TJx1Orj
	YNHERNf+VzZDFIjwn59zBwIEQFU/pCOToBVO/6tWlDCSF5XE8AlHsuYlaFNQEA/2sKiOgJXX3Bifg
	qROOJRSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkh-0000000A0mi-1uCy;
	Thu, 12 Nov 2026 13:22:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkW-0000000A0bh-0POH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:21:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 98460165C;
	Thu, 12 Nov 2026 05:21:52 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0CF333F632;
	Thu, 12 Nov 2026 05:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489715; bh=DaatvyDmhi0fUcbXm4zLVj2myJrFdJE/fIuTnRKNU4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uiQrGuxng9YBlW2iE+qzs3O9lLF6699sG96c2DC71EnxqbvpGsBrkKVR2htbl9svb
	 CJbptUP3/h9Lt0HXNI+CwtHlCLpIGDRcUMpFfgYVNi1YhxQBJ0Yi2WdnKlMlsEew+N
	 PQJxNgHWGP5R4cCxT15ee5vSqv94u9kKQXONSbgg=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 08/39] arm64: interrupts: introduce a helper for GIC priority initialization
Date: Thu, 12 Nov 2026 13:20:11 +0000
Message-Id: <20261112132042.129062-9-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052156_223279_9AAA2430 
X-CRM114-Status: GOOD (  14.40  )
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

Arm64's `init_IRQ()` calls `local_daif_restore()` to synchronize
interrupt masking via DAIF and switch to masking via PMR.  This
depends on a very specific behaviour of `local_daif_restore()` which
will clear DAIF if masking interrupts via PMR, which will get removed
in the future.

As `setup_arch()` cleared DA only earlier, introduce a dedicated
helper that explicitly initializes the PMR to mask interrupts and
clears DAIF, switching to IRQ priority masking.

Given it is a dedicated helper, add a lockdep assertion as
`setup_arch()` should always have called `trace_hardirqs_off()` when
clearing DA, otherwise something bad happened.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/interrupts/masking.h | 19 +++++++++++++++++++
 arch/arm64/kernel/irq.c                     | 14 +++++---------
 2 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/interrupts/masking.h b/arch/arm64/include/asm/interrupts/masking.h
index db3439853b64..9e589bf11ec8 100644
--- a/arch/arm64/include/asm/interrupts/masking.h
+++ b/arch/arm64/include/asm/interrupts/masking.h
@@ -5,6 +5,8 @@
 #ifndef __ASM_INTERRUPTS_MASKING_H
 #define __ASM_INTERRUPTS_MASKING_H
 
+#include <linux/lockdep.h>
+
 #include <asm/arch_gicv3.h>
 #include <asm/bug.h>
 #include <asm/cpufeature.h>
@@ -89,4 +91,21 @@ static inline void local_exceptions_final_mask(void)
 	__local_exceptions_final_mask();
 }
 #endif /* CONFIG_DEBUG_IRQFLAGS */
+
+/*
+ * During early boot, we unmask PSR.DA before the GIC has been set up.
+ * If we use IRQ priority masking, the PMR and PSR will be out of sync
+ * after the GIC is enabled : sync them up.
+ */
+static inline void local_interrupt_priority_init(void)
+{
+	if (!system_uses_irq_prio_masking())
+		return;
+
+	WARN_ON(read_sysreg(daif) & PSR_A_BIT);
+	lockdep_assert_irqs_disabled();
+
+	arm64_update_exc_context(NOIRQ_CONTEXT);
+}
+
 #endif /* __ASM_INTERRUPTS_MASKING_H */
diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
index 58b778083576..a3d9128ba195 100644
--- a/arch/arm64/kernel/irq.c
+++ b/arch/arm64/kernel/irq.c
@@ -21,7 +21,6 @@
 #include <linux/seq_file.h>
 #include <linux/smp.h>
 #include <linux/vmalloc.h>
-#include <asm/daifflags.h>
 #include <asm/interrupts/masking.h>
 #include <asm/exception.h>
 #include <asm/numa.h>
@@ -131,14 +130,11 @@ void __init init_IRQ(void)
 
 	irqchip_init();
 
-	if (system_uses_irq_prio_masking()) {
-		/*
-		 * Now that we have a stack for our IRQ handler, set
-		 * the PMR/PSR pair to a consistent state.
-		 */
-		WARN_ON(read_sysreg(daif) & PSR_A_BIT);
-		local_daif_restore(DAIF_PROCCTX_NOIRQ);
-	}
+	/*
+	 * Now that we have a stack for our IRQ handler,
+	 * let's mask interrupts via the PMR.
+	 */
+	local_interrupt_priority_init();
 }
 
 #ifdef CONFIG_DEBUG_IRQFLAGS
-- 
2.34.1


