Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ADF606A88C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fmtxTqhq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UaM5tGF2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rWs4H6vt3oOj0DVbcxQ48oJIrZ+cy4RFgQO8xRAG8RE=; b=fmtxTqhqJ2ftaT
	iw87iAWZq5Q6F5439dM5n6baDIW+FwU/UGV3lVWOPoVXkhqN8x/LAPX6mMVJnkRv95Q/RiL66QIA+
	1lnSJwfB6dVmQeHXGVnEm7A19c2U1CSFCUPquC8ys1sMt9OlCOpFSrAlewDa00Xjq6mJy1MIIQP6V
	DtVNkMvH8bnu05jDAX8ng68TWum4tVsW/9cpU1TJnYlTEVI8bQl07gTha05ghdJRfi2ZgWph8AB7f
	Czk/Ditw1S6NzphDrbU05UlXg4l0zofXpBGHTOidvKkrtviFhPIp8eBvRC1qSSmmH0DZEhhET/P7Q
	UJgJflsHF65jutmDwK5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxUU-00000002mRP-27xk;
	Mon, 16 Nov 2026 14:15:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxUS-00000002mPo-3dCu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:15:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7658840745;
	Mon, 16 Nov 2026 14:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD9281F000CE;
	Mon, 16 Nov 2026 14:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794838524;
	bh=rWs4H6vt3oOj0DVbcxQ48oJIrZ+cy4RFgQO8xRAG8RE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UaM5tGF2OsM6QZFo1iEwCEof8sxDoBogHd5u5FE1qcPnm9QV8Y53aEwKBKW6hT0yN
	 ddfWd6fNUa+KWw2829JwD1TSCgoRRIhNH3uJXxTmz7Ny7Syjoi5g4B979JrVN8DWnN
	 k+mOULB9X0bWIhhfezNtrMPTX+RpdSw1ey0mZu5iKP5Nb5mTRrwJYUSzfvJZJRml4N
	 nycgt2fiqkyRhsh7PCQlzpS5/omn88WP0Z/RCmhyBUleGc1rivRNG3G3g3hbPIRyay
	 gDToFtY8WtzRo6WCJaeDyiKrBcySpx2nOgivWKAJNqpm1hCNvzTS/wplAy9nIYPOt3
	 WZpOqytQ5N1Rw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/8] net: stmmac: Add glue layer for Synaptics SL2610 SoC
Date: Mon, 16 Nov 2026 21:54:38 +0800
Message-ID: <20261116135442.4827-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116135442.4827-1-jszhang@kernel.org>
References: <20261116135442.4827-1-jszhang@kernel.org>
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

Add dwmac glue driver to support the DesignWare-based GMAC controllers
in the Synaptics SL2610 SoC.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 MAINTAINERS                                   |   2 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 ++
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../net/ethernet/stmicro/stmmac/dwmac-syna.c  | 116 ++++++++++++++++++
 4 files changed, 130 insertions(+)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 430758242906..dba0288bf4da 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3808,12 +3808,14 @@ M:	Jisheng Zhang <jszhang@kernel.org>
 M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/net/syna,sl2610-dwmac.yaml
 F:	Documentation/devicetree/bindings/soc/synaptics/
 F:	arch/arm/boot/dts/synaptics/
 F:	arch/arm/mach-berlin/
 F:	arch/arm64/boot/dts/synaptics/
 F:	drivers/clk/berlin/*sl2610*
 F:	drivers/clk/berlin/sl-*
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c
 F:	drivers/pinctrl/berlin/pinctrl-sl2610.c
 F:	drivers/reset/reset-sl2610.c
 F:	drivers/soc/synaptics/
diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index c6559e749c0c..79ffebcaba0e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -310,6 +310,17 @@ config DWMAC_SUN55I
 	  stmmac device driver. This driver is used for A523/T527
 	  GMAC200 ethernet controller.
 
+config DWMAC_SYNA
+	tristate "Synaptics SL2610 DWMAC support"
+	depends on OF && HAS_DMA && (ARCH_BERLIN || COMPILE_TEST)
+	select MFD_SYSCON
+	help
+	  Support for the Synaptics SL2610 DesignWare Ethernet MAC glue.
+	  This configures the PHY interface through the system controller.
+
+	  To compile this driver as a module, choose M here. The module
+	  will be called dwmac-syna.
+
 config DWMAC_THEAD
 	tristate "T-HEAD dwmac support"
 	depends on OF && (ARCH_THEAD || COMPILE_TEST)
diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index b16a456b730e..d132353e9403 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -35,6 +35,7 @@ obj-$(CONFIG_DWMAC_STM32)	+= dwmac-stm32.o
 obj-$(CONFIG_DWMAC_SUNXI)	+= dwmac-sunxi.o
 obj-$(CONFIG_DWMAC_SUN8I)	+= dwmac-sun8i.o
 obj-$(CONFIG_DWMAC_SUN55I)	+= dwmac-sun55i.o
+obj-$(CONFIG_DWMAC_SYNA)	+= dwmac-syna.o
 obj-$(CONFIG_DWMAC_THEAD)	+= dwmac-thead.o
 obj-$(CONFIG_DWMAC_ULTRARISC)	+= dwmac-ultrarisc.o
 obj-$(CONFIG_DWMAC_DWC_QOS_ETH)	+= dwmac-dwc-qos-eth.o
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c
new file mode 100644
index 000000000000..c4bc895b29da
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-syna.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Synaptics DWMAC platform driver
+ *
+ * Copyright (C) 2026 Jisheng Zhang <jszhang@kernel.org>
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_net.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include "stmmac_platform.h"
+
+#define CTL_PHY_INTF_SEL	GENMASK(4, 1)
+#define CTL_PHY_INTF_RGMII	FIELD_PREP(CTL_PHY_INTF_SEL, 1)
+#define CTL_PHY_INTF_RMII	FIELD_PREP(CTL_PHY_INTF_SEL, 4)
+
+struct syna_dwmac {
+	struct plat_stmmacenet_data *plat;
+	struct regmap *regmap;
+	u32 rgmii_ctl;
+	struct device *dev;
+};
+
+static int syna_dwmac_set_phy_if(struct plat_stmmacenet_data *plat)
+{
+	struct syna_dwmac *dwmac = plat->bsp_priv;
+	u32 phyif;
+
+	switch (plat->phy_interface) {
+	case PHY_INTERFACE_MODE_RMII:
+		phyif = CTL_PHY_INTF_RMII;
+		break;
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+		phyif = CTL_PHY_INTF_RGMII;
+		break;
+	default:
+		dev_err(dwmac->dev, "unsupported phy interface %s\n",
+			phy_modes(plat->phy_interface));
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(dwmac->regmap, dwmac->rgmii_ctl, CTL_PHY_INTF_SEL, phyif);
+}
+
+static int syna_dwmac_init(struct device *dev, void *priv)
+{
+	struct syna_dwmac *dwmac = priv;
+
+	return syna_dwmac_set_phy_if(dwmac->plat);
+}
+
+static int syna_dwmac_probe(struct platform_device *pdev)
+{
+	struct stmmac_resources stmmac_res;
+	struct plat_stmmacenet_data *plat;
+	struct syna_dwmac *dwmac;
+	int ret;
+
+	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "failed to get resources\n");
+
+	plat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	if (IS_ERR(plat))
+		return dev_err_probe(&pdev->dev, PTR_ERR(plat),
+				     "dt configuration failed\n");
+
+	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
+	if (!dwmac)
+		return -ENOMEM;
+
+	dwmac->regmap = syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
+							     "syna,syscon", 1,
+							     &dwmac->rgmii_ctl);
+	if (IS_ERR(dwmac->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dwmac->regmap),
+				     "Failed to get syscon regmap\n");
+
+	dwmac->dev = &pdev->dev;
+	dwmac->plat = plat;
+	plat->bsp_priv = dwmac;
+	plat->init = syna_dwmac_init;
+
+	return devm_stmmac_pltfr_probe(pdev, plat, &stmmac_res);
+}
+
+static const struct of_device_id syna_dwmac_match[] = {
+	{ .compatible = "syna,sl2610-dwmac" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, syna_dwmac_match);
+
+static struct platform_driver syna_dwmac_driver = {
+	.probe = syna_dwmac_probe,
+	.driver = {
+		.name = "syna-dwmac",
+		.pm = &stmmac_pltfr_pm_ops,
+		.of_match_table = syna_dwmac_match,
+	},
+};
+module_platform_driver(syna_dwmac_driver);
+
+MODULE_AUTHOR("Jisheng Zhang <jszhang@kernel.org>");
+MODULE_DESCRIPTION("Synaptics DWMAC platform driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0


