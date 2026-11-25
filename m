Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873CC60A3826
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 15:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uNO9VwDm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=17njXQ7Tet8iwZqoG19brC1XCP2klxjEKEJ+60r15+c=; b=uNO9VwDmi3sNyhMziQiEfFDKxk
	wli8fovYiSyif6S91E6ue+hlzUNQXQTO6kOyIPLmqeOnnGQBQoc+Ju6aO9zycn2VhjYiN4SlLoEoJ
	FvijQvLYHGJMz/3i3HsqD1gV8mJ6MPA5/TXF0CqU1ueIU3tI4e3IRciLzkFJDmw+E8578pILdEZNG
	HedbMwoA6T6V9FRxXqjyRvZ1x+CMsEmr01Vc1/iAKJMFtw5jJtmNsuOWGIkwBWnL9UcvTmqG7buQG
	Fji6gXbN7sG/tK2zQS2zXbblaErpnMgD0v1xFBWYH33Ne49TOC4H41cMAraj+OHwm84MEglPqFLUq
	lDhWqHNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF7K-0000000AP1A-20U4;
	Wed, 25 Nov 2026 15:41:06 +0000
Received: from exchange.fintech.ru ([195.54.195.159])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWF6c-0000000AOQZ-05My;
	Wed, 25 Nov 2026 15:40:25 +0000
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.159) with Microsoft SMTP Server (TLS) id 14.3.498.0; Wed, 25 Nov
 2026 18:40:14 +0300
Received: from localhost (10.0.253.153) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Wed, 25 Nov
 2026 18:40:14 +0300
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
Subject: [PATCH v2 2/3] drm/rockchip: analogix_dp: Disable pclk if setting eDP mode fails
Date: Wed, 25 Nov 2026 18:39:46 +0300
Message-ID: <20261125153958.1349811-3-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125153958.1349811-1-n.zhandarovich@fintech.ru>
References: <20261125153958.1349811-1-n.zhandarovich@fintech.ru>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_074022_064397_0B904293 
X-CRM114-Status: GOOD (  11.40  )
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

The eDP-mode register write via rockchip_grf_field_write() call can
fail after pclk has been enabled. To prevent this, disable pclk before
returning that error so the platform power_on callback, in turn,
releases the clock reference it acquired on failure.

Fixes: 729f8eefdcad ("drm/rockchip: analogix_dp: Add support for RK3588")
Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
---
v1 -> v2: Use goto label to avoid repeating calls to
clk_disable_unprepare() per Damon Ding's <damon.ding@rock-chips.com>
suggestion. 

 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 3a80600eece1..8b24918cea64 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -140,14 +140,19 @@ static int rockchip_dp_poweron(struct analogix_dp_plat_data *plat_data)
 	ret = rockchip_dp_pre_init(dp);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dp->dev, "failed to dp pre init %d\n", ret);
-		clk_disable_unprepare(dp->pclk);
-		return ret;
+		goto err_disable_pclk;
 	}
 
 	ret = rockchip_grf_field_write(dp->grf, &dp->data->edp_mode, 1);
-	if (ret != 0)
+	if (ret != 0) {
 		DRM_DEV_ERROR(dp->dev, "failed to set edp mode %d\n", ret);
+		goto err_disable_pclk;
+	}
 
+	return 0;
+
+err_disable_pclk:
+	clk_disable_unprepare(dp->pclk);
 	return ret;
 }
 
-- 
2.43.0


