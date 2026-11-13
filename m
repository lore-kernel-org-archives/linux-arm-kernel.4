Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52434606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2RGxMjPw;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=k0aPymII
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=G/kiDScfnY0OYjEod2cKdTuMee7XEGUq6FrfIROTexM=; b=2RGxMjPw55W3mh
	3XlsO1+45ahI/+dLk46aGsyQAnC9mOz9g/LsaAC531xVfqsI3nGj5vmTUHLN1NbwSXn5t1U1J4TaA
	rvN/zW7PonkN9QXHNdW5sWXYv5C8K+N3Etveq++vv7G//0u6JTXcsG+FZD80ylQyoFNqUZzdIWzu/
	Lod7hqjyc/5t3QK2OuA8b6TrFSI1EEacmv234ksNMY9/J18gZk2naYajYq0AJ+Bj80Bnk9KatOD5p
	+WE7YJ4UmS3xG+SQELsG3kJPruJPS3l74SEyL8FgE263KD8sfNOGNW/VpqKaX2IOlHvOnwPWQTfKG
	WMJBGVBSu8YN9WrM62Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmZg-0000000C1Pa-3qZJ;
	Fri, 13 Nov 2026 08:23:56 +0000
Received: from mail-m128102.netease.com ([103.209.128.102])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmZB-0000000C14M-2e34;
	Fri, 13 Nov 2026 08:23:27 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54921be22;
	Fri, 13 Nov 2026 16:23:21 +0800 (GMT+08:00)
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
Subject: [PATCH v6 04/18] drm/bridge: analogix_dp: Return bitmask from analogix_dp_get_irq_type()
Date: Fri, 13 Nov 2026 16:22:51 +0800
Message-Id: <20261113082305.541652-5-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113082305.541652-1-damon.ding@rock-chips.com>
References: <20261113082305.541652-1-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d4010e2203a8kunm073aab0481a4b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSUlOVklCGR8fTx1OQk5KGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=k0aPymIIZbkGIzGUxq0OBQD9fYwvdXTdZrm3KRdv21bZ4Gqob08Mfzt2Hy62FYvNFMAeia15XrDfjycug+yT0acQqTauvOivdFKgS14GeDeTl6v4E4c6kgwlH4YHTwxEHpLesoInlr1nLNdMS21GXfq/d8ug7xvsNK5cz5NaWpg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=G/kiDScfnY0OYjEod2cKdTuMee7XEGUq6FrfIROTexM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_002325_925192_9E5C7BC4 
X-CRM114-Status: GOOD (  14.98  )
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

Analogix DP controllers support two sets of interrupts for hotplug
detection: HOTPLUG_CHG, and the pair PLUG / HPD_LOST.  The current
driver logic relies on PLUG/HPD_LOST only, and
analogix_dp_get_irq_type() returns on the first matched interrupt
flag, so the hardirq handler unconditionally mutes all HPD
interrupts, including HOTPLUG_CHG and INT_HPD.

To prepare fine-grained interrupt handling, convert the return type
from enum dp_irq_type to a u32 bitmask, accumulate all pending
interrupt flags instead of returning early, add detection for
DP_IRQ_TYPE_IRQ_HPD, and use zero instead of the DP_IRQ_TYPE_UNKNOWN
sentinel to indicate no pending interrupts.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v4:
- Add Tested-by tag.

Changes in v5:
- Simplify the commit msg.

Changes in v6:
- Add Tested-by tag.
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c |  8 ++++----
 .../gpu/drm/bridge/analogix/analogix_dp_core.h |  4 ++--
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c  | 18 ++++++++++--------
 3 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 35b273a803a0..a3871f28b835 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -704,10 +704,10 @@ static irqreturn_t analogix_dp_hardirq(int irq, void *arg)
 {
 	struct analogix_dp_device *dp = arg;
 	irqreturn_t ret = IRQ_NONE;
-	enum dp_irq_type irq_type;
+	u32 irq_type;
 
 	irq_type = analogix_dp_get_irq_type(dp);
-	if (irq_type != DP_IRQ_TYPE_UNKNOWN) {
+	if (irq_type) {
 		analogix_dp_mute_hpd_interrupt(dp);
 		ret = IRQ_WAKE_THREAD;
 	}
@@ -718,7 +718,7 @@ static irqreturn_t analogix_dp_hardirq(int irq, void *arg)
 static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 {
 	struct analogix_dp_device *dp = arg;
-	enum dp_irq_type irq_type;
+	u32 irq_type;
 
 	irq_type = analogix_dp_get_irq_type(dp);
 	if (irq_type & DP_IRQ_TYPE_HP_CABLE_IN ||
@@ -728,7 +728,7 @@ static irqreturn_t analogix_dp_irq_thread(int irq, void *arg)
 			drm_helper_hpd_irq_event(dp->drm_dev);
 	}
 
-	if (irq_type != DP_IRQ_TYPE_UNKNOWN) {
+	if (irq_type) {
 		analogix_dp_clear_hotplug_interrupts(dp);
 		analogix_dp_unmute_hpd_interrupt(dp);
 	}
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
index 64aaba67e669..dc189f0b7a19 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
@@ -120,7 +120,7 @@ enum dp_irq_type {
 	DP_IRQ_TYPE_HP_CABLE_IN  = BIT(0),
 	DP_IRQ_TYPE_HP_CABLE_OUT = BIT(1),
 	DP_IRQ_TYPE_HP_CHANGE    = BIT(2),
-	DP_IRQ_TYPE_UNKNOWN      = BIT(3),
+	DP_IRQ_TYPE_IRQ_HPD      = BIT(3),
 };
 
 struct video_info {
@@ -196,7 +196,7 @@ void analogix_dp_set_analog_power_down(struct analogix_dp_device *dp,
 int analogix_dp_init_analog_func(struct analogix_dp_device *dp);
 void analogix_dp_init_hpd(struct analogix_dp_device *dp);
 void analogix_dp_force_hpd(struct analogix_dp_device *dp);
-enum dp_irq_type analogix_dp_get_irq_type(struct analogix_dp_device *dp);
+u32 analogix_dp_get_irq_type(struct analogix_dp_device *dp);
 void analogix_dp_clear_hotplug_interrupts(struct analogix_dp_device *dp);
 void analogix_dp_reset_aux(struct analogix_dp_device *dp);
 void analogix_dp_init_aux(struct analogix_dp_device *dp);
diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index c1344a3f013a..49c1961e4326 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -412,8 +412,9 @@ void analogix_dp_force_hpd(struct analogix_dp_device *dp)
 	writel(reg, dp->reg_base + ANALOGIX_DP_SYS_CTL_3);
 }
 
-enum dp_irq_type analogix_dp_get_irq_type(struct analogix_dp_device *dp)
+u32 analogix_dp_get_irq_type(struct analogix_dp_device *dp)
 {
+	u32 irq_type = 0;
 	u32 reg;
 
 	if (dp->hpd_gpiod) {
@@ -425,17 +426,18 @@ enum dp_irq_type analogix_dp_get_irq_type(struct analogix_dp_device *dp)
 	} else {
 		/* Parse hotplug interrupt status register */
 		reg = readl(dp->reg_base + ANALOGIX_DP_COMMON_INT_STA_4);
-
 		if (reg & PLUG)
-			return DP_IRQ_TYPE_HP_CABLE_IN;
-
+			irq_type |= DP_IRQ_TYPE_HP_CABLE_IN;
 		if (reg & HPD_LOST)
-			return DP_IRQ_TYPE_HP_CABLE_OUT;
-
+			irq_type |= DP_IRQ_TYPE_HP_CABLE_OUT;
 		if (reg & HOTPLUG_CHG)
-			return DP_IRQ_TYPE_HP_CHANGE;
+			irq_type |= DP_IRQ_TYPE_HP_CHANGE;
+
+		reg = readl(dp->reg_base + ANALOGIX_DP_INT_STA);
+		if (reg & INT_HPD)
+			irq_type |= DP_IRQ_TYPE_IRQ_HPD;
 
-		return DP_IRQ_TYPE_UNKNOWN;
+		return irq_type;
 	}
 }
 
-- 
2.34.1


