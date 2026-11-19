Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D11606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 11:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X621U6Hx;
	dkim=pass (1024-bit key) header.d=swemel.ru header.i=@swemel.ru header.a=rsa-sha256 header.s=mail header.b=WdApNlaR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=YLq833Da6iVYeGdT+KadJJm72vxSoeHnYAbiFsDpxsQ=; b=X621U6HxytEZWS9m8v34u6dmr4
	IBQ5yPO6htywyKVOBZJcM2hmYao1mOB5BNCVZmW6V5Oqp42r0wxtXt5qEO1AYWiruEQsgNOWTUzrO
	ybSNZ4mKahrYRifmYPtty/pjJPXvbJ6sINitn3hCJiJFdeTmSrE67Skq+4T/z2dresfr4wROMjzg9
	/81MrjeWfJSfKQQ/205qSx8HW97G19G4IWS3OhUUfHAM41zZbFbhkxQXh79cu+9E9XUdTFPd0w7iz
	3wjTqB8N5NpL8TnaTCfWCMze1nUq52qQyv0Kp4eDAeWtdv9/i4koXmOs3K8BjCrIAQ5tLAt/vyh8O
	wfhyfnuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0Lk-0000000BhkH-3quk;
	Thu, 19 Nov 2026 11:30:44 +0000
Received: from mx.swemel.ru ([95.143.211.150])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0Lf-0000000BhjS-3ch0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 11:30:43 +0000
From: Denis Arefev <arefev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
	t=1795087831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YLq833Da6iVYeGdT+KadJJm72vxSoeHnYAbiFsDpxsQ=;
	b=WdApNlaReVWiFHY24zJ4gDKi+BvJ5U13eP9wS2Du8AQcs3H+OddwFwSO2ekqbiQy/Ou4et
	ikzVVHXbdXOsBpTAv2AM3zczklWZTEgROPYgxJOmfPW1fJbItOakXQrGaaNSOZEL/fCCxs
	8/XDogI/TrR4ycseRX0I6sHyW+g8EMU=
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH] drm: imx-dcss: Check return value of drm_mode_config_helper_suspend()
Date: Thu, 19 Nov 2026 14:30:29 +0300
Message-ID: <20261119113031.36945-1-arefev@swemel.ru>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_033040_419045_66DA3410 
X-CRM114-Status: GOOD (  11.82  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

dcss_dev_suspend() ignores the return value of 
drm_mode_config_helper_suspend(). On failure that helper rolls back its
partial work (re-enables fbdev and polling) and leaves
mode_config.suspend_state unset, i.e. the DRM side is not suspended.
Continuing to suspend the context loader and disable the clocks then
leaves the device in an inconsistent state.

Check the return value and propagate the error to the PM core, as the
other DRM drivers calling this helper do.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 9021c317b770 ("drm/imx: Add initial support for DCSS on iMX8MQ")
Cc: stable@vger.kernel.org
Signed-off-by: Denis Arefev <arefev@swemel.ru>
---
 drivers/gpu/drm/imx/dcss/dcss-dev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
index 45a91e43bab1..0b12ce2498f0 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
@@ -253,7 +253,9 @@ static int dcss_dev_suspend(struct device *dev)
 	struct drm_device *ddev = dcss_drv_dev_to_drm(dev);
 	int ret;
 
-	drm_mode_config_helper_suspend(ddev);
+	ret = drm_mode_config_helper_suspend(ddev);
+	if (ret)
+		return ret;
 
 	if (pm_runtime_suspended(dev))
 		return 0;
-- 
2.43.0


