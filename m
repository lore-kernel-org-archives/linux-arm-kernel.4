Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07BD60A2606
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 00:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uStnOKd5;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=TzqZBKMl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ABxWzgzmGEph2AHBxDZRCgEW99uo6BmUCnWoisNV7Yw=; b=uStnOKd5nxB6zr
	hVsBDIcRr0AKgQ57md7MQLCfx/X/J4IxpWjGBnFHjtBYbOc5B6INvKbI7oI78bRVKkatP+L63rWtG
	9s8HWfIwwWACarhl8KLzAtbGqvX9a0cgupO+fiqD3P3BupkoZHych8m6An611Tt/LOjyxg4KD6c0/
	An4U4IH0e2w7ZrDB+5VRfzU4u/4ihrgssKtPMCQfHRaLuxeyhrZJeTtDokX3cMi9cLVrW6PYHY0ck
	66g7w0Ogj81VPG6koxGC6GSgFZ8uWhQqNFGcopUEH3I5UEtfoYtCOzGXiNmuMpNp31k8+FhdZhwvb
	rAxB3soHbC2eoMC0NC8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZKP-00000001ylD-0Zel;
	Tue, 10 Nov 2026 00:03:09 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZK7-00000001yX9-31c6;
	Tue, 10 Nov 2026 00:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794268968;
	bh=GN4bmnoEDDAXDU5l7MQkDzQrhcRMkLzOepWx2peIp3g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TzqZBKMlDbyecZRI8Acku4S9WOI8n1T3yAhQybhrGEzD4TizsfhYWTt3MOHAa3W+B
	 aKOY1ttJqMyuJLz992F4z+X7upBp2MHpkpDWfFY9qpcqXj53yjO5O8nisprPnvhe83
	 69WHqKLtCDKRImFIo12oAJ8QXEedA4O/DaLxuHZPKB7sOHsDaWei9BStmChRWZZ/D1
	 wkAg9HbnCF0BLMVwTwB0h5H4mFM1dLfWsiyootrdBwsT9J7S3OxjNRow2ybw0xUp/D
	 NMtNzRrTI6uRnYDwfUXaR7AXlEClM0fTzOFq+1Li2eTXifqyr1j57tMO18QCsUc9+d
	 /wFKiMQW5kTSw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 681F217E07EC;
	Tue, 10 Nov 2026 01:02:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 23876480030; Tue, 10 Nov 2026 01:02:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 01:02:47 +0100
Subject: [PATCH v4 2/5] phy: rockchip: inno-usb2: ignore regmap_write
 return codes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-2-51acc071634f@collabora.com>
References: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-0-51acc071634f@collabora.com>
In-Reply-To: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-0-51acc071634f@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 William Wu <william.wu@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Igor Paunovic <royalnet026@gmail.com>, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10869;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=GN4bmnoEDDAXDU5l7MQkDzQrhcRMkLzOepWx2peIp3g=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGryXydIITBhOGACeSv+CQfTAL5yJOqSyFfDl
 /YVT83PjR73i4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq8l8nAAoJENju1/PI
 O/qa8E4P/2vejFM2vnvgfwZ5YHGBB1PyXWvUMB1mXQYTvxauDN/9cZbk8TggFUF98oqa9B85WP7
 Kvz5uyHpb0QtTR8reOav7Q8vMLRHT/VS+jY2HUmJE7dM5ue9Cwk+a07L/H6cAAhZjM4cM+jxq4a
 by+7jWiCAiSx2lb08EuJ6m+GKS0EurrnC1tKD/+TuK7dszf4/X4o9d8JAGpApC0Hy1u+bQWHptm
 1jWTdIb8anSzOhfJbGxyRkm+tXSTF+FP4PMtrsw6Q/N2ZChAyROsVnF37/nQ1RTXtCeMOSWa/UT
 uiy5k7yEotLppLw/KOmyzNezdJS0cxak0ijFNdj1z7g2rghd4f37MsH5nE3pAd8krapkuP+gY7n
 c6wwYvMBKNoUcBQuL/V82TmJ2+5ZhzWwYzpp+Wsf7Brj+sz7LQpwrE6FFwS2Fx2jpvA1VQb5+eO
 O37o7sNQVcxIni0ZyWzSLPVafAe99XmnzprslIUkrfE2lauFRwIieySadW4V8mTGU9X8QW188AI
 BOQQ9wMdj1l7L9pGmLCS06pRBJfetZMfwuUED6rttxoU9ixAwJ7nSI2cvQf8gsb7/qb9SSFxeY7
 owQO7nFGplz7qdzZfEzhTaN1CX0Hst1tls5GG5VUi//t9Dakmh5UmLTObPqnb8pO+yxVpnDAg55
 VdIPAbDKbA+Q6NdqaZKw6mw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_160251_953696_B5C6BC30 
X-CRM114-Status: GOOD (  19.20  )
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

This driver only uses MMIO regmaps, which means regmap_write and
regmap_write_bits() cannot fail (writing to unpowered/unclocked
registers would result in an SError instead of a regmap_write failure).
Thus drop the useless error handling for better code readability.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 161 +++++++-------------------
 1 file changed, 43 insertions(+), 118 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 0b61f152eb3f..a705c4b18bd4 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -263,8 +263,8 @@ struct rockchip_usb2phy {
 	struct rockchip_usb2phy_port	ports[USB2PHY_NUM_PORTS];
 };
 
-static inline int property_enable(struct regmap *base,
-				  const struct usb2phy_reg *reg, bool en)
+static inline void property_enable(struct regmap *base,
+				   const struct usb2phy_reg *reg, bool en)
 {
 	unsigned int val, mask, tmp;
 
@@ -272,7 +272,7 @@ static inline int property_enable(struct regmap *base,
 	mask = GENMASK(reg->bitend, reg->bitstart);
 	val = (tmp << reg->bitstart) | (mask << BIT_WRITEABLE_SHIFT);
 
-	return regmap_write(base, reg->offset, val);
+	regmap_write(base, reg->offset, val);
 }
 
 static inline bool property_enabled(struct regmap *base,
@@ -336,15 +336,12 @@ static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 {
 	const struct usb2phy_reg *clkout_ctl;
 	struct regmap *base;
-	int ret;
 
 	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
 
 	/* turn on 480m clk output if it is off */
 	if (!property_enabled(base, clkout_ctl)) {
-		ret = property_enable(base, clkout_ctl, true);
-		if (ret)
-			return ret;
+		property_enable(base, clkout_ctl, true);
 
 		/* waiting for the clk become stable */
 		usleep_range(1200, 1300);
@@ -481,25 +478,14 @@ static int rockchip_usb2phy_extcon_register(struct rockchip_usb2phy *rphy)
 	return 0;
 }
 
-static int rockchip_usb2phy_enable_host_disc_irq(struct rockchip_usb2phy *rphy,
-						 struct rockchip_usb2phy_port *rport,
-						 bool en)
+static void rockchip_usb2phy_enable_host_disc_irq(struct rockchip_usb2phy *rphy,
+						  struct rockchip_usb2phy_port *rport,
+						  bool en)
 {
-	int ret;
-
-	ret = property_enable(rphy->grf, &rport->port_cfg->disfall_clr, true);
-	if (ret)
-		return ret;
-
-	ret = property_enable(rphy->grf, &rport->port_cfg->disfall_en, en);
-	if (ret)
-		return ret;
-
-	ret = property_enable(rphy->grf, &rport->port_cfg->disrise_clr, true);
-	if (ret)
-		return ret;
-
-	return property_enable(rphy->grf, &rport->port_cfg->disrise_en, en);
+	property_enable(rphy->grf, &rport->port_cfg->disfall_clr, true);
+	property_enable(rphy->grf, &rport->port_cfg->disfall_en, en);
+	property_enable(rphy->grf, &rport->port_cfg->disrise_clr, true);
+	property_enable(rphy->grf, &rport->port_cfg->disrise_en, en);
 }
 
 static int rockchip_usb2phy_init(struct phy *phy)
@@ -516,42 +502,14 @@ static int rockchip_usb2phy_init(struct phy *phy)
 		if (rport->mode != USB_DR_MODE_HOST &&
 		    rport->mode != USB_DR_MODE_UNKNOWN) {
 			/* clear bvalid status and enable bvalid detect irq */
-			ret = property_enable(rphy->grf,
-					      &rport->port_cfg->bvalid_det_clr,
-					      true);
-			if (ret)
-				goto out;
-
-			ret = property_enable(rphy->grf,
-					      &rport->port_cfg->bvalid_det_en,
-					      true);
-			if (ret)
-				goto out;
+			property_enable(rphy->grf, &rport->port_cfg->bvalid_det_clr, true);
+			property_enable(rphy->grf, &rport->port_cfg->bvalid_det_en, true);
 
 			/* clear id status and enable id detect irqs */
-			ret = property_enable(rphy->grf,
-					      &rport->port_cfg->idfall_det_clr,
-					      true);
-			if (ret)
-				goto out;
-
-			ret = property_enable(rphy->grf,
-					      &rport->port_cfg->idrise_det_clr,
-					      true);
-			if (ret)
-				goto out;
-
-			ret = property_enable(rphy->grf,
-					      &rport->port_cfg->idfall_det_en,
-					      true);
-			if (ret)
-				goto out;
-
-			ret = property_enable(rphy->grf,
-					      &rport->port_cfg->idrise_det_en,
-					      true);
-			if (ret)
-				goto out;
+			property_enable(rphy->grf, &rport->port_cfg->idfall_det_clr, true);
+			property_enable(rphy->grf, &rport->port_cfg->idrise_det_clr, true);
+			property_enable(rphy->grf, &rport->port_cfg->idfall_det_en, true);
+			property_enable(rphy->grf, &rport->port_cfg->idrise_det_en, true);
 
 			schedule_delayed_work(&rport->otg_sm_work,
 					      OTG_SCHEDULE_DELAY * 3);
@@ -562,28 +520,16 @@ static int rockchip_usb2phy_init(struct phy *phy)
 	} else if (rport->port_id == USB2PHY_PORT_HOST) {
 		if (rport->port_cfg->disfall_en.offset) {
 			rport->host_disconnect = true;
-			ret = rockchip_usb2phy_enable_host_disc_irq(rphy, rport, true);
-			if (ret) {
-				dev_err(rphy->dev, "failed to enable disconnect irq\n");
-				goto out;
-			}
+			rockchip_usb2phy_enable_host_disc_irq(rphy, rport, true);
 		}
 
 		/* clear linestate and enable linestate detect irq */
-		ret = property_enable(rphy->grf,
-				      &rport->port_cfg->ls_det_clr, true);
-		if (ret)
-			goto out;
-
-		ret = property_enable(rphy->grf,
-				      &rport->port_cfg->ls_det_en, true);
-		if (ret)
-			goto out;
+		property_enable(rphy->grf, &rport->port_cfg->ls_det_clr, true);
+		property_enable(rphy->grf, &rport->port_cfg->ls_det_en, true);
 
 		schedule_delayed_work(&rport->sm_work, SCHEDULE_DELAY);
 	}
 
-out:
 	mutex_unlock(&rport->mutex);
 	return ret;
 }
@@ -603,11 +549,7 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	ret = property_enable(rphy->grf, &rport->port_cfg->phy_sus, false);
-	if (ret) {
-		clk_disable_unprepare(rphy->clk480m);
-		return ret;
-	}
+	property_enable(rphy->grf, &rport->port_cfg->phy_sus, false);
 
 	/*
 	 * For rk3588, it needs to reset phy when exit from
@@ -632,16 +574,13 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 {
 	struct rockchip_usb2phy_port *rport = phy_get_drvdata(phy);
 	struct rockchip_usb2phy *rphy = dev_get_drvdata(phy->dev.parent);
-	int ret;
 
 	dev_dbg(&phy->dev, "port power off\n");
 
 	if (rport->suspended)
 		return 0;
 
-	ret = property_enable(rphy->grf, &rport->port_cfg->phy_sus, true);
-	if (ret)
-		return ret;
+	property_enable(rphy->grf, &rport->port_cfg->phy_sus, true);
 
 	rport->suspended = true;
 	clk_disable_unprepare(rphy->clk480m);
@@ -1511,39 +1450,29 @@ static int rockchip_usb2phy_probe(struct platform_device *pdev)
 static int rk3128_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 {
 	/* Turn off differential receiver in suspend mode */
-	return regmap_write_bits(rphy->grf, 0x298,
-				BIT(2) << BIT_WRITEABLE_SHIFT | BIT(2),
-				BIT(2) << BIT_WRITEABLE_SHIFT | 0);
+	regmap_write_bits(rphy->grf, 0x298,
+			  BIT(2) << BIT_WRITEABLE_SHIFT | BIT(2),
+			  BIT(2) << BIT_WRITEABLE_SHIFT | 0);
+
+	return 0;
 }
 
 static int rk3528_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 {
-	int ret;
-
 	/* Turn off otg port differential receiver in suspend mode */
-	ret = regmap_write(rphy->phy_base, 0x30, BIT(18) | 0x0000);
-	if (ret)
-		return ret;
+	regmap_write(rphy->phy_base, 0x30, BIT(18) | 0x0000);
 
 	/* Turn off host port differential receiver in suspend mode */
-	ret = regmap_write(rphy->phy_base, 0x430, BIT(18) | 0x0000);
-	if (ret)
-		return ret;
+	regmap_write(rphy->phy_base, 0x430, BIT(18) | 0x0000);
 
 	/* Set otg port HS eye height to 400mv (default is 450mv) */
-	ret = regmap_write(rphy->phy_base, 0x30, GENMASK(22, 20) | 0x0000);
-	if (ret)
-		return ret;
+	regmap_write(rphy->phy_base, 0x30, GENMASK(22, 20) | 0x0000);
 
 	/* Set host port HS eye height to 400mv (default is 450mv) */
-	ret = regmap_write(rphy->phy_base, 0x430, GENMASK(22, 20) | 0x0000);
-	if (ret)
-		return ret;
+	regmap_write(rphy->phy_base, 0x430, GENMASK(22, 20) | 0x0000);
 
 	/* Choose the Tx fs/ls data as linestate from TX driver for otg port */
-	ret = regmap_write(rphy->phy_base, 0x94, GENMASK(22, 19) | 0x0018);
-	if (ret)
-		return ret;
+	regmap_write(rphy->phy_base, 0x94, GENMASK(22, 19) | 0x0018);
 
 	return 0;
 }
@@ -1554,9 +1483,7 @@ static int rk3576_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 	u32 reg = rphy->phy_cfg->reg;
 
 	/* Deassert SIDDQ to power on analog block */
-	ret = regmap_write(rphy->grf, reg + 0x0010, GENMASK(29, 29) | 0x0000);
-	if (ret)
-		return ret;
+	regmap_write(rphy->grf, reg + 0x0010, GENMASK(29, 29) | 0x0000);
 
 	/* Do reset after exit IDDQ mode */
 	ret = rockchip_usb2phy_reset(rphy);
@@ -1564,12 +1491,12 @@ static int rk3576_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 		return ret;
 
 	/* HS DC Voltage Level Adjustment 4'b1001 : +5.89% */
-	ret |= regmap_write(rphy->grf, reg + 0x000c, GENMASK(27, 24) | 0x0900);
+	regmap_write(rphy->grf, reg + 0x000c, GENMASK(27, 24) | 0x0900);
 
 	/* HS Transmitter Pre-Emphasis Current Control 2'b10 : 2x */
-	ret |= regmap_write(rphy->grf, reg + 0x0010, GENMASK(20, 19) | 0x0010);
+	regmap_write(rphy->grf, reg + 0x0010, GENMASK(20, 19) | 0x0010);
 
-	return ret;
+	return 0;
 }
 
 static int rk3588_usb2phy_tuning(struct rockchip_usb2phy *rphy)
@@ -1594,9 +1521,7 @@ static int rk3588_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 	}
 
 	/* Deassert SIDDQ to power on analog block */
-	ret = regmap_write(rphy->grf, 0x0008, GENMASK(29, 29) | 0x0000);
-	if (ret)
-		return ret;
+	regmap_write(rphy->grf, 0x0008, GENMASK(29, 29) | 0x0000);
 
 	/* Do reset after exit IDDQ mode */
 	ret = rockchip_usb2phy_reset(rphy);
@@ -1604,21 +1529,21 @@ static int rk3588_usb2phy_tuning(struct rockchip_usb2phy *rphy)
 		return ret;
 
 	/* suspend configuration */
-	ret |= regmap_write(rphy->grf, 0x000c, GENMASK(20, 16) | suspend_cfg);
+	regmap_write(rphy->grf, 0x000c, GENMASK(20, 16) | suspend_cfg);
 
 	/* HS DC Voltage Level Adjustment 4'b1001 : +5.89% */
-	ret |= regmap_write(rphy->grf, 0x0004, GENMASK(27, 24) | 0x0900);
+	regmap_write(rphy->grf, 0x0004, GENMASK(27, 24) | 0x0900);
 
 	/* HS Transmitter Pre-Emphasis Current Control 2'b10 : 2x */
-	ret |= regmap_write(rphy->grf, 0x0008, GENMASK(20, 19) | 0x0010);
+	regmap_write(rphy->grf, 0x0008, GENMASK(20, 19) | 0x0010);
 
 	if (!usb3otg)
-		return ret;
+		return 0;
 
 	/* Pullup iddig pin for USB3_0 OTG mode */
-	ret |= regmap_write(rphy->grf, 0x0010, GENMASK(17, 16) | 0x0003);
+	regmap_write(rphy->grf, 0x0010, GENMASK(17, 16) | 0x0003);
 
-	return ret;
+	return 0;
 }
 
 static const struct rockchip_usb2phy_cfg rk3036_phy_cfgs[] = {

-- 
2.53.0


