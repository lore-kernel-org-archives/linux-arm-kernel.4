Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B1A606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fElzyDfy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uaVmNfO/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DitWT76IqiTpYINI2gNTsviX09T89byhvTm4mxLIyps=; b=fElzyDfyj8H0nmiOn7GydGaJUs
	MJYN6fj4jzDk2d/c1DjsiNxu43lBi+HIF3b4/ztV2Dw+mfHLN4IplmnqN7h+IDt0d+TVHXAPfoP74
	PqY3aUl+Wx89bsbia8c+i39Br/Var3fhwHzsKoueaSzt3/F7L9nYoDETMagGTTKMSSeFQp3gm6jdQ
	F1GBYtAyewYy7Q7lW/IysoOZcsKtKtlfh37YZywB9oVYjcQdi/QL/SOP3tua94TTQAfqhYr6VvVzX
	WsGR5sS6GAMrFEOFFz9o9Qa3IB/JKnFycUE46kTUewwv2XawDKXC/AVuMw6UiGPNUMXgpHLYRC09M
	nhzf1hYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUmI-0000000A2Uq-2JPu;
	Thu, 12 Nov 2026 13:23:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlJ-0000000A0tP-1cBM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:22:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D7701C01;
	Thu, 12 Nov 2026 05:22:41 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D30073F632;
	Thu, 12 Nov 2026 05:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489764; bh=uGG2RN61rxhzV6S2MSL8FapLngPOSsyVrZYrkgqm9pc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uaVmNfO/oHhaJn2FyGUlisY/BFTHPu3z5upbiqP0ThuSsZJXuuw4cAUxH4+AHCAD2
	 q1ntXW00FYzh8tXyCHAAKYE2bihQgWHrBefnuj0vM6J6z3AJoD518H8SlEhAd7qEXd
	 FcN87a3pX81GwaNZhlfcLJ6D4Yr9nmfFX1Ywe490=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 34/39] irqchip/gic-v3: Rename nmi to pseudo_nmi
Date: Thu, 12 Nov 2026 13:20:37 +0000
Message-Id: <20261112132042.129062-35-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052246_436173_1A16BB6A 
X-CRM114-Status: GOOD (  15.16  )
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
Cc: mark.rutland@arm.com, catalin.marinas@arm.com, lpieralisi@kernel.org, liaochang1@huawei.com, ashok.raj@oss.qualcomm.com, Mark Brown <broonie@kernel.org>, maz@kernel.org, will@kernel.org, ruanjinjie@huawei.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Lorenzo Pieralisi <lpieralisi@kernel.org>

Currently, the terms "NMI" and "pseudo-NMI" are used
interchangeably. That creates confusion with upcoming FEAT_GICv3_NMI
support. Rename helper functions and variables related to pseudo-NMI
to make the code paths clearer and more explicit.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/irqchip/irq-gic-v3.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 94873646d46f..d9049c0679ff 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -87,7 +87,7 @@ static DEFINE_STATIC_KEY_TRUE(supports_deactivate_key);
 #define GIC_LINE_NR	min(GICD_TYPER_SPIS(gic_data.rdists.gicd_typer), 1020U)
 #define GIC_ESPI_NR	GICD_TYPER_ESPIS(gic_data.rdists.gicd_typer)
 
-static bool nmi_support_forbidden;
+static bool pseudo_nmi_support_forbidden;
 
 /*
  * There are 16 SGIs, though we only actually use 8 in Linux. The other 8 SGIs
@@ -117,7 +117,7 @@ static bool nmi_support_forbidden;
  * - Figure 4-7 Secure read of the priority field for a Non-secure Group 1
  *   interrupt.
  */
-static DEFINE_STATIC_KEY_FALSE(supports_pseudo_nmis);
+static DEFINE_STATIC_KEY_FALSE(supports_pseudo_nmi);
 
 static u32 gic_get_pribits(void)
 {
@@ -187,7 +187,7 @@ static void __init gic_prio_init(void)
 				pr_warn("Broken GIC integration, security disabled\n");
 		} else {
 			pr_warn("Broken GIC integration, pNMI forbidden\n");
-			nmi_support_forbidden = true;
+			pseudo_nmi_support_forbidden = true;
 		}
 	}
 
@@ -514,10 +514,10 @@ static void gic_unmask_irq(struct irq_data *d)
 	gic_poke_irq(d, GICD_ISENABLER);
 }
 
-static inline bool gic_supports_nmi(void)
+static inline bool gic_supports_pseudo_nmi(void)
 {
 	return IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) &&
-	       static_branch_likely(&supports_pseudo_nmis);
+	       static_branch_likely(&supports_pseudo_nmi);
 }
 
 static int gic_irq_set_irqchip_state(struct irq_data *d,
@@ -600,7 +600,7 @@ static int gic_irq_nmi_setup(struct irq_data *d)
 {
 	struct irq_desc *desc = irq_to_desc(d->irq);
 
-	if (!gic_supports_nmi())
+	if (!gic_supports_pseudo_nmi())
 		return -EINVAL;
 
 	if (gic_peek_irq(d, GICD_ISENABLER)) {
@@ -628,7 +628,7 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
 {
 	struct irq_desc *desc = irq_to_desc(d->irq);
 
-	if (WARN_ON(!gic_supports_nmi()))
+	if (WARN_ON(!gic_supports_pseudo_nmi()))
 		return;
 
 	if (gic_peek_irq(d, GICD_ISENABLER)) {
@@ -806,7 +806,7 @@ static inline void gic_complete_ack(u32 irqnr)
 
 static bool gic_rpr_is_nmi_prio(void)
 {
-	if (!gic_supports_nmi())
+	if (!gic_supports_pseudo_nmi())
 		return false;
 
 	return unlikely(gic_read_rpr() == GICV3_PRIO_NMI);
@@ -913,7 +913,7 @@ static void __gic_handle_irq_from_irqsoff(struct pt_regs *regs)
 
 static void __exception_irq_entry gic_handle_irq(struct pt_regs *regs)
 {
-	if (unlikely(gic_supports_nmi() && !interrupts_enabled(regs)))
+	if (unlikely(gic_supports_pseudo_nmi() && !interrupts_enabled(regs)))
 		__gic_handle_irq_from_irqsoff(regs);
 	else
 		__gic_handle_irq_from_irqson(regs);
@@ -1164,7 +1164,7 @@ static void gic_cpu_sys_reg_init(void)
 	/* Set priority mask register */
 	if (!gic_prio_masking_enabled()) {
 		write_gicreg(DEFAULT_PMR_VALUE, ICC_PMR_EL1);
-	} else if (gic_supports_nmi()) {
+	} else if (gic_supports_pseudo_nmi()) {
 		/*
 		 * Check that all CPUs use the same priority space.
 		 *
@@ -1958,15 +1958,15 @@ static const struct gic_quirk gic_quirks[] = {
 	}
 };
 
-static void gic_enable_nmi_support(void)
+static void gic_enable_pseudo_nmi(void)
 {
-	if (!gic_prio_masking_enabled() || nmi_support_forbidden)
+	if (!gic_prio_masking_enabled() || pseudo_nmi_support_forbidden)
 		return;
 
 	pr_info("Pseudo-NMIs enabled using %s ICC_PMR_EL1 synchronisation\n",
 		gic_has_relaxed_pmr_sync() ? "relaxed" : "forced");
 
-	static_branch_enable(&supports_pseudo_nmis);
+	static_branch_enable(&supports_pseudo_nmi);
 
 	if (static_branch_likely(&supports_deactivate_key))
 		gic_eoimode1_chip.flags |= IRQCHIP_SUPPORTS_NMI;
@@ -2050,7 +2050,7 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
 	gic_prio_init();
 	gic_dist_init();
 	gic_cpu_init();
-	gic_enable_nmi_support();
+	gic_enable_pseudo_nmi();
 	gic_smp_init();
 	gic_cpu_pm_init();
 
-- 
2.34.1


