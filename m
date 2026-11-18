Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D15D60A2630
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lJE2cl9w;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=rPQJseuB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DomKAZah0eNhI098eAShLZdloqTw6X9onjOwyu3TQpk=; b=lJE2cl9w2UTIzH
	zVeQ/7TB61HoSkTP/rLAVXXUvN3z0DD6nkkugrrXmQiTxGplA8XAUIUnLlVejDsBK8Yk7b6/O7xJS
	sTo+b/5orI/0t7g+bB1Xi5I4FaFBy6AKaf+GO3whtvHLR2aFoNMo1tzcoOCj4oFTeSY9J05LwuPNR
	bNEj10EyBPQMcI2VFSvNQKpaF61pBqE3VDKEy2qiU4mcFYUdrGtmzfzudNYthEnBL4mEitz7XXgIY
	lcFVM/CshJXlWUUwgQOvEtrQ16BIeMGSgJ+noE5ulsZJYpPKu5hhlHpxtHD4sVqS+1WVtWjY2Gaco
	AMFC5S7ONWRoNEPwiD5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTisF-00000009aJ9-3yaH;
	Wed, 18 Nov 2026 16:51:07 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTirs-00000009a0k-006k
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:50:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C2BBC4E40546;
	Wed, 18 Nov 2026 16:50:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 92E335FE9B;
	Wed, 18 Nov 2026 16:50:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E3CFC11BC28A6;
	Wed, 18 Nov 2026 17:50:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020639; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DomKAZah0eNhI098eAShLZdloqTw6X9onjOwyu3TQpk=;
	b=rPQJseuBimuYbMsVFZwYBpdH25+EgCGQGdbZxfauCn8QqexKNJ4b95ZoPwFi6VdZhyyOA/
	w9kiPsqIF3YVxzHDJWK1TmPFh+YOBqUiIgRTBFVXB/wSVzSqJcQo9mfta3VW8dhQ+0k3iy
	UNtHDoCdHGJRqMXKsRIvqgWL0BxOv9AeIAWI+wrjVdMcqnFtLRBNLwcYV02uZKvTbrJM1o
	beZ92+EGGuD4Gt962LY93ZbqaVWtaYutH80ah5/AyzwDDkv8tgDgxBGlcDjU3IyYU2/zqd
	cW1fw+Xm/swFj3+/DwMC7vbwxuVdidFf48qkM+jPzgJCfvKH1P7cLzkrTnvb3w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:49:48 +0100
Subject: [PATCH RFC v3 05/31] drm/connector: split
 drmm_connector_hdmi_init() in 3 parts
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-5-44bb3b4a828f@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_085044_332899_E884D277 
X-CRM114-Status: GOOD (  20.15  )
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

In preparation for adding hotpluggable bridges we need connectors to be
created dynamically, both regular connectors and HDMI ones.

For non-HDMI connectors drm_connector_init() already has a dynamic
variant, but there is none for HDMI. Creating one would be easy by creating
a mostly-identical copy of drmm_connector_hdmi_init(), but it is a long
function so there would be a lot of duplicated code.

drmm_connector_hdmi_init() currently has 3 sections:

 1. sanity checks
 2. call drmm_connector_init()
 3. initialize HDMI-specific fields not initialized at step 2

For the dynamic variant, sectons 1 and 3 would be an exact copy, while
section 2 needs to be different.

To avoid code duplication, split parts 1 and 3 to subfunctions. The next
commit will introduce the dynamic variant.

No functional changes. Just moving code around.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v2:
- expanded commit message to clarify rationale
- rebased on current drm-misc-next, which required a full rewrite after
  the signature of drmm_connector_hdmi_init() changed in commit
  400c9ede1ea4 ("drm/connector: Add drmm_connector_hdmi_init() with new
  signature")
- renamed drm_connector_hdmi_init() to drm_connector_hdmi_initialize() as
  or it would look like an HDMI version of drm_connector_init()
---
 drivers/gpu/drm/drm_connector.c | 88 +++++++++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index d66188521881..877c12b75090 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -542,37 +542,11 @@ int drmm_connector_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drmm_connector_init);
 
-/**
- * drmm_connector_hdmi_init - Init a preallocated HDMI connector
- * @dev: DRM device
- * @connector: A pointer to the HDMI connector to init
- * @funcs: callbacks for this connector
- * @hdmi_funcs: HDMI-related callbacks and capabilities for this connector
- * @connector_type: user visible type of the connector
- * @ddc: optional pointer to the associated ddc adapter
- *
- * Initialises a preallocated HDMI connector. Connectors can be
- * subclassed as part of driver connector objects.
- *
- * Cleanup is automatically handled with a call to
- * drm_connector_cleanup() in a DRM-managed action.
- *
- * The connector structure should be allocated with drmm_kzalloc().
- *
- * The @drm_connector_funcs.destroy hook must be NULL.
- *
- * Returns:
- * Zero on success, error code on failure.
- */
-int drmm_connector_hdmi_init(struct drm_device *dev,
-			     struct drm_connector *connector,
-			     const struct drm_connector_funcs *funcs,
-			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
-			     int connector_type,
-			     struct i2c_adapter *ddc)
+static int drm_connector_hdmi_sanity_checks(struct drm_device *dev,
+					    struct drm_connector *connector,
+					    const struct drm_connector_hdmi_funcs *hdmi_funcs,
+					    int connector_type)
 {
-	int ret;
-
 	if (!hdmi_funcs)
 		return -EINVAL;
 
@@ -613,9 +587,15 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
 		return -EINVAL;
 
-	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
-	if (ret)
-		return ret;
+	return 0;
+}
+
+/* Initialize HDMI-specific resources of a connector */
+static int drm_connector_hdmi_initialize(struct drm_device *dev,
+					 struct drm_connector *connector,
+					 const struct drm_connector_hdmi_funcs *hdmi_funcs)
+{
+	int ret;
 
 	/* TODO: remove after conversion to new drmm_connector_hdmi_init() */
 	connector->hdmi.supported_formats = hdmi_funcs->supported_formats;
@@ -680,6 +660,48 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 
 	return 0;
 }
+
+/**
+ * drmm_connector_hdmi_init - Init a preallocated HDMI connector
+ * @dev: DRM device
+ * @connector: A pointer to the HDMI connector to init
+ * @funcs: callbacks for this connector
+ * @hdmi_funcs: HDMI-related callbacks and capabilities for this connector
+ * @connector_type: user visible type of the connector
+ * @ddc: optional pointer to the associated ddc adapter
+ *
+ * Initialises a preallocated HDMI connector. Connectors can be
+ * subclassed as part of driver connector objects.
+ *
+ * Cleanup is automatically handled with a call to
+ * drm_connector_cleanup() in a DRM-managed action.
+ *
+ * The connector structure should be allocated with drmm_kzalloc().
+ *
+ * The @drm_connector_funcs.destroy hook must be NULL.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drmm_connector_hdmi_init(struct drm_device *dev,
+			     struct drm_connector *connector,
+			     const struct drm_connector_funcs *funcs,
+			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
+			     int connector_type,
+			     struct i2c_adapter *ddc)
+{
+	int ret;
+
+	ret = drm_connector_hdmi_sanity_checks(dev, connector, hdmi_funcs, connector_type);
+	if (ret)
+		return ret;
+
+	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
+	if (ret)
+		return ret;
+
+	return drm_connector_hdmi_initialize(dev, connector, hdmi_funcs);
+}
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
 
 /**

-- 
2.56.1


