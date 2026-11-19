Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2028606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 16:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p6gV30S4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J3IUvwhj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3ZAGITeIDsUKFb6XuKvNIy4TOQnpcpSLETmJV6zy9Ms=; b=p6gV30S4/0XLhFKonFyLgZX4LV
	MQCRIPkswnc179ugLGBzmrk4mi6BPvQ2G3zAN20csiqzTn/3DzwPUVL+zthPjCxwatkjeTSxS+jza
	WDReViicPVMFVb3+Db7EShIju4ULkuFNmaKUOsf7fDJs3S3pestLA8R+CEWaWG8g/q8ze1Af/a7j4
	+HxK+mOqDPU/Ld7CXURXnoAo1V4c9RpGJLNaD2Ylqu6LOGG7qJ2WQaECeZbF/fluRKIwPOu9OHfz1
	mxhrB5RAW1Jv+BPdj+cGDgx1zUnJDnkbLe6bVD8Q6K0KUpMTCnV+KlK5SX5+cLb5jP/CUcxGWEXl9
	WKeBJJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5A4-0000000Cg2y-2gWh;
	Thu, 19 Nov 2026 16:39:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU5A2-0000000Cg2b-2fdS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 16:38:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4A945435A3;
	Thu, 19 Nov 2026 16:38:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69EC91F000C5;
	Thu, 19 Nov 2026 16:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795106338;
	bh=3ZAGITeIDsUKFb6XuKvNIy4TOQnpcpSLETmJV6zy9Ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J3IUvwhjPDet3WjK93G3ukAFMtbyJJWyCUe/BqVKsPtgZVzF0ubWukjBiq8DiUsHq
	 dLFMFVhelLgLEKp+B7RbHxEaKbKCewxRbaZZOBL2Zvlcs2ayBHeZyEq4ut2tH9O7Xo
	 I3XFiPW87rQof4LMzdDIEnUe9XFQwE8pxrOCIR2heLtDRXu0x0f+PR4T6hibhM5Y+c
	 w25cUkwM615YXjykXf0Ymc3dPyjmKikVKHVbuaaWW41j+Lrw+YUC5ylZGWTxxEfkHW
	 ip9uABnFUSdqDPNQr12aZAqIAYdJ73uzgAUDDoD2LN+cOTbvRqIsS+pU2HbtYxhAyE
	 6ookO+SUBQ1cg==
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.ams.internal (Postfix) with ESMTP id 30D8B1980066;
	Thu, 19 Nov 2026 11:38:54 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Thu, 19 Nov 2026 11:38:56 -0500
X-ME-Sender: <xms:HSb_aiHbrxg9bRvm1YT6eKGCOBwlxSOOprh7iwTIOAOkXa5EFeWAcg>
    <xme:HSb_ajy6mD324gDhgtkhSt9nk_cJ_-uNGyxE2_XticbmkiLKrBnjushZPuW19w8eh
    7Db2eUmdmKqpvpe3WAo8HTZFR92O4UEVNg3iTHkMCC4w6MbjrxHwFFP>
X-ME-Received: <xmr:HSb_ahl3Z_22p2PfpJRiG5X7UXK0P6dNGcgcV87l7cZ1YH9bzTNhz64KUpo>
X-ME-Proxy-Cause: dmFkZTFZSPME4wMGk/g+Q0V2ryhRN26AmIB4l8yQaR9e4QC0yJ9iKAPc9jj2r9cDbeh+lu
    Bcw5Ah2A8acsn3OJpLo+K8yHhnp4IaewNVZj9a6dOhGhe/D3JkeJgWBooRC1GWer0uCIVZ
    mJi5nbkYy4zPpXJVeP9IDfbrAd6TYSr9cuYtoCgGO7LAWZMuGD24H5N4HmVlJeOwaAbP3U
    I58b0p9IM6n079Xa8y78u0c5MH/iXEZuBdV6BqErFUqeH/unZ6FkHHmeVxqd2aPBSe3Xk2
    BY8a7Rrv76xdzyZziiqTWDc3ghjwPkW8NjSo9G9MsdEmFHkMyJNbWs1f7BtXTECL4nDKkD
    pKL2UkMDmDtAeJ/3mSiyLcgc/cfy6eH/rhSwxPcWwZTICawdsiKy6XEz68e6optHcnu6Rq
    HoFC2E8U/XlsN8jqAWr6N8EwvqTQIb80OWF5Z4E/bD984mXMl2P2I+IRWGz0YDPIROcR9G
    bJEemg75aVFD8rNAY2qd7ghMjvks2JF1EDp2AmvFkB7x6xYg+1xp4jf5BrE1F4ZbT+BI7R
    QXpv5uxVhVZZrpyXDkwvGdf6BBtvmnSDMtNIXU4mASdjdAVsrORLmz6H7L1WcVQPATKISW
    oKIeV35K7JA+zCIyvP+S5qIx5SAPDbskcHCTdg0E4I8HDt2WHEzjJbM+1xmg
X-ME-Proxy: <xmx:HSb_aqCCUmnOOSdJ7Ou0451P2gC4cBoMxK804ingspsQviSvAMur_w>
    <xmx:HSb_asLWtBwJiI-v5JFLyyhaFz9Rru8ThXuyA83AfGUO9nGJRkLVhw>
    <xmx:HSb_atzDkv5qse1FOD5CBvvw_Gd1d4H2ZI5-aB1D0PLe26AwH6M3QA>
    <xmx:HSb_agzyBv4m8EjPaR6FXott_skYYIUGH4GhYcrKBTSFiOv8enVDSw>
    <xmx:HSb_av19jbfjO6QKZKP_J1KIP4ZLoDeyc96g--dN-K34Wq5EbE1ENMMA>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Nov 2026 11:38:52 -0500 (EST)
Date: Thu, 19 Nov 2026 16:38:51 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: [PATCH v2 00/39] arm64: Add support for FEAT_NMI
Message-ID: <av8lNnZPXOwlS7au@shutemov.name>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
 <58a4c350-539d-49ca-826f-d19563895a29@huawei.com>
 <17149b32-6b9c-4364-b664-5789f0633e9d@huawei.com>
 <57757469-2545-4fc6-a7be-ccc133555052@arm.com>
 <38d04e8b-2f31-4616-8a8e-2747c7ce114d@huawei.com>
 <d4bb2979-4bc2-436c-8f4a-c9a5decea900@arm.com>
 <av8bByU93_nCbPqE@shutemov.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <av8bByU93_nCbPqE@shutemov.name>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, Jinjie Ruan <ruanjinjie@huawei.com>, liaochang1@huawei.com, ashok.raj@oss.qualcomm.com, maz@kernel.org, will@kernel.org, lpieralisi@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 19, 2026 at 04:07:19PM +0000, Kiryl Shutsemau (Meta) wrote:
>   - Kernel: never signal a CPU that has SDEI masked. The signalling CPU
>     and the cpu_pm notifier can handshake: the sender marks the target
>     and IPIs it instead if it is already masked, and the notifier
>     refuses the power-down state while a signal is in flight. SDEI keeps
>     serving every running CPU, and the race goes away whatever the
>     firmware does. It needs a hook in arm_sdei.c.

Here is what I meant.

sdei_event_signal() refuses a masked target with -EAGAIN, and the
backtrace sends those CPUs the regular IPI. A PE that sees a signal on
its way stays out of the power-down state; the mask paths that cannot
fail wait for it, up to a millisecond.

On QEMU with TF-A minus the v2.13 check, masking a CPU through
cpu_pm_enter() and then signalling it gets -EAGAIN instead of the wedge,
and sysrq-l still goes over SDEI to the other CPUs.

I can send proper patches if it looks reasonable.

diff --git a/arch/arm64/include/asm/nmi.h b/arch/arm64/include/asm/nmi.h
index 2e8974ff8d63..561d062921e4 100644
--- a/arch/arm64/include/asm/nmi.h
+++ b/arch/arm64/include/asm/nmi.h
@@ -44,5 +44,6 @@ static inline void sdei_nmi_stop_cpus(const cpumask_t *mask) { }
  * Defined in arch/arm64/kernel/smp.c.
  */
 void __noreturn arm64_nmi_cpu_stop(struct pt_regs *regs, bool die_on_crash);
+void arm64_backtrace_ipi(cpumask_t *mask);
 
 #endif /* __ASM_NMI_H */
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 014b163ce658..8369a4cd3e32 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -946,7 +946,7 @@ static void arm64_send_ipi(const cpumask_t *mask, unsigned int nr)
 			__ipi_send_single(get_ipi_desc(cpu, nr), cpu);
 }
 
-static void arm64_backtrace_ipi(cpumask_t *mask)
+void arm64_backtrace_ipi(cpumask_t *mask)
 {
 	arm64_send_ipi(mask, IPI_CPU_BACKTRACE);
 }
diff --git a/drivers/firmware/arm_sdei.c b/drivers/firmware/arm_sdei.c
index e8dd2f0f3919..86f4349fc364 100644
--- a/drivers/firmware/arm_sdei.c
+++ b/drivers/firmware/arm_sdei.c
@@ -12,6 +12,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/cpu.h>
 #include <linux/cpu_pm.h>
+#include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/hardirq.h>
 #include <linux/kernel.h>
@@ -32,6 +33,8 @@
 #include <linux/smp.h>
 #include <linux/spinlock.h>
 
+#include <asm/smp_plat.h>
+
 /*
  * The call to use to reach the firmware.
  */
@@ -299,10 +302,37 @@ static int sdei_api_get_version(u64 *version)
 	return invoke_sdei_fn(SDEI_1_0_FN_SDEI_VERSION, 0, 0, 0, 0, 0, version);
 }
 
+/*
+ * Event 0 must not land on a masked PE. The sender and the masking PE
+ * each set their own flag, then read the other's.
+ */
+static DEFINE_PER_CPU(bool, sdei_pe_unmasked);
+static DEFINE_PER_CPU(bool, sdei_signal_pending);
+
+static bool sdei_mark_masked(void)
+{
+	this_cpu_write(sdei_pe_unmasked, false);
+	smp_mb();
+	return this_cpu_read(sdei_signal_pending);
+}
+
+static void sdei_block_signal(void)
+{
+	int i;
+
+	if (!sdei_mark_masked())
+		return;
+
+	for (i = 0; i < USEC_PER_MSEC && this_cpu_read(sdei_signal_pending); i++)
+		udelay(1);
+}
+
 int sdei_mask_local_cpu(void)
 {
 	int err;
 
+	sdei_block_signal();
+
 	err = invoke_sdei_fn(SDEI_1_0_FN_SDEI_PE_MASK, 0, 0, 0, 0, 0, NULL);
 	if (err && err != -EIO) {
 		pr_warn_once("failed to mask CPU[%u]: %d\n",
@@ -330,6 +360,7 @@ int sdei_unmask_local_cpu(void)
 		return err;
 	}
 
+	this_cpu_write(sdei_pe_unmasked, true);
 	return 0;
 }
 
@@ -344,10 +375,23 @@ static void _ipi_unmask_cpu(void *ignored)
  * but the SMC -- no locks, no event lookup -- so it is safe from NMI /
  * crash context (e.g. the cross-CPU NMI service).
  */
-int sdei_event_signal(u32 event_num, u64 mpidr)
+int sdei_event_signal(u32 event_num, unsigned int cpu)
 {
-	return invoke_sdei_fn(SDEI_1_0_FN_SDEI_EVENT_SIGNAL, event_num,
-			      mpidr, 0, 0, 0, NULL);
+	int err;
+
+	WRITE_ONCE(per_cpu(sdei_signal_pending, cpu), true);
+	smp_mb();
+	if (!READ_ONCE(per_cpu(sdei_pe_unmasked, cpu))) {
+		WRITE_ONCE(per_cpu(sdei_signal_pending, cpu), false);
+		return -EAGAIN;
+	}
+
+	err = invoke_sdei_fn(SDEI_1_0_FN_SDEI_EVENT_SIGNAL, event_num,
+			     cpu_logical_map(cpu), 0, 0, 0, NULL);
+	if (err)
+		WRITE_ONCE(per_cpu(sdei_signal_pending, cpu), false);
+
+	return err;
 }
 NOKPROBE_SYMBOL(sdei_event_signal);
 
@@ -680,6 +724,8 @@ static int sdei_cpuhp_down(unsigned int cpu)
 	struct sdei_event *event;
 	int err;
 
+	sdei_block_signal();
+
 	/* un-register private events */
 	spin_lock(&sdei_list_lock);
 	list_for_each_entry(event, &sdei_list, list) {
@@ -702,6 +748,8 @@ static int sdei_cpuhp_up(unsigned int cpu)
 	struct sdei_event *event;
 	int err;
 
+	this_cpu_write(sdei_signal_pending, false);
+
 	/* re-register/enable private events */
 	spin_lock(&sdei_list_lock);
 	list_for_each_entry(event, &sdei_list, list) {
@@ -739,6 +787,10 @@ static int sdei_pm_notifier(struct notifier_block *nb, unsigned long action,
 
 	switch (action) {
 	case CPU_PM_ENTER:
+		if (sdei_mark_masked()) {
+			this_cpu_write(sdei_pe_unmasked, true);
+			return notifier_from_errno(-EBUSY);
+		}
 		rv = sdei_mask_local_cpu();
 		break;
 	case CPU_PM_EXIT:
@@ -1114,6 +1166,9 @@ int sdei_event_handler(struct pt_regs *regs,
 	int err;
 	u32 event_num = arg->event_num;
 
+	if (!event_num)
+		__this_cpu_write(sdei_signal_pending, false);
+
 	err = arg->callback(event_num, regs, arg->callback_arg);
 	if (err)
 		pr_err_ratelimited("event %u on CPU %u failed with error: %d\n",
diff --git a/drivers/firmware/arm_sdei_nmi.c b/drivers/firmware/arm_sdei_nmi.c
index 038eb79e28ac..9e2ea532888a 100644
--- a/drivers/firmware/arm_sdei_nmi.c
+++ b/drivers/firmware/arm_sdei_nmi.c
@@ -125,15 +125,19 @@ static int sdei_nmi_handler(u32 event, struct pt_regs *regs, void *arg)
 }
 NOKPROBE_SYMBOL(sdei_nmi_handler);
 
-static void sdei_nmi_fire(unsigned int target_cpu)
+static int sdei_nmi_fire(unsigned int target_cpu)
 {
-	int err = sdei_event_signal(SDEI_NMI_EVENT, cpu_logical_map(target_cpu));
+	int err = sdei_event_signal(SDEI_NMI_EVENT, target_cpu);
 
-	if (err)
+	if (err && err != -EAGAIN)
 		pr_warn("SDEI_EVENT_SIGNAL to CPU %u failed: %d\n",
 			target_cpu, err);
+
+	return err;
 }
 
+static cpumask_t sdei_nmi_ipi_mask;
+
 /*
  * Raise callback for nmi_trigger_cpumask_backtrace(): signal event 0
  * at every CPU still pending in @mask. The framework excludes the local
@@ -150,8 +154,14 @@ static void sdei_nmi_raise_backtrace(cpumask_t *mask)
 	 */
 	dsb(ishst);
 
-	for_each_cpu(cpu, mask)
-		sdei_nmi_fire(cpu);
+	cpumask_clear(&sdei_nmi_ipi_mask);
+	for_each_cpu(cpu, mask) {
+		if (sdei_nmi_fire(cpu) == -EAGAIN)
+			cpumask_set_cpu(cpu, &sdei_nmi_ipi_mask);
+	}
+
+	if (!cpumask_empty(&sdei_nmi_ipi_mask))
+		arm64_backtrace_ipi(&sdei_nmi_ipi_mask);
 }
 
 /*
diff --git a/include/linux/arm_sdei.h b/include/linux/arm_sdei.h
index b9dc21c241be..3f565a0f4a17 100644
--- a/include/linux/arm_sdei.h
+++ b/include/linux/arm_sdei.h
@@ -41,7 +41,7 @@ int sdei_event_disable(u32 event_num);
  * Signal the software-signalled event (event 0) to another PE, NMI-like.
  * @mpidr is the target's MPIDR affinity.
  */
-int sdei_event_signal(u32 event_num, u64 mpidr);
+int sdei_event_signal(u32 event_num, unsigned int cpu);
 
 /* Was SDEI firmware probed and usable? */
 bool sdei_is_present(void);
-- 
  Kiryl Shutsemau / Kirill A. Shutemov

