Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543A9606A337
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 16:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XgO1daMG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=V8jCYR8+;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=xqh/9ZIM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=79krwX+yyeP5wQB3giUSTaFzi+h4xK2ZzarDncWghUM=; b=XgO1daMG/rBfTG
	xF+GhxoQEUbloJInfGveRrPjJtQiE1Y+erxA5L+pQMRbEXrGKh9qXk/YAJl66RU3qWFuu2cJesR2h
	GRVzN2uziRrKUEX40t3bibFlAh5JHBfKtl9G1WKCSoCzvaWZdy1ihN2v1/YAVsil0wS/e4GLS3VjT
	seoESiUH4Gd7R701m3kAqV49FXKDmoUo+A2dbb/q3JfLwmbHb6nGnKTGnWMAx90L4UUOI1AqLNRgF
	6OzCP9uXfpL23ogMDJzuIvet5VpLz6TgR90fHcuKwyGL9fT9OibxD01KVRbGA9dlXJYljdxKK1GfX
	cimppNxnDZwBu01h4Wrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiuo-00000009cbq-0fl9;
	Wed, 18 Nov 2026 16:53:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTitj-00000009bwn-0yvn
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Nov 2026 16:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=79krwX+yyeP5wQB3giUSTaFzi+h4xK2ZzarDncWghUM=; b=V8jCYR8+G0ruHpxcxxwXlKBZyq
	5xfck8tXYuiiAwoVJL5Jy7CYhla9XQ8fX6e3+iuw768nBEWqijr3wl0rs4BMgsoXH8YPA85cRFPoV
	V4NIhEtlytVllouYJ8HloY+eR7mMDt9CCnZfjowBA6wzHT1LK6WEtnHl7Wl1tFPUmDuRAG45fASzv
	Ux6hOJf1qfKFlMLbtUYru/sFHDYw9ketXysIzr3PRMXEo5HrfHDZ8IQmzds7DcMthhm2+aHkVChZU
	dWH73cfqovvMYLI0ERNiQo9G70621+DhwPk1REmm/ugb0/AuWY6xz7RlR4Brzvr8nnZkWxT4zKFCm
	Flcf1oLQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTitf-0000000GIdE-0U0i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 16:52:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9D22E1A16E2;
	Wed, 18 Nov 2026 16:52:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 641765FE9B;
	Wed, 18 Nov 2026 16:52:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B313E11BC27F3;
	Wed, 18 Nov 2026 17:52:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795020747; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=79krwX+yyeP5wQB3giUSTaFzi+h4xK2ZzarDncWghUM=;
	b=xqh/9ZIMDEnNJlnXR28jZ8B7RiXCisq0/9o/SsyTbxfcQXhcv3xUjmG3ZfcSuw6CLqUONi
	3lsGQQqpIlPXeGFH5LawVMXehMbvHv3N9/t5T+ASzengvdaUHvYR22Gsy3vUs0oODbR8SI
	4rWsQtM1GdeKED8/AMFIUz5vVa7zFWS6sRGa+EEIGJ/X70NYJdJSZ0q/2iM7aD4HLUkBVO
	Z+Uwdg/RdFEw0ynP9RycrVUcz3XoMict7cXi3QeN/sH0tDVtfIHlFWwS3ia9OWi/x/KDor
	kmQd1df1wvyfIeHIga462ANGQwOvYBA+13zkY2bifDi0sQR3Kq0HD3eR5iZ5PQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 18 Nov 2026 17:50:05 +0100
Subject: [PATCH RFC v3 22/31] drm/bridge: ti-sn65dsi83: implement
 .get_next_bridge
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-drm-bridge-hotplug-v3-22-44bb3b4a828f@bootlin.com>
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
X-CRM114-CacheID: sfid-20261118_165235_161073_73BC5EF8 
X-CRM114-Status: GOOD (  10.58  )
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

Add get_next_callback func to expose the next bridge.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- add missing drm_bridge_get
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 525cddc57876..3886dafae6d7 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -295,6 +295,13 @@ static struct sn65dsi83 *bridge_to_sn65dsi83(struct drm_bridge *bridge)
 	return container_of(bridge, struct sn65dsi83, bridge);
 }
 
+static struct drm_bridge *sn65dsi83_get_next_bridge(struct drm_bridge *bridge)
+{
+	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
+
+	return ctx->panel_bridge ? drm_bridge_get(ctx->panel_bridge) : ERR_PTR(-ENODEV);
+}
+
 static int sn65dsi83_attach(struct drm_bridge *bridge,
 			    struct drm_encoder *encoder,
 			    enum drm_bridge_attach_flags flags)
@@ -795,6 +802,7 @@ sn65dsi83_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs sn65dsi83_funcs = {
+	.get_next_bridge	= sn65dsi83_get_next_bridge,
 	.attach			= sn65dsi83_attach,
 	.detach			= sn65dsi83_detach,
 	.atomic_enable		= sn65dsi83_atomic_enable,
@@ -1065,6 +1073,7 @@ static int sn65dsi83_probe(struct i2c_client *client)
 	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.pre_enable_prev_first = true;
 	ctx->bridge.type = DRM_MODE_CONNECTOR_LVDS;
+	ctx->bridge.ops = DRM_BRIDGE_OP_GET_NEXT_BRIDGE;
 	drm_bridge_add(&ctx->bridge);
 
 	ret = sn65dsi83_host_attach(ctx);

-- 
2.56.1


