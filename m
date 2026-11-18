Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C9960A3806
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cwLumB1d;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=W+mKfVC1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eocEYsU9h/jwR33n/5xfCsJpDlX1NehsHZ0nbPGW/CI=; b=cwLumB1dcdrj7I
	xlHbUzCq5q4RWz17DJfkhdGBrIQI4J7slNdSTx0rrh99B7FuAYBwZ65JYyPooANMmPqOGlvfTAKqJ
	DdakXLwRpXDXEUaa7dkI4RmruulZn0NYtywYIk25soS2VGyhIb4SWE3O9uWNNjtz8ymxlQ1iX2tv8
	8fJPXqLC6gXHLpMcTmUm5pjT5HDp6NHpX6qjddsxBy40RAGY8D5zH6Zs/BwrjKahWw2KRNXqjqYxW
	D05A6ZpBg2zSTv2yIcdJL/jPhz0BSohP9BLyp7sSajtOOwwyg1mTk9/ywsEpzpcgPJo88+WRsAMEt
	7iYswH2cSnT8eL4uI9oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTitO-00000009ba1-2vQv;
	Wed, 18 Nov 2026 16:52:18 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTit6-00000009bG6-3KS4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:52:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D8EA7C4F77B;
	Wed, 18 Nov 2026 16:52:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF3775FE9B;
	Wed, 18 Nov 2026 16:51:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E764511BC28D2;
	Wed, 18 Nov 2026 17:51:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020717; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eocEYsU9h/jwR33n/5xfCsJpDlX1NehsHZ0nbPGW/CI=;
	b=W+mKfVC11JBGEkMq8G9bOcxsUP1/xM0k3Bqwf99ObkK8MmefP6O6q1FNUGHnJDyGTj5Z9e
	WxRD2lrFOy17nR+Thfshj4WGouWlQ4E5RslCOj0K14ruRp42Zcib9gi9wTzqpIvdrQLV02
	tZVQeX0B1ecL3Zgg2XLXY7bGs6x4D2+jOZkeQ9997du7PXNInvogPw0WBdHAN5/8pmaZ+j
	wHR/JEhk+1TbtsxxCbHA1VQWmNMSV3Asp6bUOI/OfRTSAd75hjuStPv7BSsiGpJ5Fjtt4D
	Y9UQmZNGj2cyPMu24G9+mOBv4EycxgC1w8rcQ9TvmDjpsZfFHcTApVvt+5DRrw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:00 +0100
Subject: [PATCH RFC v3 17/31] drm/bridge: notify about added and detached
 bridges
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-17-44bb3b4a828f@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_085204_111428_81E8F6F0 
X-CRM114-Status: GOOD (  11.35  )
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

In preparation to support DRM bridge hotplug, let the drm_bridge code emit
an event when a bridge is added and when it is detached, so that this event
can trigger the actions needed to (de)configure the pipeline and
(un)register the connector as appropriate.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- also notify on added bridges (for non-DSI bridges)
- use new v3 notifier API name
---
 drivers/gpu/drm/Kconfig      | 1 +
 drivers/gpu/drm/drm_bridge.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 5268bf47b2e3..105dd46a0a45 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -17,6 +17,7 @@ menuconfig DRM
 # device and dmabuf fd. Let's make sure that is available for our userspace.
 	select KCMP
 	select VIDEO
+	select DRM_HOTPLUG_EVENT_NOTIFIER
 	help
 	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
 	  introduced in XFree86 4.0. If you say Y here, you need to select
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d54245f3c4d3..bcf65cddbd6e 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -34,6 +34,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
+#include <drm/drm_hotplug_event_notifier.h>
 #include <drm/drm_file.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
@@ -475,6 +476,8 @@ void drm_bridge_add(struct drm_bridge *bridge)
 	mutex_lock(&bridge_lock);
 	list_add_tail(&bridge->list, &bridge_list);
 	mutex_unlock(&bridge_lock);
+
+	drm_hotplug_event_notifier_notify(DRM_BRIDGE_ADDED, bridge);
 }
 EXPORT_SYMBOL(drm_bridge_add);
 
@@ -695,6 +698,9 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 		bridge->funcs->detach(bridge);
 
 	list_del_init(&bridge->chain_node);
+
+	drm_hotplug_event_notifier_notify(DRM_BRIDGE_DETACHED, bridge);
+
 	bridge->dev = NULL;
 	drm_bridge_put(bridge);
 }

-- 
2.56.1


