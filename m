Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495DF606A331
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 20:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tte2J3Oi;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=g/94mVM+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8ITVm9KHIidGk2o0N3N4/rd1vDviKje/tihPuJoXn4s=; b=Tte2J3OisIo1Tr
	f0poxyvHMIeEeWkXdBV/t2XX7YnRS3XKjgMxUrsh6KihVPv7xSjN0iI+eQbCNOP/hX/EgdnhgOaJ6
	Kp8BbCIThgOWSevzeoVTOFa8M3iq3Z3Oe9JQpJxWNwuqQg325SvmHlNCDRnuPo4kdCPvUr7LmROtD
	wXJM94NxFTAEjATRgw6a34ZWqTNq4OTED9rrWjn4oEnyHITzAwW/M/ilv6EZqgWmTSt5cXDF6ut0L
	Eev+8XlYKjxSej7U2VYmtr3aE3ADD6tSQdPR1OLsgiDq4q3+HCUks+S++x5NNn6jRoEM5X863JAjP
	uMPxyiTxBzTKfpmZiWcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPn9e-0000000FNFl-0BYi;
	Sat, 07 Nov 2026 20:36:50 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPn9a-0000000FNBT-03Qy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 20:36:48 +0000
Received: by chaosmail.tech (Postfix) id 3A0F31CB76B;
	Sat, 07 Nov 2026 20:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1794083794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ITVm9KHIidGk2o0N3N4/rd1vDviKje/tihPuJoXn4s=;
	b=g/94mVM+o+u4+s4Hfcdcdb9MYFdAZnoFnxQ8xuS0RYGqHJ+Jljixn05QYbtt2h4PkWoaHk
	6O/8WA+rSXEQMT7z2rqPirN6/T4CLsyjeG8xLeOWHrkCBihesUU+J78AcaKRor7CgpPFlQ
	lNTHdu8JgKEWPS3hkNWJ13ZYUcKVDuc=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 07 Nov 2026 21:36:28 +0100
Subject: [PATCH v11 6/6] spmi: apple: Add interrupt functionality
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-t603x-spmi-v11-6-322490215f58@chaosmail.tech>
References: <20261107-t603x-spmi-v11-0-322490215f58@chaosmail.tech>
In-Reply-To: <20261107-t603x-spmi-v11-0-322490215f58@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>, Alba Mendez <me@alba.sh>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794083789; l=10938;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=8E67nA/finLLXVoBYMSqLg25vOBgCw5/T37+JMSBTvQ=;
 b=61EvVrl5j99e9gl2uKf/F4TkbciqKhu+UJV+GOTBO/CNawk+21dUx2qNnoHvon5FdIiAlH2b5
 TwoYRArXOB+DnH73Een2XY+49BpLJMv8zSiFRIQS4BVMHuKxPYVZw1i
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_123646_293830_04632327 
X-CRM114-Status: GOOD (  24.92  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alba Mendez <me@alba.sh>

Add support for interrupts sent by slave devices and use IRQ for
RX FIFO if possible, as that IRQ fires as soon as the reply is
available, which is usually takes a few us instead of the 10ms sleep
interval for polling.

Signed-off-by: Alba Mendez <me@alba.sh>
Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 drivers/spmi/Kconfig                 |   3 +-
 drivers/spmi/spmi-apple-controller.c | 257 ++++++++++++++++++++++++++++++++++-
 2 files changed, 258 insertions(+), 2 deletions(-)

diff --git a/drivers/spmi/Kconfig b/drivers/spmi/Kconfig
index a80cf4047b86..7243863a09b4 100644
--- a/drivers/spmi/Kconfig
+++ b/drivers/spmi/Kconfig
@@ -13,7 +13,8 @@ if SPMI
 
 config SPMI_APPLE
 	tristate "Apple SoC SPMI Controller platform driver"
-	depends on ARCH_APPLE || COMPILE_TEST
+	select IRQ_DOMAIN_HIERARCHY
+	depends on ARCH_APPLE || (COMPILE_TEST && 64BIT)
 	help
 	  If you say yes to this option, support will be included for the
 	  SPMI controller present on many Apple SoCs, including the
diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
index fabccd25aa0d..2390174452ab 100644
--- a/drivers/spmi/spmi-apple-controller.c
+++ b/drivers/spmi/spmi-apple-controller.c
@@ -13,11 +13,17 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/completion.h>
+#include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/spinlock.h>
 #include <linux/spmi.h>
 
 /* SPMI Controller Registers */
@@ -26,6 +32,13 @@
 #define SPMI_RSP_REG 0x8
 #define SPMI_ACT_REG 0xa4
 
+#define SPMI_IRQ_MASK_BASE 0x20
+#define SPMI_IRQ_ACK_BASE 0x60
+#define SPMI_NUM_PERIPHERAL_IRQS 256
+#define SPMI_NUM_IRQS (SPMI_NUM_PERIPHERAL_IRQS + 32)
+
+#define SPMI_IRQ_NOTIFY 256
+
 /* SPMI_RSP_REG reply word */
 #define SPMI_REPLY_FRAME_PARITY_STATUS GENMASK(31, 16)
 #define SPMI_REPLY_ACK BIT(15)
@@ -41,6 +54,12 @@
 struct apple_spmi {
 	void __iomem *regs;
 	struct mutex fifo_lock;
+	struct completion fifo_rx;
+	struct irq_domain *irqd;
+	raw_spinlock_t irq_mask_lock;
+	DECLARE_BITMAP(irq_mask_cache, SPMI_NUM_PERIPHERAL_IRQS);
+	int irq;
+	bool notify_irq;
 	bool prev_fail;
 };
 
@@ -48,6 +67,56 @@ struct apple_spmi {
 	readl_poll_timeout((spmi)->regs + (reg), (val), (cond), \
 			   REG_POLL_INTERVAL_US, REG_POLL_TIMEOUT_US)
 
+static void apple_spmi_irq_ack_raw(struct apple_spmi *spmi, u32 irq)
+{
+	u32 __iomem *reg = spmi->regs + SPMI_IRQ_ACK_BASE + (irq / 32) * 4;
+
+	writel(BIT(irq % 32), reg);
+}
+
+static void apple_spmi_irq_mask_raw(struct apple_spmi *spmi, u32 irq)
+{
+	u32 __iomem *reg = spmi->regs + SPMI_IRQ_MASK_BASE + (irq / 32) * 4;
+
+	writel(readl(reg) & ~BIT(irq % 32), reg);
+}
+
+static void apple_spmi_irq_unmask_raw(struct apple_spmi *spmi, u32 irq)
+{
+	u32 __iomem *reg = spmi->regs + SPMI_IRQ_MASK_BASE + (irq / 32) * 4;
+
+	writel(readl(reg) | BIT(irq % 32), reg);
+}
+
+static void apple_spmi_irq_ack(struct irq_data *d)
+{
+	struct apple_spmi *spmi = irq_data_get_irq_chip_data(d);
+
+	apple_spmi_irq_ack_raw(spmi, d->hwirq);
+}
+
+static void apple_spmi_irq_mask(struct irq_data *d)
+{
+	struct apple_spmi *spmi = irq_data_get_irq_chip_data(d);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&spmi->irq_mask_lock, flags);
+	apple_spmi_irq_mask_raw(spmi, d->hwirq);
+	clear_bit(d->hwirq, spmi->irq_mask_cache);
+	raw_spin_unlock_irqrestore(&spmi->irq_mask_lock, flags);
+}
+
+static void apple_spmi_irq_unmask(struct irq_data *d)
+{
+	struct apple_spmi *spmi = irq_data_get_irq_chip_data(d);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&spmi->irq_mask_lock, flags);
+	set_bit(d->hwirq, spmi->irq_mask_cache);
+	apple_spmi_irq_unmask_raw(spmi, d->hwirq);
+	raw_spin_unlock_irqrestore(&spmi->irq_mask_lock, flags);
+}
+
 static inline u32 apple_spmi_pack_cmd(u8 opc, u8 sid, u16 param)
 {
 	return opc | sid << 8 | (u32)param << 16 | (1 << 15);
@@ -60,7 +129,19 @@ static int apple_spmi_wait_rx_not_empty(struct spmi_controller *ctrl)
 	int ret;
 	u32 status;
 
-	ret = poll_reg(spmi, SPMI_STATUS_REG, status, !(status & SPMI_RX_FIFO_EMPTY));
+	if (spmi->notify_irq) {
+		ret = wait_for_completion_timeout(&spmi->fifo_rx,
+			usecs_to_jiffies(REG_POLL_TIMEOUT_US));
+		if (!ret)
+			ret = -ETIMEDOUT;
+		else if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY)
+			ret = -EIO;
+		else
+			ret = 0;
+	} else {
+		ret = poll_reg(spmi, SPMI_STATUS_REG, status, !(status & SPMI_RX_FIFO_EMPTY));
+	}
+
 	if (ret) {
 		spmi->prev_fail = true;
 		dev_err(&ctrl->dev,
@@ -84,8 +165,10 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid, u16 param,
 
 	if (spmi->prev_fail) {
 		writel(SPMI_ACT_FIFO_FLUSH, spmi->regs + SPMI_ACT_REG);
+		apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_NOTIFY);
 		spmi->prev_fail = false;
 	}
+	reinit_completion(&spmi->fifo_rx);
 
 	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
 
@@ -188,6 +271,167 @@ static int spmi_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
 	return -EINVAL;
 }
 
+static int apple_spmi_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	/* all interrupts have MSI semantics */
+	return type == IRQ_TYPE_EDGE_RISING ? 0 : -EINVAL;
+}
+
+static struct irq_chip apple_spmi_irq_chip = {
+	.name = "apple_spmi",
+	.irq_mask = apple_spmi_irq_mask,
+	.irq_unmask = apple_spmi_irq_unmask,
+	.irq_ack = apple_spmi_irq_ack,
+	.irq_set_type = apple_spmi_irq_set_type,
+	.flags = IRQCHIP_ONESHOT_SAFE,
+};
+
+static int apple_spmi_irq_domain_map(struct irq_domain *irqd,
+					unsigned int irq, irq_hw_number_t hw)
+{
+	irq_domain_set_info(irqd, irq, hw, &apple_spmi_irq_chip, irqd->host_data,
+				handle_edge_irq, NULL, NULL);
+	return 0;
+}
+
+static int apple_spmi_irq_domain_translate(struct irq_domain *irqd,
+					struct irq_fwspec *fwspec,
+					unsigned long *hwirq,
+					unsigned int *type)
+{
+	u32 *args = fwspec->param;
+
+	if (fwspec->param_count != 2)
+		return -EINVAL;
+
+	if (args[0] >= SPMI_NUM_PERIPHERAL_IRQS)
+		return -EINVAL;
+	*hwirq = args[0];
+	*type = args[1] & IRQ_TYPE_SENSE_MASK;
+	return 0;
+}
+
+static int apple_spmi_irq_domain_alloc(struct irq_domain *irqd, unsigned int virq,
+				unsigned int nr_irqs, void *arg)
+{
+	unsigned int type = IRQ_TYPE_NONE;
+	struct irq_fwspec *fwspec = arg;
+	irq_hw_number_t hwirq;
+	int i, ret;
+
+	ret = apple_spmi_irq_domain_translate(irqd, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	if (hwirq + nr_irqs > SPMI_NUM_PERIPHERAL_IRQS)
+		return -EINVAL;
+
+	for (i = 0; i < nr_irqs; i++) {
+		ret = apple_spmi_irq_domain_map(irqd, virq + i, hwirq + i);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static void apple_spmi_irq_domain_free(struct irq_domain *irqd, unsigned int virq,
+				unsigned int nr_irqs)
+{
+	int i;
+
+	for (i = 0; i < nr_irqs; i++) {
+		struct irq_data *d = irq_domain_get_irq_data(irqd, virq + i);
+
+		irq_set_handler(virq + i, NULL);
+		irq_domain_reset_irq_data(d);
+	}
+}
+
+static const struct irq_domain_ops apple_spmi_irq_domain_ops = {
+	.translate	= apple_spmi_irq_domain_translate,
+	.alloc		= apple_spmi_irq_domain_alloc,
+	.free		= apple_spmi_irq_domain_free,
+};
+
+static void apple_spmi_irq_handler(struct irq_desc *desc)
+{
+	struct apple_spmi *spmi = irq_desc_get_handler_data(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	bool handled = false;
+	unsigned long val, offset, bit;
+
+	chained_irq_enter(chip, desc);
+	val = readl(spmi->regs + SPMI_IRQ_ACK_BASE + (SPMI_IRQ_NOTIFY / 32) * 4);
+	if (val & BIT(SPMI_IRQ_NOTIFY % 32)) {
+		apple_spmi_irq_ack_raw(spmi, SPMI_IRQ_NOTIFY);
+		complete(&spmi->fifo_rx);
+		handled = true;
+	}
+
+	for (offset = 0; offset < SPMI_NUM_PERIPHERAL_IRQS / 8; offset += sizeof(val)) {
+		val = readq(spmi->regs + SPMI_IRQ_ACK_BASE + offset);
+		/**
+		 * because of other masters in the bus, we're going to get a multitude of
+		 * interrupts we're not interested in. irq_resolve_mapping isn't very
+		 * optimized for the nonexistent path, so instead we mask with (a locally
+		 * cached version of) the IRQ mask
+		 */
+		val &= spmi->irq_mask_cache[offset / sizeof(val)];
+		for_each_set_bit(bit, &val, 64) {
+			generic_handle_domain_irq(spmi->irqd, offset * 8 + bit);
+			handled = true;
+		}
+	}
+	if (!handled)
+		handle_bad_irq(desc);
+	chained_irq_exit(chip, desc);
+}
+
+static void apple_spmi_teardown_irq(void *data)
+{
+	struct apple_spmi *spmi = data;
+
+	for (size_t offset = 0; offset < SPMI_NUM_IRQS / 8; offset += 4)
+		writel(0, spmi->regs + SPMI_IRQ_MASK_BASE + offset);
+
+	synchronize_irq(spmi->irq);
+	irq_set_chained_handler_and_data(spmi->irq, NULL, NULL);
+}
+
+static int apple_spmi_init_irq(struct platform_device *pdev,
+			       struct apple_spmi *spmi, int irq)
+{
+	int ret;
+	struct irq_domain_info info = {
+		.fwnode		= pdev->dev.fwnode,
+		.hwirq_max	= ~0U,
+		.ops		= &apple_spmi_irq_domain_ops,
+		.host_data	= spmi,
+	};
+
+	raw_spin_lock_init(&spmi->irq_mask_lock);
+
+	for (size_t offset = 0; offset < SPMI_NUM_IRQS / 8; offset += 4) {
+		writel(0, spmi->regs + SPMI_IRQ_MASK_BASE + offset);
+		writel(U32_MAX, spmi->regs + SPMI_IRQ_ACK_BASE + offset);
+	}
+
+	spmi->irqd = devm_irq_domain_instantiate(&pdev->dev, &info);
+	if (IS_ERR(spmi->irqd))
+		return PTR_ERR(spmi->irqd);
+
+	ret = devm_add_action(&pdev->dev, apple_spmi_teardown_irq, spmi);
+	if (ret)
+		return ret;
+
+	irq_set_chained_handler_and_data(spmi->irq, apple_spmi_irq_handler, spmi);
+	apple_spmi_irq_unmask_raw(spmi, SPMI_IRQ_NOTIFY);
+	spmi->notify_irq = true;
+
+	return 0;
+}
+
 static int apple_spmi_probe(struct platform_device *pdev)
 {
 	struct apple_spmi *spmi;
@@ -200,6 +444,8 @@ static int apple_spmi_probe(struct platform_device *pdev)
 
 	spmi = spmi_controller_get_drvdata(ctrl);
 	mutex_init(&spmi->fifo_lock);
+	init_completion(&spmi->fifo_rx);
+	platform_set_drvdata(pdev, spmi);
 
 	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(spmi->regs))
@@ -211,6 +457,15 @@ static int apple_spmi_probe(struct platform_device *pdev)
 	ctrl->write_cmd = spmi_write_cmd;
 	ctrl->cmd = spmi_cmd;
 
+	spmi->irq = platform_get_irq_optional(pdev, 0);
+	if (spmi->irq < 0 && spmi->irq != -ENXIO)
+		return spmi->irq;
+	if (spmi->irq >= 0) {
+		ret = apple_spmi_init_irq(pdev, spmi, spmi->irq);
+		if (ret)
+			return ret;
+	}
+
 	ret = devm_spmi_controller_add(&pdev->dev, ctrl);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret,

-- 
2.56.0


