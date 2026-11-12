Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F11C606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PiMXEl78;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Sq+nYwYU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TwtDbmmIQvWKq7bBJ4xRzzbSU24+evtQRZBLwNCQBUU=; b=PiMXEl78WgIHRnkA8fIVYf1gsp
	Jt+0t08SyIzPUyeggCljb3aVFE0N3OGpYhOC2DhgpfKnNEZ88KcSBHIyH1aLVPZOa0BiWyCUBrbyb
	NbyafGkmVi9IJZBNBhuQNChEQ5N9oWI7WvuoYoI/+Q88Rv9wHHXu+qeYMApTUjyyaSB5QXgSxS1D2
	fQymRckp/E/xSdsEkNifs8cASLwvM1wapNozDHRjPcIPDj1Ww0NEIi+3cG8CUboiSG8HqZxLJOyzR
	j9DMcsJ7REaYJHObw7+4NwsygO0VMpKztUetrqA7J1uhQNt6uYt/Uc/KLWtfY/0YJBuUowMoQ30dQ
	WVhOJTKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkO-0000000A0Ud-0yns;
	Thu, 12 Nov 2026 13:21:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkI-0000000A0SJ-1tDs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:21:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4AB58153B;
	Thu, 12 Nov 2026 05:21:38 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9E6103F632;
	Thu, 12 Nov 2026 05:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489701; bh=9rtDafIJiCOMch3OFPovFwKlMfqQQvYkMMP4E+zxS3o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sq+nYwYUd3XcArPQmxmnR91vC8KBoPjyV6uUsOGS1iQ7swX+x77SLQmZWiVkfihBb
	 iWFHcRpmUo3iBK7HL5NTffdqA1rnuAxxkJCVaATuTA+q6kqgkcIdRTHZFyDWU91PlC
	 rqunno9nfv4oVwZd6+Jf9Ty5UljYuKtVFo/bDRQw=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 01/39] arm64: irqflags: Introduce arm64-specific irqflags type
Date: Thu, 12 Nov 2026 13:20:04 +0000
Message-Id: <20261112132042.129062-2-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052142_586598_B8D7A4C7 
X-CRM114-Status: GOOD (  14.80  )
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

With pseudo-NMIs enabled, we have two mechanisms that control
interrupt masking in parallel :
- The DAIF flags, masking at the CPU
- The GIC PMR, masking before the CPU

However, our irqflags implementation currently assumes that only one
of the two is used at a time, so both DAIF and PMR masking use the same
`unsigned long flags` in their own way.
This is incorrect, as some parts of the kernel will mask interrupts
with DAIF directly or bypass the local_irq masking via the PMR,
and makes tracking the state and changes of both in parallel impossible.

The irqflags API expects `unsigned long`s to be passed around, but
they should not be manipulated outside of the arch-specific code.
So, we can encode the information we need however we want as long as
we return and accept `unsigned long`s.

Introduce a union type for arm64 irqflags whose first member is
a struct allowing us to track DAIF and PMR in parallel, and the second
is the `unsigned long` expected by the irqflags API.

DAIF is a two byte value, to maintain compatibility with existing defines.
PMR is a one byte value, which is the maximum amount of priority bits
allowed by the GICv3 architecture.

Update the internal irqflags functions to use this new union and convert
back and forth with the irqflags unsigned long.
There should be no functional changes.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/irqflags.h | 44 ++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/irqflags.h b/arch/arm64/include/asm/irqflags.h
index a8cb5a5c93b7..5c17e26727f9 100644
--- a/arch/arm64/include/asm/irqflags.h
+++ b/arch/arm64/include/asm/irqflags.h
@@ -9,6 +9,8 @@
 #include <asm/ptrace.h>
 #include <asm/sysreg.h>
 
+#include <linux/compiler.h>
+
 /*
  * Aarch64 has flags for masking: Debug, Asynchronous (serror), Interrupts and
  * FIQ exceptions, in the 'daif' register. We mask and unmask them in 'daif'
@@ -20,6 +22,24 @@
  * exceptions should be unmasked.
  */
 
+ /*
+  * Internally, we want to independently manipulate and track the different
+  * interrupt masking mechanisms.
+  * Externally, the generic irqflags API expects unsgined longs to represent
+  * the state of interrupts, which are treated as obscure arch-specific data.
+  */
+typedef union arm64_exc_hwstate {
+	struct {
+		u16 daif;
+		u8 pmr;
+		u8 __pad0;
+		u32 __pad1;
+	};
+	unsigned long flags;
+} arm64_exc_hwstate_t;
+
+static_assert(sizeof(arm64_exc_hwstate_t) == sizeof(unsigned long));
+
 static __always_inline void __daif_local_irq_enable(void)
 {
 	barrier();
@@ -79,12 +99,16 @@ static __always_inline void arch_local_irq_disable(void)
 
 static __always_inline unsigned long __daif_local_save_flags(void)
 {
-	return read_sysreg(daif);
+	arm64_exc_hwstate_t hwstate = { .daif = read_sysreg(daif) };
+
+	return hwstate.flags;
 }
 
 static __always_inline unsigned long __pmr_local_save_flags(void)
 {
-	return read_sysreg_s(SYS_ICC_PMR_EL1);
+	arm64_exc_hwstate_t hwstate = { .pmr = read_sysreg_s(SYS_ICC_PMR_EL1) };
+
+	return hwstate.flags;
 }
 
 /*
@@ -101,12 +125,16 @@ static __always_inline unsigned long arch_local_save_flags(void)
 
 static __always_inline bool __daif_irqs_disabled_flags(unsigned long flags)
 {
-	return flags & PSR_I_BIT;
+	arm64_exc_hwstate_t hwstate = { .flags = flags };
+
+	return hwstate.daif & PSR_I_BIT;
 }
 
 static __always_inline bool __pmr_irqs_disabled_flags(unsigned long flags)
 {
-	return flags != GIC_PRIO_IRQON;
+	arm64_exc_hwstate_t hwstate = { .flags = flags };
+
+	return hwstate.pmr != GIC_PRIO_IRQON;
 }
 
 static __always_inline bool arch_irqs_disabled_flags(unsigned long flags)
@@ -171,15 +199,19 @@ static __always_inline unsigned long arch_local_irq_save(void)
 
 static __always_inline void __daif_local_irq_restore(unsigned long flags)
 {
+	arm64_exc_hwstate_t hwstate = { .flags = flags };
+
 	barrier();
-	write_sysreg(flags, daif);
+	write_sysreg(hwstate.daif, daif);
 	barrier();
 }
 
 static __always_inline void __pmr_local_irq_restore(unsigned long flags)
 {
+	arm64_exc_hwstate_t hwstate = { .flags = flags };
+
 	barrier();
-	write_sysreg_s(flags, SYS_ICC_PMR_EL1);
+	write_sysreg_s(hwstate.pmr, SYS_ICC_PMR_EL1);
 	pmr_sync();
 	barrier();
 }
-- 
2.34.1


