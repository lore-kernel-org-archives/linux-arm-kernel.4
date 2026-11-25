Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C19B606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YekWEqS7;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=m7mnpNIg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Vk9yBaH3e/MJLcjCUCx2pq93/hLPombdz1+fJV5hHq0=; b=YekWEqS7QBQX1P
	w+L8e7/y9s/e4LsA3Ex5yA+pUMGMk4uCYR9xgBXEO+LH9+A4DkPP2e2KW0UE4dkEl6m4XidDdByAC
	WMaKm+1b0YrEg6VZ2IdnR5++pC4tbaOXTbYxO2x2jp80buIPb7/YbGHEvuN3IU6G0CMrMVrxKeA7s
	kOYwVJyRe7P119cEbxlBOzhXXz81hzNl8puPfCgCZcY/cKt7d/gICPpi+Dkd5UUNnzYWTULx6DLcV
	60AVJOgSCUO/tU2eVgtP1CjaeoOWZG6kl4s77f5LJ4Jm++4c5kSDbp/YeHpgvUlTj+BD/kpRDjb96
	rvoF0r4uTxoE88bGgl6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWH9s-0000000AnL0-2n41;
	Wed, 25 Nov 2026 17:51:52 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWH9T-0000000An9g-3NKX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:51:33 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2FC41C6221E;
	Wed, 25 Nov 2026 17:51:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3903560480;
	Wed, 25 Nov 2026 17:51:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 197B211E6B0CB;
	Wed, 25 Nov 2026 18:51:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629080; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vk9yBaH3e/MJLcjCUCx2pq93/hLPombdz1+fJV5hHq0=;
	b=m7mnpNIgdzOoELi5NZ3m2K5N3t6N3pcO1EA+tHszf+1Qk8AXZ8ibI1mYxgDLSqAHI+6cpz
	tZcyqcgIDFVimFu5sq0aAD0sZuIuOh2Qy0Bslr2C7ClDuPdMFvnF0uXPBbX3aBQYvmdMvh
	Dm7Q62sjDrgergUSGGAV9UaQeMjnx2vzXlnUnu85+9koN0u5mkZw/fIEbVenGEOKGGaCCT
	jxaSMOxNmugKCbmloTkSdVT5xPq5IHqwFLJMxxvsfF9dj7nEC0zaIADMOeBr4dHiMtwjVM
	ZOjbcdytNFkYREebuUxjBcZRG7mr90lJJkD7zr3ugjgvFfR2v0ztxEryf8uuxQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:19 +0100
Subject: [PATCH v4 06/32] drm/connector: add
 drm_connector_hdmi_dynamic_init()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-drm-bridge-hotplug-v4-6-822722850492@bootlin.com>
References: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
In-Reply-To: <20261125-drm-bridge-hotplug-v4-0-822722850492@bootlin.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_095132_161658_EAB473CA 
X-CRM114-Status: GOOD (  13.24  )
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

In preparation for adding hotpluggable bridges into the
drm_bridge_connector, we need connectors to be created dynamically, both
regular connectors and HDMI ones. drm_connector_init() already has a
dynamic variant, add one for HDMI connectors too.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- fix error management dead code
- fix kerneldoc

Changes in v2:
- rebased on current drm-misc-next: now drm_connector_hdmi_init() can fail,
  so call drm_connector_cleanup(connector) if that happens
---
 drivers/gpu/drm/drm_connector.c | 43 +++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  6 ++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 20120b6a05d5..021f2e120fdc 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -704,6 +704,49 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
 
+/**
+ * drm_connector_hdmi_dynamic_init - Init a preallocated dynamic HDMI connector
+ * @dev: DRM device
+ * @connector: A pointer to the HDMI connector to init
+ * @funcs: callbacks for this connector
+ * @hdmi_funcs: HDMI-related callbacks and capabilities for this connector
+ * @connector_type: user visible type of the connector
+ * @ddc: optional pointer to the associated ddc adapter
+ *
+ * Initialises a preallocated dynamic HDMI connector. Connectors can be
+ * subclassed as part of driver connector objects.
+ *
+ * See drm_connector_dynamic_init(), the same constraints apply here. This
+ * is just the HDMI version.
+ *
+ * Returns:
+ * Zero on success, error code on failure.
+ */
+int drm_connector_hdmi_dynamic_init(struct drm_device *dev,
+				    struct drm_connector *connector,
+				    const struct drm_connector_funcs *funcs,
+				    const struct drm_connector_hdmi_funcs *hdmi_funcs,
+				    int connector_type,
+				    struct i2c_adapter *ddc)
+{
+	int ret;
+
+	ret = drm_connector_hdmi_sanity_checks(dev, connector, hdmi_funcs, connector_type);
+	if (ret)
+		return ret;
+
+	ret = drm_connector_dynamic_init(dev, connector, funcs, connector_type, ddc);
+	if (ret)
+		return ret;
+
+	ret = drm_connector_hdmi_initialize(dev, connector, hdmi_funcs);
+	if (ret)
+		drm_connector_cleanup(connector);
+
+	return ret;
+}
+EXPORT_SYMBOL(drm_connector_hdmi_dynamic_init);
+
 /**
  * drmm_connector_hdmi_ini2 - Init a preallocated HDMI connector
  * @dev: DRM device
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 07218ab26c9e..47de3b6d7218 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2743,6 +2743,12 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc);
+int drm_connector_hdmi_dynamic_init(struct drm_device *dev,
+				    struct drm_connector *connector,
+				    const struct drm_connector_funcs *funcs,
+				    const struct drm_connector_hdmi_funcs *hdmi_funcs,
+				    int connector_type,
+				    struct i2c_adapter *ddc);
 int drmm_connector_hdmi_ini2(struct drm_device *dev,
 			     struct drm_connector *connector,
 			     const char *vendor, const char *product,

-- 
2.56.1


