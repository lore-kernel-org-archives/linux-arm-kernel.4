Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BD9606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 17:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NHBnWQso;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=oGHuQGtx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=W0+EyXibpOEclVGjpm0uYBDA59a93+6rqY65GSuAGZ8=; b=NHBnWQsonk+1iI
	7A2MDEekuaU3J/3Jom4DEE/JBAjpNc3R2G5a36OdA34jm98uGqfgngp6vFEVxFm12buZjmHLrxmj5
	Zml0KYr8q3XIoMiqI4m0S1B5HbBhB81AOLzPPqmiNkP6WKrXKYZ3dbDYT+3v0UyAxOeEuxz13VG3+
	mB00KEP93ArlLA1Sr6nmhhKPusNmS/+e3C2V8YnDNUjHil9JhO1coXCI4AEfNjNYevsYsppmmyOPa
	vT1LgidUoZ/pWtSra6OkQEX7Rm4FObsVKnGMJK8pZyGWBVxAwC6XsatzQ8VkX0Rmi4UtJ+BcElWfj
	O8/7GBGwSdbm77OYQ9sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpVw-00000004ejU-3ZXL;
	Tue, 10 Nov 2026 17:20:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpVZ-00000004eDe-2CGp;
	Tue, 10 Nov 2026 17:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794331179;
	bh=IxmqW4hHZiplRSteB24WwisyJf/oUe3XCb1imAlD1pw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oGHuQGtxgP6gMMHD6OMhO7vts9PJLtMBIBGS738b5r3oMLMZqBPGjewPVwf9pAYgM
	 YWHVCUADrt/m5gBUCH4/HNlxXAoKF8RJgZSS8+TAulrpkstH7l6/m+kFrEeU2/Z1T9
	 Hl5DsHKVhNIREAaz8klvEpPGfaL1gC4AbDzseuxiMhkA2UO1HXP4GDpCd4JZ6sCuC0
	 3vYVAdwg5yVEJslxN4M/sxtno2qS7D2YAy8eB6JCfbSvd3+zT/zZRGgKsvUn+MubCr
	 zG6w7HQuSjYVHqhgOb60P0Ct4vx4b96xzuRC+bnGkO1+2+4sq37Ijo+IEB/NDBd6q1
	 gopUPnodg+Sdw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A76B317E1504;
	Tue, 10 Nov 2026 18:19:39 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 139CE48003A; Tue, 10 Nov 2026 18:19:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 18:19:19 +0100
Subject: [PATCH v5 6/6] phy: rockchip: inno-usb2: move suspend handling
 into clock prepare/unprepare for RK3588/RK3576
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-6-d2e24582ab22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5215;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=IxmqW4hHZiplRSteB24WwisyJf/oUe3XCb1imAlD1pw=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrzUiosvgz/3X9XcI6pCxsD6nhaDbGdGWTFw
 r/smNzs2LPhQ4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq81IqAAoJENju1/PI
 O/qa4VcP/3gWTm6w+cBQJw1ADgK3UKOOHfVcVcAcJQr7ux+G+DPIx0g1KQrY025ZI+oP/AQ1Brn
 15lNee4Ucqu69e2p87I2srUWETz+JGiGUYyTZQ1IAclnJT8B0ytVA1XPTzL5oSpgzRVP93vTgwe
 vl3bazeae3YUsKIHlnJR/zd4DfOHNi2/5FnWxbuBCbEfXr897HAxpIvgyQ8N/4G71JdfRfFLjpM
 Zku3JUwoOlne7ZqsYbhl6qmXrNQqQNYZR7OfPeNQ9EkUk/yhGcZUpeKp9MKBNZEOh9w+Tkcp8rG
 5cU/EZLPTfbkc9kTg5KPLeR7KmAOO2k535uKpEUpaDEo4jzsFHIY7xTAChMZyxtwEiOqBsw4k88
 CmFGGiPeOlYI3D6sMMTMf1KotaysCjPNWBcI/ET8xQZa5wUzjmi1iKO5bO7XKARXJwGuzZYa83g
 1wDxflxmr3/LwcwgNA/Z1u1FGo0Wzq2tCjEemHi6d5MmficbAfQ5GTtWoGKux4d+JRPMTV02DSk
 9r/EppqBD+FMFbbOXegmncbDgc79Su9+WT8G2oYVnrhxQE4yvyv6dBgvqgZOaYHNJW6xXtp0WXT
 8lFMYFDwoNv6f1LPiC1SUb3Oyjp6jofJffveveVtunLoWgkCT9If6q/UuxoI5w96qwccVx91I/i
 dXy7wMv5GwalrVb3t5U4u4g==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_091945_768010_6AAB28C8 
X-CRM114-Status: GOOD (  19.39  )
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

Note that the 480MHz PHY clock provider registration is moved after the
port initialization loop as the clock operations may access the port after
this change. Additionally the old behaviour is used for single port
devices, that have their port disabled and thus port_cfg == NULL.

Backporting this is not trivial as the change relies on prior cleanups.
Considering system suspend/resume on RK3588 never worked on upstream and
there are more issues from preventing it (especially on older kernels),
this is not marked for stable backporting.

Fixes: 3a7db8e9edef ("phy: phy-rockchip-inno-usb2: add rk3588 support")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 30 +++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 99416f6ba1c4..3ee058f7645e 100644
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
@@ -437,10 +452,7 @@ rockchip_usb2phy_clk480m_register(struct rockchip_usb2phy *rphy)
 
 	/* acquire a clk reference for internal power_on()/power_off() use */
 	rphy->clk480m = devm_clk_hw_get_clk(rphy->dev, &rphy->clk480m_hw, NULL);
-	if (IS_ERR(rphy->clk480m))
-		return PTR_ERR(rphy->clk480m);
-
-	return devm_of_clk_add_hw_provider(rphy->dev, of_clk_hw_simple_get, &rphy->clk480m_hw);
+	return PTR_ERR_OR_ZERO(rphy->clk480m);
 }
 
 static int rockchip_usb2phy_extcon_register(struct rockchip_usb2phy *rphy)
@@ -545,7 +557,8 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	rockchip_usb2phy_set_suspend(rphy, rport, false);
+	if (!rockchip_usb2phy_clk_manages_suspend(rphy))
+		rockchip_usb2phy_set_suspend(rphy, rport, false);
 
 	rport->suspended = false;
 	return 0;
@@ -561,7 +574,8 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	if (rport->suspended)
 		return 0;
 
-	rockchip_usb2phy_set_suspend(rphy, rport, true);
+	if (!rockchip_usb2phy_clk_manages_suspend(rphy))
+		rockchip_usb2phy_set_suspend(rphy, rport, true);
 
 	rport->suspended = true;
 	clk_disable_unprepare(rphy->clk480m);
@@ -1407,6 +1421,10 @@ static int rockchip_usb2phy_probe(struct platform_device *pdev)
 		}
 	}
 
+	ret = devm_of_clk_add_hw_provider(rphy->dev, of_clk_hw_simple_get, &rphy->clk480m_hw);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add 480m output clock provider\n");
+
 	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
 	if (rphy->irq > 0) {

-- 
2.53.0


