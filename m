Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AF5606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D+5uik8a;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=RjhcnCc5;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HSx6aw5r
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YlmBw6iS9JbFIE2+xqM7lxhrvjACJuumcoOTsjtyFA0=; b=D+5uik8aEc+OH2
	a7wTqGBJnh5E0BTZ5Az1p+7olG95T9N/0SDGDjeXAVgqQf5RXmt0EnxD3RiHtiAeVJCDFS0iVP23q
	nw7TiF3WI8H4VtUMJiv+6bwfNFeuXdQtaZju/eF7N3HcDLdlnEjom87jmM+zRjNr+tVkmhKGLtuk7
	BZDFBzZiBO3rNxElXkXiCyIoxbg27osQRi9DZ3ECey+uA/Vk0BdFKSQITy9bG//ADGV/gbSf7ZOZK
	fRH0KOxK3lfp6C2TmexqmWzjRgXHjsEzNLFwEofkFWWi9RVsJ+dzx63bdVUUhnyvNx5DlEvuWo1CH
	UlG1gdQzaATxPUpIpUGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHDE-0000000Arqa-0oiM;
	Wed, 25 Nov 2026 17:55:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHC0-0000000AqOZ-3AIe
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:54:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YlmBw6iS9JbFIE2+xqM7lxhrvjACJuumcoOTsjtyFA0=; b=RjhcnCc5beFGmdYPePyUZhtXx1
	NAbFQGXRD8tmSfPS5RKjC3RWKAR62hrAS3Vsbr67k7K191x7nHte8I7irldFh+JbjOPV7HxRmd5hE
	/9CqUY0IVER35M1qjSjAjcNJ9mVdQ4TJLYcxxbfMkwe7RA4YuHe/CFmCeGLdBgZBvCAD0kf5JEL7I
	rkB/uLjK/50TcNhjXYag4vcVdvR2HWgHpyLb+XGYQN3Sj4xWmBYPj0AVU2afc8zYirbzQiue2htl7
	yeo8qUzIdw+Xd1ZnaEuAElnCQmNB8KwLTsyfZs4kjCQYRMrS9Hckoy4QWqzkVpM/DGPM88nVyd060
	U5xrpeTw==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHBx-00000005bxE-1dgR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:54:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6B2CB1A1802;
	Wed, 25 Nov 2026 17:54:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3EE4060480;
	Wed, 25 Nov 2026 17:54:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1421F11E6B0AE;
	Wed, 25 Nov 2026 18:53:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629238; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YlmBw6iS9JbFIE2+xqM7lxhrvjACJuumcoOTsjtyFA0=;
	b=HSx6aw5rsLgbxyrpUxszWGjDpPKnBfWMkPpMHkmsv4a41DPW60VrdFomQEuhdmEGbUXBJV
	DQwyoodHHfatSWG8+kl6vIVkVEOGAENp93FiIadRrlYhpZn6Mze9edRoO3SfAKL11Thq0O
	Mk8jeMI8e0EflVi/kK8YmxUeAff+lwuM45O3EI3zN16M7/tp+6ncb5MjBCiFoJ7AI28ky1
	NEgb1esskhQE/C6XSFNzuqyJfN91m3mWo71EnS1oICaTdA2IQrBffoD7je328pto9R25QY
	JG4P4LRsyGlkCouWVqj1OTtirUpbAKfHn4PEKmbkSVCK3Zhx1hxdZsy57I7ivA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:40 +0100
Subject: [PATCH v4 27/32] drm/atomic: add drm_atomic_shutdown_encoder()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-drm-bridge-hotplug-v4-27-822722850492@bootlin.com>
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
X-CRM114-CacheID: sfid-20261125_175401_466816_06747CA5 
X-CRM114-Status: GOOD (  19.48  )
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

To support bridge hotplug we need to stop the components of a card that are
affected by the removal of a bridge: the connector, the encoder and
possibly the CRTC (unless it is still in use after the removal due to
cloning).

drm_atomic_helper_shutdown() does it, but it disables the entire card,
including unrelated CRTCs for multi-CRTC cards. Moreover it is in the
drm_kms_helper module, which makes it unaccessible from the core code where
we need this.

Add drm_atomic_shutdown_encoder() to drm_atomic code, doing what we need.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

New patch in v3
---
 drivers/gpu/drm/drm_atomic.c | 145 +++++++++++++++++++++++++++++++++++++++++++
 include/drm/drm_atomic.h     |   1 +
 2 files changed, 146 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 096f85419b36..536813562f6f 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -2207,6 +2207,151 @@ int __drm_atomic_helper_set_config(struct drm_mode_set *set,
 }
 EXPORT_SYMBOL(__drm_atomic_helper_set_config);
 
+static int drm_atomic_disable_encoder(struct drm_device *drm,
+				      struct drm_encoder *encoder,
+				      struct drm_modeset_acquire_ctx *ctx)
+{
+	struct drm_connector_list_iter conn_iter;
+	struct drm_connector *connector;
+	struct drm_crtc *crtc = NULL;
+	struct drm_atomic_commit *commit;
+	struct drm_crtc_state *crtc_state;
+	bool crtc_still_used = false;
+	int ret;
+
+	drm_connector_list_iter_begin(drm, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (!connector->state ||
+		    connector->state->best_encoder != encoder ||
+		    !connector->state->crtc)
+			continue;
+
+		crtc = connector->state->crtc;
+		break;
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	if (!crtc)
+		return 0;
+
+	commit = drm_atomic_commit_alloc(drm);
+	if (!commit)
+		return -ENOMEM;
+
+	commit->acquire_ctx = ctx;
+
+	crtc_state = drm_atomic_get_crtc_state(commit, crtc);
+	if (IS_ERR(crtc_state)) {
+		ret = PTR_ERR(crtc_state);
+		goto free;
+	}
+
+	drm_connector_list_iter_begin(drm, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		struct drm_connector_state *conn_state;
+
+		if (!connector->state || connector->state->crtc != crtc)
+			continue;
+
+		if (connector->state->best_encoder != encoder) {
+			crtc_still_used = true;
+			continue;
+		}
+
+		conn_state = drm_atomic_get_connector_state(commit, connector);
+		if (IS_ERR(conn_state)) {
+			ret = PTR_ERR(conn_state);
+			drm_connector_list_iter_end(&conn_iter);
+			goto free;
+		}
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	if (crtc_still_used) {
+		struct drm_connector_state *conn_state;
+		int i;
+
+		/* Some connector still uses @crtc, keep it and its planes enabled */
+		for_each_new_connector_in_state(commit, connector, conn_state, i) {
+			ret = drm_atomic_set_crtc_for_connector(conn_state, NULL);
+			if (ret < 0)
+				goto free;
+		}
+	} else {
+		struct drm_connector_state *conn_state;
+		struct drm_plane_state *plane_state;
+		struct drm_plane *plane;
+		int i;
+
+		crtc_state->active = false;
+
+		ret = drm_atomic_set_mode_prop_for_crtc(crtc_state, NULL);
+		if (ret < 0)
+			goto free;
+
+		ret = drm_atomic_add_affected_planes(commit, crtc);
+		if (ret < 0)
+			goto free;
+
+		ret = drm_atomic_add_affected_connectors(commit, crtc);
+		if (ret < 0)
+			goto free;
+
+		for_each_new_connector_in_state(commit, connector, conn_state, i) {
+			ret = drm_atomic_set_crtc_for_connector(conn_state, NULL);
+			if (ret < 0)
+				goto free;
+		}
+
+		for_each_new_plane_in_state(commit, plane, plane_state, i) {
+			ret = drm_atomic_set_crtc_for_plane(plane_state, NULL);
+			if (ret < 0)
+				goto free;
+
+			drm_atomic_set_fb_for_plane(plane_state, NULL);
+		}
+	}
+
+	ret = drm_atomic_commit(commit);
+free:
+	drm_atomic_commit_put(commit);
+	return ret;
+}
+
+/**
+ * drm_atomic_shutdown_encoder - shutdown the pipeline behind an encoder
+ * @encoder: encoder whose pipeline should be shut down
+ *
+ * Stop the output currently driven by @encoder. Also shutdown the
+ * connected CRTC unless other connectors are still attached to it
+ * (e.g. cloning).
+ */
+void drm_atomic_shutdown_encoder(struct drm_encoder *encoder)
+{
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_device *dev;
+	int ret;
+
+	if (!encoder)
+		return;
+
+	dev = encoder->dev;
+	if (!dev)
+		return;
+
+	if (!drm_drv_uses_atomic_modeset(dev))
+		return;
+
+	DRM_MODESET_LOCK_ALL_BEGIN(dev, ctx, 0, ret);
+
+	ret = drm_atomic_disable_encoder(dev, encoder, &ctx);
+	if (ret)
+		drm_err(dev, "Disabling CRTC for encoder %s failed with %i\n", encoder->name, ret);
+
+	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
+}
+EXPORT_SYMBOL(drm_atomic_shutdown_encoder);
+
 void drm_atomic_private_obj_print_state(struct drm_printer *p,
 					const struct drm_private_state *state)
 {
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index c8d0f18fd0fd..9e7bd94922ac 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1411,5 +1411,6 @@ drm_atomic_get_old_bridge_state(const struct drm_atomic_commit *state,
 struct drm_bridge_state *
 drm_atomic_get_new_bridge_state(const struct drm_atomic_commit *state,
 				struct drm_bridge *bridge);
+void drm_atomic_shutdown_encoder(struct drm_encoder *encoder);
 
 #endif /* DRM_ATOMIC_H_ */

-- 
2.56.1


