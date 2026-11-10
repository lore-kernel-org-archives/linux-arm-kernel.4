Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9E9606A332
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 00:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tceem45v;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=TuQIpCN5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5pmq+eGO7PnID3i5wqOYXC5SqQeE4O47YKg4WojFp2k=; b=Tceem45vFMtziU
	BQ6e3IM6qZIFTxBAT6Uz5cXrkiNQgOdlv7r2K9/sjwNG8J9c92JuFzO27KRx6Pxom4KT1lCnpgK69
	zAbweZVCWUrSquw1RZTpQKFatcoufh+JGBuy3GET0alEQLZeqauQzc3hFjUrp8MYMhiR+THjISsa+
	bXRqKWiBhJ+Y3413DXFCsuI1at4jVCYMUzTq2EWQ4/WorKOw3EEETT3ZTRJdZ4Kq6i1BbY4OteRC0
	kmTttcGnujHD9W6x7uuLEa5XsJT+13oZwe8yS8GWsKjSzpOgPlWeMueJoiq4OxkjPSdrk0vy2bW+1
	W/ysNDIjgTLfjSbnOPjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZKX-00000001yw1-06xU;
	Tue, 10 Nov 2026 00:03:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZKB-00000001yYi-1BWH;
	Tue, 10 Nov 2026 00:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794268968;
	bh=BQgZPTgLJ7+3Z978mywaO2hIMczDhrYpHoIMQtLi5q0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TuQIpCN5tIIPhYPKkDUgn6Pt8OjfuktNosBXYZLIHRkMOcLiN9ne46e4N7MuJrLhI
	 pfOIfPt9MXDg3v5K4dnd4fco8tcYlXTAJXCec2sWJQEYxe8eNpLQeBvVjIitaA09li
	 c2FMlfhTP088ZSMoDebzyy5Df5ufLmr7hT1kLJN7wdMrZ4YbNuRw9P3dVAFEPjeKki
	 kw/eEuiT653JuDFSpwxcVFXLKx7/se4yl4A36n+E3CPZRbGTCwwkdZZGpHwdsXLllk
	 V3KFDS12XowaYyHU6O92bnCX585pTthq/BddwV3lkkCeNn+G6r/iS53XLD0lMI3+M2
	 uc6Juu0cznGgA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B4B7717E150A;
	Tue, 10 Nov 2026 01:02:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 28C25480038; Tue, 10 Nov 2026 01:02:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 01:02:50 +0100
Subject: [PATCH v4 5/5] phy: rockchip: inno-usb2: move suspend handling
 into clock prepare/unprepare for RK3588/RK3576
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-5-51acc071634f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5082;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=BQgZPTgLJ7+3Z978mywaO2hIMczDhrYpHoIMQtLi5q0=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGryXygtU//Jjb1tabrxgjpmXtE/y8LP3Ztjj
 2ObXnIDy/5+yYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq8l8oAAoJENju1/PI
 O/qaJLEP/i59wub3x8Vk/XSJ3ivtLTSlt7F6YaxeamMa3fVyvyRmIDtY9ZTmH/dLakop96+RiCt
 P9cAmxBB3Ig9YoPdV2FaYP5J+kT3XMm+fnNpcjpCPykGc0eMCWryLm8lIgz2Bzgsex+qgx+BWk1
 dKusi7wbPIRo2SXaQF6ENyIOhqZ3jDM0EUL7f92XKV+Otet5BD3R1oXT8wGSOw8dz3Wj9h57XF8
 ewcMjZwOHROBZA0eaIO5DVjy+rRSnuMYu5l5M8xVfxvkOYeT3QNX0xzXaqP34OQ0DNyYzP+WH9c
 7m49R6N5zx+lD21eXRJ2JEq841QZtMtIsp8xqReVEDPPCW21zRTSHA0VEICKZdGk5qbcBVsTbDa
 si3YcPZUiuoyM8eAftYa4Ro/HlrjbaVZRNEwehiZ9+BdWZdute8TydTBFDrkbi/MsY1TIEcM2MG
 pabCySH8k42IpYfTLe7sbT+m88mKiVhdOUsPWAnHZY+/O1X0VH6EKXMwKIdwCkv/v030C+7xHqo
 aTg9IE0QFwy7IU0A9IbkrV8MsP5myQA3ntNRUAitulkk2ttCi5A7ul1f+816s0f9CcxO9HOASMX
 hMWLrW9nf3BenIczQFGnjhKwh701CsWH2lE9/w4/7rPaOoy54XinLRMHTBm7kxrU6Z2+kFqznEM
 h+rEGGFTYw//IUnnk7KQysQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_160255_522924_82537D3B 
X-CRM114-Status: GOOD (  19.33  )
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

On RK3588 the 480MHz PHY clock must be running to access registers on
the OHCI and EHCI controllers. This requires that the clock output bit
is configured correctly (already happening) and that the PHY PLL itself
is running. The PHY PLL is only running when the PHY is not suspended.
This is currently handled independently of the clock and thus the clock
might be enabled with the PHY being suspended resulting in a
non-functional clock despite the clock being marked as prepared and
enabled according to the common clock framework.

This is especially a problem with OHCI system resume on RK3588, which
does:

ohci_platform_resume
    -> ohci_platform_resume_common
        -> deassert resets
        -> ohci_platform_power_on -> enable clocks
        -> ohci_resume
            -> ohci_readl(ohci, &ohci->regs->control); // SError !
            -> ...
        -> ...
    -> root hub resume (this resumes the PHY)

Fix this by fully powering the PHY from the clock prepare function.

This does not work on older platforms, which have multiple ports and
only one 480MHz clock as we do not know which port should be resumed.
But as far as I can tell these platforms do not have the clock
dependency from their USB controllers and thus are not affected.

Note that the 480MHz PHY clock registration is moved after the port
initialization loop as the clock operations may access the port after
this change. Additionally the old behaviour is used for single port
devices, that have their port disabled and thus port_cfg == NULL.

Backporting this is not trivial as the change relies on prior cleanups.
Considering system suspend/resume on RK3588 never worked on upstream and
there are more issues from preventing it (especially on older kernels),
this is not marked for stable backporting.

Fixes: 3a7db8e9edef ("phy: phy-rockchip-inno-usb2: add rk3588 support")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 29 +++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 642c996d23de..9fbd9e25f2c1 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -342,8 +342,15 @@ static void rockchip_usb2phy_set_suspend(struct rockchip_usb2phy *rphy,
 	}
 }
 
+static bool rockchip_usb2phy_clk_manages_suspend(struct rockchip_usb2phy *rphy)
+{
+	return rphy->phy_cfg->num_ports == 1 && rphy->ports[0].port_cfg;
+}
+
 static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 {
+	struct rockchip_usb2phy *rphy =
+		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
 	const struct usb2phy_reg *clkout_ctl;
 	struct regmap *base;
 
@@ -357,16 +364,24 @@ static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 		usleep_range(1200, 1300);
 	}
 
+	if (rockchip_usb2phy_clk_manages_suspend(rphy))
+		rockchip_usb2phy_set_suspend(rphy, &rphy->ports[0], false);
+
 	return 0;
 }
 
 static void rockchip_usb2phy_clk480m_unprepare(struct clk_hw *hw)
 {
+	struct rockchip_usb2phy *rphy =
+		container_of(hw, struct rockchip_usb2phy, clk480m_hw);
 	const struct usb2phy_reg *clkout_ctl;
 	struct regmap *base;
 
 	rockchip_usb2phy_clk480m_clkout_ctl(hw, &base, &clkout_ctl);
 
+	if (rockchip_usb2phy_clk_manages_suspend(rphy))
+		rockchip_usb2phy_set_suspend(rphy, &rphy->ports[0], true);
+
 	/* turn off 480m clk output */
 	property_enable(base, clkout_ctl, false);
 }
@@ -559,7 +574,8 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	rockchip_usb2phy_set_suspend(rphy, rport, false);
+	if (!rockchip_usb2phy_clk_manages_suspend(rphy))
+		rockchip_usb2phy_set_suspend(rphy, rport, false);
 
 	rport->suspended = false;
 	return 0;
@@ -575,7 +591,8 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	if (rport->suspended)
 		return 0;
 
-	rockchip_usb2phy_set_suspend(rphy, rport, true);
+	if (!rockchip_usb2phy_clk_manages_suspend(rphy))
+		rockchip_usb2phy_set_suspend(rphy, rport, true);
 
 	rport->suspended = true;
 	clk_disable_unprepare(rphy->clk480m);
@@ -1365,10 +1382,6 @@ static int rockchip_usb2phy_probe(struct platform_device *pdev)
 	/* Clocks are optional */
 	rphy->num_clks = ret < 0 ? 0 : ret;
 
-	ret = rockchip_usb2phy_clk480m_register(rphy);
-	if (ret)
-		return dev_err_probe(dev, ret, "failed to register 480m output clock\n");
-
 	ret = clk_bulk_prepare_enable(rphy->num_clks, rphy->clks);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to enable phy clock\n");
@@ -1421,6 +1434,10 @@ static int rockchip_usb2phy_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = rockchip_usb2phy_clk480m_register(rphy);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register 480m output clock\n");
+
 	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
 	if (rphy->irq > 0) {

-- 
2.53.0


