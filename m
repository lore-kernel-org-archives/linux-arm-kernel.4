Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADD2606A327
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RNRa27Wv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pe0tsvO7;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=LeqpW+TR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QlrE5mBL+sk/TnfM70HTegEzQ7rLoCN6a4MXTiwJpyA=; b=RNRa27Wvvu/sAQ
	HC7JfhVmlKgtzK4RytMCUH4jb85AM81UfjHhA8ed/st5T9lEYd/lCWqxBsn+6OAnHKIeAOB2RaK8E
	z7ko9yk5j/++fduNmCRf6/V/TwbiRFxeUFs5cd6+Mxy/aXzaX6WBjIemaCALAscKThCciyLhQxUHr
	1m7qHbVA5QFt13shJ6Yqj6reA8R4Z6O1VeBcocCkn+nY6pR11nzLVG07sz8Ba4VV+FqtIblPkcnQe
	NhJeOYszEOqaprdwUYfzYaA2Swiod4mAps9LW+bRtg8lOrmXV9zL74MeEv5yXirezIzJNW/G6d2rf
	CooKPwUuhRY0eAUT3OSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHCK-0000000Aqgi-3EHD;
	Wed, 25 Nov 2026 17:54:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAc-0000000Ao6J-2Uyt
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:52:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QlrE5mBL+sk/TnfM70HTegEzQ7rLoCN6a4MXTiwJpyA=; b=pe0tsvO7XLz3cc1/Mt4/bA+BUe
	9gyvemoxE89nKMOEJoJyVIQlcj3To/UDT9tkoCajSb995BJnPWP+wwZE1HC9Er3oIq0EdsQEV2ncq
	iWZxLIkIYa6Hfldz4zSqZIZ0ac8g6LvTb/qHkcEwT+puUMAvY72WPoWdHsjVdtmVcZ3SALvRq3e/6
	Ca5GsTr25hExzGESQxjDhVVYnwxhiJYvtVQTD46Bjul/ZAgRetl7eJJyCuoco5Tl7Azwuc+LdBQVu
	YsfZ7l/RUB3rUYFUoAgdYl0eKFbpzMziBdAK7agIVB/KuEcMOpBVDe+K+DUosEyWEBjkWglh7xBSt
	MJyLyvBg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAU-00000005bGO-3UY0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:52:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CA73C4E41789;
	Wed, 25 Nov 2026 17:52:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9C8A0604C0;
	Wed, 25 Nov 2026 17:52:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7100B11E6B0AE;
	Wed, 25 Nov 2026 18:52:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629145; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QlrE5mBL+sk/TnfM70HTegEzQ7rLoCN6a4MXTiwJpyA=;
	b=LeqpW+TRrMDEt/rbXtYezm3oHPBhPmsojnvsPVKifaA9dA0XqWhiHVTWVbFcOHF65jsb5W
	sqWYAZfJ6LmfdPyqF0fYL1k0s+Ieh4AQbnNnMjorwfu/gZIVLPbdk8/hM9vDx0Xgl8y9M0
	D3M1gDa8Qac82TIdVuNJcbV9MdOgIk5GC5tRYnnam/wV0xST0Ixv6iBMuyU7Gsq2H22Dz3
	LCUNEL/0pU8G8CjzeKQU0NULvpWQNAKe1Ws2BPs/SBV3U991KWjuvyNSTsV2/l1fYLuGKq
	w2FWwPD/WiAi6Zi6cRQ+G8Ik0O6MZQz29ToxPAubHSxbMbJZnc2texefqvX+Dw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:27 +0100
Subject: [PATCH v4 14/32] drm/bridge: ti-sn65dsi86: protect device
 resources on unplug
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-drm-bridge-hotplug-v4-14-822722850492@bootlin.com>
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
X-CRM114-CacheID: sfid-20261125_175233_650197_295DA8F8 
X-CRM114-Status: GOOD (  19.27  )
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

To support hot-unplug of this bridge we need to protect access to device
resources in case device removal happens concurrently to other code.

Some care is needed for the case when drm_bridge_unplug() happens before
ti_sn_bridge_atomic_post_disable(), so the latter cannot release supplier
resources taken by ti_sn_bridge_atomic_pre_enable(): runtime PM (and in
turn regulators) and refclk.

To ensure those resources are released exactly once on device removal:

 * move the code to release them to a dedicated function
 * register that function when the resources are taken in
   ti_sn_bridge_atomic_pre_enable()
 * if ti_sn_bridge_atomic_post_disable() happens before drm_bridge_unplug()
   (typical non-hot-unplug case):
   * ti_sn_bridge_atomic_post_disable() can enter the critical section
     (drm_bridge_enter() returns 0) -> it releases and executes the
     devres action
 * if ti_sn_bridge_atomic_post_disable() happens after drm_bridge_unplug()
   (typical hot-unplug case):
   * ti_sn_bridge_remove() -> drm_bridge_unplug() defuses
     ti_sn_bridge_atomic_post_disable() so it cannot execute the devres
     action
   * the devres action is executed just after ti_sn_bridge_remove()

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v4:
- protect from register access in ti_sn_bridge_detect() and
  ti_sn_bridge_edid_read() too

New patch in v3

This commit basically replicates the same change done on the ti-sn65dsi83
driver, now upstream:
https://lore.kernel.org/all/20251112-drm-bridge-atomic-vs-remove-v3-2-85db717ce094@bootlin.com/
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 74 +++++++++++++++++++++++++++++++----
 1 file changed, 67 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 48b83df9aed6..38318113a534 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -827,9 +827,15 @@ static void ti_sn_bridge_atomic_disable(struct drm_bridge *bridge,
 					struct drm_atomic_commit *state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	int idx;
+
+	if (!drm_bridge_enter(bridge, &idx))
+		return;
 
 	/* disable video stream */
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE, 0);
+
+	drm_bridge_exit(idx);
 }
 
 static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata,
@@ -1099,11 +1105,16 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 	int ret = -EINVAL;
 	int max_dp_lanes;
 	unsigned int bpp;
+	int idx;
+
+	if (!drm_bridge_enter(bridge, &idx))
+		return;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state,
 							     bridge->encoder);
 	if (!connector) {
 		dev_err_ratelimited(pdata->dev, "Could not get the connector\n");
+		drm_bridge_exit(idx);
 		return;
 	}
 
@@ -1167,6 +1178,7 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 	}
 	if (ret) {
 		DRM_DEV_ERROR(pdata->dev, "%s (%d)\n", last_err_str, ret);
+		drm_bridge_exit(idx);
 		return;
 	}
 
@@ -1176,26 +1188,57 @@ static void ti_sn_bridge_atomic_enable(struct drm_bridge *bridge,
 	/* enable video stream */
 	regmap_update_bits(pdata->regmap, SN_ENH_FRAME_REG, VSTREAM_ENABLE,
 			   VSTREAM_ENABLE);
+
+	drm_bridge_exit(idx);
+}
+
+/*
+ * Release resources taken by ti_sn_bridge_atomic_pre_enable().
+ *
+ * Invoked by ti_sn_bridge_atomic_post_disable() normally, or by devres
+ * after ti_sn_bridge_remove() in case this happens befora
+ * atomic_post_disable.
+ */
+static void ti_sn_bridge_release_resources(void *data)
+{
+	struct ti_sn65dsi86 *pdata = (struct ti_sn65dsi86 *)data;
+
+	if (!pdata->refclk)
+		ti_sn65dsi86_disable_comms(pdata);
+
+	pm_runtime_put_sync(pdata->dev);
 }
 
 static void ti_sn_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					   struct drm_atomic_commit *state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	int idx;
+
+	if (!drm_bridge_enter(bridge, &idx))
+		return;
 
 	pm_runtime_get_sync(pdata->dev);
 
 	if (!pdata->refclk)
 		ti_sn65dsi86_enable_comms(pdata, state);
 
+	devm_add_action(pdata->dev, ti_sn_bridge_release_resources, pdata);
+
 	/* td7: min 100 us after enable before DSI data */
 	usleep_range(100, 110);
+
+	drm_bridge_exit(idx);
 }
 
 static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
 					     struct drm_atomic_commit *state)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	int idx;
+
+	if (!drm_bridge_enter(bridge, &idx))
+		return;
 
 	/* semi auto link training mode OFF */
 	regmap_write(pdata->regmap, SN_ML_TX_MODE_REG, 0);
@@ -1204,17 +1247,21 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	/* disable DP PLL */
 	regmap_write(pdata->regmap, SN_PLL_ENABLE_REG, 0);
 
-	if (!pdata->refclk)
-		ti_sn65dsi86_disable_comms(pdata);
+	devm_release_action(pdata->dev, ti_sn_bridge_release_resources, pdata);
 
-	pm_runtime_put_sync(pdata->dev);
+	drm_bridge_exit(idx);
 }
 
 static enum drm_connector_status
 ti_sn_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	enum drm_connector_status status = connector_status_disconnected;
 	int val = 0;
+	int idx;
+
+	if (!drm_bridge_enter(bridge, &idx))
+		return status;
 
 	/*
 	 * Runtime reference is grabbed in ti_sn_bridge_hpd_enable()
@@ -1225,16 +1272,29 @@ ti_sn_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
 
 	regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
 
-	return val & HPD_DEBOUNCED_STATE ? connector_status_connected
-					 : connector_status_disconnected;
+	status = val & HPD_DEBOUNCED_STATE ? connector_status_connected
+					   : connector_status_disconnected;
+
+	drm_bridge_exit(idx);
+
+	return status;
 }
 
 static const struct drm_edid *ti_sn_bridge_edid_read(struct drm_bridge *bridge,
 						     struct drm_connector *connector)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+	const struct drm_edid *edid;
+	int idx;
 
-	return drm_edid_read_ddc(connector, &pdata->aux.ddc);
+	if (!drm_bridge_enter(bridge, &idx))
+		return NULL;
+
+	edid = drm_edid_read_ddc(connector, &pdata->aux.ddc);
+
+	drm_bridge_exit(idx);
+
+	return edid;
 }
 
 static void ti_sn65dsi86_debugfs_init(struct drm_bridge *bridge, struct dentry *root)
@@ -1475,7 +1535,7 @@ static void ti_sn_bridge_remove(struct auxiliary_device *adev)
 	if (!pdata)
 		return;
 
-	drm_bridge_remove(&pdata->bridge);
+	drm_bridge_unplug(&pdata->bridge);
 
 	of_node_put(pdata->host_node);
 }

-- 
2.56.1


