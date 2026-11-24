Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8008606A33A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 19:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sa82YkyS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ke7n9tdz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Jb7UacLdyzgROEM6VeFj8C1lCP+Li5b9218DpdLXBEc=; b=sa82YkySCOoPtXfYfyjY3IukVn
	wko4N5pAoovYqn7mLRkUZwYSmMlmqO2ZEbY1pgKE9OvIJ18g2zfflIhUOoEta+w5Qj3nGBYQjaEHB
	obTIXO55KT2h1XwqZQ48/Dr3Dg3QiDLnlZuu7OgPeef96SXS8kDJrj9xANljm+2gx+jEma9IYBczE
	BAyp/BG0cwHOVd245TeaoGda4OHwle0aNO6er5b1AEetIyNSIpAkRZTiYAvF1ZM4/Qc8VtlRoZlLk
	Pm53NTdAx6l/Ylfzx9cWhXAObWzR+T2AjdH2MHrP0oMR6mLyiwqzox65lUzzzPQ1z3efrlVoxDcLi
	lyh6XLCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwUJ-00000007cRA-11te;
	Tue, 24 Nov 2026 19:47:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVwU8-00000007cOA-26q1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 19:47:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A8AEB60EEF;
	Tue, 24 Nov 2026 19:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C7AD1F000F4;
	Tue, 24 Nov 2026 19:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795549643;
	bh=Jb7UacLdyzgROEM6VeFj8C1lCP+Li5b9218DpdLXBEc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ke7n9tdzmh78RWE/vlZb+cPXV5Am6Cyy+xNXTKld/9H1PgV1OOgytyfroznoOcaiz
	 nreVQuF0SWmYrfhJ3eVZNIJa71/TNc9hrEixvhfrsI3qLPFOh6JC7PWGrrL73MTtSV
	 +ZJBzOWmlP1u4KZRdE51Pb+VMqC819ECQWn1y1epSk+lFb0S6wNy8uUC5yNKkLVMHT
	 eh/3SIUa04c/LLl12Qk7FpZkE7l9m68H4k7FJrz66o3uMcWH8I1+1DQyqWTsXw43CE
	 foH82+lKPsNhh2cRvQi/eREsWrIBtQh1NqNB30D/1ixITP/pCOc/hH7bYz3u5DJUj0
	 0rGC7knzTYlxw==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 5ACE81980047;
	Tue, 24 Nov 2026 14:47:18 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 24 Nov 2026 14:47:20 -0500
X-ME-Sender: <xms:xekFa0cmu2gUb8M5YJxYK7s8sCMxYvibiLGG3W40q2-VN4Jo4GW3rQ>
    <xme:xekFa0kA-upSFROVy9-3OKa8CkNOj4J6kTWdtM83VLNK7MiQthhOT7d4LN-CWau0B
    JTPv8jjkWJvO7mxy0beNkQOwY59hgK9IImgBIE6hbL98n4O7CS34UmW2w>
X-ME-Received: <xmr:xekFaxhua7X7NHCCrwHeXtuMWatqn1SAQaW-Wiv026GNNERfs8Fi3kmtsdI>
X-ME-Proxy-Cause: dmFkZTF8mK3hTCRd90aqnSvOpCd4gzquwbaRY1ybcFkVdEZH36HujOrk/L6VV6Y1vtNMHJ
    6VVt7i5u8kMpzFTrCKxhljVCQ0KWilRMz8P/2EHJr4WvH0fuZpYQC7sK293mDxYM5fCpxr
    1T3W9hf6dB8LZqtzE4IkJAYo0VMIBVV8zOeHK0H62E2wvN3S7anHOZYKNhLPFJ87IUM61S
    qHy4D0IvnCfOjgesgxbhRacdN4oSj4TucPlCavxmzsp4Gkj0PCKNRZJx/kx70DdCFDXw+q
    7xJwCo/wVwK7Yl9cyU5U0q9sKTnCGo1ZKourJqEYJheN6vPystHS9LyDe6Aaf2u3+CwkI8
    K0JxkNkTYnrafKZ/rTj/3+9Cp9lcsGjXEwFv/7cqddgUQW1JxEbcN2FXocQC6sokP77iTz
    4rFrL77wxX12ppPWSMVZwxp19CXJ0zfLguT3cdPHVkfzezIu+smY5OQy4cfTbZFhJai4jB
    qioc+3L14it17ZZqJ4ZF6Bnn419bRnXUI5OLbowlPINKMA4fFjOlriEYMVbgvrEMVmIGoe
    G0Me4uLkDxVpzwekgnG0s9azudRcd/8aoyRo2FA7cagRqEdCXxQUA4Z/C5Q2BrbWG+Nvx/
    +OoIzYgvtUzHpR22FRjEmXOcLWgi+Kvv0g9Kvv04EWtoKGWbRjR5HU7A/p7Q
X-ME-Proxy: <xmx:xekFa9EGI9L4ahECNeOKy9PLeZNJLwtB0SeRXNELsui-ZeELFs6Fnw>
    <xmx:xekFa4zOf4H4XkBgNVEFRyaEqZGefgnS87-IiO3iXpUh-wAp0q-6TQ>
    <xmx:xekFa8ptG5LFDO8P2LynCZIsBDBtiu_gC354pp1S3Bi3FyMHFmG2dA>
    <xmx:xekFa7dIQ7vp6XFCWc-hwYoO9-kQslgtqXxz4YU-ZIH-o1qvT7-nJA>
    <xmx:xekFaygRgIctcxYKCfXNpWhmSCYbso94vTf0CMNuc6xBx11D26g_Z-wE>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 14:47:17 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>
Subject: [PATCH 2/2] firmware: arm_sdei_nmi: Send the backtrace IPI to CPUs with SDEI masked
Date: Tue, 24 Nov 2026 19:47:05 +0000
Message-ID: <20261124194707.1030653-3-kas@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124194707.1030653-1-kas@kernel.org>
References: <20261124194707.1030653-1-kas@kernel.org>
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
Cc: "Kiryl Shutsemau \(Meta\)" <kas@kernel.org>, Yin Fengwei <fengwei_yin@linux.alibaba.com>, kernel-team@meta.com, Vladimir Murzin <vladimir.murzin@arm.com>, Marc Zyngier <maz@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>, Cong Wang <cwang@multikernel.io>, Liao Chang <liaochang1@huawei.com>, Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Ashok Raj <ashok.raj@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Pengjie Zhang <zhangpengjie2@huawei.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sdei_event_signal() refuses a CPU that has SDEI masked. An NMI
backtrace then gets nothing from such a CPU and, after 10 seconds,
reports it as not responding.

The CPU is in a power-down idle state or going offline, and the regular
backtrace IPI wakes it. Send that IPI to the CPUs SDEI refused; every
other CPU still gets event 0.

A stop needs nothing extra: smp_send_stop() has sent its IPIs before it
signals SDEI, and a CPU still online after that is reported as not
stopped.

Fixes: 0c2c56598cc1 ("drivers/firmware: add SDEI cross-CPU NMI service for arm64")
Cc: stable@vger.kernel.org
Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
---
 arch/arm64/include/asm/nmi.h    |  7 +++++++
 arch/arm64/kernel/smp.c         |  2 +-
 drivers/firmware/arm_sdei_nmi.c | 21 ++++++++++++++++++---
 3 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/nmi.h b/arch/arm64/include/asm/nmi.h
index 2e8974ff8d63..447d681a5475 100644
--- a/arch/arm64/include/asm/nmi.h
+++ b/arch/arm64/include/asm/nmi.h
@@ -45,4 +45,11 @@ static inline void sdei_nmi_stop_cpus(const cpumask_t *mask) { }
  */
 void __noreturn arm64_nmi_cpu_stop(struct pt_regs *regs, bool die_on_crash);
 
+/*
+ * Send the regular backtrace IPI (an NMI with pseudo-NMI) to @mask. The
+ * SDEI provider uses it for the CPUs it cannot signal. Defined in
+ * arch/arm64/kernel/smp.c.
+ */
+void arm64_backtrace_ipi(cpumask_t *mask);
+
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
diff --git a/drivers/firmware/arm_sdei_nmi.c b/drivers/firmware/arm_sdei_nmi.c
index edea68ef881e..b8ebb97caf18 100644
--- a/drivers/firmware/arm_sdei_nmi.c
+++ b/drivers/firmware/arm_sdei_nmi.c
@@ -124,7 +124,7 @@ static int sdei_nmi_handler(u32 event, struct pt_regs *regs, void *arg)
 }
 NOKPROBE_SYMBOL(sdei_nmi_handler);
 
-static void sdei_nmi_fire(unsigned int target_cpu)
+static int sdei_nmi_fire(unsigned int target_cpu)
 {
 	int err = sdei_event_signal(SDEI_NMI_EVENT, target_cpu);
 
@@ -133,8 +133,13 @@ static void sdei_nmi_fire(unsigned int target_cpu)
 		pr_warn("SDEI_EVENT_SIGNAL to CPU %u failed: %d\n",
 			target_cpu, err);
 	}
+
+	return err;
 }
 
+/* CPUs to IPI instead; nmi_trigger_cpumask_backtrace() serialises its users */
+static cpumask_t sdei_nmi_ipi_mask;
+
 /*
  * Raise callback for nmi_trigger_cpumask_backtrace(): signal event 0
  * at every CPU still pending in @mask. The framework excludes the local
@@ -151,8 +156,18 @@ static void sdei_nmi_raise_backtrace(cpumask_t *mask)
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
+	/*
+	 * A CPU with SDEI masked is in a power-down idle state or going
+	 * offline. The IPI wakes it and it reports like any other.
+	 */
+	if (!cpumask_empty(&sdei_nmi_ipi_mask))
+		arm64_backtrace_ipi(&sdei_nmi_ipi_mask);
 }
 
 /*
-- 
2.54.0


