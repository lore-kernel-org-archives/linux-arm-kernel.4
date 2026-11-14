Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96D160A2612
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Nov 2026 02:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ieuoBjFr;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=MNplbPlm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2OSpRSMY5S7gJ0YlvoZIj+BjbDx5rDvM6lPm/wqvFII=; b=ieuoBjFruIDWPe
	TMkQySjU1WhBnKavdHQaGM1vBT0p7K9l+a3vBeMRFWVU8RTpwHjcfaGY23JRHRFT0XmvBc4icpfzQ
	xm0IWz2KVplSnQIHK1QFYMg2Gjse8M+zU6Wh3wbG/5c/Z6pa1HLYeaZ9hXS9kuzB5kLq7qezG5bIX
	5pc+QnerSHHwwHWLDzGtQrFrbG57qKGkPZuKD0wxMBlau0SYwYBUwK6434ED38vtNFYeEUWr7OgyJ
	nwU1yJZ+wSLtrhjHxT3qmFPV822CEsn+zeQiA+zKQmAKAE8c9BdXvCyHTJmSdytICor5GkGxdVsC6
	uMxHZcZO3Czd9r+ve3iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS34z-0000000F5NI-2Ezr;
	Sat, 14 Nov 2026 02:01:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xS34X-0000000F505-1gOt;
	Sat, 14 Nov 2026 02:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794621650;
	bh=vCRDwnWAmUXifR4KoaHyZqwG4bnpG8tRLsDIqivw6G8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MNplbPlmmEifVRXBMuTOWacph3vYjvvdzUpcc2Hbp8OYut02GGqklR2RkcoK4ywrt
	 TO0V0uun2O6PioHbZKXk84GdlmPfQ+Xp7nH/AsJotVjlmxTTd0CGHn4jkh1a378pY6
	 noKT2yCZ0SgOIsuvZYRmha4D2qVTVFGZSaPbTKZjgaVBVoSaouhQCvs59ZUcQmtm6j
	 IIgrM0Vx6nRrIM92Cj6xsNzYwO1ikKwyWcgfvix+vzUbzguVXxOp/UcgiXpmc/dKA0
	 zZRMuLv9M3s1HNCJKQXKcGIyCOnSbokPGug3kDvWNnjYeAv5tqawJ/jBerUl1pZmAA
	 Mt3gr91MA6Blg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA47517E0CD7;
	Sat, 14 Nov 2026 03:00:50 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 77CC1480035; Sat, 14 Nov 2026 03:00:50 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Sat, 14 Nov 2026 03:00:31 +0100
Subject: [PATCH v17 4/7] phy: rockchip: usbdp: Fix power state handling
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-4-1af5f566408e@collabora.com>
References: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com>
In-Reply-To: <20261114-b4-rockchip-usbdp-cleanup-part3-v17-0-1af5f566408e@collabora.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7335;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=vCRDwnWAmUXifR4KoaHyZqwG4bnpG8tRLsDIqivw6G8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGr3wNLuHdkH4aRhKJgrhS5XJr3BNnbPLn5sz
 bX464rZWHOmaYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq98DSAAoJENju1/PI
 O/qaIvAP/3oT92PUeOAwmig7lR/lfbV+MJNa3P+wG+YkZoAMH3iSPQETpOvNmkjWjuBW1IXe3mb
 o7MjiuAhPd3/NUeQywv6sja2XdBPmMKjG1xaWTt+hMoanxG7NbPs8ou//KocCw4yfUNxkRyL1MT
 5FHKsK5QCzvhIPMsqPNmBMRSIOnde6QHss390k5pqbMEAgIkrVgGyaPwBL/CindxCF+fVAE7lSY
 LAmADmMnMFGM2XtfrMEJ3h/94xRkI5F4/jROwPQVi3CJ8U3A2XODKViyqJTC5y5uvLHY58GR0Jn
 w/Vm0Uv9ZdBdC+gQ41DNbzDftYGPvu45c4mIXWSFwGGaUQzf/DRPIBDdjO0hoFguDcuyTSlyetn
 iOIABN1tf2CNsAkSUpBKiWyBaEE3ZYPRJ+hkE1qcZABUeFq70T/kCjxh9fEoJS9RL5aghW0xOMH
 LAbQd5jdRTF5MLYcZ7iIghvIIqPqUeLA38VMavc7Ezg1GTcMuq4wJdZ+Ri0XRFyLHLnYnRS4MQB
 qg4CfDUUikX6nXxmCMI1DhvRo7ivvgOWLfADVRPS2f+VtwPcXcoZkUjrb9YPM/OoA/8qR2KylaK
 r75qF8KvrMmqmq268bLek79iHYjtIByuAKObDwQuTa4iqMvqxLE6g+E1/EvYEkbHE+WzT7gh5Kd
 4fRuQYA3Ys6Mant3R2ckq7Q==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_180053_625281_6F3D53E5 
X-CRM114-Status: GOOD (  26.25  )
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

Restructure power state handling, so that the function uses sw_mode and
hw_mode to figure out the actual required hardware state. This allows
any path updating either of those modes to simply call
rk_udphy_update_power_state() to get the right hardware state.

This makes it a lot more obvious what is going on and also fixes a few
potential resource leaks identified by Sashiko as a side-effect. For
example if USB3 is requested by software while the USB-C is in DP-only
mode, things are decently handled after this.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 122 +++++++++++++++++-------------
 1 file changed, 70 insertions(+), 52 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index de8f01bd0467..fc3c4104dcd7 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -173,10 +173,10 @@ struct rk_udphy {
 
 	/* PHY status management */
 	bool flip;
-	bool phy_needs_reinit;
+	bool phy_needs_reinit; /* lane mux changed */
 	u8 hw_mode; /* modes currently supported by hardware */
-	u8 status;
 	u8 sw_mode; /* modes currently requested */
+	u8 status;
 
 	/* utilized for USB */
 	bool hs; /* flag for high-speed */
@@ -1029,70 +1029,93 @@ void rk_udphy_register_reset_handler(struct phy *phy,
 }
 EXPORT_SYMBOL_GPL(rk_udphy_register_reset_handler);
 
-static int rk_udphy_power_on(struct rk_udphy *udphy, u8 mode)
+static int rk_udphy_update_power_state(struct rk_udphy *udphy)
 {
+	bool usb3_port_enable;
+	u8 target_mode;
 	int ret;
 
-	if (!(udphy->hw_mode & mode)) {
-		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
+	/*
+	 * Initialize PHY mode according to the hardware setup (either described
+	 * in DT or negotiated via the Type-C controller) instead of requesting
+	 * only the needed PHY side, because that would break the USB/DP data
+	 * streams when the other PHY is being requested. This is not an issue
+	 * during the Type-C negotiation as that happens during the hotplug phase
+	 * and not during normal operation. Also disable everything if the
+	 * software has not requested anything, as there shouldn't be any active
+	 * data streams in that case.
+	 */
+	target_mode = udphy->hw_mode;
+	if (udphy->sw_mode == UDPHY_MODE_NONE)
+		target_mode = UDPHY_MODE_NONE;
+
+	usb3_port_enable = !udphy->hs && (target_mode & UDPHY_MODE_USB);
+
+	if (!udphy->phy_needs_reinit && udphy->status == target_mode) {
+		if (udphy->sw_mode & UDPHY_MODE_USB)
+			rk_udphy_u3_port_disable(udphy, !usb3_port_enable);
 		return 0;
 	}
 
-	if (udphy->status == UDPHY_MODE_NONE) {
-		rk_udphy_run_reset_handler(udphy, true);
+	/* Avoid to re-init disabled PHY */
+	if (udphy->status == target_mode && target_mode == UDPHY_MODE_NONE)
+		return 0;
+
+	/*
+	 * Inform DWC3 driver, that we are about to reset the PHY, so that it can
+	 * assert its PIPE reset lines and avoid DWC3 getting into a buggy state.
+	 * This is intentionally done for a PHY disable, since that also changes
+	 * the clocks routed to the PHY.
+	 */
+	rk_udphy_run_reset_handler(udphy, true);
 
+	/*
+	 * Disable USB3 port, which among other things re-routes a DWC3 clock to
+	 * avoid SErrors when the DWC3 registers are accessed while the PHY is
+	 * disabled. This is only done, when the DWC3 is running as the accessed
+	 * GRF registers and in PD_USB.
+	 */
+	if (udphy->sw_mode & UDPHY_MODE_USB) {
 		rk_udphy_u3_port_disable(udphy, true);
 		udelay(10);
+	}
 
+	if (udphy->status == UDPHY_MODE_NONE) {
+		/* Power up (incl. clocks) */
 		ret = rk_udphy_setup(udphy);
 		if (ret) {
 			rk_udphy_run_reset_handler(udphy, false);
 			return ret;
 		}
-
-		if (!udphy->hs && udphy->hw_mode & UDPHY_MODE_USB)
-			rk_udphy_u3_port_disable(udphy, false);
-		udphy->phy_needs_reinit = false;
-
-		rk_udphy_run_reset_handler(udphy, false);
-	} else if (udphy->phy_needs_reinit) {
-		rk_udphy_run_reset_handler(udphy, true);
-
-		rk_udphy_u3_port_disable(udphy, true);
-		udelay(10);
-
+	} else if (target_mode == UDPHY_MODE_NONE) {
+		/* Power down (incl. clocks) */
+		rk_udphy_disable(udphy);
+	} else {
+		/* Mode change => re-init */
 		ret = rk_udphy_init(udphy);
 		if (ret) {
 			rk_udphy_run_reset_handler(udphy, false);
 			return ret;
 		}
-
-		if (!udphy->hs && udphy->hw_mode & UDPHY_MODE_USB)
-			rk_udphy_u3_port_disable(udphy, false);
-		udphy->phy_needs_reinit = false;
-
-		rk_udphy_run_reset_handler(udphy, false);
 	}
 
-	udphy->status |= mode;
-
-	return 0;
-}
-
-static void rk_udphy_power_off(struct rk_udphy *udphy, u8 mode)
-{
-	if (!(udphy->hw_mode & mode)) {
-		dev_info(udphy->dev, "mode 0x%02x is not support\n", mode);
-		return;
-	}
+	/* Ensure USB3 support is enabled when supported */
+	if (udphy->sw_mode & UDPHY_MODE_USB)
+		rk_udphy_u3_port_disable(udphy, !usb3_port_enable);
 
-	if (!udphy->status)
-		return;
+	/*
+	 * Inform DWC3, that we are done with the reset, so that it can deassert
+	 * its PIPE reset line. This is sent in pair with a PRE_RESET allowing
+	 * consumer driver to do paired resource requests (e.g. clocks) in their
+	 * notification handlers. As we reroute the clocks, its also fine to
+	 * send this after completely disabling the PHY.
+	 */
+	rk_udphy_run_reset_handler(udphy, false);
 
-	udphy->status &= ~mode;
+	udphy->status = target_mode;
+	udphy->phy_needs_reinit = false;
 
-	if (udphy->status == UDPHY_MODE_NONE)
-		rk_udphy_disable(udphy);
+	return 0;
 }
 
 static int rk_udphy_dp_phy_power_on(struct phy *phy)
@@ -1105,7 +1128,7 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 
 		phy_set_bus_width(phy, udphy->dp_lanes);
 
-		ret = rk_udphy_power_on(udphy, UDPHY_MODE_DP);
+		ret = rk_udphy_update_power_state(udphy);
 		if (ret) {
 			udphy->sw_mode &= ~UDPHY_MODE_DP;
 			return ret;
@@ -1135,9 +1158,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	udphy->sw_mode &= ~UDPHY_MODE_DP;
 
 	rk_udphy_dp_lane_enable(udphy, 0);
-	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
-
-	return 0;
+	return rk_udphy_update_power_state(udphy);
 }
 
 /*
@@ -1349,12 +1370,12 @@ static int rk_udphy_usb3_phy_init(struct phy *phy)
 	udphy->sw_mode |= UDPHY_MODE_USB;
 
 	/* DP only or high-speed, disable U3 port */
-	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs) {
+	if (udphy->hs) {
 		rk_udphy_u3_port_disable(udphy, true);
 		return 0;
 	}
 
-	ret = rk_udphy_power_on(udphy, UDPHY_MODE_USB);
+	ret = rk_udphy_update_power_state(udphy);
 	if (ret) {
 		udphy->sw_mode &= ~UDPHY_MODE_USB;
 		return ret;
@@ -1371,13 +1392,10 @@ static int rk_udphy_usb3_phy_exit(struct phy *phy)
 
 	udphy->sw_mode &= ~UDPHY_MODE_USB;
 
-	/* DP only or high-speed */
-	if (!(udphy->hw_mode & UDPHY_MODE_USB) || udphy->hs)
+	if (udphy->hs)
 		return 0;
 
-	rk_udphy_power_off(udphy, UDPHY_MODE_USB);
-
-	return 0;
+	return rk_udphy_update_power_state(udphy);
 }
 
 static const struct phy_ops rk_udphy_usb3_phy_ops = {

-- 
2.53.0


