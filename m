Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2A0606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Nov 2026 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TlSLxZsB;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=W8a96ZXY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nBpVmosivKOUo6zC+QJPxAEXH1usJBo55UEAKPb0gdY=; b=TlSLxZsBBu7/Nflvygjj1o/sEU
	Hs4fNTyo5EqoFrXeck4Bl9g0ivBfbHAFnJzzyRwRnyY7TvU+PO+GKs8KCzl3gMROJf1PtFXRcji4p
	u+6P6STI+m1IeyhzW0JFxDK/MPPAvRqQVQNHhMRsm08LS8gUh3vDEmrYcvrUKClMrr2HqpQQkONdi
	JJnl1MjXkzy9M1xKSlEVjCjo1zuARXQcPWoEQGoHBZrQYsJsZsJ0U2JHsb8dc53zbBHr2Ud+yirKp
	p9h9vgZNtR8uIyPqVQ9Z++W15a9tx3ifVEDx2g+TyCjE49JiBr9yT0fGwXkdg+VQMwMif+n4EAOHs
	IyTuGIsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUmt-0000000A3G5-43VW;
	Thu, 12 Nov 2026 13:24:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRUlK-0000000A1Gq-2iVc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Nov 2026 13:23:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27FA7169C;
	Thu, 12 Nov 2026 05:22:43 -0800 (PST)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A9D593F632;
	Thu, 12 Nov 2026 05:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794489766; bh=gw8rhbqATA4OUflJvzMp9SwlHKCTXt2wWNpH9NIRBI0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W8a96ZXYgitXPssWp8Axe54TRfMT22KWWMq3HJO1pOJIa5HgPrq6CTUB0tDOS/RCz
	 0G3m09oflNfSF5lTRUhSwo82smhdjCf6YxPiA6NmEhQuXoX9lyg4ClQI/H9FdAg+Lj
	 6lpn/8gImVMBGGSpqwmjyRcuvR6L07nBR6sFiUEw=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 35/39] irqchip/gic-v3: Implement FEAT_GICv3_NMI support
Date: Thu, 12 Nov 2026 13:20:38 +0000
Message-Id: <20261112132042.129062-36-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20261112132042.129062-1-vladimir.murzin@arm.com>
References: <20261112132042.129062-1-vladimir.murzin@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_052247_885740_BB744F21 
X-CRM114-Status: GOOD (  21.79  )
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

The FEAT_GICv3_NMI GIC feature coupled with the CPU FEAT_NMI enables
handling NMI interrupts in HW on aarch64, by adding a superpriority
interrupt to the existing GIC priority scheme.

Implement GIC driver support for the FEAT_GICv3_NMI feature.

Check, through the ARM64 capabilitity infrastructure, if support
for FEAT_NMI was detected on the core and the system has not overridden
the detection and forced pseudo-NMIs enablement.

If FEAT_NMI is detected, it was not overridden (check embedded in the
system_uses_nmi() call) and the GIC supports the FEAT_GICv3_NMI
feature, initialize NMIs related HW GIC registers and route irq to NMI
handling logic.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 drivers/irqchip/irq-gic-v3.c       | 127 +++++++++++++++++++++++++++--
 include/linux/irqchip/arm-gic-v3.h |   4 +
 2 files changed, 124 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index d9049c0679ff..853d12951288 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -64,6 +64,7 @@ struct gic_chip_data {
 	u32			nr_redist_regions;
 	u64			flags;
 	bool			has_rss;
+	bool			has_nmi;
 	unsigned int		ppi_nr;
 	struct partition_affinity *parts;
 	unsigned int		nr_parts;
@@ -89,6 +90,9 @@ static DEFINE_STATIC_KEY_TRUE(supports_deactivate_key);
 
 static bool pseudo_nmi_support_forbidden;
 
+static DEFINE_RAW_SPINLOCK(gic_nmi_lock);
+
+
 /*
  * There are 16 SGIs, though we only actually use 8 in Linux. The other 8 SGIs
  * are potentially stolen by the secure side. Some code, especially code dealing
@@ -254,6 +258,37 @@ enum gic_intid_range {
 	__INVALID_RANGE__
 };
 
+#ifdef CONFIG_ARM64
+#include <asm/cpufeature.h>
+
+static inline bool gic_supports_v3_3_nmi(void)
+{
+	return gic_data.has_nmi && system_uses_nmi();
+}
+
+static inline u64 gic_read_nmiar(void)
+{
+	u64 irqstat;
+
+	irqstat = read_sysreg_s(SYS_ICC_NMIAR1_EL1);
+
+	dsb(sy);
+
+	return irqstat;
+}
+
+#else
+static inline bool gic_supports_v3_3_nmi(void)
+{
+	return false;
+}
+
+static inline u64 gic_read_nmiar(void)
+{
+	BUG();
+}
+#endif
+
 static enum gic_intid_range __get_intid_range(irq_hw_number_t hwirq)
 {
 	switch (hwirq) {
@@ -440,6 +475,8 @@ static u32 convert_offset_index(struct irq_data *d, u32 offset, u32 *index)
 			return GICD_ICFGRnE;
 		case GICD_IROUTER:
 			return GICD_IROUTERnE;
+		case GICD_INMIR:
+			return GICD_INMIRnE;
 		default:
 			break;
 		}
@@ -469,6 +506,42 @@ static int gic_peek_irq(struct irq_data *d, u32 offset)
 	return !!(readl_relaxed(base + offset + (index / 32) * 4) & mask);
 }
 
+static void gic_irq_configure_nmi(struct irq_data *d, bool enable)
+{
+	void __iomem *base, *addr;
+	unsigned long val;
+	u32 offset, index;
+
+	offset = convert_offset_index(d, GICD_INMIR, &index);
+
+	if (gic_irq_in_rdist(d))
+		base = gic_data_rdist_sgi_base();
+	else
+		base = gic_dist_base_alias(d);
+
+	addr = base + offset + (index / 32) * 4;
+
+	raw_spin_lock(&gic_nmi_lock);
+
+	val = readl_relaxed(addr);
+
+	__assign_bit(index % 32, &val, enable);
+
+	writel_relaxed(val, addr);
+
+	raw_spin_unlock(&gic_nmi_lock);
+}
+
+static void gic_irq_enable_nmi(struct irq_data *d)
+{
+	gic_irq_configure_nmi(d, true);
+}
+
+static void gic_irq_disable_nmi(struct irq_data *d)
+{
+	gic_irq_configure_nmi(d, false);
+}
+
 static void gic_poke_irq(struct irq_data *d, u32 offset)
 {
 	void __iomem *base;
@@ -600,7 +673,7 @@ static int gic_irq_nmi_setup(struct irq_data *d)
 {
 	struct irq_desc *desc = irq_to_desc(d->irq);
 
-	if (!gic_supports_pseudo_nmi())
+	if (!gic_supports_pseudo_nmi() && !gic_supports_v3_3_nmi())
 		return -EINVAL;
 
 	if (gic_peek_irq(d, GICD_ISENABLER)) {
@@ -619,7 +692,10 @@ static int gic_irq_nmi_setup(struct irq_data *d)
 	if (!gic_irq_in_rdist(d))
 		desc->handle_irq = handle_fasteoi_nmi;
 
-	gic_irq_set_prio(d, dist_prio_nmi);
+	if (gic_supports_v3_3_nmi())
+		gic_irq_enable_nmi(d);
+	else
+		gic_irq_set_prio(d, dist_prio_nmi);
 
 	return 0;
 }
@@ -628,7 +704,7 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
 {
 	struct irq_desc *desc = irq_to_desc(d->irq);
 
-	if (WARN_ON(!gic_supports_pseudo_nmi()))
+	if (WARN_ON(!gic_supports_pseudo_nmi() && !gic_supports_v3_3_nmi()))
 		return;
 
 	if (gic_peek_irq(d, GICD_ISENABLER)) {
@@ -647,7 +723,10 @@ static void gic_irq_nmi_teardown(struct irq_data *d)
 	if (!gic_irq_in_rdist(d))
 		desc->handle_irq = handle_fasteoi_irq;
 
-	gic_irq_set_prio(d, dist_prio_irq);
+	if (gic_supports_v3_3_nmi())
+		gic_irq_disable_nmi(d);
+	else
+		gic_irq_set_prio(d, dist_prio_irq);
 }
 
 static bool gic_arm64_erratum_2941627_needed(struct irq_data *d)
@@ -838,7 +917,8 @@ static void __gic_handle_nmi(u32 irqnr, struct pt_regs *regs)
 	gic_complete_ack(irqnr);
 
 	if (generic_handle_domain_nmi(gic_data.domain, irqnr)) {
-		WARN_ONCE(true, "Unexpected pseudo-NMI (irqnr %u)\n", irqnr);
+		WARN_ONCE(true, "Unexpected %sNMI (irqnr %u)\n",
+			  gic_supports_pseudo_nmi() ? "pseudo-" : "", irqnr);
 		gic_deactivate_unhandled(irqnr);
 	}
 }
@@ -913,7 +993,11 @@ static void __gic_handle_irq_from_irqsoff(struct pt_regs *regs)
 
 static void __exception_irq_entry gic_handle_irq(struct pt_regs *regs)
 {
-	if (unlikely(gic_supports_pseudo_nmi() && !interrupts_enabled(regs)))
+	if (gic_supports_v3_3_nmi() && in_nmi()) {
+		u32 irqnr = gic_read_nmiar();
+
+		__gic_handle_nmi(irqnr, regs);
+	} else if (unlikely(gic_supports_pseudo_nmi() && !interrupts_enabled(regs)))
 		__gic_handle_irq_from_irqsoff(regs);
 	else
 		__gic_handle_irq_from_irqson(regs);
@@ -955,6 +1039,14 @@ static void __init gic_dist_init(void)
 		writel_relaxed(REPEAT_BYTE_U32(dist_prio_irq),
 			       base + GICD_IPRIORITYRnE + i);
 
+	if (gic_data.has_nmi) {
+		for (i = 0; i < GIC_LINE_NR; i += 32)
+			writel_relaxed(0, base +  GICD_INMIR + i / 8);
+
+		for (i = 0; i < GIC_ESPI_NR; i += 32)
+			writel_relaxed(0, base +  GICD_INMIRnE + i / 8);
+	}
+
 	/* Now do the common stuff */
 	gic_dist_config(base, GIC_LINE_NR, dist_prio_irq);
 
@@ -1292,6 +1384,11 @@ static void gic_cpu_init(void)
 	for (i = 0; i < gic_data.ppi_nr + SGI_NR; i += 32)
 		writel_relaxed(~0, rbase + GICR_IGROUPR0 + i / 8);
 
+	if (gic_data.has_nmi) {
+		for (i = 0; i < gic_data.ppi_nr + SGI_NR; i += 32)
+			writel_relaxed(0, rbase + GICR_INMIR0 + i / 8);
+	}
+
 	gic_cpu_config(rbase, gic_data.ppi_nr + SGI_NR, dist_prio_irq);
 	gic_redist_wait_for_rwp();
 
@@ -1967,6 +2064,19 @@ static void gic_enable_pseudo_nmi(void)
 		gic_has_relaxed_pmr_sync() ? "relaxed" : "forced");
 
 	static_branch_enable(&supports_pseudo_nmi);
+}
+
+static void gic_enable_nmi_support(void)
+{
+	if ((!gic_prio_masking_enabled() || pseudo_nmi_support_forbidden) && !gic_supports_v3_3_nmi())
+		return;
+
+	/*
+	 * Initialize pseudo-NMIs only if GIC driver cannot take advantage
+	 * of core (FEAT_NMI) and GIC (FEAT_GICv3_NMI) in HW
+	 */
+	if (!gic_supports_v3_3_nmi())
+		gic_enable_pseudo_nmi();
 
 	if (static_branch_likely(&supports_deactivate_key))
 		gic_eoimode1_chip.flags |= IRQCHIP_SUPPORTS_NMI;
@@ -2035,6 +2145,9 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
 	irq_domain_update_bus_token(gic_data.domain, DOMAIN_BUS_WIRED);
 
 	gic_data.has_rss = !!(typer & GICD_TYPER_RSS);
+	gic_data.has_nmi = !!(typer & GICD_TYPER_NMI);
+
+	pr_info("Non-maskable interrupt property %s supported\n", gic_data.has_nmi ? "is" : "not");
 
 	if (typer & GICD_TYPER_MBIS) {
 		err = mbi_init(handle, gic_data.domain);
@@ -2050,7 +2163,7 @@ static int __init gic_init_bases(phys_addr_t dist_phys_base,
 	gic_prio_init();
 	gic_dist_init();
 	gic_cpu_init();
-	gic_enable_pseudo_nmi();
+	gic_enable_nmi_support();
 	gic_smp_init();
 	gic_cpu_pm_init();
 
diff --git a/include/linux/irqchip/arm-gic-v3.h b/include/linux/irqchip/arm-gic-v3.h
index ea5fd2374ebe..ebccd76cadda 100644
--- a/include/linux/irqchip/arm-gic-v3.h
+++ b/include/linux/irqchip/arm-gic-v3.h
@@ -30,6 +30,7 @@
 #define GICD_ICFGR			0x0C00
 #define GICD_IGRPMODR			0x0D00
 #define GICD_NSACR			0x0E00
+#define GICD_INMIR			0x0F80
 #define GICD_IGROUPRnE			0x1000
 #define GICD_ISENABLERnE		0x1200
 #define GICD_ICENABLERnE		0x1400
@@ -39,6 +40,7 @@
 #define GICD_ICACTIVERnE		0x1C00
 #define GICD_IPRIORITYRnE		0x2000
 #define GICD_ICFGRnE			0x3000
+#define GICD_INMIRnE			0x3B00
 #define GICD_IROUTER			0x6000
 #define GICD_IROUTERnE			0x8000
 #define GICD_IDREGS			0xFFD0
@@ -83,6 +85,7 @@
 #define GICD_TYPER_LPIS			(1U << 17)
 #define GICD_TYPER_MBIS			(1U << 16)
 #define GICD_TYPER_ESPI			(1U << 8)
+#define GICD_TYPER_NMI			(1U << 9)
 
 #define GICD_TYPER_ID_BITS(typer)	((((typer) >> 19) & 0x1f) + 1)
 #define GICD_TYPER_NUM_LPIS(typer)	((((typer) >> 11) & 0x1f) + 1)
@@ -238,6 +241,7 @@
 #define GICR_ICFGR0			GICD_ICFGR
 #define GICR_IGRPMODR0			GICD_IGRPMODR
 #define GICR_NSACR			GICD_NSACR
+#define GICR_INMIR0			GICD_INMIR
 
 #define GICR_TYPER_PLPIS		(1U << 0)
 #define GICR_TYPER_VLPIS		(1U << 1)
-- 
2.34.1


