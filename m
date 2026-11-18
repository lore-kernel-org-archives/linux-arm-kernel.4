Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAF360A3828
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rR5RtBQ9;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xB+1Urz7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PawFOJzGO+j7Rk1FiSoFYRQzAZVs1Yl5DoDfqYSRNT4=; b=rR5RtBQ93T6skA
	+qkIXUBO1zVWisuIYo8z/VNnDupBzIxm6qRSJubkpvZNKzYsZQiHsNERdk7JD3WLnfHxd3UaBxRku
	mSDZmc0pa7RYq2JfJfXvTasKxF+EvRaeoP5svO1EdNitGmM8tj6y3FOVm05z1KqvjzwM2jV1bSTqx
	P6DPNwfWCs61CAqE1/1l6cgUTwyH4/r5kfFmYorfNow/vXlcfDSTQ7ZRmQiUWuTwOkiM2NaXN7pVN
	vgJGvfRwP/3XpsSB2JUX9aaGG3GfuaKyo2MqLD+gf249wJD4RGy0M/sAYIt4zMSA+h+R3N5TLVO6G
	Xy2Tf9F0J7iCORpfX6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTitb-00000009bnm-3uw6;
	Wed, 18 Nov 2026 16:52:31 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTitC-00000009bLh-1sxL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:52:14 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id ED86D1A16E2;
	Wed, 18 Nov 2026 16:52:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BAF155FE9B;
	Wed, 18 Nov 2026 16:52:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8987511BC27F3;
	Wed, 18 Nov 2026 17:51:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020722; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PawFOJzGO+j7Rk1FiSoFYRQzAZVs1Yl5DoDfqYSRNT4=;
	b=xB+1Urz72QZ3bKmVFogNO/YK6rZUtdkdPXSmy/r5gjqtP7ckfdkJObtVqSZfEd8kONlLqD
	BVjWS5C8IKHSjg2wVNjZT9lnqWRCaZOWl9Bxq+/uMBb72Ve1FL+KtONzoOGEplGzc8R3rl
	aPzT0OPXQ/BBZELKURsK11UBdR6Nrotxs0Di1RBzyD/lg5ZIrLF1Cg632+ZrFq8YhU+zV9
	bmpNFnBcm0lafIHLTY+o1gXOwis+r84Y9HTxpYb+on0wfHVpxX/uOlfvpX6LxFTHlymKLN
	1M1owoM608rZPxzOaI24GXcH4SybwatpZquBqNfm/OoCfv5bTtlSeerfwq2gYQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:01 +0100
Subject: [PATCH RFC v3 18/31] drm/mipi-dsi: notify about DSI attach
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-18-44bb3b4a828f@bootlin.com>
References: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
In-Reply-To: <20261118-drm-bridge-hotplug-v3-0-44bb3b4a828f@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_085206_667724_59F14E34 
X-CRM114-Status: GOOD (  11.57  )
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

In preparation to support DRM bridge hotplug, let the drm_mipi_dsi code
emit an event when a DSI device is attached to the corresponding DSI host,
so that this event can trigger the actions needed to configure the pipeline
and register the connector as appropriate.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- use new v3 notifier API name
- fix commit message
---
 drivers/gpu/drm/Kconfig        | 1 +
 drivers/gpu/drm/drm_mipi_dsi.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 105dd46a0a45..3ebd9388bdda 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -45,6 +45,7 @@ config DRM_MIPI_DBI
 config DRM_MIPI_DSI
 	bool
 	depends on DRM
+	select DRM_HOTPLUG_EVENT_NOTIFIER
 
 config DRM_KMS_HELPER
 	tristate
diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 3ac1dd5ad640..ae49f3aa1b2b 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -34,6 +34,7 @@
 #include <linux/slab.h>
 
 #include <drm/display/drm_dsc.h>
+#include <drm/drm_hotplug_event_notifier.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_print.h>
 
@@ -386,6 +387,8 @@ int mipi_dsi_attach(struct mipi_dsi_device *dsi)
 
 	dsi->attached = true;
 
+	drm_hotplug_event_notifier_notify(DRM_MIPI_DSI_ATTACHED, dsi);
+
 	return 0;
 }
 EXPORT_SYMBOL(mipi_dsi_attach);

-- 
2.56.1


