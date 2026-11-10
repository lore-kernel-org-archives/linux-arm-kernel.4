Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151DF606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 17:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V+Le3okL;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=IAL2bxxV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FJppWOnyTt9DZtc+FHPiQQxS3jOtEqZJrdgIOgwpmJ0=; b=V+Le3okLCHat5r
	QsQLXauqQ438kwyW1d1eiAl2JUQ/15GsAlygQNnx/Jc3Vp5dlThXNQeaXim2tejWGoKjTHNxB/ypj
	jZ6QLu0OT/6YSKIdTnKSHAJB68hXiyA3Ex9BlSe/0kkja21gbYonXE3t0mwfUDb+/LJtoPPgbqqAx
	IEgYHCJPucg8e7Bc2flgAvKAx3iKQDEwfrIxxxMAgC7AvI3m4OviIqo+P4AoM6ZWZAfGJrwzNgSEQ
	1TOHsegPKg/wymSwTukyPhTg3OjWKn9zx1H94zsAwdT3a5kWa83gKlgolTL+EmGDZNYI3EEWTskiD
	b6WWlKXftbXavVORbtPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpW2-00000004eqQ-1Pxz;
	Tue, 10 Nov 2026 17:20:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpVZ-00000004eDf-3SU7;
	Tue, 10 Nov 2026 17:19:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794331179;
	bh=J10wxRz8jVsNiG2URQvahFtGbMuwglI13tTx3pFQivE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IAL2bxxVciIcQm/N7ZPYxeFGocvptpdexQ67ujXkoibAKwYEJTRQLL0Cff3JOJOOG
	 FOY7mC6sVwvCAqpv/2xRGxKKwzhiSVJUAcPVZmMFUcND52aLX9MkzfmO2rB0faWIeD
	 /QnXH8kecb0lMaMXf2EA7HBh52neSvKEmeHFK5iQWKU+jHDP1wZmQ6PQLRAbFV+1V7
	 6XDVsFx3ybB3ITq2ZGDqMcAhCyJ3PJLExqMLrpSv0VPyS1w8z5BEjpKedcqQrB/iJO
	 DVNX3e3TKiVDWbIXattR/tPDz7cKgyjP5OIplps+lQjVBS0hvIkiGx6EWAOe/4cA6E
	 PKBei2HQk5HTA==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A4B8417E1054;
	Tue, 10 Nov 2026 18:19:39 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 11F53480038; Tue, 10 Nov 2026 18:19:39 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 10 Nov 2026 18:19:18 +0100
Subject: [PATCH v5 5/6] phy: rockchip: inno-usb2: move suspend handling
 into new function
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-phy-rockchip-inno-usb2-clock-fix-v5-5-d2e24582ab22@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2520;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=J10wxRz8jVsNiG2URQvahFtGbMuwglI13tTx3pFQivE=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrzUiornpGl3xGPeN/rN6wOXg51cdGxdbdN5
 2NVQq+GDGxk5okCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq81IqAAoJENju1/PI
 O/qaU4EP/A0UpAXKloA2+nYEnHYjRZQrUOV/HS1dUABhV9U1yitTWEFv9vdinm8vsY3ToFam7wW
 qiX8CCeGv53JQuFdRJVbdjID9ghHbZ6u4ZtqtECpT+6O1dZLiugWl3AdKSS11RCt3zBFHHavO+A
 YjO2VeqRGXA2DJf0UUvNuIImoaJN0XPsbEiBziw7jUbEsFoGan374CmMf+w61v7P/rR/za5aAlE
 uVw5cLBchTkxrXSW2AH+GyxmzokBmmV/TchsTF0sMQtJNJTb6Bw24pC5Cn6K314/2QFgbLm5nnm
 TdRRwNAoB1ciwrdZwNsFaFLcmt+MF3muX/bNlteOSK3Rl2FmZL0t6PdL0+9PzS5V1sg+OLHbcTU
 qhxVBaMZNjuuqpA+a4F13V1fUHgkZOyxXqJX0nV2/UjsOQ4zlMsku9TUtN7Qf2ioSIUJT5RI8JG
 s/W5h+yv5G/fp+HEiBhzthP0wHVs6KXsQYipTHLapUNsupwnDcI8tr9kHXAYQqCTXnc8aAqP4J9
 q7xmK5HGRZ6x4VoG798dwQdkNc4YFkI54iVeD4AxUhQoSiwgfICCg4zo+oGyuyF0VDg3dUdq35h
 H7sX7zLZD0AzNUT3vv1Q+uyCPyLfa1Cf5UYCg3zdqE5GpfBzrsioOUM0OiPh09U/+axyxWlzZ5v
 iHUuI4fUzGny9HbJ4PworAQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_091946_137597_ADAF8C7E 
X-CRM114-Status: GOOD (  13.37  )
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
index 4c0feb6b20ad..99416f6ba1c4 100644
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
@@ -524,20 +545,7 @@ static int rockchip_usb2phy_power_on(struct phy *phy)
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
@@ -553,7 +561,7 @@ static int rockchip_usb2phy_power_off(struct phy *phy)
 	if (rport->suspended)
 		return 0;
 
-	property_enable(rphy->grf, &rport->port_cfg->phy_sus, true);
+	rockchip_usb2phy_set_suspend(rphy, rport, true);
 
 	rport->suspended = true;
 	clk_disable_unprepare(rphy->clk480m);

-- 
2.53.0


