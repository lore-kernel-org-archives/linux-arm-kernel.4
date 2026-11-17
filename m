Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50988606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 22:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YUBrZF2U;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RwrIRli6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qYN2eoweNIz8/zbwaEMkzsjzNjhGAdJAZGmGu2jNJbE=; b=YUBrZF2UhO032i
	x9FmIvdbG2cTdXu3JhKt+QsLIuekmT4wxycYFacSPNT2F4kTiKkG6L23Y9VkUqA9keOkEzkZ685TU
	qtLXbCvQSIHfM4IPhneJiUcccuOO9y40c6H2dJcEahT8VnHE3rkYqjNfoKRdj2Vo3xF3RXLcHl/pJ
	UE+VpDACCZMvyoqa5oBwI0Sxv/sKrm3bZv0yR2hxeoGsxG5mU6ZLoojiUsVacOdt2ZbDjI3ZDhBsl
	0HG9ZGkBlEajuezSMC34iiFfsVfDxB2vg6KwNW9yUsv6X9cEaww4vJMJXbKIVIze1+FKkE3ATIcso
	6KyqaYIJR5NbEZCmdSxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRZj-00000007DUV-3p87;
	Tue, 17 Nov 2026 22:22:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRZh-00000007DTk-0VBZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 22:22:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C1AB61CCD;
	Tue, 17 Nov 2026 22:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC401F000C5;
	Tue, 17 Nov 2026 22:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794954168;
	bh=qYN2eoweNIz8/zbwaEMkzsjzNjhGAdJAZGmGu2jNJbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RwrIRli6LqanF+IqCEOIyyXyyxus5tPMfGI38tqXJyoD1xfnSVbDMFO2pwQ+RaPZi
	 BO7qagSwIECiNtLm0FmAgooKLvJCHZGAqvlQRBNJuZc07NPoDInBANPsJCVd/XFZgl
	 cy1aM2Ua8TvW3haUuLhd0Mg9+vg6nY92oABzhsCNAV4NymKOW9cYcB3WemnAMcShuF
	 T4nl8SUjiLdjQc5gb1bHypuSncYn49QZ09IFuUl04lfhSZdAYdVAiSnGZcGQA1Btqp
	 gxFejuKwINtlijdDl6PCPWApEcW1fubPjKuSu2iIVCw8P6b19wi6tW1hmBGlHVYkbd
	 zt4kxS1qRNzlA==
From: Arnd Bergmann <arnd@kernel.org>
To: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Navneet Singh <navneetsingh@microsoft.com>,
	apais@microsoft.com,
	hargar@linux.microsoft.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dynamically enable st64bv0 for SVA
Date: Tue, 17 Nov 2026 23:22:24 +0100
Message-ID: <20261117222224.1465328-3-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117222224.1465328-1-arnd@kernel.org>
References: <20261117222224.1465328-1-arnd@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arnd Bergmann <arnd@arndb.de>

I/O devices that understand the st64bv0 instruction for doing shared
virtual access from userspace need to set the pasid value in the
accdata_el1 register, but in general we want this to be disabled unless
a driver actually hands an MMIO area to userspace that accepts these
commands and installs a pasid using iommu_sva_bind_device().

Rather than trying to find all threads that use an mm_struct by the
time the pasid created, iommu_sva_bind_device() only stores the pasid in
'struct iommu_mm_data' and sets up the iommu domain in the device. The
first attempt to use SVA from userspace traps into do_el0_other(),
which checks that this is indeed valid and then sets the configured
pasid before enabling SCTLR_EL1_EnAS0.

On machines running KVM guests, KVM already handles saving and restoring
ACCDATA now. If the same process uses SVA itself, the context is restored
upon guest access. This only really makes sense if the host device using
SVA is attached to the same SMMU using a single stage translation, and
another device is assigned to the guest VMID for stage2 so it can use
the stage1 translation inside of the guest using ACCDATA as PASID.

This is pretty much a lifted from the x86 try_fixup_enqcmd_gp()
function.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/include/asm/cpufeature.h  |  5 +++
 arch/arm64/include/asm/exception.h   |  1 +
 arch/arm64/include/asm/mmu_context.h | 17 +++++++++
 arch/arm64/kernel/entry-common.c     | 11 ++++++
 arch/arm64/kernel/traps.c            | 52 ++++++++++++++++++++++++++++
 arch/arm64/tools/sysreg              |  5 +++
 6 files changed, 91 insertions(+)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 7d7b8eb7f72f..e5367344e817 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -914,6 +914,11 @@ static inline bool system_supports_bbml3(void)
 	return alternative_has_cap_unlikely(ARM64_HAS_BBML3);
 }
 
+static inline bool system_supports_ls64_accdata(void)
+{
+	return cpus_have_final_cap(ARM64_HAS_LS64_ACCDATA);
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
 
diff --git a/arch/arm64/include/asm/exception.h b/arch/arm64/include/asm/exception.h
index a2da3cb21c24..7c61b50718d6 100644
--- a/arch/arm64/include/asm/exception.h
+++ b/arch/arm64/include/asm/exception.h
@@ -81,6 +81,7 @@ void do_el0_sys(unsigned long esr, struct pt_regs *regs);
 void do_sp_pc_abort(unsigned long addr, unsigned long esr, struct pt_regs *regs);
 void bad_el0_sync(struct pt_regs *regs, int reason, unsigned long esr);
 void do_el0_cp15(unsigned long esr, struct pt_regs *regs);
+void do_el0_other(struct pt_regs *regs, unsigned long esr);
 int do_compat_alignment_fixup(unsigned long addr, struct pt_regs *regs);
 void do_el0_svc(struct pt_regs *regs);
 void do_el0_svc_compat(struct pt_regs *regs);
diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 803b68758152..40c47ee003d5 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -16,6 +16,7 @@
 #include <linux/mm_types.h>
 #include <linux/pgtable.h>
 #include <linux/pkeys.h>
+#include <linux/iommu.h>
 
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
@@ -247,6 +248,20 @@ static inline void __switch_mm(struct mm_struct *next)
 	check_and_switch_context(next);
 }
 
+/* switch to PASID if new task has enabled st64bv0 */
+static inline void switch_iommu_mm(struct mm_struct *mm, struct task_struct *tsk)
+{
+	u32 pasid;
+
+	if (!IS_ENABLED(CONFIG_IOMMU_SVA) ||
+	    !(tsk->thread.sctlr_user & SCTLR_EL1_EnAS0))
+		return;
+
+	pasid = mm_get_enqcmd_pasid(mm);
+	if (pasid != IOMMU_PASID_INVALID)
+		write_sysreg(pasid, accdata_el1);
+}
+
 static inline void
 switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	  struct task_struct *tsk)
@@ -254,6 +269,8 @@ switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	if (prev != next)
 		__switch_mm(next);
 
+	switch_iommu_mm(next, tsk);
+
 	/*
 	 * Update the saved TTBR0_EL1 of the scheduled-in task as the previous
 	 * value may have not been initialised yet (activate_mm caller) or the
diff --git a/arch/arm64/kernel/entry-common.c b/arch/arm64/kernel/entry-common.c
index beb56891fc4f..03ecc73c44a4 100644
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -807,6 +807,14 @@ static void noinstr el0_fpac(struct pt_regs *regs, unsigned long esr)
 	arm64_exit_to_user_mode(regs);
 }
 
+static void noinstr el0_other(struct pt_regs *regs, unsigned long esr)
+{
+	arm64_enter_from_user_mode(regs);
+	local_daif_restore(DAIF_PROCCTX);
+	do_el0_other(regs, esr);
+	arm64_exit_to_user_mode(regs);
+}
+
 asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 {
 	unsigned long esr = read_sysreg(esr_el1);
@@ -870,6 +878,9 @@ asmlinkage void noinstr el0t_64_sync_handler(struct pt_regs *regs)
 	case ESR_ELx_EC_FPAC:
 		el0_fpac(regs, esr);
 		break;
+	case ESR_ELx_EC_OTHER:
+		el0_other(regs, esr);
+		break;
 	default:
 		el0_inv(regs, esr);
 	}
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index d6391ab20db3..a02dbee8c06d 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -13,6 +13,7 @@
 #include <linux/kprobes.h>
 #include <linux/spinlock.h>
 #include <linux/uaccess.h>
+#include <linux/iommu.h>
 #include <linux/hardirq.h>
 #include <linux/kdebug.h>
 #include <linux/module.h>
@@ -543,6 +544,56 @@ void do_el1_mops(struct pt_regs *regs, unsigned long esr)
 	kernel_fastforward_single_step(regs);
 }
 
+/*
+ * PASID/ACCDATA is shared by the entire mm, while sctlr_el1
+ * is maintained per thread. Keep things simple and enable
+ * ACCDATA dynamically on first access if the feature is
+ * available and a valid pasid is set.
+ *
+ * After exiting back to userspace, the st64bv0 instruction
+ * should no longer trap.
+ */
+static bool try_enable_st64bv0(struct pt_regs *regs, unsigned long esr)
+{
+	u32 pasid;
+	u64 sctlr;
+
+	if (!system_supports_ls64_accdata())
+		return false;
+
+	pasid = mm_get_enqcmd_pasid(current->mm);
+	if (pasid == IOMMU_PASID_INVALID)
+		return false;
+
+	preempt_disable();
+	write_sysreg(pasid, accdata_el1);
+	sctlr = current->thread.sctlr_user;
+	sctlr |= SCTLR_EL1_EnAS0;
+	current->thread.sctlr_user = sctlr;
+	update_sctlr_el1(sctlr);
+	preempt_enable();
+
+	return true;
+}
+
+void do_el0_other(struct pt_regs *regs, unsigned long esr)
+{
+	switch (ESR_ELx_ISS(esr)) {
+	case ESR_ELx_ISS_OTHER_ST64BV0:
+		if (try_enable_st64bv0(regs, esr))
+			return;
+		break;
+
+	case ESR_ELx_ISS_OTHER_ST64BV:
+	case ESR_ELx_ISS_OTHER_LDST64B:
+	default:
+		break;
+	}
+
+	/* Treat all other "other" trapping instructions as illegal opcode */
+	force_signal_inject(SIGILL, ILL_ILLOPC, regs->pc, 0);
+}
+
 #define __user_cache_maint(insn, address, res)			\
 	if (address >= TASK_SIZE_MAX) {				\
 		res = -EFAULT;					\
@@ -842,6 +893,7 @@ static const char *esr_class_str[] = {
 	[ESR_ELx_EC_FP_ASIMD]		= "ASIMD",
 	[ESR_ELx_EC_CP10_ID]		= "CP10 MRC/VMRS",
 	[ESR_ELx_EC_PAC]		= "PAC",
+	[ESR_ELx_EC_OTHER]		= "OTHER",
 	[ESR_ELx_EC_CP14_64]		= "CP14 MCRR/MRRC",
 	[ESR_ELx_EC_BTI]		= "BTI",
 	[ESR_ELx_EC_ILL]		= "PSTATE.IL",
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 28d319e63d8f..7612bacdb018 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3707,6 +3707,11 @@ Sysreg	TPIDR_EL1	3	0	13	0	4
 Field	63:0	ThreadID
 EndSysreg
 
+Sysreg	ACCDATA_EL1	3	0	13	0	5
+Res0	63:32
+Field	31:0	ACCDATA
+EndSysreg
+
 Sysreg	RCWMASK_EL1	3	0	13	0	6
 Field	63:0	RCWMASK
 EndSysreg
-- 
2.53.0


