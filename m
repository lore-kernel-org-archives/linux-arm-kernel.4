Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352E3606C9B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eYn1yCRE;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=cwS8AC/I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ybHIHgPqplEUJRoppMm7glS9jAlf6L3WssQnCO+s3Qc=; b=eYn1yCREQd9tJF
	tBjUlLjIJhEHHReJv9WetHLhKGhsUwXifJObbcJjJ0nBlQLlLNDErTtNpmQ7UPixyqN/ebBdNSpIz
	v2fwIco7qAQ87ogeOmlavE9KJMyZ1Usrer0+wkVnlp8CPpHmXqwuaQwP8wkYFPyk8zmkNh+dBpyzU
	A26fNCjXu6ZzqpTeEJkv4SKkqAOQce9K5HXzB0fejqnfjW0AdDWQOBFO9smJWPcuXUli9Jo0XglRB
	9RBLbFdcJdCexBj5PzN6OLd1+AySuf++BGP9+zW1kyAMRk5NHG87jniZduZfropTIinideeuJNZZa
	S306qUurOWZkDGdv7vVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmeD-0000000C3C1-2ADg;
	Fri, 13 Nov 2026 08:28:37 +0000
Received: from mail-m3283.qiye.163.com ([220.197.32.83])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRme9-0000000C39v-0Lnb;
	Fri, 13 Nov 2026 08:28:35 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54921be4d;
	Fri, 13 Nov 2026 16:23:28 +0800 (GMT+08:00)
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
Subject: [PATCH v6 09/18] drm/bridge: analogix_dp: Simplify analogix_dp_config_interrupt()
Date: Fri, 13 Nov 2026 16:22:56 +0800
Message-Id: <20261113082305.541652-10-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113082305.541652-1-damon.ding@rock-chips.com>
References: <20261113082305.541652-1-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d401289203a8kunm073aab0481a98
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSR1NVkJOHkNPTUNJGUhCT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=cwS8AC/IVZq1uEz3/DIcl+w6W22UmkykI56E2Q2CrCRubq+i7TQMzyV0CIvrviNojPLQYlcUwAfP4KYKVuyPdZ27EMAwlNec39veMkP0Q1spUC9zAmn0tlXBw2ut2Lc02Vc+99LieL9+gG3Eq1pWY3NXheIi7iP9mIJ8OqQOAF4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=ybHIHgPqplEUJRoppMm7glS9jAlf6L3WssQnCO+s3Qc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_002833_482333_C17FD391 
X-CRM114-Status: UNSURE (   8.78  )
X-CRM114-Notice: Please train this message.
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

Simplify analogix_dp_config_interrupt() by removing the local
COMMON_INT_MASK and INT_STA_MASK macros, replacing the open-coded
writel(0) calls for COMMON_INT_MASK_1~3, and leveraging
analogix_dp_unmute_hpd_interrupt() with the full HPD_IRQ_ALL mask to
initialize the HPD interrupt state.

Tested-by: Heiko Stuebner <heiko@sntech.de>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v3:
- Replace macro HPD_IRQ with HPD_IRQ_ALL.

Changes in v4:
- Add Tested-by tag.

Changes in v5:
- Simplify the commig msg.

Changes in v6:
- Add Tested-by tag.
---
 .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 25 +++----------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
index 6ac03a1aa512..0f1406e4a5d3 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
@@ -18,12 +18,6 @@
 #include "analogix_dp_core.h"
 #include "analogix_dp_reg.h"
 
-#define COMMON_INT_MASK_1	0
-#define COMMON_INT_MASK_2	0
-#define COMMON_INT_MASK_3	0
-#define COMMON_INT_MASK_4	(HOTPLUG_CHG | HPD_LOST | PLUG)
-#define INT_STA_MASK		INT_HPD
-
 #define HPD_IRQ_ALL		(DP_IRQ_TYPE_HP_CABLE_IN | DP_IRQ_TYPE_HP_CABLE_OUT | \
 				 DP_IRQ_TYPE_HP_CHANGE | DP_IRQ_TYPE_IRQ_HPD)
 
@@ -189,23 +183,12 @@ void analogix_dp_swreset(struct analogix_dp_device *dp)
 
 void analogix_dp_config_interrupt(struct analogix_dp_device *dp)
 {
-	u32 reg;
-
 	/* 0: mask, 1: unmask */
-	reg = COMMON_INT_MASK_1;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_1);
-
-	reg = COMMON_INT_MASK_2;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
-
-	reg = COMMON_INT_MASK_3;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
-
-	reg = COMMON_INT_MASK_4;
-	writel(reg, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_4);
+	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_1);
+	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_2);
+	writel(0, dp->reg_base + ANALOGIX_DP_COMMON_INT_MASK_3);
 
-	reg = INT_STA_MASK;
-	writel(reg, dp->reg_base + ANALOGIX_DP_INT_STA_MASK);
+	analogix_dp_unmute_hpd_interrupt(dp, HPD_IRQ_ALL);
 }
 
 /*
-- 
2.34.1


