Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DAD606A320
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 15:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q9surHjQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ICwn+jjX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4+yM/qgFl4l9o3JMx3spF2QT6RM/tQfu3jiBKfBpPWU=; b=q9surHjQOLvx7CwiXCvcD+IUR8
	YNAmzFZ3IBYGQxzIBqj1EEsYsQQinsl1MuGkd4Efy4O/LWG9ji8eXpHI+eO1QUZVQUHXxC7rWQcLd
	wiNCZEHkiHGSi82z0m5DPdQg+nAfzr5hyNQk5LjPojOGuA3lfoC998+5gFzR9MZFke7D0fDIRsz2L
	VfPOeAfdJ/9rRcmSOKkQawVOSc2wbw+JYanXqpFtt7tGdCT3Fn1Esx1W8PeXp0+EWsDNZsoTxI0vF
	tIpT2cU25i3Zn1LOxWfYmfJTDydllyR7L5G5g+JAat5msacrVm6ngMOQpIcQpy/M/Y5pShwyXQvlC
	S0/ALBHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQDP-0000000FMVa-1hV4;
	Fri, 20 Nov 2026 15:07:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUQDO-0000000FMVL-1UHA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 15:07:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 588E662121;
	Fri, 20 Nov 2026 15:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1389A1F000E1;
	Fri, 20 Nov 2026 15:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795187268;
	bh=4+yM/qgFl4l9o3JMx3spF2QT6RM/tQfu3jiBKfBpPWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ICwn+jjXdJ/AV2+F1RDPOsBJ0vBxr6+MsOPHnhQvniHlCitPue1DIMZv8qhD404d7
	 lHtGWjzktX1k4H1rs8teykvpX3lio9Rq3Xc0ot4QPtW4U7mTLa1jAOnY0+/Sv7hQTh
	 fGjaO59fXERS3rXbVQPxZAOK1eywV23gqohAXbPfk6lJQxs/qHrcc6uLChvQ+9TB0C
	 YJhnc6m1qKcm/Cm/tscwlzGzaI+0k/yFIBmASH/JzqUffgMZjZV/SRgwgw3LpH5Bcj
	 xahJW5dCd6shXmu160r+bUm5mvKm6wDMqgNUJCJuPBYvPafKiZ7lFfZ1CSDANp3hsS
	 J2aHcZDB3b67A==
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfauth.ams.internal (Postfix) with ESMTP id B81401980072;
	Fri, 20 Nov 2026 10:07:44 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Fri, 20 Nov 2026 10:07:46 -0500
X-ME-Sender: <xms:QGIAa8xCkKPZ8_NgvW6cKwos6eIGHTkqfseUr4MJWH6wpE5PEnd2bw>
    <xme:QGIAawuA7Nd52qF0lZTr3g5jUt20_bIP7n3t3TJKIUGgK_aePMrmrXFSrYyihXOl6
    0cOEogYiH0ByWVCaJ9hcMPGE5aT4r3-DQg0B04qHMgARyBB1HCv9wto>
X-ME-Received: <xmr:QGIAazyqntO5klGZaKIJaEl367_czCICsNdMHnySEssbVLgwgHr8_sdatrs>
X-ME-Proxy-Cause: dmFkZTGP8lF8xLEZ+07SN27NgOJevOVv9NHNPEZuTOpvSWsO1l/o0Jvc27g4gVeeDMNRrD
    zvN+AoO9Zb8dwLsynY+gHHBS4g01njbKWV91ZK0R0A0wozHNcUo9LShQAfQSEludL51Fpq
    9Mve0q4/FS6PPXG+76scpM7mFpzPvzWOwep7++KnO4AB4s3fkbf8cHCdyZFx5ZwYJWiIrJ
    gzUkJaVRzvGRFBCevyTHCD5EJ/C6JVz30AS+o5X+9dIXT7vEbPI/bQEduuk1RUIeqpNxf8
    /+YpdR+T16VeUj9BBM6+kCOKStxBpEyA0M+J/V7eTxdfP7Sq8a8RvLcQjOiysyP/cT8uW7
    48EKN142KarTiXbuEIkCQkq3GI2jLwYb0ZN0S/91rpNHo4/V2LeF2fsA/zZa9AYySSEy+v
    ZA8Ud3azwFiZzWCQEA2yZ5GpXKNW8kEltDQ55LGr3b802a1xJxxUG240Q0Q8BZM/GFKcp8
    7MzHJg+ougAOJVJiEQVtKPx5mXpS2nD+7xK+R8cElHzHR04dOhTJQMtnfI9agNEUivV+89
    6512zEULkMcg3uhZyFIoni4O4oRpv2HmY5A0YxPrIahusoHaWiP7oy4cTRs2hcY2yW3OpW
    +87NV7rIu+TRFUp2PXPv85NAtVwyW7DJLTsr7zqQHJxU6uRL2jwJr4xy35eQ
X-ME-Proxy: <xmx:QGIAa4e6CLWJPR11dkga1cdpcg-0p3gQlOcbsCAyYYOmAS_6fAmiCw>
    <xmx:QGIAax0ueOq6YZAH8WIOC3akRHlUxotg3p4nRNoQv9Y6UU99Rlwtvw>
    <xmx:QGIAa5u3Ho1KUZ-cbIK7nFKza0LxMEiRS2-Oenukkt42R6rMDmaBSg>
    <xmx:QGIAa19Ur8LJmQPpYmi3xVogFa1O8Ed0NdFE92lM-AK-G5k0dfdMWw>
    <xmx:QGIAa1TtGVpAlcT-ZqqDTKsuAPaCU88sReubsApHA-A8JWA_3HQv9Uv2>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 10:07:43 -0500 (EST)
Date: Fri, 20 Nov 2026 15:07:42 +0000
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [PATCH v2 00/39] arm64: Add support for FEAT_NMI
Message-ID: <awBeQIq4WvfIIiqA@shutemov.name>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
 <58a4c350-539d-49ca-826f-d19563895a29@huawei.com>
 <17149b32-6b9c-4364-b664-5789f0633e9d@huawei.com>
 <57757469-2545-4fc6-a7be-ccc133555052@arm.com>
 <38d04e8b-2f31-4616-8a8e-2747c7ce114d@huawei.com>
 <d4bb2979-4bc2-436c-8f4a-c9a5decea900@arm.com>
 <av8bByU93_nCbPqE@shutemov.name>
 <3ca9a2a6-88f1-43c5-af5a-2773aa70b444@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="zdocadxby5dc6aab"
Content-Disposition: inline
In-Reply-To: <3ca9a2a6-88f1-43c5-af5a-2773aa70b444@huawei.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, Vladimir Murzin <vladimir.murzin@arm.com>, catalin.marinas@arm.com, lpieralisi@kernel.org, liaochang1@huawei.com, ashok.raj@oss.qualcomm.com, maz@kernel.org, will@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--zdocadxby5dc6aab
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 20, 2026 at 10:11:33AM +0800, Jinjie Ruan wrote:
> Sorry, I seem unable to open this link.

It is Cong Wang's "fix(sdei): keep event 0 pending while the PE is
masked", not reviewed yet. I attached it, in case your firmware is
based on TF-A.

> Zero. two logs are 0 (rc3 + rc2). The firmware returns success for all
> targets, including the masked CPU.

Thanks. So on your firmware it is not a race: every CPU that is in the
power-down state when the broadcast goes out gets wedged.

> This method might require a per-CPU mask. If the mask is already set, it
> will not send an SDEI but instead use a regular IPI instead. However,
> the code modification appears to be relatively complex.

I sent a sketch of it in a follow-up to Vladimir. It has two holes,
fixed in the version below.

With one flag per CPU, a sender that backs off clears the flag while an
earlier signal is still on its way, and the event 0 handler can clear
the flag of a later sender that has passed its check but not yet made
the SMC. Either way the PE masks with an SGI on its way. Counting the
signals instead closes it.

The notifier also has to leave alone a PE that is already masked, as
one is between sdei_cpuhp_down() and CPU_OFF, where cpuidle still runs.
A veto there marks it unmasked. Without a veto, CPU_PM_EXIT unmasks it,
and the flag is still set when the PE comes back masked from CPU_OFF.
Either way the next signal goes to a masked PE.

Could you try it on HIP12 with the power-down state enabled? It applies
to v7.4-rc3.

> Shall I send a patch for the switch?

Yes, please.

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
index e8dd2f0f3919..b9972f01e55d 100644
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
@@ -299,10 +302,51 @@ static int sdei_api_get_version(u64 *version)
 	return invoke_sdei_fn(SDEI_1_0_FN_SDEI_VERSION, 0, 0, 0, 0, 0, version);
 }
 
+/*
+ * Event 0 must not land on a masked PE. A signal is in flight from the
+ * sender's check until the target takes it.
+ */
+static DEFINE_PER_CPU(bool, sdei_pe_unmasked);
+static DEFINE_PER_CPU(atomic_t, sdei_signalling);
+static DEFINE_PER_CPU(atomic_t, sdei_signals_sent);
+static DEFINE_PER_CPU(unsigned int, sdei_signals_taken);
+static DEFINE_PER_CPU(bool, sdei_pm_masked);
+
+static bool sdei_signal_in_flight(void)
+{
+	unsigned int sent;
+
+	if (atomic_read_acquire(this_cpu_ptr(&sdei_signalling)))
+		return true;
+
+	sent = atomic_read(this_cpu_ptr(&sdei_signals_sent));
+	return sent != this_cpu_read(sdei_signals_taken);
+}
+
+static bool sdei_mark_masked(void)
+{
+	this_cpu_write(sdei_pe_unmasked, false);
+	smp_mb();
+	return sdei_signal_in_flight();
+}
+
+static void sdei_block_signal(void)
+{
+	int i;
+
+	if (!sdei_mark_masked())
+		return;
+
+	for (i = 0; i < USEC_PER_MSEC && sdei_signal_in_flight(); i++)
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
@@ -330,6 +374,7 @@ int sdei_unmask_local_cpu(void)
 		return err;
 	}
 
+	this_cpu_write(sdei_pe_unmasked, true);
 	return 0;
 }
 
@@ -344,10 +389,27 @@ static void _ipi_unmask_cpu(void *ignored)
  * but the SMC -- no locks, no event lookup -- so it is safe from NMI /
  * crash context (e.g. the cross-CPU NMI service).
  */
-int sdei_event_signal(u32 event_num, u64 mpidr)
+int sdei_event_signal(u32 event_num, unsigned int cpu)
 {
-	return invoke_sdei_fn(SDEI_1_0_FN_SDEI_EVENT_SIGNAL, event_num,
-			      mpidr, 0, 0, 0, NULL);
+	atomic_t *signalling = per_cpu_ptr(&sdei_signalling, cpu);
+	u64 mpidr = cpu_logical_map(cpu);
+	int err;
+
+	atomic_inc(signalling);
+	smp_mb__after_atomic();
+	if (!READ_ONCE(per_cpu(sdei_pe_unmasked, cpu))) {
+		atomic_dec(signalling);
+		return -EAGAIN;
+	}
+
+	err = invoke_sdei_fn(SDEI_1_0_FN_SDEI_EVENT_SIGNAL, event_num,
+			     mpidr, 0, 0, 0, NULL);
+	if (!err)
+		atomic_inc(per_cpu_ptr(&sdei_signals_sent, cpu));
+
+	atomic_dec_return_release(signalling);
+
+	return err;
 }
 NOKPROBE_SYMBOL(sdei_event_signal);
 
@@ -680,6 +742,8 @@ static int sdei_cpuhp_down(unsigned int cpu)
 	struct sdei_event *event;
 	int err;
 
+	sdei_block_signal();
+
 	/* un-register private events */
 	spin_lock(&sdei_list_lock);
 	list_for_each_entry(event, &sdei_list, list) {
@@ -700,8 +764,12 @@ static int sdei_cpuhp_down(unsigned int cpu)
 static int sdei_cpuhp_up(unsigned int cpu)
 {
 	struct sdei_event *event;
+	unsigned int sent;
 	int err;
 
+	sent = atomic_read(this_cpu_ptr(&sdei_signals_sent));
+	this_cpu_write(sdei_signals_taken, sent);
+
 	/* re-register/enable private events */
 	spin_lock(&sdei_list_lock);
 	list_for_each_entry(event, &sdei_list, list) {
@@ -739,10 +807,21 @@ static int sdei_pm_notifier(struct notifier_block *nb, unsigned long action,
 
 	switch (action) {
 	case CPU_PM_ENTER:
+		if (!this_cpu_read(sdei_pe_unmasked))
+			return NOTIFY_DONE;
+		if (sdei_mark_masked()) {
+			this_cpu_write(sdei_pe_unmasked, true);
+			return notifier_from_errno(-EBUSY);
+		}
 		rv = sdei_mask_local_cpu();
+		if (!rv)
+			this_cpu_write(sdei_pm_masked, true);
 		break;
 	case CPU_PM_EXIT:
 	case CPU_PM_ENTER_FAILED:
+		if (!this_cpu_read(sdei_pm_masked))
+			return NOTIFY_DONE;
+		this_cpu_write(sdei_pm_masked, false);
 		rv = sdei_unmask_local_cpu();
 		break;
 	default:
@@ -1113,6 +1192,12 @@ int sdei_event_handler(struct pt_regs *regs,
 {
 	int err;
 	u32 event_num = arg->event_num;
+	unsigned int sent;
+
+	if (!event_num) {
+		sent = atomic_read(this_cpu_ptr(&sdei_signals_sent));
+		__this_cpu_write(sdei_signals_taken, sent);
+	}
 
 	err = arg->callback(event_num, regs, arg->callback_arg);
 	if (err)
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

--zdocadxby5dc6aab
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=dc1c45b.diff

From dc1c45b86cb0243f6a32840acbefa78f773e4105 Mon Sep 17 00:00:00 2001
From: Cong Wang <cwang@multikernel.io>
Date: Mon, 12 Oct 2026 22:03:58 -0700
Subject: [PATCH] fix(sdei): keep event 0 pending while the PE is masked

When the SGI behind event 0 arrives at a PE that has SDEI events
masked, handle_masked_trigger() returns without ending the interrupt.
The SGI stays active at the SDEI priority, which keeps the running
priority of that PE above every Non-secure interrupt. The PE then takes
no Non-secure interrupt at all, and SDEI_PE_UNMASK does not undo it.

sdei_signal() refuses a target PE that is masked, but it reads the
target's state from another PE. The target can mask between that
check and the arrival of the SGI, and a client masks its PE around
every power-down state and on its way off, so a signal sent at the
wrong moment is enough. The caller has been told SUCCESS by then.

The specification wants a private event triggered on a masked PE to
stay pending and be delivered after SDEI_PE_UNMASK. Do that for event
0: end the interrupt, remember the signal for the PE, and raise the
SGI again when the PE unmasks. The SGI is raised again rather than left
pending at the interrupt controller, because SGI pending state is not
something every controller lets software set or clear. A PE powered on
afresh drops a signal its previous power-on missed.

Tested on QEMU virt (GICv3) with Linux, on v2.12 where sdei_signal()
has no target check: a PE signalled while masked keeps taking IPIs and
runs the event 0 handler right after it unmasks.

Signed-off-by: Cong Wang <cwang@multikernel.io>
Change-Id: Iada3da6b1ed4a6d58c6b8fc2daea79946032d1d3
---

diff --git a/services/std_svc/sdei/sdei_intr_mgmt.c b/services/std_svc/sdei/sdei_intr_mgmt.c
index c2de835..50ca0ed 100644
--- a/services/std_svc/sdei/sdei_intr_mgmt.c
+++ b/services/std_svc/sdei/sdei_intr_mgmt.c
@@ -54,6 +54,8 @@
 	unsigned short stack_top; /* Empty ascending */
 	bool pe_masked;
 	bool pending_enables;
+	/* Event 0 was signalled while this PE was masked */
+	bool pending_signal;
 } sdei_cpu_state_t;
 
 /* SDEI state for each core in the system */
@@ -136,6 +138,19 @@
 
 	state->pending_enables = false;
 	state->pe_masked = false;
+
+	if (state->pending_signal) {
+		state->pending_signal = false;
+		map = find_event_map(SDEI_EVENT_0);
+		assert(map != NULL);
+		plat_ic_raise_el3_sgi((int) map->intr, read_mpidr_el1());
+	}
+}
+
+/* Drop an event 0 signal that a previous power-on of this PE missed */
+void sdei_pe_clear_signal(void)
+{
+	sdei_get_this_pe_state()->pending_signal = false;
 }
 
 /* Push a dispatch context to the dispatch stack */
@@ -331,9 +346,16 @@
 	uint64_t my_mpidr __unused = (read_mpidr_el1() & MPIDR_AFFINITY_MASK);
 	bool disable = false;
 
-	/* Nothing to do for event 0 */
-	if (map->ev_num == SDEI_EVENT_0)
+	/*
+	 * Event 0 must stay pending until the PE unmasks, like any private
+	 * event. Its SGI cannot portably be left pending at the interrupt
+	 * controller, so end it and raise it again from sdei_pe_unmask().
+	 */
+	if (map->ev_num == SDEI_EVENT_0) {
+		state->pending_signal = true;
+		plat_ic_end_of_interrupt(intr_raw);
 		return;
+	}
 
 	/*
 	 * For a private event, or for a shared event specifically routed to
diff --git a/services/std_svc/sdei/sdei_main.c b/services/std_svc/sdei/sdei_main.c
index 6791419..9389fc3 100644
--- a/services/std_svc/sdei/sdei_main.c
+++ b/services/std_svc/sdei/sdei_main.c
@@ -79,6 +79,7 @@
 
 	/* All PEs start with SDEI events masked */
 	(void) sdei_pe_mask();
+	sdei_pe_clear_signal();
 
 	return NULL;
 }
diff --git a/services/std_svc/sdei/sdei_private.h b/services/std_svc/sdei/sdei_private.h
index 788e8db..d2859b0 100644
--- a/services/std_svc/sdei/sdei_private.h
+++ b/services/std_svc/sdei/sdei_private.h
@@ -241,6 +241,7 @@
 bool sdei_is_target_pe_masked(uint64_t target_pe);
 int64_t sdei_pe_mask(void);
 void sdei_pe_unmask(void);
+void sdei_pe_clear_signal(void);
 
 int sdei_intr_handler(uint32_t intr_raw, uint32_t flags, void *handle,
 		void *cookie);

--zdocadxby5dc6aab--

