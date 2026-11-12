Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C5F606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YqmVDEV8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=TMHxpbnc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r7zCHpZcBo4ne45VHzFhSLbzizVk7Bi/VJidN5b+xtM=; b=YqmVDEV8XgH7JI5HPVxHlUperY
	1GmNmeaPcQU8NtucRkJ3aRb+1NOuJKx8dl8ezKx2ZY/oUaDFFAT7HWxkON9zUaF7RFDB5XU0u3x/7
	42efqOfVDwWreNcgeQEXG1vkEZJU+xPgKMLiT08isqQrsvOHAkZisc0pnKPhP1E1bpu6H5bVQUQJh
	HE8UYFUY7lmk2l03bPbJ/dnbGMAI+LiqLV3s9s6MZFGiVmJe3a9jzSBlyzkLMXqHJcKHGd/o5v3Z+
	hPqMLAzPtI5GJR/lZaUqHxtw5Brp4OVNi11d41mrRYnOBzvNqMTO4Kyjk9DjgsiQ+vMmBMgG2rpRP
	QZ+TR18Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkh-0000000A0nq-3tB0;
	Thu, 12 Nov 2026 13:22:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUkY-0000000A0eY-1W2x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:21:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67E001477;
	Thu, 12 Nov 2026 05:21:54 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EA97A3FA7A;
	Thu, 12 Nov 2026 05:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489717; bh=WTrKn0Lz3OEi1erW8nu8Ekezs3xBbLhZ0ywEdA4gbCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TMHxpbnc8oQJ4xyIDDwrK4cA50Li2DBpzx1mm3vXCcVuWA2lgj4pjpUgo1HyNeYii
	 ziDO9RC4UX9/2gMdCuGGc1hkEHkFdE8M6pVPkTrihT8nVxmJobt81z2Kq0KYxlGcit
	 xayBmtrwioc2pdpjZOD/8vrO7oElfIWwhluXUOK0=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 09/39] arm64: replace local_daif helpers
Date: Thu, 12 Nov 2026 13:20:12 +0000
Message-Id: <20261112132042.129062-10-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052158_508722_0BEF83E8 
X-CRM114-Status: GOOD (  25.49  )
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

Replace existing `local_daif_...` usage with the new `local_exceptions_...`
helpers, adding the necessary save-state struct where required.

Rework `apei_claim_sea()`'s handling of interrupt masking to
fit with the new APIs. Currently, it saves the DAIF flags to restore
later and the `local_irq` ones to check if interrupts are disabled.
It then masks AIF to signal the SEA (forcing DAIF masking), and will
unmask to IF (re-enabling PMR masking if pseudo-NMIs are in use) if it
interrupted a task with interrupts unmaksed, restoring with the DAIF
flags from the beginning afterwards. It is not clear why masking has
to be nested, so take an opportunity to do masking sequentially:
mask/unmask AIF around the SEA signaling and mask/unmask IRQ if we
interrupted a task with interrupts unmaksed.

Remove the use of GIC_PRIO_PSR_I_SET in `kvm/hyp/nvhe/switch.c`,
as we now check both PMR and DAIF everywhere and we don't need to signal
interrupts being masked in DAIF in the PMR anymore.

Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 arch/arm64/kernel/acpi.c          | 43 ++++++++++++++-----------------
 arch/arm64/kernel/hibernate.c     | 14 +++++-----
 arch/arm64/kernel/hw_breakpoint.c | 16 +++++++-----
 arch/arm64/kernel/machine_kexec.c |  4 +--
 arch/arm64/kernel/setup.c         |  4 +--
 arch/arm64/kernel/smp.c           | 10 +++----
 arch/arm64/kernel/suspend.c       | 14 +++++-----
 arch/arm64/kvm/hyp/nvhe/switch.c  |  2 +-
 arch/arm64/kvm/hyp/vgic-v3-sr.c   |  7 ++---
 arch/arm64/kvm/hyp/vhe/switch.c   | 14 +++++-----
 arch/arm64/mm/mmu.c               |  7 ++---
 11 files changed, 68 insertions(+), 67 deletions(-)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 681aa2bbc399..b488e04249d0 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -33,7 +33,7 @@
 #include <acpi/processor.h>
 #include <asm/cputype.h>
 #include <asm/cpu_ops.h>
-#include <asm/daifflags.h>
+#include <asm/interrupts/masking.h>
 #include <asm/smp_plat.h>
 
 int acpi_noirq = 1;		/* skip ACPI IRQ initialization */
@@ -388,48 +388,43 @@ void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
  */
 int apei_claim_sea(struct pt_regs *regs)
 {
+	arm64_exc_hwstates_t hwstate;
+	bool irqs_disabled;
 	int err = -ENOENT;
-	bool return_to_irqs_enabled;
-	unsigned long current_flags;
 
 	if (!IS_ENABLED(CONFIG_ACPI_APEI_GHES))
 		return err;
 
-	current_flags = local_daif_save_flags();
-
-	/* current_flags isn't useful here as daif doesn't tell us about pNMI */
-	return_to_irqs_enabled = !irqs_disabled_flags(arch_local_save_flags());
-
-	if (regs)
-		return_to_irqs_enabled = !regs_irqs_disabled(regs);
-
 	/*
 	 * SEA can interrupt SError, mask it and describe this as an NMI so
 	 * that APEI defers the handling.
 	 */
-	local_daif_restore(DAIF_ERRCTX);
+	hwstate = local_exceptions_save_mask(ERROR_CONTEXT);
 	nmi_enter();
 	err = ghes_notify_sea();
 	nmi_exit();
+	local_exceptions_restore(hwstate);
+
+	if (err)
+		return err;
 
 	/*
 	 * APEI NMI-like notifications are deferred to irq_work. Unless
 	 * we interrupted irqs-masked code, we can do that now.
 	 */
-	if (!err) {
-		if (return_to_irqs_enabled) {
-			local_daif_restore(DAIF_PROCCTX_NOIRQ);
-			__irq_enter();
-			irq_work_run();
-			__irq_exit();
-		} else {
-			pr_warn_ratelimited("APEI work queued but not completed\n");
-			err = -EINPROGRESS;
-		}
+	irqs_disabled = regs ? regs_irqs_disabled(regs) : arch_irqs_disabled_flags(hwstate.saved.flags);
+
+	if (!irqs_disabled) {
+		hwstate = local_exceptions_save_mask(NOIRQ_CONTEXT);
+		__irq_enter();
+		irq_work_run();
+		__irq_exit();
+		local_exceptions_restore(hwstate);
+	} else {
+		pr_warn_ratelimited("APEI work queued but not completed\n");
+		err = -EINPROGRESS;
 	}
 
-	local_daif_restore(current_flags);
-
 	return err;
 }
 
diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 8c39863d2d63..7712b6e87797 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -22,7 +22,7 @@
 #include <asm/barrier.h>
 #include <asm/cacheflush.h>
 #include <asm/cputype.h>
-#include <asm/daifflags.h>
+#include <asm/interrupts/masking.h>
 #include <asm/irqflags.h>
 #include <asm/kexec.h>
 #include <asm/memory.h>
@@ -346,16 +346,16 @@ static void swsusp_mte_restore_tags(void)
 
 int swsusp_arch_suspend(void)
 {
-	int ret = 0;
-	unsigned long flags;
 	struct sleep_stack_data state;
+	arm64_exc_hwstates_t hwstate;
+	int ret = 0;
 
 	if (cpus_are_stuck_in_kernel()) {
 		pr_err("Can't hibernate: no mechanism to offline secondary CPUs.\n");
 		return -EBUSY;
 	}
 
-	flags = local_daif_save();
+	hwstate = local_exceptions_save_mask(CRITICAL_CONTEXT);
 
 	if (__cpu_suspend_enter(&state)) {
 		/* make the crash dump kernel image visible/saveable */
@@ -363,7 +363,7 @@ int swsusp_arch_suspend(void)
 
 		ret = swsusp_mte_save_tags();
 		if (ret) {
-			local_daif_restore(flags);
+			local_exceptions_restore(hwstate);
 			return ret;
 		}
 
@@ -407,7 +407,7 @@ int swsusp_arch_suspend(void)
 		spectre_v4_enable_mitigation(NULL);
 	}
 
-	local_daif_restore(flags);
+	local_exceptions_restore(hwstate);
 
 	return ret;
 }
@@ -491,7 +491,7 @@ int __nocfi swsusp_arch_resume(void)
 	 *   swsusp_arch_resume(), and expects to be re-entered in the
 	 *   same state : with all DAIF exceptions masked.
 	 */
-	local_daif_save();
+	local_exceptions_save_mask(CRITICAL_CONTEXT);
 	hibernate_exit(virt_to_phys(tmp_pg_dir), resume_hdr.ttbr1_el1,
 		       resume_hdr.reenter_kernel, restore_pblist,
 		       resume_hdr.__hyp_stub_vectors, virt_to_phys(zero_page));
diff --git a/arch/arm64/kernel/hw_breakpoint.c b/arch/arm64/kernel/hw_breakpoint.c
index 32b38967433e..f20f37d9d602 100644
--- a/arch/arm64/kernel/hw_breakpoint.c
+++ b/arch/arm64/kernel/hw_breakpoint.c
@@ -20,11 +20,11 @@
 #include <linux/uaccess.h>
 
 #include <asm/current.h>
-#include <asm/daifflags.h>
 #include <asm/debug-monitors.h>
 #include <asm/esr.h>
 #include <asm/exception.h>
 #include <asm/hw_breakpoint.h>
+#include <asm/interrupts/masking.h>
 #include <asm/traps.h>
 #include <asm/cputype.h>
 #include <asm/system_misc.h>
@@ -299,18 +299,18 @@ static int hw_breakpoint_control(struct perf_event *bp,
  */
 int arch_install_hw_breakpoint(struct perf_event *bp)
 {
-	unsigned long daif = local_daif_save();
+	arm64_exc_hwstates_t hwstate = local_exceptions_save_mask(CRITICAL_CONTEXT);
 	int ret = hw_breakpoint_control(bp, HW_BREAKPOINT_INSTALL);
 
-	local_daif_restore(daif);
+	local_exceptions_restore(hwstate);
 	return ret;
 }
 
 void arch_uninstall_hw_breakpoint(struct perf_event *bp)
 {
-	unsigned long daif = local_daif_save();
+	arm64_exc_hwstates_t hwstate = local_exceptions_save_mask(CRITICAL_CONTEXT);
 	hw_breakpoint_control(bp, HW_BREAKPOINT_UNINSTALL);
-	local_daif_restore(daif);
+	local_exceptions_restore(hwstate);
 }
 
 static int get_hbp_len(u8 hbp_len)
@@ -945,7 +945,9 @@ void hw_breakpoint_thread_switch(struct task_struct *next)
 	 */
 
 	struct debug_info *current_debug_info, *next_debug_info;
-	unsigned long daif = local_daif_save();
+	arm64_exc_hwstates_t hwstate;
+
+	hwstate = local_exceptions_save_mask(CRITICAL_CONTEXT);
 
 	current_debug_info = &current->thread.debug;
 	next_debug_info = &next->thread.debug;
@@ -962,7 +964,7 @@ void hw_breakpoint_thread_switch(struct task_struct *next)
 				    DBG_ACTIVE_EL0,
 				    !next_debug_info->wps_disabled);
 
-	local_daif_restore(daif);
+	local_exceptions_restore(hwstate);
 }
 
 /*
diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
index 48f343704cb5..91f0d1e99db5 100644
--- a/arch/arm64/kernel/machine_kexec.c
+++ b/arch/arm64/kernel/machine_kexec.c
@@ -18,7 +18,7 @@
 
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
-#include <asm/daifflags.h>
+#include <asm/interrupts/masking.h>
 #include <asm/memory.h>
 #include <asm/mmu.h>
 #include <asm/mmu_context.h>
@@ -185,7 +185,7 @@ void machine_kexec(struct kimage *kimage)
 
 	pr_info("Bye!\n");
 
-	local_daif_mask();
+	local_exceptions_final_mask();
 
 	/*
 	 * Both restart and kernel_reloc will shutdown the MMU, disable data
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index a707deba6ae7..49914965b790 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -38,7 +38,7 @@
 #include <asm/fixmap.h>
 #include <asm/cpu.h>
 #include <asm/cputype.h>
-#include <asm/daifflags.h>
+#include <asm/interrupts/masking.h>
 #include <asm/elf.h>
 #include <asm/cpufeature.h>
 #include <asm/cpu_ops.h>
@@ -311,7 +311,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
 	 * IRQ and FIQ will be unmasked after the root irqchip has been
 	 * detected and initialized.
 	 */
-	local_daif_restore(DAIF_PROCCTX_NOIRQ);
+	local_exceptions_cpu_init_mask(NOIRQ_CONTEXT);
 
 	/*
 	 * TTBR0 is only used for the identity mapping at this stage. Make it
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 0e3d0fa25dd2..cb04f2c37d9a 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -43,7 +43,7 @@
 #include <asm/cpu.h>
 #include <asm/cputype.h>
 #include <asm/cpu_ops.h>
-#include <asm/daifflags.h>
+#include <asm/interrupts/masking.h>
 #include <asm/kvm_mmu.h>
 #include <asm/mmu_context.h>
 #include <asm/nmi.h>
@@ -267,7 +267,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	 * as the root irqchip has already been detected and initialized we can
 	 * unmask IRQ and FIQ at the same time.
 	 */
-	local_daif_restore(DAIF_PROCCTX);
+	local_exceptions_cpu_init_mask(PROCESS_CONTEXT);
 
 	/*
 	 * OK, it's off to the idle thread for us
@@ -374,7 +374,7 @@ void __noreturn cpu_die(void)
 
 	idle_task_exit();
 
-	local_daif_mask();
+	local_exceptions_final_mask();
 
 	/* Tell cpuhp_bp_sync_dead() that this CPU is now safe to dispose of */
 	cpuhp_ap_report_dead();
@@ -898,14 +898,14 @@ void __noreturn arm64_nmi_cpu_stop(struct pt_regs *regs, bool die_on_crash)
 	bool crash = IS_ENABLED(CONFIG_KEXEC_CORE) && crash_stop;
 
 	/*
-	 * Use local_daif_mask() instead of local_irq_disable() to make sure
+	 * Use local_exceptions_final_mask() instead of local_irq_disable() to make sure
 	 * that pseudo-NMIs are disabled. The "stop" code starts with an IRQ
 	 * and falls back to NMI (which might be pseudo). If the IRQ finally
 	 * goes through right as we're timing out then the NMI could interrupt
 	 * us. It's better to prevent the NMI and let the IRQ finish since the
 	 * pt_regs will be better.
 	 */
-	local_daif_mask();
+	local_exceptions_final_mask();
 
 #ifdef CONFIG_KEXEC_CORE
 	if (crash && regs)
diff --git a/arch/arm64/kernel/suspend.c b/arch/arm64/kernel/suspend.c
index 3691c4c32904..41cf580a7780 100644
--- a/arch/arm64/kernel/suspend.c
+++ b/arch/arm64/kernel/suspend.c
@@ -9,7 +9,7 @@
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/cpuidle.h>
-#include <asm/daifflags.h>
+#include <asm/interrupts/masking.h>
 #include <asm/debug-monitors.h>
 #include <asm/exec.h>
 #include <asm/fpsimd.h>
@@ -69,7 +69,7 @@ void notrace __cpu_suspend_exit(void)
 	/*
 	 * Restore HW breakpoint registers to sane values
 	 * before debug exceptions are possibly reenabled
-	 * by cpu_suspend()s local_daif_restore() call.
+	 * by cpu_suspend()s local_exceptions_restore() call.
 	 */
 	if (hw_breakpoint_restore)
 		hw_breakpoint_restore(cpu);
@@ -97,7 +97,7 @@ void notrace __cpu_suspend_exit(void)
 int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
 {
 	int ret = 0;
-	unsigned long flags;
+	arm64_exc_hwstates_t hwstate;
 	struct sleep_stack_data state;
 
 	/*
@@ -119,12 +119,12 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
 	 *
 	 * Strictly speaking the trace_hardirqs_off() here is superfluous,
 	 * hardirqs should be firmly off by now. This really ought to use
-	 * something like raw_local_daif_save().
+	 * something like raw_local_exceptions_save_mask().
 	 *
 	 * This also unmasks interrupts in PMR in order to reliably
 	 * resume if we're using pseudo-NMIs.
 	 */
-	flags = local_daif_save();
+	hwstate = local_exceptions_save_mask(CRITICAL_CONTEXT);
 
 	/*
 	 * Function graph tracer state gets inconsistent when the kernel
@@ -158,11 +158,11 @@ int cpu_suspend(unsigned long arg, int (*fn)(unsigned long))
 	unpause_graph_tracing();
 
 	/*
-	 * Restore pstate flags. OS lock and mdscr have been already
+	 * Restore interrupt masks. OS lock and mdscr have been already
 	 * restored, so from this point onwards, debugging is fully
 	 * reenabled if it was enabled when core started shutdown.
 	 */
-	local_daif_restore(flags);
+	local_exceptions_restore(hwstate);
 
 	return ret;
 }
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 89fb9dd351ad..244260365d63 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -291,7 +291,7 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	 * Naturally, we want to avoid this.
 	 */
 	if (system_uses_irq_prio_masking()) {
-		gic_write_pmr(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET);
+		gic_write_pmr(GIC_PRIO_IRQON);
 		pmr_sync();
 	}
 
diff --git a/arch/arm64/kvm/hyp/vgic-v3-sr.c b/arch/arm64/kvm/hyp/vgic-v3-sr.c
index 2dfb5ff9db57..4e570a1ad739 100644
--- a/arch/arm64/kvm/hyp/vgic-v3-sr.c
+++ b/arch/arm64/kvm/hyp/vgic-v3-sr.c
@@ -10,6 +10,7 @@
 #include <linux/irqchip/arm-gic-v3.h>
 #include <linux/kvm_host.h>
 
+#include <asm/interrupts/masking.h>
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
@@ -440,8 +441,8 @@ void __vgic_v3_init_lrs(void)
 /* Return true if GICv3 is MMIO (GICv2) capable, false otherwise */
 bool __vgic_v3_get_gic_config(void)
 {
+	arm64_exc_hwstates_t hwstate;
 	u64 val, sre;
-	unsigned long flags = 0;
 
 	sre = read_gicreg(ICC_SRE_EL1);
 	/*
@@ -462,7 +463,7 @@ bool __vgic_v3_get_gic_config(void)
 	 * of the exception entry to EL2.
 	 */
 	if (has_vhe()) {
-		flags = local_daif_save();
+		hwstate = local_exceptions_save_mask(CRITICAL_CONTEXT);
 	} else {
 		sysreg_clear_set_hcr(0, HCR_EL2_AMO | HCR_EL2_FMO | HCR_EL2_IMO);
 		isb();
@@ -477,7 +478,7 @@ bool __vgic_v3_get_gic_config(void)
 	isb();
 
 	if (has_vhe()) {
-		local_daif_restore(flags);
+		local_exceptions_restore(hwstate);
 	} else {
 		sysreg_clear_set_hcr(HCR_EL2_AMO | HCR_EL2_FMO | HCR_EL2_IMO, 0);
 		isb();
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 3f2390a13173..31da573fb169 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -17,6 +17,7 @@
 
 #include <asm/barrier.h>
 #include <asm/cpufeature.h>
+#include <asm/interrupts/masking.h>
 #include <asm/kprobes.h>
 #include <asm/kvm_asm.h>
 #include <asm/kvm_emulate.h>
@@ -666,9 +667,10 @@ NOKPROBE_SYMBOL(__kvm_vcpu_run_vhe);
 
 int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 {
+	arm64_exc_hwstates_t hwstate;
 	int ret;
 
-	local_daif_mask();
+	hwstate = local_exceptions_save_mask(CRITICAL_CONTEXT);
 
 	/*
 	 * Having IRQs masked via PMR when entering the guest means the GIC
@@ -676,18 +678,18 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	 * only way to get out will be via guest exceptions.
 	 * Naturally, we want to avoid this.
 	 *
-	 * local_daif_mask() already sets GIC_PRIO_PSR_I_SET, we just need a
-	 * dsb to ensure the redistributor is forwards EL2 IRQs to the CPU.
+	 * local_exceptions_save_mask(), via helpers, sets
+	 * GIC_PRIO_IRQON along with pmr_sync(), so we can be shure
+	 * that redistributor forwards EL2 IRQs to the CPU.
 	 */
-	pmr_sync();
 
 	ret = __kvm_vcpu_run_vhe(vcpu);
 
 	/*
-	 * local_daif_restore() takes care to properly restore PSTATE.DAIF
+	 * local_exceptions_restore() takes care to properly restore PSTATE.DAIF
 	 * and the GIC PMR if the host is using IRQ priorities.
 	 */
-	local_daif_restore(DAIF_PROCCTX_NOIRQ);
+	local_exceptions_restore(hwstate);
 
 	return ret;
 }
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 140520b351e2..1267f49815e6 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -33,6 +33,7 @@
 
 #include <asm/barrier.h>
 #include <asm/cputype.h>
+#include <asm/interrupts/masking.h>
 #include <asm/fixmap.h>
 #include <asm/kasan.h>
 #include <asm/kernel-pgtable.h>
@@ -2329,7 +2330,7 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
 	typedef void (ttbr_replace_func)(phys_addr_t);
 	extern ttbr_replace_func idmap_cpu_replace_ttbr1;
 	ttbr_replace_func *replace_phys;
-	unsigned long daif;
+	arm64_exc_hwstates_t hwstate;
 
 	/* phys_to_ttbr() zeros lower 2 bits of ttbr with 52-bit PA */
 	phys_addr_t ttbr1 = phys_to_ttbr(virt_to_phys(pgdp));
@@ -2345,9 +2346,9 @@ void __cpu_replace_ttbr1(pgd_t *pgdp, bool cnp)
 	 * We really don't want to take *any* exceptions while TTBR1 is
 	 * in the process of being replaced so mask everything.
 	 */
-	daif = local_daif_save();
+	hwstate = local_exceptions_save_mask(CRITICAL_CONTEXT);
 	replace_phys(ttbr1);
-	local_daif_restore(daif);
+	local_exceptions_restore(hwstate);
 
 	cpu_uninstall_idmap();
 }
-- 
2.34.1


