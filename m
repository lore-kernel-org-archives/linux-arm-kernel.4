Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3015A606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o60YGETO;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=fkLLj6yE;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=h0MjVZZX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=El3w/0saMJR4Cg0hO6gP7gJK+ccnbO/QuF06gZeD5gI=; b=o60YGETOaTC8IF
	NRafeHjWn3+v+LCtgBLl824VeKy69bqAXEgg/beTSxDf9RWvl3ispQxQaLK1LdR4IrzOvULVIEvX/
	yti6MRIS0wbvk82Oz3mWTAOOQmeIJEg2zZ4dbwMBHDrgml5SMBK2hLKL3HblxQVUHw3aok7IFyOtO
	XS8Lr4bzCBfruJRbhOirxKEeemOgKBQARIzKxetqMWf3w4UVVRilrVD31y95mTAhL2OQTmYSChYSe
	1JRlSmhYxpcvYY51uazU5cN+4iBH5/oVWHSviPYMxfzRqnS00guM+1E01IooJc7rNOniivukYtDd3
	/0IRAIbenMHTjqBxsKPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiuq-00000009ccz-3huj;
	Wed, 18 Nov 2026 16:53:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTity-00000009cC2-23Gd
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 16:52:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=El3w/0saMJR4Cg0hO6gP7gJK+ccnbO/QuF06gZeD5gI=; b=fkLLj6yEFXufggEVk72oqQDSsL
	lYZokoLukERNe5ayBwbCbSWhSNkaqfLcEPTXlbFNRsnT+7M5m4qkxrYINWUk9eRkzpbHhUaYWWZII
	Q2qBerZ2BryeIEjEUlj8yQm+X0z8VIAN0fWOD9RoR5qaolItDmQlkvhZxtsCze7BjTy/+d3HJBGc8
	/cc5nESBnrCyR6gXGyGaDRtCG3M+p3uZffNq8sV/lMnMnnodDG+EtnGUCxQnhw8VA1P7GLY/iqxyg
	gO/WsSIxlw0ISWGXA6edKFjV1BJQpWLZ4tC03S+9pDZ/cNtFm11Li5bsvhYBlwVSnDlSYHljAlEU4
	0RBEypgQ==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTitt-0000000GIhX-3lKH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:52:51 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E2BF9C4F77B;
	Wed, 18 Nov 2026 16:52:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 082095FE9B;
	Wed, 18 Nov 2026 16:52:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8522911BC28D2;
	Wed, 18 Nov 2026 17:52:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020766; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=El3w/0saMJR4Cg0hO6gP7gJK+ccnbO/QuF06gZeD5gI=;
	b=h0MjVZZXVSczLoEXHDNG3wv+jntZZsmqbMQV5jBo6uI8eRFlz5sndqOdPK4kKU6Ue+f6Fh
	JxYrfzYmg6VNPoEt6s38Ry/wxRhUzwwbEP3/1vE/eGe++RGMgwkv+rHByW84P/+LFw84ua
	oY2DtjeJeroIo4O7eEwaC4uoPkmNkp3bZKfCwlZRkMzwbn+qlMhp3Q9sV3hVN/MssZegBd
	IEVHZQM7kPXOMz+3eiE5m8wYjZk1QCVk+GzMwh5JZUC4f/ZN56beIr9R3lOkMowUqU8LYx
	f92ZVmsXnNkndD9dJUfzLdo8sXT7Fb15JlEYYX1bs2y2P9/7kui2ySka3dsK4g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:08 +0100
Subject: [PATCH RFC v3 25/31] drm/bridge: add drm_bridge_detach_from()
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-25-44bb3b4a828f@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_165249_884835_7A221ED2 
X-CRM114-Status: GOOD (  14.91  )
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

Supporting bridge hotplug requires the ability to detach all bridges from
the one that got removed to the end of the pipeline. Add a function for
this.

Take care to not try detaching non-attached bridges. This is needed because
when two or more bridges are removed not in the backwards order,
drm_encoder_cleanup_from() is called more than once for bridges closer to
the panel.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This replaces "drm/encoder: add drm_encoder_cleanup_from()" from v2 as
discussed with Maxime in v1:
https://lore.kernel.org/all/20260609-hypnotic-honeybee-of-adventure-d89b7c@houat/
---
 drivers/gpu/drm/drm_bridge.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index e0a1e016b37c..a29f3e60bb24 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -504,6 +504,40 @@ int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge)
 }
 EXPORT_SYMBOL(devm_drm_bridge_add);
 
+/**
+ * drm_bridge_detach_from - detach a given bridge and all the following
+ *                          from an encoder chain
+ * @bridge: first bridge to remove
+ *
+ * Removes from an encoder all the bridges starting with a given bridge
+ * and until the end of the chain.
+ *
+ * Does nothing if the bridge is not attached to an encoder chain.
+ */
+static void drm_bridge_detach_from(struct drm_bridge *bridge)
+{
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_bridge *next;
+	LIST_HEAD(tmplist);
+
+	/*
+	 * We need the bridge_chain_mutex to modify the chain, but
+	 * drm_bridge_detach() will call DRM_MODESET_LOCK_ALL_BEGIN() (in
+	 * drm_modeset_lock_fini()), resulting in a possible ABBA circular
+	 * deadlock. Avoid it by first moving all the bridges to a
+	 * temporary list holding the lock, and then calling
+	 * drm_bridge_detach() without the lock.
+	 */
+	mutex_lock(&encoder->bridge_chain_mutex);
+	if (!list_empty(&bridge->chain_node))
+		list_for_each_entry_safe_from(bridge, next, &encoder->bridge_chain, chain_node)
+			list_move_tail(&bridge->chain_node, &tmplist);
+	mutex_unlock(&encoder->bridge_chain_mutex);
+
+	while (!list_empty(&tmplist))
+		drm_bridge_detach(list_first_entry(&tmplist, struct drm_bridge, chain_node));
+}
+
 /**
  * drm_bridge_remove - unregister a bridge
  *

-- 
2.56.1


