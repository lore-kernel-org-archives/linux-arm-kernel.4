Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563AC606A338
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=huMr+ZHR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TGSlRAR+Zm4NZmfK0vP+zv8nj5qbBIRZNsmYsMV1EOs=; b=huMr+ZHRnFjBHG0BFwVjRjaJCz
	6apymv0FBVXc1nSV3+5Eqw2/ifi/XMdip8M3St2UJEUE8lXEuCLqBPTr9CL3iwD4/s3wCNF85QpXe
	KKQcHizdsPvVUt/CZqsCC4+EQIESJHoDmK1tk0+3qpFvxPP1yauXc1zxL5aBhqpz+X7zIkBkqK0Ya
	AndaUQvliSIN/ijUYnw+36NlR86zmXukwuPCmeiH+YjCywlm3FUW61JHc8hNQoFKGrFpmpBciT+Rn
	lWvo2d4gzLuXeYwZsMk5EBH8s0RSAc/2lmAF68Isn8W7BnXXK5Jup6DdgtL9TSmP5EknF7rPiM1DH
	rHfYIhmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFk8-000000059sh-3JD8;
	Tue, 17 Nov 2026 09:44:48 +0000
Received: from mail-koreacentralazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c40f::6] helo=SEYPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFjg-000000059Om-2fyx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 09:44:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uShj+/uG5DyRzjeV+P7yveKOGib7DjKd+mBZXbx3UjM0vZgr+dXBb81QXVqoB3lX8PRC9ULTfN8nzLUhGLRZFZJdtEJHEwrNHB2ib+EChfgvjT1LYXbWobHEEjAGRkipv7Cp/g7mF3gJSr7Ac+U6Z1D25TkR6I+VZGtiFeY8C5mSdgM6WJW7KmNSwa4rzFVKZyqMhHtjY3a5JY6WqwGzhrwvyf01ne19J5JUGObcdeJGmyIeNf82eHXPZWNSCnD7JISGFz8C6UmQhZulfGGLpHnUanJB96aLEl7r+3+NAjcm+vSA57vof0ORmwjY+/+Nbw2kClGlAFbc+r7bk8InPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TGSlRAR+Zm4NZmfK0vP+zv8nj5qbBIRZNsmYsMV1EOs=;
 b=sDGa8P9SpNL21BshOiakAls3esBbizJU2POxUcEBuTOJCnQV75SeOsTM0cGI3SSNLGywFENt6U5RRDVRLNufzUOaFVC+JqQ2i0Ay2l0Y0iJ69H+txtbRptp6W/Fd9ZGzgf3FWT4MRiu1Up4stpd/8zGNNk8nyzyrtN4emRNWb5jROR93B4OA+Ad80PApZiPFLYp2T7IhKIRbF2Rzol3821AFl2n9Xm/c1J0hNlaCS3rA/oVg+5eR/u/O6j4hwsrSw3m3ZRq08NTEdegoWh1vPFwH/rBUNJfL/MypnzX6YQClJ4s7bnY/Ac2U9EdHL+k4CuMDLNsMK0fYnEo6zc3CPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR01CA0189.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::15) by SG2PR06MB5081.apcprd06.prod.outlook.com
 (2603:1096:4:1c8::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.7; Tue, 17 Nov
 2026 09:44:12 +0000
Received: from SG2PEPF000B66CA.apcprd03.prod.outlook.com
 (2603:1096:4:189:cafe::1b) by SG2PR01CA0189.outlook.office365.com
 (2603:1096:4:189::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 09:44:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CA.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 09:44:11 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 9B28540920E2;
	Tue, 17 Nov 2026 17:44:09 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	tglx@kernel.org
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com,
	radu@rendec.net
Subject: [PATCH v4 2/5] irqchip: Add the Sky1 AUDSS auxiliary interrupt controller
Date: Tue, 17 Nov 2026 17:44:05 +0800
Message-ID: <20261117094408.1393837-3-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117094408.1393837-1-Jelly.Jia@cixtech.com>
References: <20261117094408.1393837-1-Jelly.Jia@cixtech.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CA:EE_|SG2PR06MB5081:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 412399df-87f5-4d80-521f-08df448f5590
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|36860700016|1800799024|23010399003|18002099003|22082099003|261009220027099003|261009223027099003|261009223327099003|261009221727099003|261009221227099003|3023799007|921020|260925021911599003|260925022911599003|260925021311599003|56012099006|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info: LFP1AmFrWtqvY5+Jw581wDzTdZhyJg3oJiYWC2IftJhIvmDzSVmgUcQr0YUkwiXi2UpPg816onhv1LON7ySrM2YM7/rBAQrkc5txTT5a6aI6PpF+QTYymBK3k9M8jHMURthAzp+yinCDo4pQvAFXZ/m8vW3JGDnfnAd5aTeNJivpHzptnh9bFcXJfjTrKZf8j1eRPm35PstH7QNV4QTm4cQWUC2lmMVIJ26qmLt/WYFQLQkKBPx9B4qbw7ExrttxTXZZtHBSWaxboNloQkYd63xRfOUm03Bp9hYSec3rDDDHZE/WQLnWpfVTpgULeNuQL54GCJKdW+wpG51IqpskjTcx6C4U+L6gpxFYihp5cL477O0+SCWKpkq8o2VVSO53CkGWHSQBjgZ/RVRwltdbqb0NDghamxyUiJWYnfh4pWSBkPS2oSAOFnvc7Kn/yHUj8rXE/N8QGg89CYdW+D7OsBwv7BbHLv0Js5QRqJUGIFu3uqf8jXMrVKQBmmqBdMPRJbHd007fCAPZQN9oA2NwQ+9rXFAHJ3edRPkVXJvlTk09zq0OEyRUEq12LNtSOOFBHWE8buXG5QEF82gjkyMbVcCaezg86D+18k+ii5aLn76mgmmqlO0AU1GRehmwJ80q4owgtk7Ik5WKkrPhtsZ4xRcxzaH9vKc/Ox+EBJDT5jKxILmxPjrKdJR/UudfKEQUXv9xjhTgLXT3foiNOKf8QeV+AkDT1VBofY+1YkgGOtzFFEyctXZBnqgFNXfLgPuw
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700016)(1800799024)(23010399003)(18002099003)(22082099003)(261009220027099003)(261009223027099003)(261009223327099003)(261009221727099003)(261009221227099003)(3023799007)(921020)(260925021911599003)(260925022911599003)(260925021311599003)(56012099006)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eYxHg7hddVTYUdSUxGZDu5hZ9kh3RC8TBWsSyTCZlmvM3clS6TQwXk+h0AJ0uXIpBoJ+sft30ptDtL4ZygkkwSCBS1jjfITrLLusexW71ewKq9fo5mmS/dcTe10Qxv9sYQvLikbSVG5bLC0fxRc43htdA795XznbZDmNr0BdgQ3QOCdohc9O+K3urpQ0xnRYLHB6gCXheLKwpJpo5RNYtlH6WpSNiuQ2ugwLGRYBZH8ZQupTq6+B1/eDpKiK1UIfwlWOzf2roKbjHE6k7VGmenYQxPULBf1B8y6rdHZssNU78g7SX2ih+H3jgT+iMx7tYgqc9mIuJXHhEoD3x1KGDR9UqmjOeYoXRPR9qwJ8UVxvfvaZhWuHaVyHl/K8+ocbfJhlnBEHk8qexOXBhTj2vbGSzDgjUggIoGznRCsHhVhU2vQ6sr0vIeHF/TRbQp38
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 09:44:11.3869
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 412399df-87f5-4d80-521f-08df448f5590
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CA.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_014420_856791_15D7E58A 
X-CRM114-Status: GOOD (  22.63  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The AUDSS CRU gates eight DMA channel interrupts onto a shared parent line.
Implement its irqchip, domain and chained handler in an auxiliary driver
under drivers/irqchip rather than the clock subsystem.

Reuse the parent CRU regmap and firmware node. Retain level/polled child
flow, explicit disable masking, mapping disposal and powered teardown. Keep
clock/reset control in the parent. Coordinate the parent IRQ's quiescing
with runtime PM and noirq system sleep, keeping sleepable power management
out of hard IRQ callbacks.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 MAINTAINERS                      |   1 +
 drivers/irqchip/Kconfig          |  16 ++
 drivers/irqchip/Makefile         |   1 +
 drivers/irqchip/irq-sky1-audss.c | 255 +++++++++++++++++++++++++++++++
 4 files changed, 273 insertions(+)
 create mode 100644 drivers/irqchip/irq-sky1-audss.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..bd966600deb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2904,6 +2904,7 @@ T:	git https://github.com/cixtech/linux-mainline.git
 F:	Documentation/devicetree/bindings/arm/cix.yaml
 F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
 F:	arch/arm64/boot/dts/cix/
+F:	drivers/irqchip/irq-sky1-audss.c
 F:	drivers/mailbox/cix-mailbox.c
 K:	\bcix\b
 
diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 136bab41f801..1275622851c1 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -233,6 +233,22 @@ config LAN966X_OIC
 config MADERA_IRQ
 	tristate
 
+config IRQ_SKY1_AUDSS
+	tristate "CIX Sky1 AUDSS DMA interrupt controller"
+	depends on ARCH_CIX || COMPILE_TEST
+	depends on OF
+	select AUXILIARY_BUS
+	select IRQ_DOMAIN
+	select REGMAP
+	default CLK_SKY1_AUDSS
+	help
+	  Support the DMA channel interrupt gates in the CIX Sky1 audio
+	  subsystem CRU. This auxiliary driver shares the clock controller's
+	  register map and combines the channel interrupts onto a parent IRQ.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called irq-sky1-audss.
+
 config IRQ_MIPS_CPU
 	bool
 	select GENERIC_IRQ_CHIP
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 16a5fd126c9a..2862a0335082 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_IRQCHIP)			+= irqchip.o
+obj-$(CONFIG_IRQ_SKY1_AUDSS)		+= irq-sky1-audss.o
 
 obj-$(CONFIG_AL_FIC)			+= irq-al-fic.o
 obj-$(CONFIG_ALPINE_MSI)		+= irq-alpine-msi.o
diff --git a/drivers/irqchip/irq-sky1-audss.c b/drivers/irqchip/irq-sky1-audss.c
new file mode 100644
index 000000000000..df2063f0d771
--- /dev/null
+++ b/drivers/irqchip/irq-sky1-audss.c
@@ -0,0 +1,255 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2026 Cix Technology Group Co., Ltd. */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/bitops.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#define INFO_AP_IRQC		0x54
+#define INFO_AP_IRQC_DMAC_MASK	GENMASK(7, 0)
+#define SKY1_AUDSS_DMAC_IRQS	8
+
+struct sky1_audss_irq {
+	struct regmap *regmap;
+	struct irq_domain *domain;
+	int parent_irq;
+};
+
+static void sky1_audss_irq_mask(struct irq_data *d)
+{
+	struct sky1_audss_irq *priv = irq_data_get_irq_chip_data(d);
+
+	regmap_update_bits(priv->regmap, INFO_AP_IRQC, BIT(d->hwirq), 0);
+}
+
+static void sky1_audss_irq_unmask(struct irq_data *d)
+{
+	struct sky1_audss_irq *priv = irq_data_get_irq_chip_data(d);
+
+	regmap_update_bits(priv->regmap, INFO_AP_IRQC,
+			   BIT(d->hwirq), BIT(d->hwirq));
+}
+
+static int sky1_audss_irq_request_resources(struct irq_data *d)
+{
+	return try_module_get(THIS_MODULE) ? 0 : -ENODEV;
+}
+
+static void sky1_audss_irq_release_resources(struct irq_data *d)
+{
+	module_put(THIS_MODULE);
+}
+
+static struct irq_chip sky1_audss_irq_chip = {
+	.name			= "sky1-audss-dmac",
+	.irq_mask		= sky1_audss_irq_mask,
+	.irq_unmask		= sky1_audss_irq_unmask,
+	.irq_disable		= sky1_audss_irq_mask,
+	.irq_request_resources	= sky1_audss_irq_request_resources,
+	.irq_release_resources	= sky1_audss_irq_release_resources,
+	.flags			= IRQCHIP_SKIP_SET_WAKE,
+};
+
+static int sky1_audss_irq_map(struct irq_domain *d, unsigned int irq,
+			      irq_hw_number_t hwirq)
+{
+	if (hwirq >= SKY1_AUDSS_DMAC_IRQS)
+		return -EINVAL;
+
+	irq_set_chip_data(irq, d->host_data);
+	irq_set_chip_and_handler(irq, &sky1_audss_irq_chip, handle_level_irq);
+	/*
+	 * There is no per-channel pending status in the CRU. Poll enabled
+	 * children without spurious-IRQ accounting, but retain level flow
+	 * control so disabled and oneshot-threaded children stay masked.
+	 */
+	irq_set_status_flags(irq, IRQ_LEVEL | IRQ_IS_POLLED);
+	irq_set_noprobe(irq);
+
+	return 0;
+}
+
+static const struct irq_domain_ops sky1_audss_irq_ops = {
+	.map	= sky1_audss_irq_map,
+	.xlate	= irq_domain_xlate_onecell,
+};
+
+static void sky1_audss_irq_handler(struct irq_desc *desc)
+{
+	struct sky1_audss_irq *priv = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	unsigned long enabled;
+	unsigned int hwirq;
+	u32 val;
+
+	chained_irq_enter(chip, desc);
+
+	if (!regmap_read(priv->regmap, INFO_AP_IRQC, &val)) {
+		enabled = val & INFO_AP_IRQC_DMAC_MASK;
+		for_each_set_bit(hwirq, &enabled, SKY1_AUDSS_DMAC_IRQS)
+			generic_handle_domain_irq(priv->domain, hwirq);
+	}
+
+	chained_irq_exit(chip, desc);
+}
+
+static int sky1_audss_irq_runtime_suspend(struct device *dev)
+{
+	struct sky1_audss_irq *priv = dev_get_drvdata(dev);
+
+	/* The parent CRU may turn its clocks off after the child suspends. */
+	disable_irq(priv->parent_irq);
+
+	return 0;
+}
+
+static int sky1_audss_irq_runtime_resume(struct device *dev)
+{
+	struct sky1_audss_irq *priv = dev_get_drvdata(dev);
+
+	/* Parent resume has already restored the CRU registers. */
+	enable_irq(priv->parent_irq);
+
+	return 0;
+}
+
+static const struct dev_pm_ops sky1_audss_irq_pm_ops = {
+	RUNTIME_PM_OPS(sky1_audss_irq_runtime_suspend,
+		       sky1_audss_irq_runtime_resume, NULL)
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				  pm_runtime_force_resume)
+};
+
+static int sky1_audss_irq_probe(struct auxiliary_device *adev,
+				const struct auxiliary_device_id *id)
+{
+	struct device *dev = &adev->dev;
+	struct sky1_audss_irq *priv;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regmap = dev_get_regmap(dev->parent, NULL);
+	if (!priv->regmap)
+		return dev_err_probe(dev, -ENODEV, "failed to get CRU regmap\n");
+
+	priv->parent_irq = of_irq_get(dev->of_node, 0);
+	if (priv->parent_irq < 0)
+		return dev_err_probe(dev, priv->parent_irq,
+				     "failed to get parent IRQ\n");
+	if (!priv->parent_irq)
+		return -EINVAL;
+
+	ret = pm_runtime_resume_and_get(dev->parent);
+	if (ret < 0)
+		return dev_err_probe(dev, ret, "failed to resume CRU\n");
+
+	ret = regmap_update_bits(priv->regmap, INFO_AP_IRQC,
+				 INFO_AP_IRQC_DMAC_MASK, 0);
+	if (ret)
+		goto out_put_parent;
+
+	dev_set_drvdata(dev, priv);
+	pm_runtime_get_noresume(dev);
+	ret = pm_runtime_set_active(dev);
+	if (ret)
+		goto out_put_child;
+	pm_runtime_enable(dev);
+
+	priv->domain = irq_domain_create_linear(dev_fwnode(dev),
+						SKY1_AUDSS_DMAC_IRQS,
+						&sky1_audss_irq_ops, priv);
+	if (!priv->domain) {
+		ret = -ENOMEM;
+		goto out_disable_pm;
+	}
+	irq_domain_set_pm_device(priv->domain, dev);
+
+	/* A chained handler cannot implement lazy-disable masking. */
+	irq_set_status_flags(priv->parent_irq, IRQ_DISABLE_UNLAZY);
+	irq_set_chained_handler_and_data(priv->parent_irq,
+					 sky1_audss_irq_handler, priv);
+
+	pm_runtime_put_sync(dev);
+	pm_runtime_put_sync(dev->parent);
+
+	return 0;
+
+out_disable_pm:
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+out_put_child:
+	pm_runtime_put_noidle(dev);
+out_put_parent:
+	pm_runtime_put_sync(dev->parent);
+	return ret;
+}
+
+static void sky1_audss_irq_remove(struct auxiliary_device *adev)
+{
+	struct device *dev = &adev->dev;
+	struct sky1_audss_irq *priv = dev_get_drvdata(dev);
+	unsigned int hwirq;
+	unsigned int virq;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
+		dev_warn(dev, "failed to resume CRU for IRQ teardown: %d\n", ret);
+
+	disable_irq(priv->parent_irq);
+	if (ret >= 0)
+		regmap_update_bits(priv->regmap, INFO_AP_IRQC,
+				   INFO_AP_IRQC_DMAC_MASK, 0);
+	irq_set_chained_handler_and_data(priv->parent_irq, NULL, NULL);
+	synchronize_irq(priv->parent_irq);
+	irq_clear_status_flags(priv->parent_irq, IRQ_DISABLE_UNLAZY);
+
+	for (hwirq = 0; hwirq < SKY1_AUDSS_DMAC_IRQS; hwirq++) {
+		virq = irq_find_mapping(priv->domain, hwirq);
+		if (!virq)
+			continue;
+
+		/* Disassociation must not access an unpowered CRU either. */
+		if (ret < 0)
+			irq_set_chip(virq, NULL);
+		irq_dispose_mapping(virq);
+	}
+	irq_domain_remove(priv->domain);
+
+	pm_runtime_disable(dev);
+	if (ret >= 0)
+		pm_runtime_put_noidle(dev);
+	pm_runtime_set_suspended(dev);
+}
+
+static const struct auxiliary_device_id sky1_audss_irq_ids[] = {
+	{ .name = "clk_sky1_audss.irq" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, sky1_audss_irq_ids);
+
+static struct auxiliary_driver sky1_audss_irq_driver = {
+	.probe = sky1_audss_irq_probe,
+	.remove = sky1_audss_irq_remove,
+	.id_table = sky1_audss_irq_ids,
+	.driver = {
+		.pm = pm_ptr(&sky1_audss_irq_pm_ops),
+		.suppress_bind_attrs = true,
+	},
+};
+module_auxiliary_driver(sky1_audss_irq_driver);
+
+MODULE_AUTHOR("Jelly Jia <Jelly.Jia@cixtech.com>");
+MODULE_DESCRIPTION("CIX Sky1 AUDSS DMA interrupt controller");
+MODULE_LICENSE("GPL");
-- 
2.54.0


