Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE06C606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DR1puywM;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=QucEHD+z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DxmAekFZg8HrN9kEe90BM7uKLIPyET3n9/th6lpRcWI=; b=DR1puywMj9AM1a
	2DB5KcMnRcGRJ4Uh6wilZdOUQP54kUyQZJDbVjIWyJY8KUs0p8D5yvEYP16U+nWHvE+jx7xoJm9Nh
	CF3slUn6gtkqzwcR/JNrnasLWSdXv/dO6OOL5nVdjRhp1siWYOAd4m6ktNb7xh7hJsK7RSHqi6Qw8
	CD45H4fbgAaWzNOtt30ZtFcm10xeDIzaBykrJnaDn1SBKL63kBFXHErQvf0ogNKS6Q8hQj3iBpWZN
	Se/NbHFf5ccJiV1PAdi8kNAm8k0gmHC7lHOoioyyMDTsHMuIwOeR50pWfZ4jbWNEYNNvRpHicbSi6
	+VeE03N9XfQsw5LaXT9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUmG-0000000A2PI-1O7e;
	Thu, 12 Nov 2026 13:23:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlD-0000000A1DV-1uIf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F147D165C;
	Thu, 12 Nov 2026 05:22:35 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A0C253F632;
	Thu, 12 Nov 2026 05:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489759; bh=Q+Fia6qKXpTw/Y+H+loQ54AwU8r/Iz6p225mFNloM0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QucEHD+z4Q+Ff3FNScSllGRKs2aR0/Qvs+R/EVdVGLqcbJnI0xGymNdUjkvCyPAZL
	 0qSyyuqPFrOrFXXmV2A3at7D10PvW8LWcH6ll4l80x5jaHXnDYE4RPEohTujSEuwC2
	 8+45h96hesSjvzZCUJccAmBE3YkjErlTlB3YwFYc=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com,
	ashok.raj@oss.qualcomm.com,
	maz@kernel.org
Subject: [PATCH v2 31/39] arm64: smp: Fall back to IRQ when IPI NMI request fails
Date: Thu, 12 Nov 2026 13:20:34 +0000
Message-Id: <20261112132042.129062-32-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052244_303716_5B1F3EF8 
X-CRM114-Status: GOOD (  19.26  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Existing IPI setup logic relies on ipi_should_be_nmi() to decide
whether to request an NMI (if supported) or an ordinary IRQ. If NMI is
not supported, using an ordinary IRQ is acceptable.

FEAT_NMI requires complementary support in the interrupt
controller. If FEAT_NMI is present but interrupt controller support is
absent, request_percpu_nmi() can fail.

One way to prevent this would be to extend ipi_should_be_nmi() to also
check for interrupt controller support. However, since falling back to
an ordinary IRQ is acceptable, treat ipi_should_be_nmi() as a hint
instead. Whether an IPI is actually registered as an NMI is determined
by the success or failure of request_percpu_nmi(). If the request
fails, fall back to request_irq().

Track which IPIs were actually registered as NMIs and use that state
in the per-CPU enable and disable paths. This avoids calling the
percpu NMI helpers for an IPI that fell back to regular IRQ handling.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/smp.c | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 35182f06b34c..58b705426120 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -71,11 +71,14 @@ static int nr_ipi __ro_after_init = NR_IPI;
 
 struct ipi_descs {
 	struct irq_desc *descs[MAX_IPI];
+	DECLARE_BITMAP(nmi_bitmap, MAX_IPI);
 };
 
 static DEFINE_PER_CPU_READ_MOSTLY(struct ipi_descs, pcpu_ipi_desc);
 
 #define get_ipi_desc(__cpu, __ipi) (per_cpu_ptr(&pcpu_ipi_desc, __cpu)->descs[__ipi])
+#define get_ipi_nmi_bitmap(__cpu) (per_cpu_ptr(&pcpu_ipi_desc, __cpu)->nmi_bitmap)
+#define ipi_is_nmi(__cpu, __ipi) test_bit(__ipi, get_ipi_nmi_bitmap(__cpu))
 
 struct ipi_irq_ops {
 	void (*setup)(int ipi, int ncpus);
@@ -967,8 +970,8 @@ void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
 	/*
 	 * NOTE: though nmi_trigger_cpumask_backtrace() has "nmi_" in the name,
 	 * nothing about it truly needs to be implemented using an NMI, it's
-	 * just that it's _allowed_ to work with NMIs. If ipi_should_be_nmi()
-	 * returned false our backtrace attempt will just use a regular IPI.
+	 * just that it's _allowed_ to work with NMIs. If we failed request
+	 * NMI our backtrace attempt will just use a regular IPI.
 	 */
 	nmi_trigger_cpumask_backtrace(mask, exclude_cpu, arm64_backtrace_ipi);
 }
@@ -1101,6 +1104,7 @@ static void ipi_teardown(int cpu)
 
 static void ipi_sgi_setup(int ipi, int ncpus)
 {
+	bool is_nmi = ipi_should_be_nmi(ipi);
 	int err, irq, cpu;
 
 	if (WARN_ON_ONCE(ncpus))
@@ -1108,16 +1112,29 @@ static void ipi_sgi_setup(int ipi, int ncpus)
 
 	irq = ipi_irq_base + ipi;
 
-	if (ipi_should_be_nmi(ipi)) {
-		err = request_percpu_nmi(irq, ipi_handler, "IPI", NULL, &irq_stat);
-		WARN(err, "Could not request IRQ %d as NMI, err=%d\n", irq, err);
-	} else {
+	/*
+	 * Try to request NMI if it should be
+	 */
+	if (is_nmi && request_percpu_nmi(irq, ipi_handler, "IPI", NULL, &irq_stat)) {
+		/*
+		 * Fallback to regular IRQ
+		 */
+		is_nmi = false;
+	}
+
+       /*
+        * Otherwise regular IRQ
+        */
+	if (!is_nmi) {
 		err = request_percpu_irq(irq, ipi_handler, "IPI", &irq_stat);
 		WARN(err, "Could not request IRQ %d as IRQ, err=%d\n", irq, err);
 	}
 
-	for_each_possible_cpu(cpu)
+	for_each_possible_cpu(cpu) {
 		get_ipi_desc(cpu, ipi) = irq_to_desc(irq);
+		if (is_nmi)
+			set_bit(ipi, get_ipi_nmi_bitmap(cpu));
+	}
 
 	irq_set_status_flags(irq, IRQ_HIDDEN);
 }
@@ -1126,7 +1143,7 @@ static void ipi_sgi_enable(int cpu, int ipi)
 {
 	int irq = ipi_irq_base + ipi;
 
-	if (ipi_should_be_nmi(ipi)) {
+	if (ipi_is_nmi(cpu, ipi)) {
 		prepare_percpu_nmi(irq);
 		enable_percpu_nmi(irq, 0);
 	} else {
@@ -1138,7 +1155,7 @@ static void ipi_sgi_disable(int cpu, int ipi)
 {
 	int irq = ipi_irq_base + ipi;
 
-	if (ipi_should_be_nmi(ipi)) {
+	if (ipi_is_nmi(cpu, ipi)) {
 		disable_percpu_nmi(irq);
 		teardown_percpu_nmi(irq);
 	} else {
@@ -1311,7 +1328,7 @@ void smp_send_stop(void)
 	 * If CPUs are still online, try an NMI. There's no excuse for this to
 	 * be slow, so we only give them an extra 10 ms to respond.
 	 */
-	if (num_other_online_cpus() && ipi_should_be_nmi(IPI_CPU_STOP_NMI)) {
+	if (num_other_online_cpus() && ipi_is_nmi(smp_processor_id(), IPI_CPU_STOP_NMI)) {
 		smp_rmb();
 		cpumask_copy(&mask, cpu_online_mask);
 		cpumask_clear_cpu(smp_processor_id(), &mask);
-- 
2.34.1


