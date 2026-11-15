Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AE27606A329
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Nov 2026 10:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cmMQfsIw;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oEqs71I7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C9M1DffKSXo+cVMHY8IX2PaDpfQFRcHP/xAm1rjzLbw=; b=cmMQfsIwWwxdnt
	74rcqZ4QPje218n01rk7/tLCqn/s9Fj/TXGLX1SUvY0ieZOeIelB+Dhit3tqf8xdOiDMsthxD2TS6
	+Aqzn3tbHoBklMQeJDXmQXvfplZ26dWardRkuap1V4ZGlA90whMc3KBP3P3SIrMw0Z3OXKiTz9Fc5
	Ub5oMw2TAJCqmR9B4V/loSq/2iyhQkulNEZ1bnC9RvBVXkyvJcbYBJpQr5E0c1YP1n3Y34qQ7Mtdw
	KKmszEe3rO6r63g8lhTK0hwU/wBQ2/W2Eth/HgD+wg50I8CF/IPjnT7ZiWxK26DeECPPl881I0Nvc
	/w9IGeU9vV1DUEGKiypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXjB-0000000HOHs-0tG2;
	Sun, 15 Nov 2026 10:44:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSXj9-0000000HOGt-2pdb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Nov 2026 10:44:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 13FA061E8F;
	Sun, 15 Nov 2026 10:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F641F000CD;
	Sun, 15 Nov 2026 10:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794739490;
	bh=C9M1DffKSXo+cVMHY8IX2PaDpfQFRcHP/xAm1rjzLbw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oEqs71I7kKhkrtSiRbgcsRgiClvJ5jVx2SHi8Z5rocg4NWYRyy2l9VRKoMpNKOZBB
	 2Zjf8G+zvQThkxRXAAwNI9qyU7QNGynH/18yMhakjNLiV7lEertR43oczutjMq3vbB
	 x6afRZWudFap9q9hbzD6J6fnA6P5KFxw1kUFZYOaMhBPVVGZjJb2Lud5e7qb2ywguy
	 6UK5/lihgQZUGWdCZSB2rOllNF2BBmf4tZpPy9VxarnmRp3JIMbfq1TI4JATpxrkfE
	 PZGP6kSVw+uBMv0UIcx1iCC/0FquHo2ktRIotf8+WwwVi9xvIfEv2QYdELzoSa6iei
	 5IY+ZuL4QcaVQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 07/13] reset: add Synaptics SL2610 reset controller support
Date: Sun, 15 Nov 2026 18:23:46 +0800
Message-ID: <20261115102401.3520-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115102401.3520-1-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Support the SoC and MCU reset controls exposed by the SL2610 system
controllers. Match the MFD-created platform devices, use the parent
syscon regmap and register each reset provider against the parent DT node.

Handle both pulse resets and sticky resets with assert/deassert controls.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 MAINTAINERS                  |   1 +
 drivers/reset/Kconfig        |  13 ++
 drivers/reset/Makefile       |   1 +
 drivers/reset/reset-sl2610.c | 224 +++++++++++++++++++++++++++++++++++
 4 files changed, 239 insertions(+)
 create mode 100644 drivers/reset/reset-sl2610.c

diff --git a/MAINTAINERS b/MAINTAINERS
index eae1493485ee..1bd3b2f39865 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3812,6 +3812,7 @@ F:	Documentation/devicetree/bindings/soc/synaptics/
 F:	arch/arm/boot/dts/synaptics/
 F:	arch/arm/mach-berlin/
 F:	arch/arm64/boot/dts/synaptics/
+F:	drivers/reset/reset-sl2610.c
 F:	drivers/soc/synaptics/
 F:	include/dt-bindings/clock/syna,sl2610.h
 F:	include/dt-bindings/reset/syna,sl2610-reset.h
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index eda9c698a95f..98e973a8798c 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -358,6 +358,19 @@ config RESET_SUNXI
 	help
 	  This enables the reset driver for Allwinner SoCs.
 
+config RESET_SL2610
+	tristate "Synaptics SL2610 Reset Driver"
+	depends on ARCH_BERLIN || COMPILE_TEST
+	depends on OF && HAS_IOMEM
+	select SOC_SL2610_SYSCON
+	help
+	  Support the reset controllers in the SoC and MCU system control
+	  blocks of Synaptics SL2610 SoCs. Both pulse and sticky reset lines
+	  are supported.
+
+	  To compile this driver as a module, choose M here. The module will
+	  be called reset-sl2610.
+
 config RESET_TENSTORRENT_ATLANTIS
 	tristate "Tenstorrent atlantis reset driver"
 	depends on ARCH_TENSTORRENT || COMPILE_TEST
diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
index 489fafd6bbe3..d28276a4f2ea 100644
--- a/drivers/reset/Makefile
+++ b/drivers/reset/Makefile
@@ -42,6 +42,7 @@ obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
 obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
 obj-$(CONFIG_RESET_SKY1) += reset-sky1.o
 obj-$(CONFIG_RESET_SKY1_AUDSS) += reset-sky1-audss.o
+obj-$(CONFIG_RESET_SL2610) += reset-sl2610.o
 obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
 obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
 obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
diff --git a/drivers/reset/reset-sl2610.c b/drivers/reset/reset-sl2610.c
new file mode 100644
index 000000000000..1ca58d5a3e71
--- /dev/null
+++ b/drivers/reset/reset-sl2610.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Synaptics Incorporated
+ *
+ * Synaptics SL2610 reset driver
+ *
+ * Author: Jisheng Zhang <jszhang@kernel.org>
+ */
+
+#include <dt-bindings/reset/syna,sl2610-reset.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/reset-controller.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+/* SL2610 ACPU subsystem */
+#define SL2610_GBL_PERIFRESET			0x350
+#define SL2610_GBL_PERIFSTICKYRESET		0x360
+#define SL2610_GBL_APBPERIFRESET		0x370
+#define SL2610_GBL_TOPSTICKYRESET		0x378
+#define SL2610_GBL_AVIOSTICKYRESET		0x37c
+
+/* SL2610 system subsystem */
+#define SL2610_SMGBL_STICKYRST0			0x400
+
+#define to_sl2610_reset_priv(p)	container_of((p), struct sl2610_reset_priv, rcdev)
+
+#define SL2610_RESET(id, reg, bit, sticky)[id] = { reg, BIT(bit), sticky }
+
+struct sl2610_reset_cfg {
+	u32 reg;
+	u32 bit;
+	bool sticky;
+};
+
+struct sl2610_reset_data {
+	const struct sl2610_reset_cfg *cfgs;
+	size_t num;
+};
+
+struct sl2610_reset_priv {
+	struct regmap *regmap;
+	const struct sl2610_reset_cfg *cfgs;
+	struct reset_controller_dev rcdev;
+};
+
+static const struct sl2610_reset_cfg sl2610_reset_cfgs[] = {
+	SL2610_RESET(RST_SOC_SDIO0, SL2610_GBL_PERIFRESET, 2, false),
+	SL2610_RESET(RST_SOC_USB0, SL2610_GBL_PERIFRESET, 4, false),
+	SL2610_RESET(RST_SOC_EMMC, SL2610_GBL_PERIFRESET, 5, false),
+	SL2610_RESET(RST_SOC_GETH0, SL2610_GBL_PERIFRESET, 6, false),
+	SL2610_RESET(RST_SOC_SDIO1, SL2610_GBL_PERIFRESET, 7, false),
+	SL2610_RESET(RST_SOC_USB1, SL2610_GBL_PERIFRESET, 8, false),
+	SL2610_RESET(RST_SOC_GETH1, SL2610_GBL_PERIFRESET, 9, false),
+	SL2610_RESET(RST_SOC_USB0PHY, SL2610_GBL_PERIFSTICKYRESET, 0, true),
+	SL2610_RESET(RST_SOC_USB0CORE, SL2610_GBL_PERIFSTICKYRESET, 1, true),
+	SL2610_RESET(RST_SOC_USB0MAHB, SL2610_GBL_PERIFSTICKYRESET, 2, true),
+	SL2610_RESET(RST_SOC_USB1PHY, SL2610_GBL_PERIFSTICKYRESET, 3, true),
+	SL2610_RESET(RST_SOC_USB1CORE, SL2610_GBL_PERIFSTICKYRESET, 4, true),
+	SL2610_RESET(RST_SOC_USB1MAHB, SL2610_GBL_PERIFSTICKYRESET, 5, true),
+	SL2610_RESET(RST_SOC_UART0, SL2610_GBL_APBPERIFRESET, 0, false),
+	SL2610_RESET(RST_SOC_UART1, SL2610_GBL_APBPERIFRESET, 1, false),
+	SL2610_RESET(RST_SOC_UART2, SL2610_GBL_APBPERIFRESET, 2, false),
+	SL2610_RESET(RST_SOC_UART3, SL2610_GBL_APBPERIFRESET, 3, false),
+	SL2610_RESET(RST_SOC_I2C0, SL2610_GBL_APBPERIFRESET, 4, false),
+	SL2610_RESET(RST_SOC_I2C1, SL2610_GBL_APBPERIFRESET, 5, false),
+	SL2610_RESET(RST_SOC_SPI0, SL2610_GBL_APBPERIFRESET, 6, false),
+	SL2610_RESET(RST_SOC_SPI1, SL2610_GBL_APBPERIFRESET, 7, false),
+	SL2610_RESET(RST_SOC_SPI2, SL2610_GBL_APBPERIFRESET, 8, false),
+	SL2610_RESET(RST_SOC_SPI3, SL2610_GBL_APBPERIFRESET, 9, false),
+	SL2610_RESET(RST_SOC_APBTIMERS, SL2610_GBL_APBPERIFRESET, 10, false),
+	SL2610_RESET(RST_SOC_APBSYSCNT, SL2610_GBL_APBPERIFRESET, 11, false),
+	SL2610_RESET(RST_SOC_APBWDT, SL2610_GBL_APBPERIFRESET, 12, false),
+	SL2610_RESET(RST_SOC_APBGPIO, SL2610_GBL_APBPERIFRESET, 13, false),
+	SL2610_RESET(RST_SOC_APBDMA, SL2610_GBL_APBPERIFRESET, 14, false),
+	SL2610_RESET(RST_SOC_GPUCORE, SL2610_GBL_TOPSTICKYRESET, 0, true),
+	SL2610_RESET(RST_SOC_NPUCORE, SL2610_GBL_TOPSTICKYRESET, 1, true),
+	SL2610_RESET(RST_SOC_AVIOAIOG, SL2610_GBL_AVIOSTICKYRESET, 0, true),
+	SL2610_RESET(RST_SOC_AVIOVPPG, SL2610_GBL_AVIOSTICKYRESET, 1, true),
+	SL2610_RESET(RST_SOC_AVIOVIPG, SL2610_GBL_AVIOSTICKYRESET, 2, true),
+};
+
+static const struct sl2610_reset_cfg sl2610_system_reset_cfgs[] = {
+	SL2610_RESET(RST_SM_ADCCORE, SL2610_SMGBL_STICKYRST0, 0, true),
+	SL2610_RESET(RST_SM_ADCPRST, SL2610_SMGBL_STICKYRST0, 1, true),
+	SL2610_RESET(RST_SM_CAN0PRST, SL2610_SMGBL_STICKYRST0, 2, true),
+	SL2610_RESET(RST_SM_CAN0SRST, SL2610_SMGBL_STICKYRST0, 3, true),
+	SL2610_RESET(RST_SM_CAN1PRST, SL2610_SMGBL_STICKYRST0, 4, true),
+	SL2610_RESET(RST_SM_CAN1SRST, SL2610_SMGBL_STICKYRST0, 5, true),
+	SL2610_RESET(RST_SM_GPIOPRST, SL2610_SMGBL_STICKYRST0, 6, true),
+	SL2610_RESET(RST_SM_GPIOSRST, SL2610_SMGBL_STICKYRST0, 7, true),
+	SL2610_RESET(RST_SM_I2CM0PRST, SL2610_SMGBL_STICKYRST0, 8, true),
+	SL2610_RESET(RST_SM_I2CM0SRST, SL2610_SMGBL_STICKYRST0, 9, true),
+	SL2610_RESET(RST_SM_I2CM1PRST, SL2610_SMGBL_STICKYRST0, 10, true),
+	SL2610_RESET(RST_SM_I2CM1SRST, SL2610_SMGBL_STICKYRST0, 11, true),
+	SL2610_RESET(RST_SM_I3CPRST, SL2610_SMGBL_STICKYRST0, 12, true),
+	SL2610_RESET(RST_SM_I3CSRST, SL2610_SMGBL_STICKYRST0, 13, true),
+	SL2610_RESET(RST_SM_PDMPRST, SL2610_SMGBL_STICKYRST0, 14, true),
+	SL2610_RESET(RST_SM_PDMSRST, SL2610_SMGBL_STICKYRST0, 15, true),
+	SL2610_RESET(RST_SM_PVTHSRST, SL2610_SMGBL_STICKYRST0, 16, true),
+	SL2610_RESET(RST_SM_PVTPRST, SL2610_SMGBL_STICKYRST0, 17, true),
+	SL2610_RESET(RST_SM_PWMPERIRST, SL2610_SMGBL_STICKYRST0, 18, true),
+	SL2610_RESET(RST_SM_PWMPRST, SL2610_SMGBL_STICKYRST0, 19, true),
+	SL2610_RESET(RST_SM_SPIMPRST, SL2610_SMGBL_STICKYRST0, 20, true),
+	SL2610_RESET(RST_SM_SPIMSRST, SL2610_SMGBL_STICKYRST0, 21, true),
+	SL2610_RESET(RST_SM_SPISPRST, SL2610_SMGBL_STICKYRST0, 22, true),
+	SL2610_RESET(RST_SM_SPISSRST, SL2610_SMGBL_STICKYRST0, 23, true),
+	SL2610_RESET(RST_SM_UART0PRST, SL2610_SMGBL_STICKYRST0, 24, true),
+	SL2610_RESET(RST_SM_UART0SRST, SL2610_SMGBL_STICKYRST0, 25, true),
+	SL2610_RESET(RST_SM_UART1PRST, SL2610_SMGBL_STICKYRST0, 26, true),
+	SL2610_RESET(RST_SM_UART1SRST, SL2610_SMGBL_STICKYRST0, 27, true),
+	SL2610_RESET(RST_SM_UART2PRST, SL2610_SMGBL_STICKYRST0, 28, true),
+	SL2610_RESET(RST_SM_UART2SRST, SL2610_SMGBL_STICKYRST0, 29, true),
+	SL2610_RESET(RST_SM_UART3PRST, SL2610_SMGBL_STICKYRST0, 30, true),
+	SL2610_RESET(RST_SM_UART3SRST, SL2610_SMGBL_STICKYRST0, 31, true),
+};
+
+static const struct sl2610_reset_data sl2610_reset_data = {
+	.cfgs = sl2610_reset_cfgs,
+	.num = ARRAY_SIZE(sl2610_reset_cfgs),
+};
+
+static const struct sl2610_reset_data sl2610_system_reset_data = {
+	.cfgs = sl2610_system_reset_cfgs,
+	.num = ARRAY_SIZE(sl2610_system_reset_cfgs),
+};
+
+static int sl2610_reset_assert(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	struct sl2610_reset_priv *priv = to_sl2610_reset_priv(rcdev);
+	const struct sl2610_reset_cfg *cfg = &priv->cfgs[id];
+
+	if (!cfg->sticky)
+		return -EINVAL;
+
+	return regmap_clear_bits(priv->regmap, cfg->reg, cfg->bit);
+}
+
+static int sl2610_reset_deassert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	struct sl2610_reset_priv *priv = to_sl2610_reset_priv(rcdev);
+	const struct sl2610_reset_cfg *cfg = &priv->cfgs[id];
+
+	if (!cfg->sticky)
+		return -EINVAL;
+
+	return regmap_set_bits(priv->regmap, cfg->reg, cfg->bit);
+}
+
+static int sl2610_reset_reset(struct reset_controller_dev *rcdev,
+			      unsigned long id)
+{
+	struct sl2610_reset_priv *priv = to_sl2610_reset_priv(rcdev);
+	const struct sl2610_reset_cfg *cfg = &priv->cfgs[id];
+
+	if (cfg->sticky) {
+		regmap_clear_bits(priv->regmap, cfg->reg, cfg->bit);
+		usleep_range(10, 15);
+		return regmap_set_bits(priv->regmap, cfg->reg, cfg->bit);
+	}
+
+	return regmap_set_bits(priv->regmap, cfg->reg, cfg->bit);
+}
+
+static const struct reset_control_ops sl2610_reset_ops = {
+	.reset	= sl2610_reset_reset,
+	.assert = sl2610_reset_assert,
+	.deassert = sl2610_reset_deassert,
+};
+
+static int sl2610_reset_probe(struct platform_device *pdev)
+{
+	struct device_node *parent_np = pdev->dev.parent->of_node;
+	struct sl2610_reset_priv *priv;
+	const struct sl2610_reset_data *data =
+		(void *)platform_get_device_id(pdev)->driver_data;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->regmap = syscon_node_to_regmap(parent_np);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
+
+	priv->rcdev.owner = THIS_MODULE;
+	priv->rcdev.ops = &sl2610_reset_ops;
+	priv->rcdev.dev = &pdev->dev;
+	priv->rcdev.of_node = parent_np;
+	priv->rcdev.of_reset_n_cells = 1;
+	priv->rcdev.nr_resets = data->num;
+	priv->cfgs = data->cfgs;
+
+	return devm_reset_controller_register(&pdev->dev, &priv->rcdev);
+}
+
+static const struct platform_device_id sl2610_reset_ids[] = {
+	{ "sl2610-soc-reset", (kernel_ulong_t)&sl2610_reset_data },
+	{ "sl2610-mcu-reset", (kernel_ulong_t)&sl2610_system_reset_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, sl2610_reset_ids);
+
+static struct platform_driver sl2610_reset_driver = {
+	.probe = sl2610_reset_probe,
+	.id_table = sl2610_reset_ids,
+	.driver = {
+		.name = "sl2610-reset",
+	},
+};
+module_platform_driver(sl2610_reset_driver);
+
+MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
+MODULE_DESCRIPTION("Synaptics SL2610 reset controller");
+MODULE_LICENSE("GPL");
-- 
2.55.0


