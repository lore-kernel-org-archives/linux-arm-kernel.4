Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D57606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QKkA/FP3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TcmwRGlk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AOFmMfDWkSBORopg3T9AkRoHWdfoOLBsrFKupJzNMF4=; b=QKkA/FP30G0Vfv8iCzoV3BXgSi
	YtvQU8kcpV+rRuzrirJkFsiWqgSzXaKSa4npB8vQqRvSD/Lu4/SHqrKtDAQS3W+b6nnHAb/DQbz6v
	z66WEEvbq5K9RdJIh7BM/p54Nk33x68JzFyxT6CqlLjNh/FjheJBbByYdb99fLxznCpSe/1GehFPO
	Ih0sUeEfxH+nezGtqzdSz9VfbR8efz+D2vtLShZLzys4954wNiyQqKI1m1YzxtkorXUnkVH8btbNY
	BpYSxwzao9jHwlU5wuYm8f6MsW56QUKuyDKdwbVXZ1hbzIYVGO1rq1dnVm9QCJoRATqorSu+NGeNv
	4KqrRsAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlQ-0000000A1NY-20Vc;
	Thu, 12 Nov 2026 13:22:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkb-0000000A0h3-2ekU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 10F65153B;
	Thu, 12 Nov 2026 05:21:58 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7BF463F632;
	Thu, 12 Nov 2026 05:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489721; bh=U1iwsoUCDasf/RRUiRdrd3Ug88wZMWkW7dyYtAzPXtM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TcmwRGlky/SWH9UMpFN6n7XFHamUGEvdJUfuU2g5+eTvn6raRKQpOgjw9uOvSVonu
	 RxK9VRVrmMbX1rMBen3U1oPM/eccLE5pLvrut4/6FQFgm4IXJZ4TeQlpjMH3I9Hl72
	 s/W0Ys+Jom7JQIpypt2yYImz3qGhmmDi7V3XgTQw=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 11/39] arm64: remove daifflags.h
Date: Thu, 12 Nov 2026 13:20:14 +0000
Message-Id: <20261112132042.129062-12-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052201_813748_51D597FE 
X-CRM114-Status: GOOD (  20.48  )
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

Interrupt masking is now split in different APIs and `local_daif_...`
functions are not in use anymore.
The `DAIF_...` masks defines are now in `asm/interrupts/common_flags.h`,
so we can safely remove `daifflags.h` and all `#include`s referring to it.

Only kprobes.c uses `DAIF_...` masks defines, so add the new header
there.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/daifflags.h    | 144 --------------------------
 arch/arm64/include/asm/entry-common.h |   1 -
 arch/arm64/include/asm/kvm_host.h     |   1 -
 arch/arm64/include/asm/mmu_context.h  |   1 -
 arch/arm64/kernel/debug-monitors.c    |   1 -
 arch/arm64/kernel/probes/kprobes.c    |   2 +-
 arch/arm64/kernel/signal.c            |   1 -
 arch/arm64/kernel/traps.c             |   1 -
 arch/arm64/mm/fault.c                 |   1 -
 9 files changed, 1 insertion(+), 152 deletions(-)
 delete mode 100644 arch/arm64/include/asm/daifflags.h

diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
deleted file mode 100644
index 795b35128467..000000000000
--- a/arch/arm64/include/asm/daifflags.h
+++ /dev/null
@@ -1,144 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2017 ARM Ltd.
- */
-#ifndef __ASM_DAIFFLAGS_H
-#define __ASM_DAIFFLAGS_H
-
-#include <linux/irqflags.h>
-
-#include <asm/arch_gicv3.h>
-#include <asm/barrier.h>
-#include <asm/cpufeature.h>
-#include <asm/ptrace.h>
-
-#define DAIF_PROCCTX		0
-#define DAIF_PROCCTX_NOIRQ	(PSR_I_BIT | PSR_F_BIT)
-#define DAIF_ERRCTX		(PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
-#define DAIF_MASK		(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
-
-
-/* mask/save/unmask/restore all exceptions, including interrupts. */
-static __always_inline void local_daif_mask(void)
-{
-	WARN_ON(system_has_prio_mask_debugging() &&
-		(read_sysreg_s(SYS_ICC_PMR_EL1) == (GIC_PRIO_IRQOFF |
-						    GIC_PRIO_PSR_I_SET)));
-
-	asm volatile(
-		"msr	daifset, #0xf		// local_daif_mask\n"
-		:
-		:
-		: "memory");
-
-	/* Don't really care for a dsb here, we don't intend to enable IRQs */
-	if (system_uses_irq_prio_masking())
-		gic_write_pmr(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET);
-
-	trace_hardirqs_off();
-}
-
-static __always_inline unsigned long local_daif_save_flags(void)
-{
-	unsigned long flags;
-
-	flags = read_sysreg(daif);
-
-	if (system_uses_irq_prio_masking()) {
-		/* If IRQs are masked with PMR, reflect it in the flags */
-		if (read_sysreg_s(SYS_ICC_PMR_EL1) != GIC_PRIO_IRQON)
-			flags |= PSR_I_BIT | PSR_F_BIT;
-	}
-
-	return flags;
-}
-
-static __always_inline unsigned long local_daif_save(void)
-{
-	unsigned long flags;
-
-	flags = local_daif_save_flags();
-
-	local_daif_mask();
-
-	return flags;
-}
-
-static __always_inline void local_daif_restore(unsigned long flags)
-{
-	bool irq_disabled = flags & PSR_I_BIT;
-
-	WARN_ON(system_has_prio_mask_debugging() &&
-		(read_sysreg(daif) & (PSR_I_BIT | PSR_F_BIT)) != (PSR_I_BIT | PSR_F_BIT));
-
-	if (!irq_disabled) {
-		trace_hardirqs_on();
-
-		if (system_uses_irq_prio_masking()) {
-			gic_write_pmr(GIC_PRIO_IRQON);
-			pmr_sync();
-		}
-	} else if (system_uses_irq_prio_masking()) {
-		u64 pmr;
-
-		if (!(flags & PSR_A_BIT)) {
-			/*
-			 * If interrupts are disabled but we can take
-			 * asynchronous errors, we can take NMIs
-			 */
-			flags &= ~(PSR_I_BIT | PSR_F_BIT);
-			pmr = GIC_PRIO_IRQOFF;
-		} else {
-			pmr = GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET;
-		}
-
-		/*
-		 * There has been concern that the write to daif
-		 * might be reordered before this write to PMR.
-		 * From the ARM ARM DDI 0487D.a, section D1.7.1
-		 * "Accessing PSTATE fields":
-		 *   Writes to the PSTATE fields have side-effects on
-		 *   various aspects of the PE operation. All of these
-		 *   side-effects are guaranteed:
-		 *     - Not to be visible to earlier instructions in
-		 *       the execution stream.
-		 *     - To be visible to later instructions in the
-		 *       execution stream
-		 *
-		 * Also, writes to PMR are self-synchronizing, so no
-		 * interrupts with a lower priority than PMR is signaled
-		 * to the PE after the write.
-		 *
-		 * So we don't need additional synchronization here.
-		 */
-		gic_write_pmr(pmr);
-	}
-
-	write_sysreg(flags, daif);
-
-	if (irq_disabled)
-		trace_hardirqs_off();
-}
-
-/*
- * Called by synchronous exception handlers to restore the DAIF bits that were
- * modified by taking an exception.
- */
-static __always_inline void local_daif_inherit(struct pt_regs *regs)
-{
-	unsigned long flags = regs->pstate & DAIF_MASK;
-
-	if (!regs_irqs_disabled(regs))
-		trace_hardirqs_on();
-
-	if (system_uses_irq_prio_masking())
-		gic_write_pmr(regs->pmr);
-
-	/*
-	 * We can't use local_daif_restore(regs->pstate) here as
-	 * system_has_prio_mask_debugging() won't restore the I bit if it can
-	 * use the pmr instead.
-	 */
-	write_sysreg(flags, daif);
-}
-#endif
diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
index 1905765159aa..73d82a8d8e95 100644
--- a/arch/arm64/include/asm/entry-common.h
+++ b/arch/arm64/include/asm/entry-common.h
@@ -6,7 +6,6 @@
 #include <linux/thread_info.h>
 
 #include <asm/cpufeature.h>
-#include <asm/daifflags.h>
 #include <asm/fpsimd.h>
 #include <asm/mte.h>
 #include <asm/stacktrace.h>
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 97332ffcb130..2ca9dd9aa03f 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -24,7 +24,6 @@
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
 #include <asm/cputype.h>
-#include <asm/daifflags.h>
 #include <asm/fpsimd.h>
 #include <asm/kvm.h>
 #include <asm/kvm_asm.h>
diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 803b68758152..b3354a1350cf 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -19,7 +19,6 @@
 
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
-#include <asm/daifflags.h>
 #include <asm/gcs.h>
 #include <asm/proc-fns.h>
 #include <asm/cputype.h>
diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
index e271fbac5f82..5db27c7e86bb 100644
--- a/arch/arm64/kernel/debug-monitors.c
+++ b/arch/arm64/kernel/debug-monitors.c
@@ -19,7 +19,6 @@
 
 #include <asm/cpufeature.h>
 #include <asm/cputype.h>
-#include <asm/daifflags.h>
 #include <asm/debug-monitors.h>
 #include <asm/exception.h>
 #include <asm/kgdb.h>
diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
index 4e0efad5caf2..68f4271ce02f 100644
--- a/arch/arm64/kernel/probes/kprobes.c
+++ b/arch/arm64/kernel/probes/kprobes.c
@@ -24,9 +24,9 @@
 #include <linux/vmalloc.h>
 
 #include <asm/cacheflush.h>
-#include <asm/daifflags.h>
 #include <asm/debug-monitors.h>
 #include <asm/insn.h>
+#include <asm/interrupts/common_flags.h>
 #include <asm/irq.h>
 #include <asm/text-patching.h>
 #include <asm/ptrace.h>
diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 6a06a4e352b1..2e12a5622385 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -22,7 +22,6 @@
 #include <linux/syscalls.h>
 #include <linux/pkeys.h>
 
-#include <asm/daifflags.h>
 #include <asm/debug-monitors.h>
 #include <asm/elf.h>
 #include <asm/exception.h>
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index d6391ab20db3..6bbfa8f543b8 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -33,7 +33,6 @@
 #include <asm/atomic.h>
 #include <asm/bug.h>
 #include <asm/cpufeature.h>
-#include <asm/daifflags.h>
 #include <asm/debug-monitors.h>
 #include <asm/efi.h>
 #include <asm/esr.h>
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index b22736853fcd..eb040d1e8935 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -35,7 +35,6 @@
 #include <asm/cpufeature.h>
 #include <asm/efi.h>
 #include <asm/exception.h>
-#include <asm/daifflags.h>
 #include <asm/debug-monitors.h>
 #include <asm/esr.h>
 #include <asm/kprobes.h>
-- 
2.34.1


