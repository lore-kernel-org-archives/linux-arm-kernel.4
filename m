Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA87606A321
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bv0JJh1W;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Iwfl+96T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8wdlz0LG+mt5/jNeMcYINGDfpLpelVy5XiXlc9r/roo=; b=bv0JJh1WNDExzO
	OJW2djnAW06Zv7JA3IOW74EszXNQgOYoFqyFgDLecG2XyZIuEWsoEyJvjz5cXgKrV31bB4h1MVYFc
	YSz3J/uOnXVY4AEZHEfl6OPCgUZh3p8G3T9Sb1WkCQoTNunFDTsRSkIaCNzCrGCgDyUCSgr74r2LS
	XN3GNR6vlHGR+dNHPb+Ri8MTdmUKmf45D7VRx7sRHSaWCwDYdkEPp7d3E9sQDyey+tVG2KAfWZ+6H
	IhNyzw/IkmsBiJ/6lAJO0ddGbjr9JnN5dyvZjFY3iKkdS8whP542EUecikPgIfdL9pBlpz+39cuWZ
	8mOaaW8TkL/5ggYzS0nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWB6l-00000009bfA-29gJ;
	Wed, 25 Nov 2026 11:24:15 +0000
Received: from mail-m16023653169.xmail.ntesmail.com ([160.236.53.169])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWB4r-00000009a7p-1rgQ;
	Wed, 25 Nov 2026 11:22:19 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55f816069;
	Wed, 25 Nov 2026 19:22:12 +0800 (GMT+08:00)
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
Subject: [PATCH v7 14/20] drm/rockchip: analogix_dp: Unbind bridge when connector init fails
Date: Wed, 25 Nov 2026 19:21:35 +0800
Message-Id: <20261125112141.1434903-15-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125112141.1434903-1-damon.ding@rock-chips.com>
References: <20261125112141.1434903-1-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa212711e2703a8kunm17c230507758d2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTx9IVklLHU1OS01CSEMYTFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Iwfl+96TVBGB7FAGE+rGSWA2yQq/vmKqPlgYhhIyBsga7Y1ekKEPBl0eYaVttVJua9OHTOLyzupetvuNEHhAJnBYytJNrlD3+Sv4h7TnqxXJGZmgq+/yWjCiqD1a6B27MrzUd8V3hrKvZVv1k8f7C/H5AKwIQvE9fxkJ23C91/A=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=8wdlz0LG+mt5/jNeMcYINGDfpLpelVy5XiXlc9r/roo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_032217_801235_97158E06 
X-CRM114-Status: UNSURE (   9.57  )
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

The rockchip_dp_bind() returns without unwinding analogix_dp_bind()
when drm_bridge_connector_init() fails.  The aux device registered by
analogix_dp_bind() is then left behind with a dangling drm_dev
pointer, which could be accessed on later AUX transfers.

Call analogix_dp_unbind() in the error path to release the aux device.

Fixes: 99a49ff5ef7a ("drm/bridge: analogix_dp: Apply drm_bridge_connector helper")
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v6:
- Add Tested-by tag.

Changes in v7:
- Add Fixes tag.
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 635146746b42..39eca3ec7160 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -419,6 +419,7 @@ static int rockchip_dp_bind(struct device *dev, struct device *master,
 	if (IS_ERR(connector)) {
 		ret = PTR_ERR(connector);
 		dev_err(dp->dev, "Failed to initialize bridge_connector\n");
+		analogix_dp_unbind(dp->adp);
 		goto err_cleanup_encoder;
 	}
 
-- 
2.34.1


