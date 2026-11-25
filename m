Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88020606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1jUFy3s4;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=h5jO4cdD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Vr+7UXOJ3o2fU3yHSPB3dtyk35CtU2SSHOcbdMyEPTM=; b=1jUFy3s4qoTCVw
	CI3Me2pZXynuqxe79lBoOQCkl/+RDEA7O84szff427k6W4YgDgAwz88rp8LW4xHERb54XHfNFFtTF
	/BDaAMLKRqmS9zUdmyrCFfch2YhQ8ptYTlbUe9aNcaC0LJJhh4rO2a12W/PownzekAJ9QvsQ3ybp6
	5ZlH72EfhnNt6qaPmw91aHvecBpRMyMZM2jSLABxtrqvyWW/L0Au/wNxK2oKwzGvEod8nT6a6XlqI
	TXu6HqRVQrmXwhWaezpJ7XdKmyVy6YAxlnOA7IBUqiw0LarvpesXQPJ16O6rXdvbY//9RsLC0VGRY
	jSwGTvpVcqbB7TKEo3aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHAs-0000000AoOG-2ZJt;
	Wed, 25 Nov 2026 17:52:54 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHA0-0000000AnRM-27Xw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:52:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0A61D1A17FA;
	Wed, 25 Nov 2026 17:51:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D27E160480;
	Wed, 25 Nov 2026 17:51:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DCA611E6B0CA;
	Wed, 25 Nov 2026 18:51:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629116; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Vr+7UXOJ3o2fU3yHSPB3dtyk35CtU2SSHOcbdMyEPTM=;
	b=h5jO4cdDvoG2FdgY+Jjl9H/k69qVzlisyLEHEOj/FQwt3dAvmgZ9T3x+g31j/siNwot9zT
	C6HuYUB7WU+aN3wVV0/NZsxHAH87/gjwmgmUnhyLXhmMvPJotJ0wrs1qUv0Nl6oWxezLe3
	4vpnOWXesx17dDaF9mHQUT2/XPlgKULDRTiRWY44oMB9zKAu+Bq3JrMgERWPtliQXGgcIT
	UG9hxF/cB0joxLukmtBzAQ7vdtejDa304BUfaPiy1WZIwoY3tAF3rfIwsZ5nTuDe2R/PJY
	l0ifRHn3K4X6M26V/DO3vIpBwBjTNY5VVIz84K3b8W18QV5DgXj+Z3Qf0tlGpw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:23 +0100
Subject: [PATCH v4 10/32] drm/display: bridge-connector: add APIs to
 add/remove the connector dynamically
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-drm-bridge-hotplug-v4-10-822722850492@bootlin.com>
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
X-CRM114-CacheID: sfid-20261125_095200_858827_BD3ABCE0 
X-CRM114-Status: GOOD (  17.76  )
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
index d81cfc7aa295..07385f87b2e8 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -289,6 +289,7 @@ static void drm_bridge_connector_dynconn_destroy(struct drm_connector *connector
 
 	drm_connector_cleanup(connector);
 	drm_bridge_connector_put_bridges(bridge_connector);
+	kfree(bridge_connector);
 }
 
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
@@ -1223,7 +1224,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 	struct drm_connector *connector;
 	int ret;
 
-	bridge_connector = drmm_kzalloc(drm, sizeof(*bridge_connector), GFP_KERNEL);
+	bridge_connector = kzalloc_obj(*bridge_connector);
 	if (!bridge_connector)
 		return ERR_PTR(-ENOMEM);
 
@@ -1238,3 +1239,24 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
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


