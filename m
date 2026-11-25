Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC44606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 11:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O8oylhP8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wKpzHZ7L2zAkn9UdAVy+8MnE4gMumt/s69X7gH2oLP4=; b=O8oylhP8mp2fZA0FN+plJ1VTLm
	7vvmlkGhq0CEcNFiKZqwwSFBUf11BoM/66RRVI3twUk6QmnU3YzOREwA4kA8etGNmOdDhrHB8V2x/
	ccrZMRNE+xzV+SowBykd/cIRRI8D7y4YMK9Tgt8sckFhFCJFq3fdF9wmSrMH994vyOO+oyGdaC6QD
	a0P5kFLopEInSVoZ1IAR3Aa7iMPDLUJPAHjoy8BnvQBRUBWH2n2cevl5eIfYt9eEgVwNzShQLH/hw
	RbSQENUm89zyTeOzDMT5a4LrKTB2oPKDsti7S9zfBm0sK59SQce/PCP65eHl2jbjBAybWaKxGNOCQ
	NqGwBzhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBQc-00000009gal-1Au6;
	Wed, 25 Nov 2026 11:44:46 +0000
Received: from exchange.fintech.ru ([195.54.195.159])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWBQ8-00000009gA2-1MrD;
	Wed, 25 Nov 2026 11:44:17 +0000
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 25 Nov
 2026 14:43:47 +0300
Received: from localhost (10.0.253.153) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 25 Nov
 2026 14:43:46 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
	"Jernej Skrabec" <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Sandy Huang
	<hjc@rock-chips.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>, Alexandre Marquet <tb@a-marquet.fr>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, <linux-rockchip@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
Subject: [PATCH 3/3] drm/bridge: analogix_dp: Propagate errors from runtime resume
Date: Wed, 25 Nov 2026 14:43:15 +0300
Message-ID: <20261125114319.1089186-4-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125114319.1089186-1-n.zhandarovich@fintech.ru>
References: <20261125114319.1089186-1-n.zhandarovich@fintech.ru>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_034416_375166_2497114E 
X-CRM114-Status: GOOD (  14.36  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Stop controller initialization when platform or PHY power-on fails and
return the original error to the resume caller. Unwind the platform
power callback only after it has completed successfully, then release
the controller clock. Do not call phy_power_off() after a failed
phy_power_on(), since no successful PHY power reference was acquired.

Also stop and unwind platform power if setting the PHY mode fails.

Fixes: 3424e3a4f844 ("drm: bridge: analogix/dp: split exynos dp driver to bridge directory")
Fixes: 2c0883459ed6 ("drm/bridge: analogix_dp: Add support for phy configuration.")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
Depends on patches 1 and 2 of this series, also on Alexandre Marquet's
Exynos pipe-clock conversion [1], or Marek Szyprowski's equivalent [2].
Without [1] or [2], propagating errors from old Exynos power_on() step
may break AUX access.

This is an updated version of the patch suggested by "Pengpeng Hou"
<pengpeng@iscas.ac.cn> in [3]. It takes into account issues brought
up by Sashiko, specifically, an issue of possible unbalanced clock
disables. This patch was prepared using dependency [1].

[1] https://lore.kernel.org/all/20261027-drm-misc-next-manta-auxbus-v1-2-3a45c3cf531d@a-marquet.fr/
[2] https://lore.kernel.org/all/20261119223843.3694307-1-m.szyprowski@samsung.com/
[3] https://lore.kernel.org/all/20260828091334.5793-1-pengpeng@iscas.ac.cn/

 .../drm/bridge/analogix/analogix_dp_core.c    | 23 +++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 9d77c1d54a6d..3326b51aaeb5 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1538,15 +1538,30 @@ int analogix_dp_resume(struct analogix_dp_device *dp)
 		return ret;
 	}
 
-	if (dp->plat_data->power_on)
-		dp->plat_data->power_on(dp->plat_data);
+	if (dp->plat_data->power_on) {
+		ret = dp->plat_data->power_on(dp->plat_data);
+		if (ret)
+			goto err_disable_clk;
+	}
 
-	phy_set_mode(dp->phy, PHY_MODE_DP);
-	phy_power_on(dp->phy);
+	ret = phy_set_mode(dp->phy, PHY_MODE_DP);
+	if (ret)
+		goto err_power_off;
+
+	ret = phy_power_on(dp->phy);
+	if (ret)
+		goto err_power_off;
 
 	analogix_dp_init_dp(dp);
 
 	return 0;
+
+err_power_off:
+	if (dp->plat_data->power_on && dp->plat_data->power_off)
+		dp->plat_data->power_off(dp->plat_data);
+err_disable_clk:
+	clk_disable_unprepare(dp->clock);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(analogix_dp_resume);
 
-- 
2.43.0


