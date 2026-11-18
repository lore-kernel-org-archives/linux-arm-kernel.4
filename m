Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE0060A2613
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yLtfSIHM;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=UbgJILgQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kfV/vPTlNu0kow2S0xdSta9ITU6sSETmynTVNkXocck=; b=yLtfSIHM3mqciB
	fNIbwJtkdXgQ6xSXyRL2ccvq4rv6pk/hRbMFvr2IK4CXJCuUxs0TX381S5hsu72sf2MKsdcLjZtf0
	JGYyiS1lgF0rSZahYFOEvZGFcgGgbD5aSNhzq9YPJX30OKKFixu+hfh1tCK3AseA04mBT7xK7/+lI
	MfxnmUW2hotyJPdfnrEus5ZiTgz59mvH/VTYjC4TAG54R57HawguP5YKYle1by9FwJsxO2iBEM0LV
	BvRTtV9uMjZgjyOebAHGywZhH5pn1macoKO/vVjAFnj7zd5Yw9WJlsI8TnB3ET4NSEZHSB1W600sP
	Ib0r00T387b27GEgt5Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTisj-00000009aib-1jsm;
	Wed, 18 Nov 2026 16:51:37 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTisP-00000009aRP-1Zm5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:51:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B1FCA4E41635;
	Wed, 18 Nov 2026 16:51:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8242C5FE9B;
	Wed, 18 Nov 2026 16:51:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D823F11BC28AA;
	Wed, 18 Nov 2026 17:51:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020673; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kfV/vPTlNu0kow2S0xdSta9ITU6sSETmynTVNkXocck=;
	b=UbgJILgQlMlkKJPgr+qGpTeBAohC79QYDlYAhcbPOsnSgeF/3ZWJuf6Gny3me3j0o7nsrO
	GpsR0eO7NLHDg1y3oBcp5hhnI0B73FBfSdqTAS+A4btlJrhQyEFcPkJZxvuOQn2AEFL/yN
	mdQCSC2NKV2wr4kU7jZn369ji3j37Rpx094eCPwQqwdVsVeZ+zJA467+0ObpKyy4rDX6hb
	M8JLR3mWe4qJA3gVxFUkoatufAVRME7e3SKIYW7U+hKDzHvd0+F/sKnfDe/VCeolBFWy9X
	ZzPxwDU8Zdz9AY7mTlrZ6xJKGWVqQ9eyl8UULl4NQka2osauY7sQiMuEhUrstQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:53 +0100
Subject: [PATCH RFC v3 10/31] drm/display: bridge-connector: add APIs to
 add/remove the connector dynamically
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-10-44bb3b4a828f@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_085119_638351_13D330B3 
X-CRM114-Status: GOOD (  17.07  )
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

drm_bridge_connector_init() adds a drmm-allocated connector. For bridge
hotplug drmm allocations are not suitable because a connector may have to
be added and removed multiple times in the lifetime of a card.

In preparation for bridge hotplug, add APIs to add and remove a connector
using regular non-managed allocations.

For the dynamic connector, this requires the kfree() the allocated struct
drm_bridge_connector in the destroy func. However that func will be called
even when using the pre-existing drmm API, leading to a double free
(kfree() in the destroy callback + drmm).

One option to avoid this issue is introducing two mostly identical
drm_connector_funcs instances, one with .destroy and one without. But that
would be an annoying code duplication. Instead take a different approach:
always allocate using non-drmm kzalloc_obj(), so that deallocation always
happen in destroy->kfree().

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Uhm, maybe the change from drmm_kzalloc to kzalloc_obj and addition of
kfree to the destroy callback should eb a separate commit?
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 24 +++++++++++++++++++++++-
 include/drm/drm_bridge_connector.h             |  4 ++++
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 015f6750b7f5..4bd34dce44ad 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -289,6 +289,7 @@ static void drm_bridge_connector_dynconn_destroy(struct drm_connector *connector
 
 	drm_connector_cleanup(connector);
 	drm_bridge_connector_put_bridges(bridge_connector);
+	kfree(bridge_connector);
 }
 
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
@@ -1215,7 +1216,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_connector *connector;
 	int ret;
 
-	bridge_connector = drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_KERNEL);
+	bridge_connector = kzalloc_obj(*bridge_connector);
 	if (!bridge_connector)
 		return ERR_PTR(-ENOMEM);
 
@@ -1230,3 +1231,24 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	return connector;
 }
 EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
+
+struct drm_connector *drm_bridge_connector_dynamic_add(struct drm_device *drm,
+						       struct drm_encoder *encoder)
+{
+	struct drm_bridge_connector *bridge_connector;
+
+	bridge_connector = kzalloc_obj(*bridge_connector);
+	if (!bridge_connector)
+		return ERR_PTR(-ENOMEM);
+
+	return drm_bridge_connector_initialize(bridge_connector, drm, encoder);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_connector_dynamic_add);
+
+void drm_bridge_connector_dynamic_remove(struct drm_connector *connector)
+{
+	struct drm_bridge_connector *bridge_connector = to_drm_bridge_connector(connector);
+
+	drm_bridge_connector_fini(bridge_connector);
+}
+EXPORT_SYMBOL_GPL(drm_bridge_connector_dynamic_remove);
diff --git a/include/drm/drm_bridge_connector.h b/include/drm/drm_bridge_connector.h
index 69630815fb09..de6ec91dbfab 100644
--- a/include/drm/drm_bridge_connector.h
+++ b/include/drm/drm_bridge_connector.h
@@ -9,8 +9,12 @@
 struct drm_connector;
 struct drm_device;
 struct drm_encoder;
+struct drm_bridge_connector;
 
 struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 						struct drm_encoder *encoder);
+struct drm_connector *drm_bridge_connector_dynamic_add(struct drm_device *drm,
+						       struct drm_encoder *encoder);
+void drm_bridge_connector_dynamic_remove(struct drm_connector *connector);
 
 #endif /* __DRM_BRIDGE_CONNECTOR_H__ */

-- 
2.56.1


