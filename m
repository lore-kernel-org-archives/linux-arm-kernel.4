Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7489B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 06:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bz4MIHYF;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jbyjFl5i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XjGC0M5fpJSSlNcbeEXaj39/+McVBbE84uyM1YDnneU=; b=Bz4MIHYFKBBvg9ER69o84hgsBv
	irHOcxXjzKHAgRhist1LvjETzvTJgVAlXFDmiWFrPOEGKMDfOqGFU+5BUL2Nt9ah188ytJM2pVQMU
	RdKdSRji/p7unuZx13vRsb0H9MyrWCd/w1NtYGSsTs6uEeTyxr/9Fg+wDAgUJCvavvx8zE4QnY65O
	R2/uqKRMWrRpRqT/KBChTvKShHXV4HzTdYsgTdUrprCCqU+/yqmcjef9vWZ1moQA1DZQZrOQSTEuR
	YbSUYHKiLXflDXhLfouZd/+AwBeFmM4bPeQQLRhgYUaqjzQIVQ+hy9mQSPOqLbhupeg7akiPDwHl+
	qM0gyEnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpcI-0000000F3R3-15o8;
	Fri, 27 Nov 2026 06:39:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpbu-0000000F3GU-2KLo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 06:39:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 03C8961D4F;
	Fri, 27 Nov 2026 06:39:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795761545;
	b=M6RkvqpDAyeH7qIij/WovTokwvWJzumb7jiWiLl0CaMIIowu2ij9bPfPkbt+9rO3gprX
	 rNHT3as42B8jLfKWIyOfGi+cqBHdSKnsDLPbqvwke23QuKaSMYysu8ZBaIrHAQLS10kBs
	 X4YScAs8rp9mfBZC4ExhP1KMC+Ausv+9OueCjHi6fwOziczmzbdHUc10bfgTiYCYnjeqx
	 HMAeruMYOyO19meWWoGDkqUzrJdgT9TUFQLpuJIW8U8Uw7fVm0uhNzY0m7Nd0DJxHgx+R
	 1S2TSUpzAM5qg0YyhB/3re/NbvPx73ZkqRAwaSuudYhJZquC4YAeu+CAnFQGbZRv0ag==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795761545;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XjGC0M5fpJSSlNcbeEXaj39/+McVBbE84uyM1YDnneU=;
	b=hC61VTYrORRkNjHVfUh/rj8mjg0eWMDNreLVlqENHryQ2jHGW/sOXd9qjbsHctTwkFdw
	 ddSVCgKj49BjjQyRMwzQDv2SrTL6w07ghIUOuhXUYIl/+fIiVaovmPIQhUbWpJXyHQtHz
	 oMeHbVUZfhEX0C2ZvzqiNnpmDrzI2rWnqKXT0tMJnlvehr9OWC+F9l9ie+BMyqWkxghEC
	 nfCOVgaICODUZf42S/6sQdfHfUFsBxHCuax+NrXgLWGapJZ7vjs2kE+l8XkS1xC+bjOdX
	 k2iZNKLeca8/cT5R8MT8iXFyh3cwvmFCgMwcY9aYga+1PmONtbiSsImB+eFh3iW1bUw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C44C21F0092B;
	Fri, 27 Nov 2026 06:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795761545;
	bh=XjGC0M5fpJSSlNcbeEXaj39/+McVBbE84uyM1YDnneU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jbyjFl5ifgxOfNw19e8RHqnZ9hPj/rxsqtVsyuQUUfVSNhKX7S83v+x6gs5wn88T0
	 M7pjWt5yQXY+89f6PnAyzg0MtYsaAcaIygk5fzEAdHWiX3cyhAa8uTTfqy1YDLBktD
	 EYG7HdajkpnoiUHUxp5N/s0xtKvI+1xT4eGkINtXx9IJIPigAc0Ayn6GmJ8kfbphKI
	 u/g3ASAFh0vSREiBjhXEfdLQjvNPZkHc1OH49FLWTHTHmb7EGEmZ2GcXfh3bNtnLKi
	 gvQhafOFdmDbHEtovHzXlfG9G3OKcMm8XnSZq1GImQM9UArbMGMWPbmLxLz2MPjAP0
	 5UsmIVOcdrmBA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C4B764B5D4;
	Fri, 27 Nov 2026 06:38:46 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 27 Nov 2026 08:38:44 +0200
Subject: [PATCH RFC 07/10] lib/nmi_backtrace: notify about CPUs that ignore
 a backtrace request
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-b4-coresight-cpu-debug-lockup-v1-7-69d3ad1e0fc8@iav.lv>
References: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
In-Reply-To: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5418; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=lAXIzRdZsICWVCPuak+CsO7I/rLdVHaqdO0DPNjaa0E=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDNmcqkVOCfs3ZvxTVLq1/Er7Dc64Kb+bWrY/5wgz3sbO0
 3raQ7qxo5SFQYyLQVZMkWXCIY1bGUuu/vX3MH8AM4eVCWQIAxenAEykg53hnx0H28xWwZP31znm
 iiXPnXDssvqzuHWXUrh/POGftOmKxXRGhpbv00sPX3jsHGJe8GKN0JKVP/K6pFY/a2TzNXeMjpx
 3ix8A
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

nmi_trigger_cpumask_backtrace() waits 10 seconds for the CPUs it asked
for a backtrace and then reports the ones that did not respond. A CPU
locked up with interrupts masked cannot take a request sent as a
regular IPI, so its stack cannot be had, but an external debug
interface may still be able to sample its program counter.

Add an atomic notifier chain that is called with the CPUs that did not
respond. idle_cpu() is not exported to modules, so pass the idle CPUs
as a second mask.

nmi_backtrace_stall_check() is called at the same point, but it is an
arch hook; the consumer here is a tristate driver bound to per-CPU
devices, so it takes a notifier.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
 include/linux/nmi.h | 28 +++++++++++++++++++++++++++
 lib/nmi_backtrace.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index af69712df5f4..f2f8c9e42ff7 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -8,6 +8,8 @@
 #include <linux/sched.h>
 #include <asm/irq.h>
 
+struct notifier_block;
+
 /* Arch specific watchdogs might need to share extra watchdog-related APIs. */
 #if defined(CONFIG_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HARDLOCKUP_DETECTOR_SPARC64)
 #include <asm/nmi.h>
@@ -151,6 +153,19 @@ static inline void touch_nmi_watchdog(void)
 	touch_softlockup_watchdog();
 }
 
+/**
+ * struct nmi_backtrace_stall - CPUs that ignored a backtrace request
+ * @cpus: CPUs that did not respond before the timeout; one that responds
+ *	  while the notifiers run is cleared from the mask
+ * @idle: the CPUs of @cpus that idle_cpu() reported as idle: they run their
+ *	  idle task and have nothing queued, so a CPU stuck in idle with a
+ *	  wakeup pending is not among them
+ */
+struct nmi_backtrace_stall {
+	const struct cpumask *cpus;
+	const struct cpumask *idle;
+};
+
 /*
  * Create trigger_all_cpu_backtrace() out of the arch-provided
  * base function. Return whether such support was available,
@@ -189,7 +204,20 @@ void nmi_trigger_cpumask_backtrace(const cpumask_t *mask,
 				   void (*raise)(cpumask_t *mask));
 bool nmi_cpu_backtrace(struct pt_regs *regs);
 
+int nmi_backtrace_stall_notifier_register(struct notifier_block *nb);
+int nmi_backtrace_stall_notifier_unregister(struct notifier_block *nb);
+
 #else
+static inline int nmi_backtrace_stall_notifier_register(struct notifier_block *nb)
+{
+	return 0;
+}
+
+static inline int nmi_backtrace_stall_notifier_unregister(struct notifier_block *nb)
+{
+	return 0;
+}
+
 static inline bool trigger_all_cpu_backtrace(void)
 {
 	return false;
diff --git a/lib/nmi_backtrace.c b/lib/nmi_backtrace.c
index f39c9eca8888..2b5a4e693599 100644
--- a/lib/nmi_backtrace.c
+++ b/lib/nmi_backtrace.c
@@ -18,6 +18,7 @@
 #include <linux/kprobes.h>
 #include <linux/stringify.h>
 #include <linux/nmi.h>
+#include <linux/notifier.h>
 #include <linux/cpu.h>
 #include <linux/export.h>
 #include <linux/sched/debug.h>
@@ -31,6 +32,60 @@ static unsigned long backtrace_flag;
 
 #define NMI_BT_TIMEOUT_SEC	10
 
+static ATOMIC_NOTIFIER_HEAD(backtrace_stall_chain);
+static DECLARE_BITMAP(backtrace_stall_idle_mask, NR_CPUS);
+
+/**
+ * nmi_backtrace_stall_notifier_register - watch for CPUs ignoring a backtrace
+ * @nb: notifier to call with a &struct nmi_backtrace_stall
+ *
+ * The notifier runs in the context of the backtrace request, which can be
+ * an NMI, and the masks it is passed are valid only until it returns. Only
+ * requests that go through nmi_trigger_cpumask_backtrace() are reported.
+ *
+ * Return: 0 on success, -EEXIST if @nb is already registered.
+ */
+int nmi_backtrace_stall_notifier_register(struct notifier_block *nb)
+{
+	return atomic_notifier_chain_register(&backtrace_stall_chain, nb);
+}
+EXPORT_SYMBOL_GPL(nmi_backtrace_stall_notifier_register);
+
+/**
+ * nmi_backtrace_stall_notifier_unregister - stop watching for such CPUs
+ * @nb: notifier to remove
+ *
+ * Waits for a running notifier to return, so it can sleep and must not be
+ * called from the notifier.
+ *
+ * Return: 0 on success, -ENOENT if @nb is not registered.
+ */
+int nmi_backtrace_stall_notifier_unregister(struct notifier_block *nb)
+{
+	return atomic_notifier_chain_unregister(&backtrace_stall_chain, nb);
+}
+EXPORT_SYMBOL_GPL(nmi_backtrace_stall_notifier_unregister);
+
+static void nmi_backtrace_stall_notify(void)
+{
+	struct nmi_backtrace_stall stall = {
+		.cpus = to_cpumask(backtrace_mask),
+		.idle = to_cpumask(backtrace_stall_idle_mask),
+	};
+	int cpu;
+
+	if (atomic_notifier_call_chain_is_empty(&backtrace_stall_chain))
+		return;
+
+	cpumask_clear(to_cpumask(backtrace_stall_idle_mask));
+	for_each_cpu(cpu, stall.cpus) {
+		if (idle_cpu(cpu))
+			__cpumask_set_cpu(cpu, to_cpumask(backtrace_stall_idle_mask));
+	}
+
+	atomic_notifier_call_chain(&backtrace_stall_chain, 0, &stall);
+}
+
 /*
  * When raise() is called it will be passed a pointer to the
  * backtrace_mask. Architectures that call nmi_cpu_backtrace()
@@ -85,6 +140,7 @@ void nmi_trigger_cpumask_backtrace(const cpumask_t *mask,
 			cpumask_pr_args(to_cpumask(backtrace_mask)));
 
 		nmi_backtrace_stall_check(to_cpumask(backtrace_mask));
+		nmi_backtrace_stall_notify();
 	}
 
 	/*

-- 
2.43.0



