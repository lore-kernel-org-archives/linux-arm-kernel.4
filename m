Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85448606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 15:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pgm5xLJm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MsFRZ77Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=b+sud0cjkRrZmTAMpfSkv3BU3NI7wGAmmpkMnmsgVlI=; b=Pgm5xLJmkZNYsd
	IqYuZwNYC7LPtpa1kp6oosh9aOJ7DCzd7BaCEdN7WKYpyphXPlFuW6wUntalFsHAKJaNPNlGGFc0X
	1uQx6tI3Hxg/BRQCWl9QLH4noKaXZXumdfWHdEODpUTfnB/B2FfEQYY6YvbsjoKl+dhXYGP5LVq4+
	wH6rw7guZn2lYYe3TtcqOYzP1E2CXXb227apRrVn25EzsdLqb6qD8RATRikjl3SHcmnfX5PVuIwrN
	J7fYNqRYrmnEvucFynsX3Hy522fiqHV0gk+97PHAHou0NqTTZSt92VeMS6EJRbOb9cxS4j5sZ30hY
	eAY5j0LOSOIAF7NbMxSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbnM-0000000Do19-0vcn;
	Thu, 26 Nov 2026 15:54:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWbnD-0000000Dnya-3Vga
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 15:53:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CFB2C61CEC;
	Thu, 26 Nov 2026 15:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D636A1F000C6;
	Thu, 26 Nov 2026 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795708430;
	bh=b+sud0cjkRrZmTAMpfSkv3BU3NI7wGAmmpkMnmsgVlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MsFRZ77QHYRnAp95Rvbh1UODrX7edd6aWFb0bTOAKWLWMWVLROVqoyF7k3gTAKsO1
	 0AEC9Py9QzEHOHuvbAtrte430JUrB60HZq6UwBgxcv+KrgsXzTSy/TniDkfzb6e954
	 Kc5AJIjRWE96Q9KzewpJZ/IpttW9MCi5EyuYLONAlzlh8dSmqwruRcdBM9++txIyVH
	 h4TaDKGzWLwZ83k0FcH+XES32jR20tuRR7YUfmHChawTMxBqVzgg8opZuooM0Pbgoy
	 FNVv8xQdvJir1nDYBoOaYaid5q/xHU+1RW+jzXkHZfE9UiwCx8KTMXkl1lCHjtNKQj
	 QB/2nrRb2mutg==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 1/3] arm64: dynamically enable st64bv0 for SVA
Date: Thu, 26 Nov 2026 16:53:37 +0100
Message-ID: <20261126155339.1349218-2-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126155339.1349218-1-arnd@kernel.org>
References: <20261126155339.1349218-1-arnd@kernel.org>
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
upon guest access.  This only really makes sense if the host device using
SVA is attached to the same SMMU using a single stage translation, and
another device is assigned to the guest VMID for stage2 so it can use
the stage1 translation inside of the guest using ACCDATA as PASID.

During fork() and exec(), the mm->iommu_mm is cleaned up, so
SCTLR_EL1_EnAS0 has to get turned off as well. If a process with accdata
set enters suspend, restore the value when waking up in case the firmware
lost it.

The design is roughly based on what x86 does with try_fixup_enqcmd_gp().

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/include/asm/cpufeature.h        |  6 +++
 arch/arm64/include/asm/el2_setup.h         |  3 ++
 arch/arm64/include/asm/exception.h         |  1 +
 arch/arm64/include/asm/mmu_context.h       | 17 +++++++
 arch/arm64/include/asm/processor.h         |  2 +-
 arch/arm64/kernel/entry-common.c           | 11 ++++
 arch/arm64/kernel/process.c                | 25 +++++++++
 arch/arm64/kernel/suspend.c                | 17 +++++++
 arch/arm64/kernel/traps.c                  | 59 ++++++++++++++++++++++
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h |  8 ++-
 arch/arm64/tools/sysreg                    |  5 ++
 11 files changed, 151 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 7d7b8eb7f72f..aba24d024e37 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -914,6 +914,12 @@ static inline bool system_supports_bbml3(void)
 	return alternative_has_cap_unlikely(ARM64_HAS_BBML3);
 }
 
+static inline bool system_supports_ls64_accdata(void)
+{
+	return IS_ENABLED(CONFIG_IOMMU_SVA) &&
+	       cpus_have_final_cap(ARM64_HAS_LS64_ACCDATA);
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
 
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 12a500181291..56b4b68407a9 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -93,6 +93,9 @@
 	cmp	x1, #ID_AA64ISAR1_EL1_LS64_LS64_V
 	b.lt	.Lset_hcrx_\@
 	orr	x0, x0, #HCRX_EL2_EnASR
+	cmp	x1, #ID_AA64ISAR1_EL1_LS64_LS64_ACCDATA
+	b.lt	.Lset_hcrx_\@
+	orr	x0, x0, #HCRX_EL2_EnAS0
 
 .Lset_hcrx_\@:
 	msr_s	SYS_HCRX_EL2, x0
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
index 803b68758152..1eb171cd546e 100644
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
+		write_sysreg_s(pasid, SYS_ACCDATA_EL1);
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
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 481f1999f7c1..bf5ea7bc871a 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -264,7 +264,7 @@ static inline void task_set_sve_vl_onexec(struct task_struct *task,
 
 #define SCTLR_USER_MASK                                                        \
 	(SCTLR_ELx_ENIA | SCTLR_ELx_ENIB | SCTLR_ELx_ENDA | SCTLR_ELx_ENDB |   \
-	 SCTLR_EL1_TCF0_MASK | SCTLR_EL1_TCSO0_MASK)
+	 SCTLR_EL1_TCF0_MASK | SCTLR_EL1_TCSO0_MASK | SCTLR_EL1_EnAS0_MASK)
 
 static inline void arch_thread_struct_whitelist(unsigned long *offset,
 						unsigned long *size)
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
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 42b15b0c069f..ae0af4d7cbc2 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -340,6 +340,29 @@ static int copy_thread_gcs(struct task_struct *p,
 
 #endif
 
+#ifdef CONFIG_IOMMU_SVA
+static void flush_ls64_accdata(void)
+{
+	if (!system_supports_ls64_accdata() ||
+	    !(current->thread.sctlr_user & SCTLR_EL1_EnAS0))
+		return;
+
+	preempt_disable();
+	current->thread.sctlr_user &= ~SCTLR_EL1_EnAS0;
+	update_sctlr_el1(current->thread.sctlr_user);
+	preempt_enable();
+}
+
+static void copy_thread_ls64_accdata(struct task_struct *p)
+{
+	/* Turn off ls64_accdata for new thread */
+	p->thread.sctlr_user &= ~SCTLR_EL1_EnAS0;
+}
+#else
+static void flush_ls64_accdata(void) { }
+static void copy_thread_ls64_accdata(struct task_struct *p) { }
+#endif
+
 void flush_thread(void)
 {
 	fpsimd_flush_thread();
@@ -348,6 +371,7 @@ void flush_thread(void)
 	flush_tagged_addr_state();
 	flush_poe();
 	flush_gcs();
+	flush_ls64_accdata();
 }
 
 void exit_thread(struct task_struct *tsk)
@@ -524,6 +548,7 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		if (system_supports_poe())
 			p->thread.por_el0 = POR_EL0_INIT;
 	}
+	copy_thread_ls64_accdata(p);
 	p->thread.cpu_context.pc = (unsigned long)ret_from_fork;
 	p->thread.cpu_context.sp = (unsigned long)childregs;
 	/*
diff --git a/arch/arm64/kernel/suspend.c b/arch/arm64/kernel/suspend.c
index 4c281ae6babe..b60c782d5e34 100644
--- a/arch/arm64/kernel/suspend.c
+++ b/arch/arm64/kernel/suspend.c
@@ -42,6 +42,20 @@ void __init cpu_suspend_set_dbg_restorer(int (*hw_bp_restore)(unsigned int))
 	hw_breakpoint_restore = hw_bp_restore;
 }
 
+static void ls64_accdata_suspend_exit(void)
+{
+	u32 pasid;
+
+	if (!system_supports_ls64_accdata())
+		return;
+
+	/* if current thread has accdata enabled, restore the pasid value */
+	if (current->thread.sctlr_user & SCTLR_EL1_EnAS0) {
+		pasid = mm_get_enqcmd_pasid(current->mm);
+		write_sysreg_s(pasid, SYS_ACCDATA_EL1);
+	}
+}
+
 void notrace __cpu_suspend_exit(void)
 {
 	unsigned int cpu = smp_processor_id();
@@ -86,6 +100,9 @@ void notrace __cpu_suspend_exit(void)
 
 	/* Restore additional feature-specific configuration */
 	ptrauth_suspend_exit();
+
+	/* Restore accdata for st64bv0 */
+	ls64_accdata_suspend_exit();
 }
 
 /*
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index d6391ab20db3..b69943bfa297 100644
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
@@ -543,6 +544,63 @@ void do_el1_mops(struct pt_regs *regs, unsigned long esr)
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
+	/* unexpectedly already enabled, signal bus error */
+	if (current->thread.sctlr_user & SCTLR_EL1_EnAS0)
+		return false;
+
+	/* no PASID set, disallow */
+	pasid = mm_get_enqcmd_pasid(current->mm);
+	if (pasid == IOMMU_PASID_INVALID)
+		return false;
+
+	preempt_disable();
+	write_sysreg_s(pasid, SYS_ACCDATA_EL1);
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
+		if (!system_supports_ls64_accdata())
+			break;
+
+		if (try_enable_st64bv0(regs, esr))
+			return;
+
+		force_signal_inject(SIGBUS, BUS_OBJERR, regs->pc, 0);
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
@@ -842,6 +900,7 @@ static const char *esr_class_str[] = {
 	[ESR_ELx_EC_FP_ASIMD]		= "ASIMD",
 	[ESR_ELx_EC_CP10_ID]		= "CP10 MRC/VMRS",
 	[ESR_ELx_EC_PAC]		= "PAC",
+	[ESR_ELx_EC_OTHER]		= "OTHER",
 	[ESR_ELx_EC_CP14_64]		= "CP14 MCRR/MRRC",
 	[ESR_ELx_EC_BTI]		= "BTI",
 	[ESR_ELx_EC_ILL]		= "PSTATE.IL",
diff --git a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
index 4a008c8a696b..2d6f4dfd564f 100644
--- a/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
+++ b/arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h
@@ -143,10 +143,14 @@ static inline bool ctxt_has_accdata(struct kvm_cpu_context *ctxt)
 {
 	struct kvm_vcpu *vcpu;
 
-	/* The host never uses ACCDATA_EL1 */
-	if (!cpus_have_final_cap(ARM64_HAS_LS64_ACCDATA) || !ctxt_is_guest(ctxt))
+	/* The hardware does not support ACCDATA_EL1 */
+	if (!cpus_have_final_cap(ARM64_HAS_LS64_ACCDATA))
 		return false;
 
+	/* host only cares if SVA is enabled */
+	if (!ctxt_is_guest(ctxt))
+		return IS_ENABLED(CONFIG_IOMMU_SVA);
+
 	vcpu = ctxt_to_vcpu(ctxt);
 	return kvm_has_feat(kern_hyp_va(vcpu->kvm), ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA);
 }
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


