Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328E860A5BD4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=35crzF6i;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lKvP6lwP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2HLVIjfVNg5rhW25oP8mGOOhTAy3zo5GlIBaKlN+WIU=; b=35crzF6ihI59Tm
	FvZ0lnr3FVcsRvvWFXGr40oqfhh2NIT1aDG1is8X/qrMqEY+2xR++W6VJoh0IPBHbP4i2pmTQ9QVb
	tIOL0q1trwxGRJeDiBiTkYFWZvMoX19+TQGtqicdksvjCfSnwoTeIEVGuSvbm7wtIzhMGTQcUOlGm
	lo9Dl1Vuy/TCr+KdpWXfr3tr7280QGzaLzFijY+Qkml7Ogu7beAEjGPHqACqTyBc75OpXGfupLuAR
	UdlgAy5n7UTq3LfX8Ap+VvcCRH+qzYngsQav5E+O4HqzaldKbYk/BzKMsHD1mUWsg0u8R2R72DF+u
	Dok33/ctuL7+Erqm0SEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTitc-00000009bnt-0Lw3;
	Wed, 18 Nov 2026 16:52:32 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTitI-00000009bRt-19o0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:52:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B71A34E40546;
	Wed, 18 Nov 2026 16:52:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 865E95FE9B;
	Wed, 18 Nov 2026 16:52:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 533F511BC28EF;
	Wed, 18 Nov 2026 17:52:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020728; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2HLVIjfVNg5rhW25oP8mGOOhTAy3zo5GlIBaKlN+WIU=;
	b=lKvP6lwPWFqTADj5kmqaNtDYJSgXfC73X0pWwQvh2hnAUK35Xf3O061QdsIQyrux7G5bsK
	Mk7Pcj1nb896DaX/1gkQ1+Q0myWX1LW+64Jzl29sFKyFkFhJbWmT1bvPUkrf9pzJ9DLDC/
	ibM9qSCHrrtbBwoldrWulLPMqvfLFW68kHMbMvtY1gkz3t5FgiXVwzWl79rZctTj4Eh6y6
	SwJRCdtwkcpg6Ie7Tahx9vnKBD8XYiIIYbOYiuXNaB6HQSNiaxQLFXE1bzYO5BI/yq61/u
	tof3Z3ee7yPvRfd6vQBVBHAf1tcb5YKkZBYsG2+reCaFAuGyrSrlTyKuJAulVQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:02 +0100
Subject: [PATCH RFC v3 19/31] drm/bridge: add drm_bridge_get_next() and
 supporting func
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-19-44bb3b4a828f@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_085212_688780_9F987BCB 
X-CRM114-Status: GOOD (  20.06  )
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

For bridge hotplug we need to successfully probe a card with an incomplete
bridge chain, i.e. a chain whose last bridge currently in bridge_chain
needs another bridge at its output. Such a card would have no connector,
and be able to add one as soon as the following bridges are added up to the
bridge that requires no further ones (like a panel or a connector_bridge).

So we need a way to know whether the pipeline is complete in the hardware
(all bridges probed), in order to complete it in software (attach all
bridges not yet attached). Currently common DRM code has no way to know
that.

Add drm_bridge_get_next() and a supporting get_next_bridge func so each
bridge can expose its next bridge, and whether there's supposed to be one.

A subsequent commit will use this function to detect whether the pipeline
is complete in the hardware or not.

Link: https://lore.kernel.org/r/20260624-vagabond-neon-gorilla-cd6487@houat
Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- fix and improve kerneldoc

New patch in v2, replacing the is_tail patch in v1
---
 drivers/gpu/drm/drm_bridge.c | 30 ++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     | 25 +++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index bcf65cddbd6e..e0a1e016b37c 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -705,6 +705,36 @@ void drm_bridge_detach(struct drm_bridge *bridge)
 	drm_bridge_put(bridge);
 }
 
+/**
+ * drm_bridge_get_next - return the bridge at this bridge's output port
+ * @bridge: the bridge to query
+ *
+ * Return the next bridge, i.e. the bridge that is connected at the output
+ * port of @bridge. Unlike drm_bridge_get_next_bridge(), the next bridge
+ * might or not be in the encoder chain.
+ *
+ * Returns:
+ * * Pointer to a bridge connected to the output port of this bridge,
+ *   with refcount incremented; call drm_bridge_put() when done
+ * * ERR_PTR(-ENODEV): this bridge has an output port where a next bridge
+ *                     needs to be present for video output, but the next
+ *                     bridge is not currently available
+ * * NULL: this bridge does not have an output port where a next bridge
+ *         is expected
+ * * ERR_PTR(-ENOENT): the bridge does not implement the func
+ * * Another negative error returned by the bridge func
+ */
+struct drm_bridge *drm_bridge_get_next(struct drm_bridge *bridge)
+{
+	if (!(bridge->ops & DRM_BRIDGE_OP_GET_NEXT_BRIDGE)) {
+		drm_warn_once(bridge->dev, "get_next_bridge func not implemented!");
+		return ERR_PTR(-ENOENT);
+	}
+
+	return bridge->funcs->get_next_bridge(bridge);
+}
+EXPORT_SYMBOL(drm_bridge_get_next);
+
 /**
  * DOC: bridge operations
  *
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index c88532998aae..32962224a6e7 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -62,6 +62,25 @@ enum drm_bridge_attach_flags {
  * struct drm_bridge_funcs - drm_bridge control functions
  */
 struct drm_bridge_funcs {
+	/**
+	 * @get_next_bridge:
+	 *
+	 * Return a pointer to the bridge connected at the output port of
+	 * this bridge.
+	 *
+	 * Returns:
+	 * * Pointer to a bridge connected to the output port of this bridge,
+	 *   with refcount incremented; call drm_bridge_put() when done
+	 * * ERR_PTR(-ENODEV): this bridge has an output port where a next
+	 *                     bridge needs to be present for video output,
+	 *                     but the next bridge is not currently
+	 *                     available
+	 * * NULL: this bridge does not have an output port where a next
+	 *         bridge is expected (e.g. a panel)
+	 * * Another negative error returned by the bridge func
+	 */
+	struct drm_bridge *(*get_next_bridge)(struct drm_bridge *bridge);
+
 	/**
 	 * @attach:
 	 *
@@ -1021,6 +1040,11 @@ enum drm_bridge_ops {
 	 * &drm_bridge_funcs->hdmi_clear_spd_infoframe callbacks.
 	 */
 	DRM_BRIDGE_OP_HDMI_SPD_INFOFRAME = BIT(10),
+	/**
+	 * @DRM_BRIDGE_OP_GET_NEXT_BRIDGE: The bridge implements the
+	 * &drm_bridge_funcs->get_next_bridge callback.
+	 */
+	DRM_BRIDGE_OP_GET_NEXT_BRIDGE = BIT(11),
 };
 
 /**
@@ -1270,6 +1294,7 @@ void drm_bridge_remove(struct drm_bridge *bridge);
 int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      struct drm_bridge *previous,
 		      enum drm_bridge_attach_flags flags);
+struct drm_bridge *drm_bridge_get_next(struct drm_bridge *bridge);
 
 #ifdef CONFIG_OF
 struct drm_bridge *of_drm_find_and_get_bridge(const struct device_node *np);

-- 
2.56.1


