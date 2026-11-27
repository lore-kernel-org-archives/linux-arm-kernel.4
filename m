Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43506606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 07:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SbFRc5E7;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=EL3iYBZ3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=1qwbWnvKEU7/ZSqFLUBI0N+EyQGa8+xJ5qlfr0krybI=; b=SbFRc5E7ebFYIO
	6JHG3Lh4kqs+KSp75fH29tYmN1cxMnYiB7Mi4fS8KA0pho9AJWG7ajsW/RnTEPdHtmArb/dNQym/4
	+STzX82RYHS+N3k1SknQfCuuY5tOPqbrvOHP8KlgDUAtLdbkPYQXef/aV1GsWVT8pn439UuTH6gbb
	fm8g14Q7xKEmQ1z4ND2c/s6foWGVIrSWL30i7TyWvlpJJ4/wmSOktOyxI41SLl7ppseaLNs+5fjNA
	qq2BR4VCiPJyZpo3SBUaq46eWS7dZIz5SXFp4TRflPG6KoNK2sFhRFLJtCQuWX3LlqibHoEGU6ewa
	g7YuTqulwIrDcD8TFmuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqSj-0000000F7pg-04n1;
	Fri, 27 Nov 2026 07:33:41 +0000
Received: from watt.d-silva.org ([119.15.109.137] helo=www.nmnhosting.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWqSU-0000000F7hZ-0eTl;
	Fri, 27 Nov 2026 07:33:27 +0000
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 7AB4F4C962;
	Fri, 27 Nov 2026 18:33:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1qwbWnvKEU7/ZSqFLUBI0N+EyQGa8+xJ5qlfr0krybI=;
	b=EL3iYBZ3dx//8zLwQlpCHu0GTMDsJYJiFyT6g6GOiRzJS20rsxfggkIW158c4DUzPZYFj4
	TL6QsgSn58PE0+JilNAgWLIeKy44D8RiXLvubC/hbwpaFW0KGBgmmQAwL5cPGZ4ZjOCoSC
	0nFLYHOhgIjuXxUmyMY9DgF2Q4CY/NPPCiRwTf/Mb8jNmiERDDsFPRUGwIONqjmVe0tJUz
	246ksmFcxD9VwO7oZeSS4H46ENRh+PG4njn2gzdS6FhW5FPQVYrRHmLSpIBd6qE7+RBVug
	VH1K9d5XquqCwaPh5i+WAAxHJ0qI7+FXGIS9eZsM1Ux78bTuM/soNBhKa4ZbOQ==
X-GPT-Reason: legitimate; the email is a technical patch submission
	for a Linux kernel/hardware driver (Allwinner A733 USB 2.0 PHY),
	which aligns perfectly with the personal/business identity of
	the recipient (alastair@d-silva.org); the "From" domain (d-silva.org)
	matches the recipient domain exactly, establishing a clear personal
	or professional relationship; there are no phishing indicators,
	no suspicious links, no urgency, and the content is highly specific
	and non-commercial.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 06/11] phy: allwinner: Add Allwinner A733 USB 2.0 PHY driver
Date: Fri, 27 Nov 2026 18:32:26 +1100
Message-ID: <20261127073231.1776847-7-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127073231.1776847-1-alastair@d-silva.org>
References: <20261127073231.1776847-1-alastair@d-silva.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_233326_355647_D95F40E5 
X-CRM114-Status: GOOD (  22.20  )
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

Add USB 2.0 PHY driver for the Allwinner A733 DWC3 controller.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/phy/allwinner/Kconfig            |  12 ++
 drivers/phy/allwinner/Makefile           |   1 +
 drivers/phy/allwinner/phy-sun60i-u2phy.c | 233 +++++++++++++++++++++++
 3 files changed, 246 insertions(+)
 create mode 100644 drivers/phy/allwinner/phy-sun60i-u2phy.c

diff --git a/drivers/phy/allwinner/Kconfig b/drivers/phy/allwinner/Kconfig
index 7518c4b5c379..f8dc4931378b 100644
--- a/drivers/phy/allwinner/Kconfig
+++ b/drivers/phy/allwinner/Kconfig
@@ -68,3 +68,15 @@ config PHY_SUN60I_COMBOPHY
 	help
 	  Enable this to support the SerDes ComboPHY controller on
 	  Allwinner A733 SoCs.
+
+config PHY_SUN60I_U2PHY
+	tristate "Allwinner A733 USB 2.0 PHY driver"
+	depends on ARCH_SUNXI || COMPILE_TEST
+	depends on HAS_IOMEM && COMMON_CLK && OF
+	depends on RESET_CONTROLLER
+	select GENERIC_PHY
+	help
+	  Enable this to support the USB 2.0 PHY paired with the DWC3
+	  controller on Allwinner A733 SoCs. This driver handles UTMI
+	  PHY initialization, tuning, and host/device mode switching.
+	  If unsure, say N.
diff --git a/drivers/phy/allwinner/Makefile b/drivers/phy/allwinner/Makefile
index 483e9053bb5f..22793d59c4cd 100644
--- a/drivers/phy/allwinner/Makefile
+++ b/drivers/phy/allwinner/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_PHY_SUN6I_MIPI_DPHY)	+= phy-sun6i-mipi-dphy.o
 obj-$(CONFIG_PHY_SUN9I_USB)		+= phy-sun9i-usb.o
 obj-$(CONFIG_PHY_SUN50I_USB3)		+= phy-sun50i-usb3.o
 obj-$(CONFIG_PHY_SUN60I_COMBOPHY)	+= phy-sun60i-combophy.o
+obj-$(CONFIG_PHY_SUN60I_U2PHY)		+= phy-sun60i-u2phy.o
diff --git a/drivers/phy/allwinner/phy-sun60i-u2phy.c b/drivers/phy/allwinner/phy-sun60i-u2phy.c
new file mode 100644
index 000000000000..7788fe55ee56
--- /dev/null
+++ b/drivers/phy/allwinner/phy-sun60i-u2phy.c
@@ -0,0 +1,233 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Allwinner A733 USB 2.0 PHY driver
+ *
+ * Copyright (C) 2026 Alastair D'Silva <alastair@d-silva.org>
+ */
+
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/clk.h>
+#include <linux/io.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/reset.h>
+
+#define PHY_USB2_ISCR			0x00
+#define   FORCE_ID_MASK			GENMASK(15, 14)
+#define   FORCE_ID_HOST			BIT(15)
+#define   FORCE_ID_DEVICE		GENMASK(15, 14)
+#define   FORCE_VBUS_VALID_MASK		GENMASK(13, 12)
+#define   FORCE_VBUS_VALID_HIGH		GENMASK(13, 12)
+
+#define PHY_USB2_PHYCTL			0x10
+#define   OTGDISABLE			BIT(10)
+#define   VBUSVLDEXT			BIT(5)
+#define   SIDDQ				BIT(3)
+
+#define PHY_USB2_PHYTUNE		0x18
+/* Vendor BSP default USB2 PHY tuning value for A733. */
+#define   PHYTUNE_A733_DEFAULT		0x143338d6
+
+struct sun60i_u2phy {
+	void __iomem *base;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct reset_control *reset;
+	struct mutex lock; /* protects mode and initialized state */
+	enum phy_mode mode;
+	bool initialized;
+};
+
+static const char * const sun60i_u2phy_clks[] = {
+	"bus",
+	"ahb",
+};
+
+static void sun60i_u2phy_apply_mode(struct sun60i_u2phy *u2phy)
+{
+	u32 val;
+
+	val = readl(u2phy->base + PHY_USB2_ISCR);
+	val &= ~(FORCE_ID_MASK | FORCE_VBUS_VALID_MASK);
+
+	switch (u2phy->mode) {
+	case PHY_MODE_USB_HOST:
+		val |= FORCE_ID_HOST | FORCE_VBUS_VALID_HIGH;
+		break;
+	case PHY_MODE_USB_DEVICE:
+		val |= FORCE_ID_DEVICE | FORCE_VBUS_VALID_HIGH;
+		break;
+	case PHY_MODE_USB_OTG:
+	default:
+		break;
+	}
+
+	writel(val, u2phy->base + PHY_USB2_ISCR);
+}
+
+static int sun60i_u2phy_init(struct phy *phy)
+{
+	struct sun60i_u2phy *u2phy = phy_get_drvdata(phy);
+	u32 val;
+	int ret;
+
+	guard(mutex)(&u2phy->lock);
+
+	ret = reset_control_deassert(u2phy->reset);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(u2phy->num_clks, u2phy->clks);
+	if (ret) {
+		reset_control_assert(u2phy->reset);
+		return ret;
+	}
+
+	sun60i_u2phy_apply_mode(u2phy);
+
+	val = readl(u2phy->base + PHY_USB2_PHYCTL);
+	val |= OTGDISABLE | VBUSVLDEXT;
+	val &= ~SIDDQ;
+	writel(val, u2phy->base + PHY_USB2_PHYCTL);
+
+	writel(PHYTUNE_A733_DEFAULT, u2phy->base + PHY_USB2_PHYTUNE);
+	u2phy->initialized = true;
+
+	return 0;
+}
+
+static int sun60i_u2phy_exit(struct phy *phy)
+{
+	struct sun60i_u2phy *u2phy = phy_get_drvdata(phy);
+	u32 val;
+
+	guard(mutex)(&u2phy->lock);
+
+	u2phy->initialized = false;
+
+	val = readl(u2phy->base + PHY_USB2_PHYCTL);
+	val &= ~(OTGDISABLE | VBUSVLDEXT);
+	val |= SIDDQ;
+	writel(val, u2phy->base + PHY_USB2_PHYCTL);
+
+	val = readl(u2phy->base + PHY_USB2_ISCR);
+	val &= ~(FORCE_ID_MASK | FORCE_VBUS_VALID_MASK);
+	writel(val, u2phy->base + PHY_USB2_ISCR);
+
+	clk_bulk_disable_unprepare(u2phy->num_clks, u2phy->clks);
+	return reset_control_assert(u2phy->reset);
+}
+
+static int sun60i_u2phy_set_mode(struct phy *phy, enum phy_mode mode,
+				 int submode)
+{
+	struct sun60i_u2phy *u2phy = phy_get_drvdata(phy);
+
+	guard(mutex)(&u2phy->lock);
+
+	switch (mode) {
+	case PHY_MODE_USB_HOST:
+	case PHY_MODE_USB_HOST_LS:
+	case PHY_MODE_USB_HOST_FS:
+	case PHY_MODE_USB_HOST_HS:
+	case PHY_MODE_USB_HOST_SS:
+		u2phy->mode = PHY_MODE_USB_HOST;
+		break;
+	case PHY_MODE_USB_DEVICE:
+	case PHY_MODE_USB_DEVICE_LS:
+	case PHY_MODE_USB_DEVICE_FS:
+	case PHY_MODE_USB_DEVICE_HS:
+	case PHY_MODE_USB_DEVICE_SS:
+		u2phy->mode = PHY_MODE_USB_DEVICE;
+		break;
+	case PHY_MODE_USB_OTG:
+		u2phy->mode = PHY_MODE_USB_OTG;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (u2phy->initialized)
+		sun60i_u2phy_apply_mode(u2phy);
+
+	return 0;
+}
+
+static const struct phy_ops sun60i_u2phy_ops = {
+	.init = sun60i_u2phy_init,
+	.exit = sun60i_u2phy_exit,
+	.set_mode = sun60i_u2phy_set_mode,
+	.owner = THIS_MODULE,
+};
+
+static int sun60i_u2phy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct sun60i_u2phy *u2phy;
+	struct phy_provider *phy_provider;
+	struct phy *phy;
+	int i, ret;
+
+	u2phy = devm_kzalloc(dev, sizeof(*u2phy), GFP_KERNEL);
+	if (!u2phy)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(dev, &u2phy->lock);
+	if (ret)
+		return ret;
+	u2phy->mode = PHY_MODE_USB_HOST;
+	u2phy->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(u2phy->base))
+		return PTR_ERR(u2phy->base);
+
+	u2phy->num_clks = ARRAY_SIZE(sun60i_u2phy_clks);
+	u2phy->clks = devm_kcalloc(dev, u2phy->num_clks, sizeof(*u2phy->clks),
+				   GFP_KERNEL);
+	if (!u2phy->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < u2phy->num_clks; i++)
+		u2phy->clks[i].id = sun60i_u2phy_clks[i];
+
+	ret = devm_clk_bulk_get(dev, u2phy->num_clks, u2phy->clks);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get clocks\n");
+
+	u2phy->reset = devm_reset_control_get_shared(dev, NULL);
+	if (IS_ERR(u2phy->reset))
+		return dev_err_probe(dev, PTR_ERR(u2phy->reset),
+				     "failed to get reset\n");
+
+	phy = devm_phy_create(dev, NULL, &sun60i_u2phy_ops);
+	if (IS_ERR(phy))
+		return dev_err_probe(dev, PTR_ERR(phy),
+				     "failed to create PHY\n");
+
+	phy_set_drvdata(phy, u2phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct of_device_id sun60i_u2phy_of_match[] = {
+	{ .compatible = "allwinner,sun60i-a733-u2phy" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, sun60i_u2phy_of_match);
+
+static struct platform_driver sun60i_u2phy_driver = {
+	.probe = sun60i_u2phy_probe,
+	.driver = {
+		.name = "sun60i-u2phy",
+		.of_match_table = sun60i_u2phy_of_match,
+	},
+};
+module_platform_driver(sun60i_u2phy_driver);
+
+MODULE_DESCRIPTION("Allwinner A733 USB 2.0 PHY driver");
+MODULE_AUTHOR("Alastair D'Silva <alastair@d-silva.org>");
+MODULE_LICENSE("GPL");
-- 
2.53.0


