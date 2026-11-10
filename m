Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC9D606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 17:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kY1BePyX;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=hrnxB7v4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ABxWzgzmGEph2AHBxDZRCgEW99uo6BmUCnWoisNV7Yw=; b=kY1BePyXyRmwVe
	XD+Ztro9Yn06O6YzFOyYZgaQSJCTAJ4uIUsHoBnOvVmvZ/lBZUy1Fw1O3SaM9aEZ/ArqEX0rg9D/S
	jQyN1OwKzTkNlM4wyq/LLYgAd3OIv5Ufwh4C9gO42jkCeLBagXHAIvbrz/QFFLTgAtFFTRFyk4Smp
	g2CXIuU8loKnKbfql2XcJmMj5WjeJfem6iztnhBCXFAwhiHGPAPfENlUWnly5bOeUtSkmP7vOezWo
	zSblcg2nMJFBbZ9wxSkzJqkzgmW5g200pB+VfHedwBRQZmOqvNufLM0vSkw4MV6Y8lj2wmn/+FlHs
	D4vQWTQiQ/WP7qpNd2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpVg-00000004eLy-2fwY;
	Tue, 10 Nov 2026 17:19:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpVW-00000004eBe-33MA;
	Tue, 10 Nov 2026 17:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794331179;
	bh=GN4bmnoEDDAXDU5l7MQkDzQrhcRMkLzOepWx2peIp3g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hrnxB7v4obdBQ8WxRJhH5C7r8Fte9MSBjveoD+RJgvxpTa3Jc26pPnKLgyNnGN9J6
	 8dI9WNFKsLSCDT5RA/mCKE0v7WsexLNTUg/5HIZUgXdg2YuJUWztPBsCh+7dFdtPVI
	 LP9rtIwstUGcM1hYGeVge3KFzHMyjaqHAOHWU6LEPjN10hc+vmIU+hEEarPlh/+SAS
	 w4hh/h6qNzKTzyO30xPwlUGuGV2blp+sC0MHN/iiKAbb2hXpuO0drNR+3nFzSV2/Wk
	 JwwsQRvN/kJa3Cts5SiLqeYEcsuYch5tNr3FD6XRQnyaje7E6GV9vv+RGWcyeW/H28
	 v0Tz7YhQ8ObCg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 544F917E093E;
	Tue, 10 Nov 2026 18:19:39 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0C878480030; Tue, 10 Nov 2026 18:19:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 18:19:15 +0100
Subject: [PATCH v5 2/6] phy: rockchip: inno-usb2: ignore regmap_write
 return codes
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-2-d2e24582ab22@collabora.com>
References: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
In-Reply-To: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-0-d2e24582ab22@collabora.com>
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
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrzUipCqZLcsh1PanqaZTQkW1FNe6XwLkFF0
 7GBitxSKYgoz4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq81IqAAoJENju1/PI
 O/qaKC4P+gLp9Vq6njs87ApBJ/bsda2oyvQXyBlCOKqenY6r+h/dyk3v+fbm9wlK41KQM5BmVDg
 5Q4gD2v4UsCOLXEzSfDOlBN9assKwms+ONaZaMQwKI6U4H/I/6zlCc1/FTxzTqFK+zHnFXPLqk7
 i3mN7utFBQljkXCo7tCkxTtp2wnsY7+Y5US68m6+tO8g8LRDRxGx0yeETjwLNGRCiNHZURQPYXY
 Cs4fQ6kTZkDI29yzkk+VjzRqD6117pjn4q3q0OpP6mQeu/Y95Ut4GVxBG11MaSX/PfCtIf8Y+fS
 UtrwbQ2RC/PS4EP9FAwL8WTqtJ3D96Ml6Z2BCH4fG3F4OvYWtfYMchgQaFuW4r5I+JIASESWCSH
 a3SYByPrPyhK7nTuJ29noDe09liXn4Qv6d+Yv/Zv+XpW17QM9wHleys++Gwk5/aYWmju1hx/HXY
 g1OAQYciveiyArZO8stY5djXuc3/ug6ulzfwmz29q9ZnVoWFVnaLiINTM+Y74Sv8Ft6lOQjnND9
 o/7b/v9SB6Fr2XLVmjQaUR7QxOcg8Df7jOZjVuuwfDczUmBxg8bcK6DOanU5dG7kNfl51M+KRb/
 tnQ+cNalYW1KpIclfzy6VTnIXxvJtsrzvPiCYUrIdXyCCR3/R0QueyAqiAnzO4WPDrD8NTGKTXD
 G2KTnP4VzpfFYRzABEY4ymA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_091942_958780_38C82358 
X-CRM114-Status: GOOD (  19.09  )
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


