Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45B160A260B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 00:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bb3BMWF1;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=XyWulKBJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GHa4vWG2U9qBCeacF4dbyMI7nvPN86lsjzLRf7abFNY=; b=bb3BMWF1hzouxW
	thRpAZ6jcxviz2kfoDFBgRMr+7mnMAs8G8VeHwIPJnupuWkgOYar87qOw1imI4kVBcFq5evcpZ552
	jHo/Ebe57bD75EJRvi4newBK0UXd7gk+cFJhU/THd+mypABgqcm0TbgP9J7EhtHYS4nIw9QwJKBAQ
	jnWlhaevoDRD23+V4ulo3fyUZzsSabzG3b5xslvWFmDOsbwN2mo/AclCbBRvqeFCmVy65HH7hu6cc
	Tg2XHigd/D61j7EpbedpDj8E/Wk93qaE41S45XVTsR8uZsx69xj5GUAkDTaCuM9VokLJkmOB2KN5p
	NUk8cr8Bwcfl2hlQt3bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZKB-00000001yZP-1FlE;
	Tue, 10 Nov 2026 00:02:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZK7-00000001yXB-34b3;
	Tue, 10 Nov 2026 00:02:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794268968;
	bh=bw1d5xrjZc5YajWiuD/ZNG9Z7ntS2LT1VtNZ9HjI77U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XyWulKBJ9/ANjWHN7jYfaZ2ufF/Wtql0q1KIxvGvrKyJR0Q1tLi6D8XhOGHv4tLRK
	 muLwdTYkZoTOkC+S1QDnsXXXk9wqSgd+Vd3k9kaPj58p22yHWMeIDDHaK8TwcEV8eE
	 KGnTCvLPsohhZKY8uU7EXMuGgyPHbHTW9N8IiOZ+hakM+Ti/i/9iyZcSEmRCyLba4t
	 8nqAzBK4s0NpLjWcYqIPRFCUt7ldMlMD2K6bE7u6l+VtknvhsUDqE1rYg8TFEubzY3
	 rN7s+o/e/ITnMCwA1FkP1H6YaezUKHNhfa+X0lirqWUNAXLWN7G5NhltPXvVFe8p+V
	 7naP4U0UngMqg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6CB2417E14AA;
	Tue, 10 Nov 2026 01:02:48 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 27139480035; Tue, 10 Nov 2026 01:02:48 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 01:02:49 +0100
Subject: [PATCH v4 4/5] phy: rockchip: inno-usb2: move suspend handling
 into new function
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v4-4-51acc071634f@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2520;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=bw1d5xrjZc5YajWiuD/ZNG9Z7ntS2LT1VtNZ9HjI77U=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGryXyiY+G477NlDWvzikDMWU1Px7+wGDgk45
 OBRS5+8Qo4/o4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq8l8oAAoJENju1/PI
 O/qay+4P/iLVWJy8rwwLpujrTfdyiWyLldY3t9yrGsSPrN4+hLaq3yt5z4tUSJQjZ9weuqvyGU/
 z5pK95W4DAIJfEmY8Lu72bLWRUZ53AkDYMK/b04aHqOcYncIG25Kph5OrXKeyT8/9p/WhFhlcHy
 o6k/CbVJ+SYy0ulhTvGXwZ0hLChFdMfEeKyJmcbSadNQI+N4vJrEJeLNtz9KChITl6GTdyUexzS
 Zx47PE8NFtjghCMdkgmlGWmqvUSXtsQdAIupWzu8lgvd3dsjXFhjAhJqnhAEjCotOYNBv5bj0a8
 hdjizI/8NHYP7yC4aXsFxRwYm6BNo+nRDsukPGh8fbkuVt52RaToNFRE7gxm4VVgPAOdmad2gR7
 MH60oM1S1zodA/z3CwQzbBM6vIWnqkaACR85dCD5o/62QjRIJQhgCo2OagpfeyMm8uYHzV65fh2
 uW3DOpcydxqsC7fwy4nWdOGl+6zB1vpMpW59iNZIo2h/1hovz2eO+n169YPebswCsGilqwNZpGq
 zOg/lnDXZQk2E1hVZI6b0IXPnmlBvIN6bVkYr8KLXBKeFUuHQTxxGN5CpIGECmrYwWaY0J2z4/n
 S9K1ZpKNfY4d4WedpikXxoIapJVpRy7vaCVidN0W99ZE97NxHPtHtWuCYHqavtpW+nD9qag/MjT
 HrRPkEF1/NdtLOnNvfr4rcw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_160251_960165_380C8343 
X-CRM114-Status: GOOD (  13.47  )
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

Move handling of the PHY suspend handling into its own dedicated
function. No functional changes intended.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-usb2.c | 38 ++++++++++++++++-----------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
index 6b3104901695..642c996d23de 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-usb2.c
@@ -321,6 +321,27 @@ rockchip_usb2phy_clk480m_clkout_ctl(struct clk_hw *hw, struct regmap **base,
 	}
 }
 
+static void rockchip_usb2phy_set_suspend(struct rockchip_usb2phy *rphy,
+					 struct rockchip_usb2phy_port *rport,
+					 bool do_suspend)
+{
+	property_enable(rphy->grf, &rport->port_cfg->phy_sus, do_suspend);
+
+	if (!do_suspend) {
+		/*
+		 * For rk3588, it needs to reset phy when exit from suspend
+		 * mode with common_on_n 1'b1(aka REFCLK_LOGIC, Bias, and PLL
+		 * blocks are powered down) for lower power consumption. If you
+		 * don't want to reset phy, please keep the common_on_n 1'b0 to
+		 * set these blocks remain powered.
+		 */
+		rockchip_usb2phy_reset(rphy);
+
+		/* waiting for the utmi_clk to become stable */
+		usleep_range(1500, 2000);
+	}
+}
+
 static int rockchip_usb2phy_clk480m_prepare(struct clk_hw *hw)
 {
 	const struct usb2phy_reg *clkout_ctl;
@@ -538,20 +559,7 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
 	if (ret)
 		return ret;
 
-	property_enable(rphy->grf, &rport->port_cfg->phy_sus, false);
-
-	/*
-	 * For rk3588, it needs to reset phy when exit from
-	 * suspend mode with common_on_n 1'b1(aka REFCLK_LOGIC,
-	 * Bias, and PLL blocks are powered down) for lower
-	 * power consumption. If you don't want to reset phy,
-	 * please keep the common_on_n 1'b0 to set these blocks
-	 * remain powered.
-	 */
-	rockchip_usb2phy_reset(rphy);
-
-	/* waiting for the utmi_clk to become stable */
-	usleep_range(1500, 2000);
+	rockchip_usb2phy_set_suspend(rphy, rport, false);
 
 	rport->suspended = false;
 	return 0;
@@ -567,7 +575,7 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	if (rport->suspended)
 		return 0;
 
-	property_enable(rphy->grf, &rport->port_cfg->phy_sus, true);
+	rockchip_usb2phy_set_suspend(rphy, rport, true);
 
 	rport->suspended = true;
 	clk_disable_unprepare(rphy->clk480m);

-- 
2.53.0


