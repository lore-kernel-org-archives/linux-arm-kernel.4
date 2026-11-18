Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EB2606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LdC98V5o;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=KaBaaGrB;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Pg2rL2aQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/HnlVAW6G7yyYKcY/kk5wSZriSWdbWjxLxb+Nwookac=; b=LdC98V5op2Xsx2
	m/H60czS3TIKvo3lUiZFNf38D2MTPCHdSWl7RcpkqhhCDAlswqcrBejAZbpBZkerIC61m7NSF98h2
	k9BmlDsWUJW/vchvVa+X5JwQYXyWJPsa5ZBTR/UedX6l7zRUVFpILtzhsqvI66RcAOsZY14ewD14n
	K3XQHrWhB1nHnvgrTWgsCe2ZdyjqPpLfilzvP9FjdRM2SOu3aA2ncZFcgRaaPPv4NysxN6QZLrvp6
	e6FL9F+jRDkwTmOZnNbvVvfcGz1vcJShTeh8WByVCsXnAcRmyDm5Xhn6icOx9Ca3VIy2m3qZwLrGK
	pKHJ180UDJ968MhXESSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiur-00000009cef-2mek;
	Wed, 18 Nov 2026 16:53:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiu2-00000009cFQ-3R3d
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 16:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/HnlVAW6G7yyYKcY/kk5wSZriSWdbWjxLxb+Nwookac=; b=KaBaaGrBX0lHg1rLJWJhXdtgHS
	30o74Ssrag3uZY410RZfpgp3KOQT/NyNfh6daw4AT/wQDSBpUIG7JPF7kwZtvkeEeNwK94tYiCfkM
	JKph6aJnBTO7wK+n4mvHewVAl6fH3WVZmW3sQTzhBgOieG4bd44WyW9yhGrjQYTktmPpJM5dkgCQy
	Jm6vv8xOJt4lX1LJV0QvXTZ3JpKRn+ek0T+RakykOY8DOZDvqTFEC8tbdgihewNzgXN/vqOD8zUGE
	SHot/UojHyfXlKxYXtcjEJ36f/41nffgczoNG53m+IAzum2kH8O9qpVyGOb5cKw8zL4JHRe9JH+h9
	e+4TMBVQ==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTity-0000000GIib-2x3m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:52:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B31D7C4F77E;
	Wed, 18 Nov 2026 16:52:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CC8635FE9B;
	Wed, 18 Nov 2026 16:52:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D05F11BC2905;
	Wed, 18 Nov 2026 17:52:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020772; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/HnlVAW6G7yyYKcY/kk5wSZriSWdbWjxLxb+Nwookac=;
	b=Pg2rL2aQgEgUYYgGfbvY/vb4l3thejC0dtg0+91G50Zki/FTEo1py6ZaBw/e329vfbsW7Q
	fhle3MUb18uSM8tzAVe0BKfEfGN2KEP3HAVMSzVH9LEwbl2RcHAuzHtrASE/2nJrV+SfH9
	cfR/dtROk8avGiZdrdOl8I1JPgvOn4w/WKFqCg5Z71WG16qvyFQMxYcvp4o82XCNpzLsaK
	Ox6OZ+DVYOFBQ1iZquvq4htdzdAwz/pN2Isls0+exSd2UtFWe0bYMgt5gc6R3nZsaNoGga
	/3AzVGOGjGV8caWVFdP/+7JdNBDPcjF8pBDEtCbM0i9B5iDCXSrZc46nZCxvnA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:09 +0100
Subject: [PATCH RFC v3 26/31] drm/atomic: add drm_atomic_shutdown_encoder()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-26-44bb3b4a828f@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_165254_698183_926E4CAB 
X-CRM114-Status: GOOD (  19.01  )
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
index ad2099b4dffd..7015ee18462c 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -2148,6 +2148,151 @@ int __drm_atomic_helper_set_config(struct drm_mode_set *set,
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
 static void drm_atomic_private_obj_print_state(struct drm_printer *p,
 					       const struct drm_private_state *state)
 {
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 3ae35b09c0cf..5b6d5e8423a5 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -1409,5 +1409,6 @@ drm_atomic_get_old_bridge_state(const struct drm_atomic_commit *state,
 struct drm_bridge_state *
 drm_atomic_get_new_bridge_state(const struct drm_atomic_commit *state,
 				struct drm_bridge *bridge);
+void drm_atomic_shutdown_encoder(struct drm_encoder *encoder);
 
 #endif /* DRM_ATOMIC_H_ */

-- 
2.56.1


