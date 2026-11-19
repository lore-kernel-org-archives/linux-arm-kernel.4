Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBE8606A325
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TOX1wf60;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=kt0Q1VSA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KKjKgZv7evFIP1fKvRMbLE8Hv+29VuUsawltek0rvqA=; b=TOX1wf60dutbbR
	OMPgyhvqpjF3QDu4u1Zx/HjzNh4p9uKSVaOLHxHNtcd7juvOf5ud6jdZlMbczOC/x9vMxu0nnBdXi
	V/4FTyswDf0ilfiZhWhgOd80V37czPl1Xf4GA2TpMfJSiQDOb7zRg55THniSdJi2u2nFqnc/GZMtg
	ubcSLV102fS8KiX29zG1EAOAuVgkrzxXQFRiJAazgjM1zuZf/6bD5ueo9oiU/U0PYgDT/MYryh2yo
	6z9H+8ZrBUuGDXTRW5vG01DQ7bADv48iLUwjQbwnhNgUalUdlyVPx77wxrQ4/Qy0OecwdetX11MN+
	Wa8AUPHddToP+30ljqtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU80f-0000000DEkH-04OM;
	Thu, 19 Nov 2026 19:41:29 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU803-0000000DELg-0AYg;
	Thu, 19 Nov 2026 19:40:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795117245;
	bh=2wUa7oPyVOGC4W+/NGa6I8/8Txw8ROEK/Iq55qJBRSg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kt0Q1VSA0jqCDvfp6RlU01Un3IXhz+Md1RSm/IXhI2P5grTgGrwj/SkCXj3F9WWOf
	 9o5HA5EOMV7pD6m2ZOWXlwjab6vRcs/KUsfIuwNCxvJDeRNnK0mmgeZwI7nHanzaSu
	 NSAiJDq8l+8M4BqxCAxyUMWILb84yuD7AslYftDMGvVs6mw6R8EAO5ACysryttme4p
	 06lAuc6/P3RvqNAzfmpdmjCylko7FuD0ox4S20Si0W8FDitYd2VTeHTqWF/AAf1SX1
	 VlR1eXNC6uuKdobzruU8vH7yg7Om8n1n6+/vheEiYLVtitZd+3IpgFCmY6w+qjGvNf
	 e5biEBDnQ+ZMg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4780017E0DF7;
	Thu, 19 Nov 2026 20:40:45 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B927F48003A; Thu, 19 Nov 2026 20:40:44 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 19 Nov 2026 20:40:34 +0100
Subject: [PATCH v18 6/7] phy: rockchip: usbdp: Add USB-C state without DP
 enabled
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-6-fb325e336494@collabora.com>
References: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com>
In-Reply-To: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-0-fb325e336494@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Alexey Charkov <alchark@flipper.net>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4216;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=2wUa7oPyVOGC4W+/NGa6I8/8Txw8ROEK/Iq55qJBRSg=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr/ULz17y8kbclOYvUQpNzOCzGpbK2SdvaVb
 x0eNPkXRSBUYokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/1C8AAoJENju1/PI
 O/qabTEP/3v47gRSUvrMZKgNBTd9wBhthR/MMPbErLvu7q4Ezbl1pHJLfArvtB2Kw84JBqhmHSP
 eLtxdeYsVdrvJpsJ6u4ARmiF/g8jacClUspvrwMEv3+Edxi+Mq72w+hGEeJHwLVmiOhez1fs7GB
 X/68n8PWVq+u2MG2ukxv2hGMTUC/0X4PyVEBQyaPziFilQVVq6fz4EhshNwNW7+8FD+UQWV7Nb6
 Ba9ELhH52+TCDeB8CKb8F+aa6Evx4WzS0L4C7QQ0JQ3lIg7l1kSBVxMe4ftfJjwjWpxuXoG2nGb
 nUdxJGvdKhRzp7h6FsrE5OVRRyz4ePL9RgUUEqYZDih3K2r+PlRH/BXut/OsnC/R1GPaIEUr83i
 8htDdlq4olDUO/n80ymzLjWYwpbSWaIfZrEnfNDBRzMIRkqtR2Qvgd6kfAx+wZiwisNU0wgxdSB
 3zwqxLdRQeajueXnKnFGxhgBj1nxhFk91KSa/f4kdnOttaGlBCLJIv4aBzy3LAnxDw4R5LKpZgn
 c4apC7o5spPsS7hk7pXVe95yu/DQWoKl+mKmJToH07Sw9W4mBqy3YkRu+8yEg3veaMK9x7T+fT2
 x4ddx7kc8ufvssjt+QmMXEqePGvO18qyav1V0VreEh+d1Hx1Joxl/zhYxdXPcrIOuWKIhLXBLfO
 BhBwXOdC4uHjNhcJo51M3tw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_114051_260488_C9F8494A 
X-CRM114-Status: GOOD (  16.84  )
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

The driver currently only differs between 4 lanes DP mode or combined DP
+ USB3 mode. This makes sense from a lane routing point of view, as the
hardware only has 2 lanes of USB3.

But adding a separate state for USB-only helps with power management,
since we always power up all PHY parts according to the current hardware
setup to avoid data stream interruptions. Even if some lanes are muxed
to the DP controller there is no need to keep the DP side enabled if
something without DP AltMode is plugged into USB-C.

This potentially triggers some more USB reconnections during the PD
AltMode negotiation when switching from USB-only to combined USB+DP
mode. This should be fine, as the cable is freshly plugged at this
point.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 68 +++++++++++++++++++------------
 1 file changed, 42 insertions(+), 26 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index e4bbcb4edeae..e72752ed4968 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -583,32 +583,14 @@ static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 				   CMN_DP_CMN_RSTN, FIELD_PREP(CMN_DP_CMN_RSTN, 0x0));
 }
 
-static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 hw_mode)
+static void rk_udphy_set_lane_mux(struct rk_udphy *udphy)
 {
-	if (udphy->hw_mode == hw_mode)
-		return;
-
-	udphy->phy_needs_reinit = true;
-	udphy->hw_mode = hw_mode;
-}
-
-static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state)
-{
-	u8 hw_mode;
-
-	switch (state) {
-	case TYPEC_DP_STATE_C:
-	case TYPEC_DP_STATE_E:
+	if (udphy->dp_lanes == 4) {
 		udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
-		hw_mode = UDPHY_MODE_DP;
-		udphy->dp_lanes = 4;
-		break;
-
-	case TYPEC_DP_STATE_D:
-	default:
+	} else {
 		if (udphy->flip) {
 			udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
 			udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
@@ -620,12 +602,39 @@ static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state
 			udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
 		}
-		hw_mode = UDPHY_MODE_DP_USB;
-		udphy->dp_lanes = 2;
+	}
+}
+
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 hw_mode, u8 dp_lanes)
+{
+	if (udphy->hw_mode == hw_mode && udphy->dp_lanes == dp_lanes)
+		return;
+
+	udphy->phy_needs_reinit = true;
+	udphy->hw_mode = hw_mode;
+	udphy->dp_lanes = dp_lanes;
+}
+
+static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state)
+{
+	switch (state) {
+	case TYPEC_DP_STATE_C:
+	case TYPEC_DP_STATE_E:
+		rk_udphy_mode_set(udphy, UDPHY_MODE_DP, 4);
+		break;
+
+	case TYPEC_DP_STATE_D:
+		rk_udphy_mode_set(udphy, UDPHY_MODE_DP_USB, 2);
+		break;
+
+	case TYPEC_STATE_SAFE:
+	case TYPEC_STATE_USB:
+	default:
+		rk_udphy_mode_set(udphy, UDPHY_MODE_USB, 0);
 		break;
 	}
 
-	rk_udphy_mode_set(udphy, hw_mode);
+	rk_udphy_set_lane_mux(udphy);
 }
 
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
@@ -650,8 +659,15 @@ static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
 		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
 	}
 
-	/* default to USB3 + DP as 4 lane USB is not supported */
-	rk_udphy_set_typec_state(udphy, TYPEC_DP_STATE_D);
+	/*
+	 * default to safe mode (USB only) when mux is available to
+	 * avoid unnecessary mode changes; otherwise default to 2+2
+	 * mode, considering HW can effectively only do 2+2 or DP-only
+	 */
+	if (udphy->mux)
+		rk_udphy_set_typec_state(udphy, TYPEC_STATE_SAFE);
+	else
+		rk_udphy_set_typec_state(udphy, TYPEC_DP_STATE_D);
 }
 
 static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,

-- 
2.53.0


