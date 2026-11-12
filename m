Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D7F606A321
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=01bM4SiC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TtfjzHAe;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=LD4KZDD7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AumFJQgA9dsViX7b0DUamAo5+fowDMdAMqNi4CE5GIY=; b=01bM4SiCR8+L/x
	6qBNMcgKlzBmk/e5RAu+BblinGEGklO8NW/CcpwLLgZBQEqNk+7HLJ4jOoVfDKjO1peM4dFobDwao
	5mvjowQehYGD8TcjZux8LEa1DbGzS1VYxNu2YpTOYBL8y2ZeEX0nDXXwHgJVAdsSlSv9kilkq/nG3
	UKBU1+Kl/fAFZFAJ+GY39Ugna6pbe78ofmYHmbzndhKK3S9jonr6zANkytx93mDC0CtV3koXCgxLj
	h6UFZQUTIODbG5+gYrbkoLF4HW3KcaXFfk819AknNfcud1xjPTlXqe6yUB+bpV36UdyeXskNtT8l4
	3I3OYOK8YxK+DXtLfI1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUly-0000000A22B-1bU8;
	Thu, 12 Nov 2026 13:23:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlJ-0000000A1GD-3GKy
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Nov 2026 13:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=AumFJQgA9dsViX7b0DUamAo5+fowDMdAMqNi4CE5GIY=; b=TtfjzHAelbAQJWGOiOOiBbshod
	zzWdE2j+JHr7UxgC6nDk3e7XCIL6vtskxSxAb6l4FIajrEd6obV98IsB4L8fscZCfWIgMUrwJuMM3
	OtnND0vwj/RtpDKYyOpjQoljuV2Ep5EAsRyLlVkYU3qqILQGx6XVPwojFS+ZK0+s0UeAbrrhDfWs8
	lBkHNBIR5GIMhXsqN5c1mdAjZ/MtCJ+3bqOEPg91/q+k5aA56xjkUt0fTJ6WjxPIYBAXVPz+m/Kjt
	TYXhagQE6miWaKWm3J2xX2wJ+MMn+URdMnZiqbf2DMAwrwLqnmtEonjkqZQsvM7Y6iyIC2crqu/uC
	+0G/qGiA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlD-0000000AMn0-0SFe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5544A1A9A;
	Thu, 12 Nov 2026 05:22:34 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1C3923F632;
	Thu, 12 Nov 2026 05:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489757; bh=nTQKy5Dl58xsk6v2EszBPHVJZNkWKR4cyHlcNUn/opI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LD4KZDD7XaLifl4lMuSduG4JCg5JCSbAbih++dJJzBigPbvN+fYVA3XwPXu1lw6P3
	 xffhBxn9JdxHChHaDyVUItoV9VTrIjiTK3WUAJqq7u+yBINHw/1YFeuYbdHkhtvubg
	 qcb6sWhIc15sGM8yQeHLyrSwmsYv7zzhYw4orYAQ=
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
Subject: [PATCH v2 30/39] arm64: smp: Abstract SGI and LPI operations
Date: Thu, 12 Nov 2026 13:20:33 +0000
Message-Id: <20261112132042.129062-31-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_132242_005357_37311F46 
X-CRM114-Status: GOOD (  15.22  )
X-Spam-Score: -2.5 (--)
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

SGI and LPI backed IPIs require different setup, enable, disable and
send operations. These differences are currently handled by repeatedly
checking percpu_ipi_descs. As the implementation specific logic grows,
these checks make the common IPI code increasingly difficult to
follow.

Introduce an operations structure for each implementation to
encapsulate the specific of SGI and LPI handling, leaving the common
IPI paths generic.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/smp.c | 136 ++++++++++++++++++++++++++--------------
 1 file changed, 89 insertions(+), 47 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 22274d775990..35182f06b34c 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -77,11 +77,18 @@ static DEFINE_PER_CPU_READ_MOSTLY(struct ipi_descs, pcpu_ipi_desc);
 
 #define get_ipi_desc(__cpu, __ipi) (per_cpu_ptr(&pcpu_ipi_desc, __cpu)->descs[__ipi])
 
-static bool percpu_ipi_descs __ro_after_init;
+struct ipi_irq_ops {
+	void (*setup)(int ipi, int ncpus);
+	void (*disable)(int cpu, int ipi);
+	void (*enable)(int cpu, int ipi);
+	void (*send)(const cpumask_t *mask, unsigned int nr);
+};
+
+static const struct ipi_irq_ops *ipi_ops __ro_after_init;
 
 static bool crash_stop;
 
-static void ipi_setup(int cpu);
+static void ipi_enable(int cpu);
 
 #ifdef CONFIG_HOTPLUG_CPU
 static void ipi_teardown(int cpu);
@@ -244,7 +251,7 @@ asmlinkage notrace void secondary_start_kernel(void)
 	notify_cpu_starting(cpu);
 	trace_hardirqs_off_finish();
 
-	ipi_setup(cpu);
+	ipi_enable(cpu);
 
 	numa_add_cpu(cpu);
 
@@ -937,13 +944,7 @@ void __noreturn panic_smp_self_stop(void)
 
 static void arm64_send_ipi(const cpumask_t *mask, unsigned int nr)
 {
-	unsigned int cpu;
-
-	if (!percpu_ipi_descs)
-		__ipi_send_mask(get_ipi_desc(0, nr), mask);
-	else
-		for_each_cpu(cpu, mask)
-			__ipi_send_single(get_ipi_desc(cpu, nr), cpu);
+	ipi_ops->send(mask, nr);
 }
 
 static void arm64_backtrace_ipi(cpumask_t *mask)
@@ -1074,54 +1075,37 @@ static bool ipi_should_be_nmi(enum ipi_msg_type ipi)
 	}
 }
 
-static void ipi_setup(int cpu)
+static void ipi_enable(int cpu)
 {
-	int i;
+	int ipi;
 
 	if (WARN_ON_ONCE(!ipi_irq_base))
 		return;
 
-	for (i = 0; i < nr_ipi; i++) {
-		if (!percpu_ipi_descs) {
-			if (ipi_should_be_nmi(i)) {
-				prepare_percpu_nmi(ipi_irq_base + i);
-				enable_percpu_nmi(ipi_irq_base + i, 0);
-			} else {
-				enable_percpu_irq(ipi_irq_base + i, 0);
-			}
-		} else {
-			enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, i)));
-		}
-	}
+	for (ipi = 0; ipi < nr_ipi; ipi++)
+		ipi_ops->enable(cpu, ipi);
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
 static void ipi_teardown(int cpu)
 {
-	int i;
+	int ipi;
 
 	if (WARN_ON_ONCE(!ipi_irq_base))
 		return;
 
-	for (i = 0; i < nr_ipi; i++) {
-		if (!percpu_ipi_descs) {
-			if (ipi_should_be_nmi(i)) {
-				disable_percpu_nmi(ipi_irq_base + i);
-				teardown_percpu_nmi(ipi_irq_base + i);
-			} else {
-				disable_percpu_irq(ipi_irq_base + i);
-			}
-		} else {
-			disable_irq_nosync(irq_desc_get_irq(get_ipi_desc(cpu, i)));
-		}
-	}
+	for (ipi = 0; ipi < nr_ipi; ipi++)
+		ipi_ops->disable(cpu, ipi);
 }
 #endif
 
-static void ipi_setup_sgi(int ipi)
+static void ipi_sgi_setup(int ipi, int ncpus)
 {
 	int err, irq, cpu;
 
+	if (WARN_ON_ONCE(ncpus))
+		return;
+
 	irq = ipi_irq_base + ipi;
 
 	if (ipi_should_be_nmi(ipi)) {
@@ -1138,7 +1122,53 @@ static void ipi_setup_sgi(int ipi)
 	irq_set_status_flags(irq, IRQ_HIDDEN);
 }
 
-static void ipi_setup_lpi(int ipi, int ncpus)
+static void ipi_sgi_enable(int cpu, int ipi)
+{
+	int irq = ipi_irq_base + ipi;
+
+	if (ipi_should_be_nmi(ipi)) {
+		prepare_percpu_nmi(irq);
+		enable_percpu_nmi(irq, 0);
+	} else {
+		enable_percpu_irq(irq, 0);
+	}
+}
+
+static void ipi_sgi_disable(int cpu, int ipi)
+{
+	int irq = ipi_irq_base + ipi;
+
+	if (ipi_should_be_nmi(ipi)) {
+		disable_percpu_nmi(irq);
+		teardown_percpu_nmi(irq);
+	} else {
+		disable_percpu_irq(irq);
+	}
+}
+
+static void ipi_sgi_send(const cpumask_t *mask, unsigned int nr)
+{
+	__ipi_send_mask(get_ipi_desc(0, nr), mask);
+}
+
+static const struct ipi_irq_ops ipi_sgi_ops = {
+	.setup = ipi_sgi_setup,
+	.disable = ipi_sgi_disable,
+	.enable = ipi_sgi_enable,
+	.send = ipi_sgi_send,
+};
+
+static void ipi_lpi_enable(int cpu, int ipi)
+{
+	enable_irq(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
+}
+
+static void ipi_lpi_disable(int cpu, int ipi)
+{
+	disable_irq_nosync(irq_desc_get_irq(get_ipi_desc(cpu, ipi)));
+}
+
+static void ipi_lpi_setup(int ipi, int ncpus)
 {
 	for (int cpu = 0; cpu < ncpus; cpu++) {
 		int err, irq;
@@ -1158,6 +1188,21 @@ static void ipi_setup_lpi(int ipi, int ncpus)
 	}
 }
 
+static void ipi_lpi_send(const cpumask_t *mask, unsigned int nr)
+{
+	int cpu;
+
+	for_each_cpu(cpu, mask)
+		__ipi_send_single(get_ipi_desc(cpu, nr), cpu);
+}
+
+static const struct ipi_irq_ops ipi_lpi_ops = {
+	.setup = ipi_lpi_setup,
+	.disable = ipi_lpi_disable,
+	.enable = ipi_lpi_enable,
+	.send = ipi_lpi_send,
+};
+
 void __init set_smp_ipi_range_percpu(int ipi_base, int n, int ncpus)
 {
 	int i;
@@ -1165,18 +1210,15 @@ void __init set_smp_ipi_range_percpu(int ipi_base, int n, int ncpus)
 	WARN_ON(n < MAX_IPI);
 	nr_ipi = min(n, MAX_IPI);
 
-	percpu_ipi_descs = !!ncpus;
 	ipi_irq_base = ipi_base;
 
-	for (i = 0; i < nr_ipi; i++) {
-		if (!percpu_ipi_descs)
-			ipi_setup_sgi(i);
-		else
-			ipi_setup_lpi(i, ncpus);
-	}
+	ipi_ops = ncpus ? &ipi_lpi_ops : &ipi_sgi_ops;
+
+	for (i = 0; i < nr_ipi; i++)
+		ipi_ops->setup(i, ncpus);
 
 	/* Setup the boot CPU immediately */
-	ipi_setup(smp_processor_id());
+	ipi_enable(smp_processor_id());
 }
 
 void arch_smp_send_reschedule(int cpu)
-- 
2.34.1


