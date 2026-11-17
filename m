Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11673606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 20:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mSoRN4ZZ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NpVymrhF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l9S+/fGt6QMtr7orblw6BxaiAisH7gLZIShPMzXT7qI=; b=mSoRN4ZZuOBUo2TgNWuXntOscw
	b/Ixd7uucyxQ9h1TkL9IjrbquxDF6hTWBsBeWgrLY8FWgJ/0QVSf8WM593F3OZlkDj0evYmyo0iT1
	VulO2x8nQ8wNIbMNXVP2TEIfdMjjWJgWsGRfICILj4cRggrHPLginmpw6wUWzYl8f84ub4iGR0cAX
	sAl6KkYfiOO4KzTdwQD0JfrKJH/TTvADmbxLr7ZpY5Ja3Cr9zK/+gEFnZL6NSTc+DjB/OPNPgacTh
	4NdQXJ/p4xcahAZVj0Jf4255U9cSxpjk6DLGyzeLlsf/zYYN1GYK1FlH66oKzOMI/ahTwRTlablu6
	rASf0sJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPo4-000000070sg-0AAD;
	Tue, 17 Nov 2026 20:29:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTPny-000000070rA-3Zlf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 20:29:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A5DF450BB;
	Tue, 17 Nov 2026 20:29:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794947366;
	b=YB0yZtia/QWuK4S0crq/zRVInF6yg+xMG0p85CbLZLKvoSpdHWYeVp4ALSc6CAIrme6q
	 o8OrupnBmM5pPZr4loyEq2tEDPmATlBOg8yxxjtw4KHx2xyalo4hM+q9mdZDnTILWwhOC
	 K8H3WoVGirS44GnJlVPibCa2O80nfMoVlGyB/Ywdfo/lAVKTkH/NbsiZdEkgICsDrDU7G
	 QpLJ6r2Svpkqh8HFvvnXhyJ1iXku34vUNkfCFEYGTwpoDyAjsT98eYwVf2R98vo8G68IY
	 /88NzUMc6I9EMtH9ZsnJU2oMhjNV32TG0Sped/2qEng+Bf7sLZDHxFHGrEKKBgJEblw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794947366;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=l9S+/fGt6QMtr7orblw6BxaiAisH7gLZIShPMzXT7qI=;
	b=zIDLFsb3hznDh/FHZTG+qSvcN88y6Fxya+zqT3GGcRtwiavwVwxf7BmV4egdPyf+VBRP
	 AojkbSc+hdsgR/CS1EP+krrIYLEXF8gMsWbSPfBz6pm7y768eHuzFCwEANovl+ZXhN8Tb
	 A/+SVecXkFVMC8zb6Gg6BOE5vUWtu8xwpFjFuoYTjfBeqjLzv+Io+M+T+66da+ipASbwE
	 E5vzsVAeiHK7cyocjNCOqHsAaIChgL+qIVHssjm953C2cyAiD5MCqtg7aQ/ZJ70U96TP+
	 WyaUbiqMtE5gZG8oXHzUXvTVyeiyRhesBrKFF4jAa7G4/lkcwNcjzli9/YFYy0mLjUw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 546D11F000C6;
	Tue, 17 Nov 2026 20:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794947366;
	bh=l9S+/fGt6QMtr7orblw6BxaiAisH7gLZIShPMzXT7qI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=NpVymrhFZ4TVyUtYiRcoTIy+Eg86NC3I5eWXFn8Ktp10UI0phxb2WxQ4mnPDAM0ev
	 kwptKW4xQ8myQczmWu3K+3FO8WZ7hSksDEgV7PuGFom+SL6qSit672R3Fur5jUb8Ej
	 Q7zg/dlJEHJo/qSdttim2WySHjQFMJBsKetKNUSyUSvi0O6AiH/5IpK9/OhzDAXBeY
	 xGZXeFvPrFKbBgX/gocCLSFMZMqEdMW4vWiXEYqxtJXsMsb9OQOi9uv1tUAspmKD32
	 F4rytBbGVoI8pq0XqKVsFIw3c2tPlLk0fc8/OQYnPXsA3joCsI6xxEyPpjTaAVdAmm
	 SF+fy485zIXoA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D86304AAD6;
	Tue, 17 Nov 2026 20:29:23 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 17 Nov 2026 23:29:24 +0300
Subject: [PATCH v4 2/2] irqchip: Add Cortina Systems CS75xx peripheral
 interrupt controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-cs75xx-intc-v4-2-0a678f35e5f3@gmail.com>
References: <20261117-cs75xx-intc-v4-0-0a678f35e5f3@gmail.com>
In-Reply-To: <20261117-cs75xx-intc-v4-0-0a678f35e5f3@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Fil Dunsky <filipp.dunsky@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794947362; l=5096;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=/TDDrsDXswx4rj1Q6oUXRwk17epz9dhPBPrG6KgLxTU=;
 b=ejtm9LmgvsXGWtXcUH+DBww2L0dLTC7iLcg7hwYWNdOK6fmX8CnNkHveV42QYqqEvLPukM5j2
 l3yTAe0NU60ASH/rvpslPwVDWj2V7OEU1cGE/nho1xhg5ih+NKVfMwt
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

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 drivers/irqchip/Kconfig      |  12 ++++++
 drivers/irqchip/Makefile     |   1 +
 drivers/irqchip/irq-cs75xx.c | 100 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 113 insertions(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 136bab41f..db5edd4ec 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -187,6 +187,18 @@ config BRCMSTB_L2_IRQ
 	select GENERIC_IRQ_CHIP
 	select IRQ_DOMAIN
 
+config CS75XX_INTC
+	bool "Cortina Systems CS75xx peripheral interrupt controller"
+	depends on ARCH_CORTINA_ACCESS || COMPILE_TEST
+	default ARCH_CORTINA_ACCESS
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
index 000000000..f3d71b06c
--- /dev/null
+++ b/drivers/irqchip/irq-cs75xx.c
@@ -0,0 +1,100 @@
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
+	void __iomem *base;
+	int parent_irq;
+	int ret;
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
+					     handle_level_irq, IRQ_NOREQUEST | IRQ_NOPROBE, 0,
+					     IRQ_GC_INIT_MASK_CACHE);
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
+	return ret;
+}
+
+IRQCHIP_DECLARE(cs7542_intc, "cortina,cs7542-intc", cs75xx_intc_init);

-- 
2.53.0



