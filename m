Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CFA606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R9wxhkSC;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=R1vhd8AX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8nmKNXvKfXVV2+hGJX+cnp3hs/pqFkjNN9NDdDTn1gc=; b=R9wxhkSCBmxSW/
	g+6JviUFvAaNyF/CHaHXfopqV9ZWTo/srkyFiMyMpWIg/8X9WRa8WJE/ACjp4+a5JjzIHAnXbhRz/
	YYPluRVhAQ12qhccrqT+0Dv3XKF/gG/kUj+kNVhRd2EK/IdxMz+a6ljNXSRgBLwfzDe0qfKPYmq9i
	VB6tDMG1nuHzrGZzXTjjCgb5JMjmxycZp0mBBTUn/+Js9Nbeew339DW7MKxSMFwsMun723TCQNWJg
	yJqlWNJP6CvPXUAWshy5J7ofDmQNWXe8EF9lW1otQbUs6uCJ50GPNH+1jA9vbNJ8tDSYoGXkV7m49
	P0d/UtlzAR1FGzQ7zsCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU805-0000000DENy-2YX1;
	Thu, 19 Nov 2026 19:40:53 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7zz-0000000DEJq-28Zp;
	Thu, 19 Nov 2026 19:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795117245;
	bh=aLQX+yuNJC189MbLKUqIECIf3ahma7TwwXSHD13wOyY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R1vhd8AXky+ZV2rYsS+4HjulF+XD0Pt6aMqyGs5LFWhEzdjFsubDDFvLaNpp4tZb5
	 Mk27wru94iCTNvtR6IcaWCGMtU5Wl2WDxP/QGAv+nYAiVNd0LEaT7xdZLddv3WP9Ds
	 LQ1w8HLLTSwDPzv1y7S/MW1POA56wcEEEfaiph1TS/4b3N+czGT9cvrEw0hNRCxCmU
	 rQ3/yOIo42uX41qJ4HBbV6OACaL2bU40eJlrsi2RT4/dPDO9/VRL/HdsIfU5SwBZpK
	 GuEN+u0B4VANjFToewtRRvB2ZUbr19W0KGVsDW3GnpFAS9d931e0H8H6bjsEHsjSmd
	 /vgdg/Smnv2GQ==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF24917E0A27;
	Thu, 19 Nov 2026 20:40:44 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id B3DCB480031; Thu, 19 Nov 2026 20:40:44 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 19 Nov 2026 20:40:31 +0100
Subject: [PATCH v18 3/7] phy: rockchip: usbdp: Rename mode to hw_mode
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-b4-rockchip-usbdp-cleanup-part3-v18-3-fb325e336494@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7146;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=aLQX+yuNJC189MbLKUqIECIf3ahma7TwwXSHD13wOyY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr/ULw7/ZADGkr0fu+wobSJAbj765iwyau+D
 QGUDMmKuq74YYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq/1C8AAoJENju1/PI
 O/qaICsP/3K5wvfhZ3gNB2K/I0QlotRuGun5mBWFZeOgGG+Wu0T3PC2Vr+HTb7We6DLDDGYmNna
 8Px5Uki7gkSCSCN4Ug8BaNePaJi80z2Z15bri6sV8WiufrBozWB2qdzbYvXmcdLLVeRK0KbV11H
 C+FHLXl38CrY9XziVMMt2P5pTrrp7wWRvzzWoFpnOY9ty8jAM0sh6WRrf1vwjC0nnUS7Tf911M6
 4Kw5vbvRMo77gGu7Q0qNtEIVajEhPTrowqJNh7zQKltD0vOJpswk5eQgnTJZkK3OIrrvwDBQXmj
 S6+jtpONEDfQEQWAeq2PzW2gzGRIcG1YGZUKPNwKVDCve94awQYkRhnXi/YiXFclf8180f5Nsak
 YpwrBLKNsLJte5Kg/P085EsYsRVS7D+iAFRnFTxfzPt1HBkITWfmxDAsSeWfcsoDyI+Xjg3MKbU
 RigWbwOgiP0zlLa8pToj90Qs/dpo76yGEua4Xuyk+W0E951Ca5eb5ZWLVxWMw0ztEOwpyr1U3Bh
 SqGpTCna3VQrI0nCBeZrKY0r3/0sPs5aq27n9zN/kInbQv5eCa5f3bmX+FwBd59TqhJLau8rYtl
 64QwEHw5oo9Jf4TUJI96AIuwVAnB35P8k3pwmW6oqnIg3Lo/Zdn7jnZjDqNbx7K16YnUDlHM1XG
 789cRW1DGUePLb/jKLJE1Ag==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_114047_743342_B296C876 
X-CRM114-Status: GOOD (  17.00  )
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

Rename mode field to hw_mode to make clear that this is the modes
currently supported by the hardware, but not necessarily requested
by software. I.e. it is only set by either the USB-C state machine
or device-tree if the PHY is used in a fixed routing setup.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 48 +++++++++++++++----------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 025c8d52d72c..de8f01bd0467 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -174,7 +174,7 @@ struct rk_udphy {
 	/* PHY status management */
 	bool flip;
 	bool phy_needs_reinit;
-	u8 mode;
+	u8 hw_mode; /* modes currently supported by hardware */
 	u8 status;
 	u8 sw_mode; /* modes currently requested */
 
@@ -583,18 +583,18 @@ static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 				   CMN_DP_CMN_RSTN, FIELD_PREP(CMN_DP_CMN_RSTN, 0x0));
 }
 
-static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 mode)
+static void rk_udphy_mode_set(struct rk_udphy *udphy, u8 hw_mode)
 {
-	if (udphy->mode == mode)
+	if (udphy->hw_mode == hw_mode)
 		return;
 
 	udphy->phy_needs_reinit = true;
-	udphy->mode = mode;
+	udphy->hw_mode = hw_mode;
 }
 
 static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state)
 {
-	u8 mode;
+	u8 hw_mode;
 
 	switch (state) {
 	case TYPEC_DP_STATE_C:
@@ -603,7 +603,7 @@ static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state
 		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
-		mode = UDPHY_MODE_DP;
+		hw_mode = UDPHY_MODE_DP;
 		udphy->dp_lanes = 4;
 		break;
 
@@ -620,12 +620,12 @@ static void rk_udphy_set_typec_state(struct rk_udphy *udphy, unsigned long state
 			udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
 			udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
 		}
-		mode = UDPHY_MODE_DP_USB;
+		hw_mode = UDPHY_MODE_DP_USB;
 		udphy->dp_lanes = 2;
 		break;
 	}
 
-	rk_udphy_mode_set(udphy, mode);
+	rk_udphy_mode_set(udphy, hw_mode);
 }
 
 static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
@@ -748,7 +748,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 	int ret;
 
 	/* LCPLL check */
-	if (udphy->mode & UDPHY_MODE_USB) {
+	if (udphy->hw_mode & UDPHY_MODE_USB) {
 		ret = regmap_read_poll_timeout(udphy->pma_regmap, CMN_ANA_LCPLL_DONE_OFFSET,
 					       val, (val & CMN_ANA_LCPLL_AFC_DONE) &&
 					       (val & CMN_ANA_LCPLL_LOCK_DONE), 200, 100000);
@@ -783,15 +783,15 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	int ret;
 
 	dev_dbg(udphy->dev, "reinit PHY with USB3=%s and DP=%s (%u lanes) flipped=%s\n",
-		str_on_off(udphy->mode & UDPHY_MODE_USB),
-		str_on_off(udphy->mode & UDPHY_MODE_DP),
+		str_on_off(udphy->hw_mode & UDPHY_MODE_USB),
+		str_on_off(udphy->hw_mode & UDPHY_MODE_DP),
 		udphy->dp_lanes, str_yes_no(udphy->flip));
 
 	rk_udphy_reset_assert_all(udphy);
 	usleep_range(10000, 11000);
 
 	/* enable rx lfps for usb */
-	if (udphy->mode & UDPHY_MODE_USB)
+	if (udphy->hw_mode & UDPHY_MODE_USB)
 		rk_udphy_grfreg_write(udphy->udphygrf, &cfg->grfcfg.rx_lfps, true);
 
 	/* Step 1: power on pma and deassert apb rstn */
@@ -828,13 +828,13 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 			   FIELD_PREP(CMN_DP_LANE_EN_ALL, 0));
 
 	/* Step 4: deassert init rstn and wait for 200ns from datasheet */
-	if (udphy->mode & UDPHY_MODE_USB) {
+	if (udphy->hw_mode & UDPHY_MODE_USB) {
 		ret = rk_udphy_reset_deassert(udphy, "init");
 		if (ret)
 			goto assert_resets;
 	}
 
-	if (udphy->mode & UDPHY_MODE_DP) {
+	if (udphy->hw_mode & UDPHY_MODE_DP) {
 		regmap_update_bits(udphy->pma_regmap, CMN_DP_RSTN_OFFSET,
 				   CMN_DP_INIT_RSTN,
 				   FIELD_PREP(CMN_DP_INIT_RSTN, 0x1));
@@ -843,7 +843,7 @@ static int rk_udphy_init(struct rk_udphy *udphy)
 	udelay(1);
 
 	/*  Step 5: deassert cmn/lane rstn */
-	if (udphy->mode & UDPHY_MODE_USB) {
+	if (udphy->hw_mode & UDPHY_MODE_USB) {
 		ret = rk_udphy_reset_deassert(udphy, "cmn");
 		if (ret)
 			goto assert_resets;
@@ -902,7 +902,7 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 	num_lanes = device_property_count_u32(udphy->dev, "rockchip,dp-lane-mux");
 	if (num_lanes < 0) {
 		dev_dbg(udphy->dev, "no dp-lane-mux, following dp alt mode\n");
-		udphy->mode = UDPHY_MODE_USB;
+		udphy->hw_mode = UDPHY_MODE_USB;
 		return 0;
 	}
 
@@ -931,10 +931,10 @@ static int rk_udphy_parse_lane_mux_data(struct rk_udphy *udphy)
 		}
 	}
 
-	udphy->mode = UDPHY_MODE_DP;
+	udphy->hw_mode = UDPHY_MODE_DP;
 	udphy->dp_lanes = num_lanes;
 	if (num_lanes == 1 || num_lanes == 2) {
-		udphy->mode |= UDPHY_MODE_USB;
+		udphy->hw_mode |= UDPHY_MODE_USB;
 		udphy->flip = (udphy->lane_mux_sel[0] == PHY_LANE_MUX_DP) ||
 			      (udphy->lane_mux_sel[1] == PHY_LANE_MUX_DP);
 	}
@@ -1033,7 +1033,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 {
 	int ret;
 
-	if (!(udphy->mode & mode)) {
+	if (!(udphy->hw_mode & mode)) {
 		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
 		return 0;
 	}
@@ -1050,7 +1050,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			return ret;
 		}
 
-		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
+		if (!udphy->hs && udphy->hw_mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 
@@ -1067,7 +1067,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 			return ret;
 		}
 
-		if (!udphy->hs && udphy->mode & UDPHY_MODE_USB)
+		if (!udphy->hs && udphy->hw_mode & UDPHY_MODE_USB)
 			rk_udphy_u3_port_disable(udphy, false);
 		udphy->phy_needs_reinit = false;
 
@@ -1081,7 +1081,7 @@ static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
 
 static void rk_udphy_power_off(struct rk_udphy *udphy, u8 mode)
 {
-	if (!(udphy->mode & mode)) {
+	if (!(udphy->hw_mode & mode)) {
 		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
 		return;
 	}
@@ -1349,7 +1349,7 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
 	udphy->sw_mode |= UDPHY_MODE_USB;
 
 	/* DP only or high-speed, disable U3 port */
-	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs) {
+	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
 		return 0;
 	}
@@ -1372,7 +1372,7 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 	udphy->sw_mode &= ~UDPHY_MODE_USB;
 
 	/* DP only or high-speed */
-	if (!(udphy->mode & UDPHY_MODE_USB) || udphy->hs)
+	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs)
 		return 0;
 
 	rk_udphy_power_off(udphy, UDPHY_MODE_USB);

-- 
2.53.0


