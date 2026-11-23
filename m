Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB11606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 03:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3eyfR7K7;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Ypsah1jH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HTuc4PPVjvPSPrnzlo65kpf6x+DRB3BoRJK0cybPyUc=; b=3eyfR7K7aPzjAHjmANQR7jWu0B
	s2w0tLaetDJ749FEJjNm8Uh5k0M/F+YitZYpokrH+CF3LOkJDU8Bhe4rObRPwdzs19iHX9qhHik+4
	lUwAL3hC1QryTafhjciw4GVoU9Yw9Swh0g8wwtu/NDDsNL8/7AfV7qs810q+sBt4yMr31nUKToA8v
	w+Mu8EkkleBzvmPAvWFkRh2r1BzsBXPs1K9LtnxlYtO9CzvtQxqJep14Yjjan5eHrDTpOAi7niXwE
	aOxyrNZk+UQRAYhDluOYbEBcnRKEnY/Q3FPXyIRBWu2zXtYI5dNdzhrGPOB0LoacUZiK8MekBCibk
	LgE3J9DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKnE-00000002DHU-28cq;
	Mon, 23 Nov 2026 03:32:36 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVKnA-00000002DFv-1kq2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 03:32:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=HTuc4PPVjvPSPrnzlo65kpf6x+DRB3BoRJK0cybPyUc=;
	b=Ypsah1jHxA0fC+6TtqOU7fe6cKNpFUlt2u9yxuH8l/CyfzcHuYy+3kksNxTlrniD4ZRy69ugW
	CLd3rgkeYxYRqJxMaxf/n1boqVwv8sqQ27E9BvaCyx2NfG4PUynq0wjsHpP0nhbEBDKWIDqIAO+
	GBdTWGgyWG5LIomVqswrGcI=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jXs193VM5zcbS2;
	Mon, 23 Nov 2026 11:31:25 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id C45C340537;
	Mon, 23 Nov 2026 11:32:26 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 23 Nov
 2026 11:32:25 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <rppt@kernel.org>, <arnd@arndb.de>,
	<kmehltretter@gmail.com>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<enelsonmoore@gmail.com>, <bp@alien8.de>, <jlayton@kernel.org>,
	<catalin.marinas@arm.com>, <sean@starlabs.systems>, <will@kernel.org>,
	<jonathan.cameron@oss.qualcomm.com>, <tzungbi@kernel.org>, <kas@kernel.org>,
	<steven.price@arm.com>, <chenhuacai@kernel.org>, <tzimmermann@suse.de>,
	<wenst@chromium.org>, <ruanjinjie@huawei.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<vladimir.murzin@arm.com>
Subject: [PATCH] arm64: sdei: add sdei_nmi.disabled= to keep the GIC NMI path reachable
Date: Mon, 23 Nov 2026 11:32:22 +0800
Message-ID: <20261123033222.1067923-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_193233_114896_C22F6AF9 
X-CRM114-Status: GOOD (  15.74  )
X-Spam-Score: -2.1 (--)
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

While the SDEI cross-CPU NMI is active it claims every cross-CPU
backtrace, so on a platform whose firmware exposes SDEI event 0
the irqchip NMI path can never be used.  There is no way to opt out.

Add a boot parameter "sdei_nmi.disabled".

With sdei_nmi.disabled=1, the SDEI NMI stays registered and simply
declines every request, so arch_trigger_cpumask_backtrace() falls
through to its IPI path and smp_send_stop() skips its SDEI rung.

Suggested-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 .../admin-guide/kernel-parameters.txt         |  8 +++++++
 drivers/firmware/Kconfig                      |  4 ++++
 drivers/firmware/arm_sdei_nmi.c               | 23 +++++++++++++++++--
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 176648941aec..9a3ce8ed18f4 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6958,6 +6958,14 @@ Kernel parameters
 			1 -- enable.
 			Default value is 1.
 
+	sdei_nmi.disabled= [ARM64,EARLY]
+			Disable SDEI-based cross-CPU NMI and leave the GIC NMI
+			path in place. Requires the kernel to be built with
+			CONFIG_ARM_SDEI_NMI.
+			Format: { "0" | "1" }
+			0 -- enable (default).
+			1 -- disable.
+
 	serialnumber	[BUGS=X86-32]
 
 	sev=option[,option...] [X86-64]
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 43e2e2a64594..4c8b917867dd 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -58,6 +58,10 @@ config ARM_SDEI_NMI
 	  regardless of the target's PSTATE.DAIF -- forced delivery into a
 	  CPU wedged with interrupts locally masked.
 
+	  This provider takes over every cross-CPU backtrace; set the
+	  kernel parameter "sdei_nmi.disabled" to 1 to use the irqchip
+	  NMI path instead.
+
 	  If unsure, say N.
 
 config EDD
diff --git a/drivers/firmware/arm_sdei_nmi.c b/drivers/firmware/arm_sdei_nmi.c
index 038eb79e28ac..baf89f88c4f1 100644
--- a/drivers/firmware/arm_sdei_nmi.c
+++ b/drivers/firmware/arm_sdei_nmi.c
@@ -62,6 +62,18 @@
 
 static bool sdei_nmi_available;
 
+/*
+ * Mirrors irqchip.gicv3_pseudo_nmi=: the architected NMI path
+ * is preferred when asked for, and SDEI stays out of the way.
+ */
+static bool sdei_nmi_disabled __ro_after_init;
+
+static int __init sdei_nmi_disable_setup(char *str)
+{
+	return kstrtobool(str, &sdei_nmi_disabled);
+}
+early_param("sdei_nmi.disabled", sdei_nmi_disable_setup);
+
 #define SDEI_NMI_EVENT			0
 
 /*
@@ -168,7 +180,7 @@ static void sdei_nmi_raise_backtrace(cpumask_t *mask)
  */
 bool sdei_nmi_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
 {
-	if (!sdei_nmi_available)
+	if (!sdei_nmi_available || sdei_nmi_disabled)
 		return false;
 
 	nmi_trigger_cpumask_backtrace(mask, exclude_cpu,
@@ -178,7 +190,7 @@ bool sdei_nmi_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
 
 bool sdei_nmi_active(void)
 {
-	return sdei_nmi_available;
+	return sdei_nmi_available && !sdei_nmi_disabled;
 }
 
 /*
@@ -194,6 +206,9 @@ void sdei_nmi_stop_cpus(const cpumask_t *mask)
 {
 	unsigned int cpu;
 
+	if (sdei_nmi_disabled)
+		return;
+
 	WRITE_ONCE(sdei_nmi_stopping, true);
 
 	/*
@@ -238,6 +253,10 @@ static int __init sdei_nmi_init(void)
 	}
 
 	sdei_nmi_available = true;
+	if (sdei_nmi_disabled) {
+		pr_info("SDEI cross-CPU NMI disabled by sdei_nmi.disabled.\n");
+		return 0;
+	}
 	pr_info("using SDEI cross-CPU NMI (SDEI_EVENT_SIGNAL, event %u)\n",
 		SDEI_NMI_EVENT);
 
-- 
2.34.1


