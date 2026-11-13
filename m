Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3155860A6F62
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VWgbq3kk;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=i5qfWhFk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=XNuY/Vo6Av48O204IEijKEDS+EVPpGFz9/aSQiiHflQ=; b=VWgbq3kkXR4oB9
	r5uDaZ+669Fv4DvRPQaOuCU/jVAO6b7EG0cz/lP0WFkn3kz53Sq3qX1R/4sbLGGli1Nht/ak1Bkqq
	pVuDfAonIUbyJIxQzengEw49Pnzjpn1PqsbRlZPCOuC0gBWoHi4FxEK6PMEuBS4gVRt2F7RDrCQbQ
	JJYJrCGXe5MzOoLsP3D9ORZRSgkdlWQcEzMDpTvUVOiVbQAW2R3hmS9Sv4OorJH8LPyLrPh6awe+F
	4KYBBwCvrNJS+a45JMWC4/cnyyHUKoQtoteb4qXRdwGWUMFt++BtP5e8uLOjqoDAl+d2OgFn7//O8
	ARxUK9uETa5L9fxh4UBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmZH-0000000C1BG-2NYG;
	Fri, 13 Nov 2026 08:23:31 +0000
Received: from mail-m158133.netease.com ([47.251.158.133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmZ8-0000000C13S-1gvm;
	Fri, 13 Nov 2026 08:23:24 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54921bdfd;
	Fri, 13 Nov 2026 16:23:17 +0800 (GMT+08:00)
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
Subject: [PATCH v6 01/18] drm/bridge: Select VIDEOMODE_HELPERS for DRM_OF_DISPLAY_MODE_BRIDGE
Date: Fri, 13 Nov 2026 16:22:48 +0800
Message-Id: <20261113082305.541652-2-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113082305.541652-1-damon.ding@rock-chips.com>
References: <20261113082305.541652-1-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1d400fe4c03a8kunm073aab0481a12
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaT0kZVk5PTR9JSh9DGRoeHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=i5qfWhFksLq8cnd1a+lBOnDN1h5a2ZwsvD7/onmO4MfEkfobPPxPg9mJPrqpi+9x3m2tFKD9Q2YZYTv41w1aSncg4yZNbwsalcQRLiAnFM4B1CvMITH/JMKNoLNF3fCZDxkk4V0/iRdSM+0HWPrOfTZDqAg7Y4K+BKKzEa56PIg=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=XNuY/Vo6Av48O204IEijKEDS+EVPpGFz9/aSQiiHflQ=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_002322_966871_E6356315 
X-CRM114-Status: UNSURE (   7.23  )
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

The of-display-mode-bridge driver calls of_get_drm_display_mode(),
which is provided when VIDEOMODE_HELPERS is selected.  So far the
dependency has been satisfied by the users selecting
VIDEOMODE_HELPERS themselves (e.g. the Exynos and i.MX DRM drivers),
which breaks as soon as a user does not, resulting in undefined
references to of_get_drm_display_mode() at link time.

Select VIDEOMODE_HELPERS from DRM_OF_DISPLAY_MODE_BRIDGE, so that the
dependency is always satisfied.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 drivers/gpu/drm/bridge/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index c7da6b02d7b6..f717523014e8 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -266,6 +266,7 @@ config DRM_NXP_PTN3460
 config DRM_OF_DISPLAY_MODE_BRIDGE
 	tristate
 	depends on DRM_BRIDGE && OF
+	select VIDEOMODE_HELPERS
 	help
 	  This is a DRM bridge implementation that uses of_get_drm_display_mode
 	  to acquire display mode.
-- 
2.34.1


