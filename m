Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47E6606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cjD8NwvK;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Ql6dAdDB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LN55FevueCSpgrf/yglA1ahNWl9iVPOBwH9tWUd+Rbo=; b=cjD8NwvKjTrzbv
	JlDQFyuAWMPrHqXaypiuZUh5piCMDK4uV35Bwl6SAbvNMgf39pJyPk7L4C25F1cNvFcKCdpzK8nmi
	XC5IDXKWzjO12+MZwNlUAlOtJeFNdvBdwHzkKpTo8+Lc678Mt7HCWjj0JUXAivxT84L+TY/RV/hQ1
	6qPsCzH/7+KRoCW0C1qu1rhytochC8BVv2TfKn7wZzNWfUfSzsYsE6O6obrdWqIo3vp0IvH8oWQ6e
	g7/KiCm7s4Qk7itaKLtT7IzerXMaBLLfGd5gGXxCwbiive6gvhT3Ou0aDoh4Tbq+If+AH6OxQUuF5
	tiJ51UecywK7GSQPW9pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWB4z-00000009aHU-03mB;
	Wed, 25 Nov 2026 11:22:25 +0000
Received: from mail-m82117.xmail.ntesmail.com ([156.224.82.117])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWB4b-00000009Zw1-2pLZ;
	Wed, 25 Nov 2026 11:22:03 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55f81602c;
	Wed, 25 Nov 2026 19:21:56 +0800 (GMT+08:00)
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
Subject: [PATCH v7 02/20] drm/bridge: analogix_dp: Drop the redundant pm_runtime_mark_last_busy() calls
Date: Wed, 25 Nov 2026 19:21:23 +0800
Message-Id: <20261125112141.1434903-3-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125112141.1434903-1-damon.ding@rock-chips.com>
References: <20261125112141.1434903-1-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa21270dfad03a8kunm17c23050775861
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSRlMVkNJSB8fTh9KHk9JGFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Ql6dAdDBICliEpE0zaJBKkomwfjmr5mRu2VrmabrPTLBWAfg2j531J6ktUsjgmd+VE5ZkOgR1Bqm9tIm/qa6yI08cOosdZyeghzfsCrE+AdcMmWPjrYmoXfAgm7LiKAn9q1vf+MwcZtHBsE/u4tgdi5tK4MmxfhJMzFPmIde824=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=LN55FevueCSpgrf/yglA1ahNWl9iVPOBwH9tWUd+Rbo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_032201_984344_12B5E1CA 
X-CRM114-Status: UNSURE (   9.15  )
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

Since commit b3db492e8335 ("PM: runtime: Mark last busy stamp in
pm_runtime_put_autosuspend()"), pm_runtime_put_autosuspend() updates
the last busy timestamp itself, so the explicit
pm_runtime_mark_last_busy() calls right before it are no longer needed.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

---

Changes in v7:
- Add this patch to drop the redundant pm_runtime_mark_last_busy()
  calls, as pm_runtime_put_autosuspend() updates the last busy stamp
  since commit b3db492e8335.
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 8bb4c48aa3b4..50da43d64034 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1369,7 +1369,6 @@ static ssize_t analogix_dpaux_transfer(struct drm_dp_aux *aux,
 
 	ret = analogix_dp_transfer(dp, msg);
 out:
-	pm_runtime_mark_last_busy(dp->dev);
 	pm_runtime_put_autosuspend(dp->dev);
 
 	return ret;
@@ -1389,7 +1388,6 @@ static int analogix_dpaux_wait_hpd_asserted(struct drm_dp_aux *aux, unsigned lon
 	ret = readx_poll_timeout(analogix_dp_get_plug_in_status, dp, val, !val,
 				 wait_us / 100, wait_us);
 
-	pm_runtime_mark_last_busy(dp->dev);
 	pm_runtime_put_autosuspend(dp->dev);
 
 	return ret;
-- 
2.34.1


