Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E776606A323
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 17:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1fv3GPgS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=KTu6EkaH;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pC03i2kT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=V74pzO2dbBdR1xMLyKRF82kgPEC5zrUjBnhQoT0iHWI=; b=1fv3GPgSwVD5JL
	JqtNlaCoY7OXf1PspteHwiX3tr3wTKf/QRT5xVJx8uEGSlVk6Q98vON96UbSiEl+WwjayffrILG0b
	itiYx3jc4+dwrLBKlu3pM8CxrqT/9uQ2k+Nhu2BowmhiRe6Vb5z0XE80NMdFntKEC01+wE/85Q2ag
	cE0JHyMJql4NE4/kdjBT6Q8euzzWWdg80F6tuP4FudjlC1VbXzm59U6YzYklVM/jhkmweGWYYRp5D
	f1uvQBo0J7nyJQvWNkng7DF9oZkjuODWbTmbfzhccsvlFetZMY+5/L3mb0DcreTRIbg8vQt7krZEp
	mpV5eYt3uXLLkJFezMIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHDB-0000000Arm0-3vJI;
	Wed, 25 Nov 2026 17:55:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHBn-0000000Aq6t-1ppJ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Nov 2026 17:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=V74pzO2dbBdR1xMLyKRF82kgPEC5zrUjBnhQoT0iHWI=; b=KTu6EkaHHK1lq1mkkHXgdrMZ3k
	rnG/QQT88HoaEZSkz9YWpgPWOlp87UP7dte+7FQDRysvzvWnx8JmBCFUJUg9SlnXWR+dHY6/mvTpG
	xsfaOJ14PT+/L6Hz/NnrPrT1gZjRKvCEM2lj9+kLn1OTu3V6gFw2DJBUlwwj/AwL3hT7nLntP2AJ8
	Fitv/PDgdUrqS+QNC/s50UdFzdCUKZjEEZzcQtC5y1oJk3oTWEVoNXLfaltvFbHM7JgWvFw/jpPXA
	keWESkg2LGby1XloI65USNQ+2yFFJa1SIhSK3/ip9imBP7uNTBI4JvGMVfzL5tJRk6I54Lto9u6BV
	uQKb3/Gw==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHBe-00000005bow-3E0R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 17:53:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B6AD14E41790;
	Wed, 25 Nov 2026 17:53:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8910B60480;
	Wed, 25 Nov 2026 17:53:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D40411E6B0C5;
	Wed, 25 Nov 2026 18:53:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629219; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V74pzO2dbBdR1xMLyKRF82kgPEC5zrUjBnhQoT0iHWI=;
	b=pC03i2kT6QcBRZW3lwAhBKfRfcUbjAMu80IBqjnw+d5T/Oi0c+xT04nlOlSG/L6dI2gaHp
	FBFbucuLFtH/lE8DVadJaUM5UP+RISwkxtxQu970o8g/G+QDLKxIZ55baBFHbXOZu7/45J
	TLboRIQlGOXC2hKRUFoMJDLaegg+8pGZWrVILpZcp7K2NWR66wPVcs3Jti3BF4LhCZMIcb
	zy73Ox9nzDBCyZ2flhOvfHbtI0SClPQ1u9+Qo1DJV7uVe6TOgKT5TeIm6qsDs/dq6DqEFS
	jAgOLdp7wcvZKL8HWB0UBZf2rqh1HTErSex7Sg4ermhfhQWRkIFoP5CtgotkCQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 25 Nov 2026 18:50:37 +0100
Subject: [PATCH v4 24/32] drm/bridge: ti-sn65dsi86: implement
 .get_next_bridge
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-drm-bridge-hotplug-v4-24-822722850492@bootlin.com>
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
X-CRM114-CacheID: sfid-20261125_175342_887548_0B13CDE5 
X-CRM114-Status: GOOD (  13.07  )
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
X-Spam-Status: No, score=-14.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add get_next_callback func to expose the next bridge.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- add missing drm_bridge_get
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 38318113a534..6dadcd7eb8d1 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -743,6 +743,13 @@ static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86
 	return devm_mipi_dsi_attach(&adev->dev, dsi);
 }
 
+static struct drm_bridge *sn65dsi86_get_next_bridge(struct drm_bridge *bridge)
+{
+	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
+
+	return pdata->next_bridge ? drm_bridge_get(pdata->next_bridge) : ERR_PTR(-ENODEV);
+}
+
 static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 			       struct drm_encoder *encoder,
 			       enum drm_bridge_attach_flags flags)
@@ -1353,6 +1360,7 @@ static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
 }
 
 static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
+	.get_next_bridge = sn65dsi86_get_next_bridge,
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
 	.mode_valid = ti_sn_bridge_mode_valid,
@@ -1491,8 +1499,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 	pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
 			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
 
+	pdata->bridge.ops = DRM_BRIDGE_OP_GET_NEXT_BRIDGE;
 	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort) {
-		pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
+		pdata->bridge.ops |= DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
 		if (client->irq)
 			pdata->bridge.ops |= DRM_BRIDGE_OP_HPD;
 		/*

-- 
2.56.1


