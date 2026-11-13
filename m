Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33974606A890
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2GZ3HVwb;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=AcSvs2CT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IjC/8t2i/kN8GWSD3FIAe1B/UxMrwa2ZYacA7/WfeWA=; b=2GZ3HVwbab9ePU
	BthmpcS0sE7Zp4m+Q2W4ZRKyinPHITWz/R2EJ/oDkUc3jTHm4SkGgCkOytUtG29EV7UjoCJuKuW9J
	3tA9WQnAVR8A0dnJhTTGTnPbrSrhBq4qQxPQE2UtefKZjdp8hUBPjr6Ca8lkf+CLRxb5i3hbdfNXD
	KsqDZeqQOilwqZOj5+kYbkTdlP8JW+LKiPXuFAyfyPjYEtJukcB2KouEuCqPuaG9SHJRg8pOTh/p0
	SDd2e9fxaALY08i4TvrVE0ffWBIZ+Hm08MK/KF7e8gPE6rOda+OSlXJ6w6YL1KsjpgM/fq11ByCu7
	UeHw6XElWrPNMAo25fOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmaA-0000000C1eg-47dN;
	Fri, 13 Nov 2026 08:24:26 +0000
Received: from mail-m81230.xmail.ntesmail.com ([156.224.81.230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmZK-0000000C1B4-1YPq;
	Fri, 13 Nov 2026 08:23:37 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54921be54;
	Fri, 13 Nov 2026 16:23:29 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jingoo Han <jingoohan1@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andyshrk@163.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v6 10/18] drm/bridge: analogix_dp: Use platform-specific HPD detection scheme
Date: Fri, 13 Nov 2026 16:22:57 +0800
Message-Id: <20261113082305.541652-11-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113082305.541652-1-damon.ding@rock-chips.com>
References: <20261113082305.541652-1-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d4012d9903a8kunm073aab0481aa9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDH0hPVh1DGEJDQhhJHUNPGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=AcSvs2CTFKgmrK5Ji3jabLkJa58RntjqmsMIiQcH/mN8C75VZj2mSjnGtB6KOD7X/BsCaAtcCS5UR0IrtMjsJhlhAq5PuaGz2Z1moViFcj6gl2LQpWIZ6D65zRBgbrf3TPac5Yy0mAqCkA1X1tMuEOfgH/w5Ytu5Ja/qPi7hUAc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=IjC/8t2i/kN8GWSD3FIAe1B/UxMrwa2ZYacA7/WfeWA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_002335_662632_B34C604D 
X-CRM114-Status: GOOD (  14.93  )
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

The Analogix DP controller provides two sets of interrupt sources for
hotplug detection: HOTPLUG_CHG for any HPD level change, and the
PLUG/HPD_LOST pair for connect/disconnect transitions respectively.

On Rockchip platforms, configure the HPD deglitch filter and use
HOTPLUG_CHG interrupt for hotplug detection. Other platforms retain the
original PLUG + HPD_LOST scheme with unchanged deglitch values.

Move the HPD deglitch configuration into analogix_dp_reset() so that
platform-specific values are set alongside the existing register
defaults in a single location. Update the threaded IRQ handler to check
the corresponding interrupt flag based on platform type.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v2:
- Move ANALOGIX_DP_HPD_DEGLITCH_L/ANALOGIX_DP_HPD_DEGLITCH_H configs to
  analogix_dp_reset().

Changes in v3:
- Modify the commit msg.
- Replace macro HPD_IRQ with HPD_IRQ_ALL.

Changes in v4:
- Add Tested-by tag.

Changes in v6:
- Add Tested-by tag.
---
 .../drm/bridge/analogix/analogix_dp_core.c    |  9 ++++++--
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 22 ++++++++++++++++---
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 97a943f29cf1..db0aefaf6754 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -717,13 +717,18 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 {
 	struct analogix_dp_device *dp = arg;
 	u32 irq_type;
+	bool hpd_detected;
 
 	irq_type = analogix_dp_get_irq_type(dp);
 	if (irq_type)
 		analogix_dp_clear_hotplug_interrupts(dp, irq_type);
 
-	if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN ||
-	    irq_type & DP_IRQ_TYPE_HP_CABLE_OUT) {
+	if (!dp->hpd_gpiod && analogix_dp_is_rockchip(dp->plat_data->dev_type))
+		hpd_detected = irq_type & DP_IRQ_TYPE_HP_CHANGE;
+	else
+		hpd_detected = (irq_type & DP_IRQ_TYPE_HP_CABLE_IN) ||
+			       (irq_type & DP_IRQ_TYPE_HP_CABLE_OUT);
+	if (hpd_detected) {
 		dev_dbg(dp->dev, "Detected cable status changed!\n");
 		if (dp->drm_dev)
 			drm_helper_hpd_irq_event(dp->drm_dev);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 0f1406e4a5d3..025da25463a8 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -160,8 +160,13 @@ void analogix_dp_reset(struct analogix_dp_device *dp)
 	writel(0x0, dp->reg_base + ANALOGIX_DP_PKT_SEND_CTL);
 	writel(0x0, dp->reg_base + ANALOGIX_DP_HDCP_CTL);
 
-	writel(0x5e, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_L);
-	writel(0x1a, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_H);
+	if (analogix_dp_is_rockchip(dp->plat_data->dev_type)) {
+		writel(0x80, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_L);
+		writel(0xbb, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_H);
+	} else {
+		writel(0x5e, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_L);
+		writel(0x1a, dp->reg_base + ANALOGIX_DP_HPD_DEGLITCH_H);
+	}
 
 	writel(0x10, dp->reg_base + ANALOGIX_DP_LINK_DEBUG_CTL);
 
@@ -188,7 +193,18 @@ void analogix_dp_config_interrupt(struct analogix_dp_device *dp)
 	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
 	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
 
-	analogix_dp_unmute_hpd_interrupt(dp, HPD_IRQ_ALL);
+	/*
+	 * Either HOTPLUG_CHG interrupt or PLUG + HPD_LOST interrupt
+	 * pair can be used to implement hotplug detection.
+	 *
+	 * On Rockchip platforms, configuring HPD deglitch to 2ms and
+	 * using HOTPLUG_CHG interrupt for hotplug detection is proven
+	 * as a better solution via engineering verification.
+	 */
+	if (analogix_dp_is_rockchip(dp->plat_data->dev_type))
+		analogix_dp_unmute_hpd_interrupt(dp, DP_IRQ_TYPE_HP_CHANGE);
+	else
+		analogix_dp_unmute_hpd_interrupt(dp, HPD_IRQ_ALL);
 }
 
 /*
-- 
2.34.1


