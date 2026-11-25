Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9322F606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 08:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LuDEOXba;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tqS4Klv7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=wrzhx5t/iGLS3qmtq75RdlxMdlTkWisQNBBhZbaEnus=; b=LuDEOXbaiw5M0TUBA3REEAUnCN
	0JgZuwWgdWRPwUKSoBSv5IY7ETWQwDcXLl5jAvqYU8i+vb5yGF+CE/ZJgt1AXMSpBkE69E9RJnH3n
	eXyuQb75SFW7LvCgvwVO9PZzsIUpMD109rXaOP0jqjtZHdHCuR90juE8//H2A2GYHmRVrhUVz86Ja
	lieJTbDlAaAs1f36bf7N8MilDF6b3HTwlfRwlqwhJExchWAezfk6rO29B3RVuzI19R4x+izPcIxNc
	cCdzeGmX/xISqqr6TMd7cmBIi8FSju7m3sYH7Iro0I1JKOj/dZIhCZb3MrZl2FI6TMDXTIYsqQjh0
	AOrX9IwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW83H-00000008yqH-38CP;
	Wed, 25 Nov 2026 08:08:27 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW83D-00000008yoV-2HgD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 08:08:26 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wrzhx5t/iGLS3qmtq75RdlxMdlTkWisQNBBhZbaEnus=;
	b=tqS4Klv7lZR7U71zCQvspliNcOl7SRTvkKu0Ui1p+Y5PdwRVxMjBpxFRaIeVw15g3YNxVh010
	/Yvombh6gXV1DJUdZn2eayPuW8xt9UXo1p91PW0pyQiQjInUMQm7Xv0PQpfwe2KOPh+1iu0Dswd
	VhL+XpECdeYyxpIcX2aKZHk=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jZC3M1GPQz1prQf;
	Wed, 25 Nov 2026 16:07:59 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 308F74057F;
	Wed, 25 Nov 2026 16:08:16 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 25 Nov
 2026 16:08:15 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <rdunlap@infradead.org>,
	<james.morse@arm.com>, <rppt@kernel.org>, <arnd@arndb.de>,
	<kmehltretter@gmail.com>, <dapeng1.mi@linux.intel.com>, <elver@google.com>,
	<enelsonmoore@gmail.com>, <bp@alien8.de>, <jlayton@kernel.org>,
	<catalin.marinas@arm.com>, <sean@starlabs.systems>, <suzuki.poulose@arm.com>,
	<will@kernel.org>, <tzungbi@kernel.org>, <kas@kernel.org>,
	<wenst@chromium.org>, <steven.price@arm.com>, <tzimmermann@suse.de>,
	<ruanjinjie@huawei.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<vladimir.murzin@arm.com>
Subject: [PATCH v2] arm64: sdei: add sdei_nmi.disabled= to keep the GIC NMI path reachable
Date: Wed, 25 Nov 2026 16:08:12 +0800
Message-ID: <20261125080812.1225194-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_000824_501437_C52483C9 
X-CRM114-Status: GOOD (  16.29  )
X-Spam-Score: -2.8 (--)
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

While the SDEI cross-CPU NMI provider is active it claims every
cross-CPU backtrace, so on a platform whose firmware exposes SDEI
event 0 the irqchip NMI path can never be used.  There is no way to
opt out.

Add a boot parameter "sdei_nmi.disabled".

With sdei_nmi.disabled=1, the SDEI NMI will not be registered, so
sdei_nmi_available stays false and the hooks decline on their own, which
lets arch_trigger_cpumask_backtrace() fall through to its IPI path.

Suggested-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Alphabetical order.
- Simplify the code by return before registering event 0.
---
 Documentation/admin-guide/kernel-parameters.txt |  8 ++++++++
 drivers/firmware/Kconfig                        |  4 ++++
 drivers/firmware/arm_sdei_nmi.c                 | 17 +++++++++++++++++
 3 files changed, 29 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 176648941aec..4f07c771b46b 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6934,6 +6934,14 @@ Kernel parameters
 			non-zero "wait" parameter.  See weight_single
 			and weight_many.
 
+	sdei_nmi.disabled= [ARM64,EARLY]
+			Disable SDEI-based cross-CPU NMI and leave the GIC NMI
+			path in place. Requires the kernel to be built with
+			CONFIG_ARM_SDEI_NMI.
+			Format: { "0" | "1" }
+			0 -- enable (default).
+			1 -- disable.
+
 	sdw_mclk_divider=[SDW]
 			Specify the MCLK divider for Intel SoundWire buses in
 			case the BIOS does not provide the clock rate properly.
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
index 038eb79e28ac..0e146e603354 100644
--- a/drivers/firmware/arm_sdei_nmi.c
+++ b/drivers/firmware/arm_sdei_nmi.c
@@ -62,6 +62,18 @@
 
 static bool sdei_nmi_available;
 
+/*
+ * Mirrors irqchip.gicv3_pseudo_nmi=: the architected NMI path
+ * is preferred when asked for, and SDEI stays out of the way.
+ */
+static bool sdei_nmi_disabled __initdata;
+
+static int __init sdei_nmi_disable_setup(char *str)
+{
+	return kstrtobool(str, &sdei_nmi_disabled);
+}
+early_param("sdei_nmi.disabled", sdei_nmi_disable_setup);
+
 #define SDEI_NMI_EVENT			0
 
 /*
@@ -222,6 +234,11 @@ static int __init sdei_nmi_init(void)
 	if (!sdei_is_present())
 		return 0;
 
+	if (sdei_nmi_disabled) {
+		pr_info("SDEI cross-CPU NMI disabled by sdei_nmi.disabled.\n");
+		return 0;
+	}
+
 	err = sdei_event_register(SDEI_NMI_EVENT, sdei_nmi_handler, NULL);
 	if (err) {
 		pr_err("sdei_event_register(%u) failed: %d\n",
-- 
2.34.1


