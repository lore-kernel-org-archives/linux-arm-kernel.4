Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B0660A2605
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ne3/kHdj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=MY2/U7jg;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VANaU7qz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=VqaXeB0uMmevpA1DBkwlWl8Zdc+Q/NLjUm3MHxfbmWA=; b=ne3/kHdj/AB+8v
	IJJiQzKwVoYd6CDRqBwyUvElxPyqcztC3L5gCb0lkIff1joPXJpar+wEYnTfoaniSPSsFZ8KSXkiW
	SjUbrOPdre+daD8Xwesd4PstTzH0ADBVe8yEQrUD43GbPQattyYg+1VbXZAQEmzqx8BzI0L5gK2tM
	aaP1WkxPvCO/+Pbq/paTM+/rdcA9hIGZ8I+sBzT4c94N6qvdFed6iMpbuq68ddrG88L7E2LNM1dj0
	sgaS9sB+8gCkZJ/ae22LdKB6tWdEOeEhDvu4MusE4VwrXGZUeYib5MprdoNvWTeaiikZvymn62Fgr
	BpS58q3ZPhdGjFflOPdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiva-00000009d8j-29mN;
	Wed, 18 Nov 2026 16:54:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiuc-00000009cXT-2aGX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 16:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VqaXeB0uMmevpA1DBkwlWl8Zdc+Q/NLjUm3MHxfbmWA=; b=MY2/U7jgCkdfRNGQi6IxTS85ju
	gMrbe1HJwWpqbHOtlmOhr++t/hUQmT4R4+8xUVZGgRczGs8n3CJxhg48wpQ7KBFft4qBGNRKw29ec
	YLN1JfHVf8Mw2jLJWHQTdhfhNwPZdH15/M1cgO9JmGsLOBDk62KBcoq/Q/j38tLijk1DoGZbGudXk
	IsLrXiqLQoWRkciiO3NfPJLnLkaZLmPyryfp4BL9WWPXPqiJlga4zohK9T6AYrbyRm1FWE4Op6+t+
	Zy8pv/vpQKPEyU7SADbQL3/tgEFeclxecgI6QsuoY3WmfcS1fP1KDiBp2OTbZshTs1dYMRQRyoC9r
	27LrP56Q==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiuZ-0000000GIs4-1ATI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:53:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6F0124E40546;
	Wed, 18 Nov 2026 16:53:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DF8B5FE9B;
	Wed, 18 Nov 2026 16:53:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DB3011BC2904;
	Wed, 18 Nov 2026 17:53:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020808; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VqaXeB0uMmevpA1DBkwlWl8Zdc+Q/NLjUm3MHxfbmWA=;
	b=VANaU7qzFLNn9jCCAM4AUeqfHTFbIC0X8Rxr4mIGW8NgVhivkoBEwv2X6tDBhl4RePaRnH
	0rRdIKVBGH9nre5316eDL8VBW2vQADdBPszUbrrz1eCoD2/39ybx/utxJH4otL5Qf+6DXp
	voVfQEqZ+SLE/hAmX1kHJzeX7Sdr3G8MvtZ8HNrk/fzCf4QnqtEgcDtlsD3ZclV2TiCT/A
	1vCIuiKj/u1atUAEslTjoYo6sy+D1buXq/j+n+kc+6aFbiIladk7jHHlk1IioJHcFKwAcd
	rzM6KInCM4ce+dML/E4aQCZ3pnM/RNZAeqoyjmorV9aDKN+c0RA4SXsv5TLXnA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:14 +0100
Subject: [PATCH RFC v3 31/31] drm/mxsfb/lcdif: enable bridge hotplug
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-31-44bb3b4a828f@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_165331_298383_9A8048F7 
X-CRM114-Status: GOOD (  17.27  )
X-Spam-Score: -0.2 (/)
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

Switch to the new drm_hotplug_helper() to handle bridge hotplugging.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- Adapt to the v3 version of the drm_hotplug_helper, which also handles HPD

Changes in v2:
- Use the hotplug helper callback to enable HPD on the hotplugged connector
---
 drivers/gpu/drm/mxsfb/Kconfig     |  2 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c | 40 +++++++++++++++++++--------------------
 2 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
index 31db7a824a93..ada9a9334ea4 100644
--- a/drivers/gpu/drm/mxsfb/Kconfig
+++ b/drivers/gpu/drm/mxsfb/Kconfig
@@ -34,7 +34,7 @@ config DRM_IMX_LCDIF
 	select DRM_PANEL
 	select DRM_PANEL_BRIDGE
 	select DRM_DISPLAY_HELPER
-	select DRM_BRIDGE_CONNECTOR
+	select DRM_HOTPLUG_HELPER
 	help
 	  Choose this option if you have an LCDIFv3 LCD controller.
 	  Those devices are found in various i.MX SoC (i.MX8MP,
diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c b/drivers/gpu/drm/mxsfb/lcdif_drv.c
index b7be7e17d1d0..56b15dbcfd2a 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
@@ -18,7 +18,7 @@
 #include <drm/clients/drm_client_setup.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_bridge_connector.h>
+#include <drm/drm_hotplug_helper.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fbdev_dma.h>
@@ -47,6 +47,19 @@ static const struct drm_encoder_funcs lcdif_encoder_funcs = {
 	.destroy = drm_encoder_cleanup,
 };
 
+static void lcdif_hotplug_event(enum drm_hotplug_helper_event event,
+				struct drm_connector *connector)
+{
+	switch (event) {
+	case DRM_HOTPLUG_HELPER_CONNECTOR_ADDED:
+		drm_kms_helper_poll_init(connector->dev);
+		break;
+	case DRM_HOTPLUG_HELPER_CONNECTOR_REMOVING:
+		drm_kms_helper_poll_fini(connector->dev);
+		break;
+	}
+}
+
 static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 {
 	struct device *dev = lcdif->drm->dev;
@@ -56,9 +69,8 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 		struct device_node *remote __free(device_node) =
 			of_graph_get_remote_port_parent(ep);
 		struct of_endpoint of_ep;
-		struct drm_bridge *bridge;
 		struct drm_encoder *encoder;
-		struct drm_connector *connector;
+		struct drm_hotplug_helper *hotplug_helper;
 		int ret;
 
 		if (!of_device_is_available(remote))
@@ -68,12 +80,6 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 		if (ret < 0)
 			return dev_err_probe(dev, ret, "Failed to parse endpoint %pOF\n", ep);
 
-		bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, of_ep.id);
-		if (IS_ERR(bridge))
-			return dev_err_probe(dev, PTR_ERR(bridge),
-					     "Failed to get bridge for endpoint%u\n",
-					     of_ep.id);
-
 		encoder = devm_kzalloc_obj(dev, *encoder);
 		if (!encoder)
 			return dev_err_probe(dev, -ENOMEM,
@@ -88,16 +94,10 @@ static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
 					     "Failed to initialize encoder for endpoint%u\n",
 					     of_ep.id);
 
-		ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-		if (ret)
-			return dev_err_probe(dev, ret,
-					     "Failed to attach bridge for endpoint%u\n",
-					     of_ep.id);
-
-		connector = drm_bridge_connector_init(lcdif->drm, encoder);
-		if (IS_ERR(connector))
-			return dev_err_probe(dev, PTR_ERR(connector),
-					     "Failed to init bridge_connector for endpoint%u\n",
+		hotplug_helper = drmm_hotplug_helper_init(encoder, lcdif_hotplug_event, ep);
+		if (IS_ERR(hotplug_helper))
+			return dev_err_probe(dev, PTR_ERR(hotplug_helper),
+					     "Failed to init hotplug_helper for endpoint%u\n",
 					     of_ep.id);
 	}
 
@@ -211,8 +211,6 @@ static int lcdif_load(struct drm_device *drm)
 		return ret;
 	}
 
-	drm_kms_helper_poll_init(drm);
-
 	drm_helper_hpd_irq_event(drm);
 
 	pm_runtime_enable(drm->dev);

-- 
2.56.1


