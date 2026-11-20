Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851D2606A333
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 17:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V7xpOCv5;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K4j65Mbj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FCAXrPxeX14bN1VetxI8E65zIox/7YHgEb5aQilywVk=; b=V7xpOCv5KvRtgRSC0+PzUgPPuU
	mNNlyP0ZrQ+8AqRvQmKzbcZjQ6z8L5sbFx1y7cbmwcMPTsbH5rVfxxX1bW76EGYPGKkzGreYV9iNY
	8BHnSIYo5kZ3nOtf/fqwfBTXzX+xc4lU8bfNMouwksvCC9mG6e5oy0mzoJ5hx6mzoliNINSLYn0PP
	4+BDar+q+Hok3+N7r8YkQvHQ6rmyZ/utyAyZHLPwR1ywgCcLQ3VuYfINK1BspxT1lfe0g5ObFYS0Q
	0RPZ44ka5b0H0I8sh2VVmulHadvRus7w6v47HsaschrBqjyk8dzFz4N8b/NE4iSFF+cTYjB5lD5s0
	UOFqc3pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSMH-0000000FgHK-2tgC;
	Fri, 20 Nov 2026 17:25:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUSLr-0000000Fg7k-49nA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 17:24:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 98B4442D61;
	Fri, 20 Nov 2026 17:24:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795195483;
	b=DSfafZGdot0jjzYDkGYyYvHmldAnILssl1WivvgVd0ETtEyNMW+W8ak7JMhGD7x0JC5w
	 DJvCrgIhe5lbgw5f9PW5FCHthUz01clMZn+1SDWynbTkxgY8g2nDKha14XzRazWvdRXl+
	 Ww78CF6BIz1VXikf9TW7Ss5j9seeMj+clOYGnoHLxX7x7KFf4MtIbqqsDrsyeON3YNM9w
	 Ej0bhB8Vm+62NrFr9OB6iaGp6fWdi4x2he5jHyz9smA/bYZssm5c7I9OeKHaX/Ufy/xub
	 bvtd7eaevQhgIChoVhQ/+l0F+sUo4+2e+XRcbsxiye1TnqCy0o/GMd9WlS23FWMu0og==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795195483;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FCAXrPxeX14bN1VetxI8E65zIox/7YHgEb5aQilywVk=;
	b=plVdhSpMZAJHp2EmkmhJ0fP3hVOrKnG6GLRJ5YX85jqmeU6qqprCPZXnWd7bQkFAW6w4
	 RfAxA1+SaCF0sLJy+iPw3PieJEfkFJPgVhPLVjjR2Bx3PoCaeuv9hmimeR7Av23VuNXiG
	 b+CWZdZuSQJWfY8wzQOceRRbtT7oRsk5lcLvIHVgwBaKGnfDg+dzvquYbuiMYtyZ5SdPz
	 vL/G7YEjjwOsoG3tlQIFPSu4HVNlZ/xuvORpoOKt7QO2K/9oCPKdVQH6FT0LtaFGXNLke
	 /8D/r7F2qqaxUhUvcOTmysSZuKXGQsIJH0sot/IWcpSJnYhQkOEf2nufbbVvqJm1slQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72BDF1F000EB;
	Fri, 20 Nov 2026 17:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195483;
	bh=FCAXrPxeX14bN1VetxI8E65zIox/7YHgEb5aQilywVk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=K4j65MbjNKVYnnMa2OqYlPNC6eFPwNdT3Xz9Svo5Pn5rRFiGcxZT/QMxIJPk5nuQ2
	 L/dkXVDFmtqEHw+NTstDd61UWLZJQmEdNF5gB3wT1EFwGAcKPOMMBxldYutKGoGW6e
	 IFtVe3leUZNo4GciNoMVhMbUk8FSLvtCTC4zmD6NAa3istdalcomvNXvGToyzj4Ar3
	 LH4oAcgjd8vap2eLWJ+Exj8+A0V9HL2TBDhihTKGTfC+YqgNbHhxlhuJZNT6NKC0CG
	 VjEhbxkqJvQKe5W7R9yNpHpuCU4lxNRAs6izHskxX93nq94aZbuvKBXc6W63tS7IO8
	 7BauUsZgZiv6w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 002FF4B891;
	Fri, 20 Nov 2026 17:24:32 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 20:24:15 +0300
Subject: [PATCH v5 2/2] irqchip: Add Cortina Systems CS75xx peripheral
 interrupt controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-cs75xx-intc-v5-2-f2be75c5e97c@gmail.com>
References: <20261120-cs75xx-intc-v5-0-f2be75c5e97c@gmail.com>
In-Reply-To: <20261120-cs75xx-intc-v5-0-f2be75c5e97c@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795195470; l=5353;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=nlJ1ISew1ezebn+ulwSM+gYqPI61U7Zt8jVwTgz66XQ=;
 b=tcMMCzoGaymUUNfrebj6mGjQ3JnvK9hH/SSj93AzrUDRy8s+8/FXvEvdKgaj6R7YTik409P9f
 ZOr7nlD6gjfCXeBfDHCWH19jSr0A73NxpRNFaaDC6cTXRWCHpivyrcT
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
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
Reply-To: filipp.dunsky@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

The timers, GPIO banks, I2C, MDIO, SPI and a few other low speed
peripherals of the Cortina Systems CS75xx SoCs share a single GIC
interrupt. A status register shows the level of the 15 sources and an
enable register masks them; there is nothing to acknowledge, each source
is cleared in its peripheral.

Add a chained driver using a generic chip on a linear domain.
The driver depends on OF and HAS_IOMEM and can be enabled independently
of the CS75xx platform support.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 drivers/irqchip/Kconfig      |  12 +++++
 drivers/irqchip/Makefile     |   1 +
 drivers/irqchip/irq-cs75xx.c | 107 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 120 insertions(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 136bab41f..12bf87e8e 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -187,6 +187,18 @@ config BRCMSTB_L2_IRQ
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN
 
+config CS75XX_INTC
+	bool "Cortina Systems CS75xx peripheral interrupt controller"
+	depends on OF
+	depends on HAS_IOMEM
+	select GENERIC_IRQ_CHIP
+	select IRQ_DOMAIN
+	help
+	  Support for the interrupt controller of the Cortina Systems
+	  CS75xx SoCs that combines the interrupts of the low speed
+	  peripherals (timers, GPIO banks, I2C, MDIO, SPI) into a single
+	  GIC interrupt. Say Y if you have a board with such an SoC.
+
 config DAVINCI_CP_INTC
 	bool
 	select GENERIC_IRQ_CHIP
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 16a5fd126..7ed8f8b33 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -136,3 +136,4 @@ obj-$(CONFIG_MCHP_EIC)			+= irq-mchp-eic.o
 obj-$(CONFIG_SOPHGO_SG2042_MSI)		+= irq-sg2042-msi.o
 obj-$(CONFIG_SUNPLUS_SP7021_INTC)	+= irq-sp7021-intc.o
 obj-$(CONFIG_IRQCHIP_XILINX_SMMU_CSR)	+= irq-xilinx-smmu-csr.o
+obj-$(CONFIG_CS75XX_INTC)		+= irq-cs75xx.o
diff --git a/drivers/irqchip/irq-cs75xx.c b/drivers/irqchip/irq-cs75xx.c
new file mode 100644
index 000000000..18f10eb7e
--- /dev/null
+++ b/drivers/irqchip/irq-cs75xx.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Cortina Systems CS75xx peripheral interrupt controller
+ *
+ * The low speed peripherals on the register bus (timers, GPIO banks, I2C,
+ * MDIO, SPI, ...) share a single GIC interrupt. A status register shows
+ * the level of the 15 sources and an enable register masks them; there is
+ * nothing to acknowledge, the sources are cleared in the peripherals.
+ */
+
+#include <linux/bitops.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+
+#define CS75XX_INTC_STATUS	0x00
+#define CS75XX_INTC_ENABLE	0x04
+
+#define CS75XX_INTC_NR_IRQS	15
+
+static void cs75xx_intc_handler(struct irq_desc *desc)
+{
+	struct irq_domain *domain = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct irq_chip_generic *gc;
+	unsigned long pending;
+	unsigned int hwirq;
+
+	gc = irq_get_domain_generic_chip(domain, 0);
+	chained_irq_enter(chip, desc);
+
+	pending = readl(gc->reg_base + CS75XX_INTC_STATUS) & gc->mask_cache;
+	for_each_set_bit(hwirq, &pending, CS75XX_INTC_NR_IRQS)
+		generic_handle_domain_irq(domain, hwirq);
+
+	chained_irq_exit(chip, desc);
+}
+
+static int __init cs75xx_intc_init(struct device_node *np, struct device_node *parent)
+{
+	struct irq_chip_generic *gc;
+	struct irq_domain *domain;
+	struct resource res;
+	void __iomem *base;
+	int parent_irq;
+	int ret;
+
+	ret = of_address_to_resource(np, 0, &res);
+	if (ret)
+		return ret;
+
+	base = of_io_request_and_map(np, 0, of_node_full_name(np));
+	if (IS_ERR(base)) {
+		pr_err("%pOF: unable to map registers\n", np);
+		return PTR_ERR(base);
+	}
+
+	/* Mask everything before the chained handler is installed */
+	writel(0, base + CS75XX_INTC_ENABLE);
+
+	parent_irq = irq_of_parse_and_map(np, 0);
+	if (!parent_irq) {
+		pr_err("%pOF: unable to map parent interrupt\n", np);
+		ret = -EINVAL;
+		goto err_unmap;
+	}
+
+	domain = irq_domain_create_linear(of_fwnode_handle(np), CS75XX_INTC_NR_IRQS,
+					  &irq_generic_chip_ops, NULL);
+	if (!domain) {
+		ret = -ENOMEM;
+		goto err_dispose;
+	}
+
+	ret = irq_alloc_domain_generic_chips(domain, CS75XX_INTC_NR_IRQS, 1, "cs75xx-intc",
+					     handle_level_irq, IRQ_NOREQUEST,
+					     IRQ_LEVEL | IRQ_NOPROBE, IRQ_GC_INIT_MASK_CACHE);
+	if (ret)
+		goto err_domain;
+
+	gc = irq_get_domain_generic_chip(domain, 0);
+	gc->reg_base = base;
+	gc->chip_types[0].regs.mask = CS75XX_INTC_ENABLE;
+	gc->chip_types[0].chip.irq_mask = irq_gc_mask_clr_bit;
+	gc->chip_types[0].chip.irq_unmask = irq_gc_mask_set_bit;
+
+	irq_set_chained_handler_and_data(parent_irq, cs75xx_intc_handler, domain);
+
+	return 0;
+
+err_domain:
+	irq_domain_remove(domain);
+err_dispose:
+	irq_dispose_mapping(parent_irq);
+err_unmap:
+	iounmap(base);
+	release_mem_region(res.start, resource_size(&res));
+	return ret;
+}
+
+IRQCHIP_DECLARE(cs7542_intc, "cortina,cs7542-intc", cs75xx_intc_init);

-- 
2.53.0



